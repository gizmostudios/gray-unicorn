from django.db import models
from django import forms
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

import os 

from datetime import datetime
from preview_generator.manager import PreviewManager

from modelcluster.fields import ParentalKey

from wagtail.core.fields import StreamField
from wagtail.core.models import Page, Orderable
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, PageChooserPanel, StreamFieldPanel
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.snippets.models import register_snippet

from django.forms.widgets import Select

from wagtail.core import blocks
from wagtail.images.blocks import ImageChooserBlock
from news.blocks import BaseStreamBlock
from knowledge.models import *

from itertools import chain
from operator import attrgetter

class TopImage(Orderable):
	image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=True,
		on_delete=models.SET_NULL,
		related_name='+'
	)
	page = ParentalKey('Newspage', related_name='top_images')

	panels = [
		ImageChooserPanel('image'),
	]

class File(models.Model):
	name = models.CharField(max_length=255, null=True, blank=True)
	file = models.FileField(null=True, blank=True)
	path_to_thumbnail = models.CharField(max_length=255, null=True, blank=True)

	page = ParentalKey('NewsPage', related_name='downloads', null=True)

	def extension(self):
		name, extension = os.path.splitext(self.file.name)
		return extension

	def thumbnail(self):
		
		dir_path = os.path.dirname(os.path.realpath(__file__))
		par_dir = os.path.abspath(os.path.join(dir_path, os.pardir))
		if self.path_to_thumbnail is None:
			cache_path = par_dir+'/media/'
			pdf_or_odt_to_preview_path = par_dir+self.file.url
			manager = PreviewManager(cache_path, create_folder= True)
			path_to_preview_image = manager.get_jpeg_preview(pdf_or_odt_to_preview_path)
			path, file = path_to_preview_image.split('/media/')
			self.thumbnail = file
			print(self.thumbnail)
			return self.thumbnail
		else:		
			return self.path_to_thumbnail

	panels = [
		FieldPanel('name'),
		FieldPanel('file'),
	]

class RelatedArticle(Orderable):
	page = ParentalKey('NewsPage', related_name='linked_articles')

	element = models.ForeignKey('news.NewsPage', on_delete=models.SET_NULL, null=True, blank=True,)

	panels = [
		FieldPanel('element'),
	]

class RelatedProject(Orderable):
	page = ParentalKey('NewsPage', related_name='linked_projects')

	element = models.ForeignKey('projects.ProjectPage', on_delete=models.SET_NULL, null=True, blank=True,)

	panels = [
		FieldPanel('element'),
	]

class NewsPage(Page):

	parent_page_types = ['FolderArticlePage']
	subpage_types = []

	ARTICLE = 'AR'
	EVENT = 'EV'
	OPEN_POSITION = 'OP'

	highlight = models.BooleanField(blank=True, null=True)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	date_published = models.DateField("Date article published", blank=True, null=True)
	intro = models.TextField(blank=True)

	path_to_thumbnail = models.CharField(max_length=255, null=True, blank=True) 

	list_of_type = (
		(ARTICLE, 'Article'),
		(EVENT, 'Event'),
		(OPEN_POSITION, 'Open position'),
		)
	type_of_news = models.CharField(
		max_length=2,
		choices=list_of_type,
		default=ARTICLE,
	)
	navbar_transparent = models.BooleanField('Transparency of the navigation bar', blank=True, null=True)
	navbar_inverted = models.BooleanField('Colorful navigation bar', blank=True, null=True)
	body = StreamField(BaseStreamBlock(), verbose_name="Page body", blank=True)
	author = models.ForeignKey('people.People',on_delete=models.SET_NULL,null=True,blank=True,)
	



	content_panels = Page.content_panels + [
		FieldPanel('highlight', widget=forms.CheckboxInput),
		FieldPanel('navbar_transparent', widget=forms.CheckboxInput),
		FieldPanel('navbar_inverted', widget=forms.CheckboxInput),
		InlinePanel('top_images', label='Top section carousel images'),
		FieldPanel('hero_title'),
		FieldPanel('hero_subtitle'),
		FieldPanel('type_of_news'),
		FieldPanel('intro', classname="full"),
		StreamFieldPanel('body'),
		FieldPanel('date_published'),
		FieldPanel('author'),
		InlinePanel('linked_articles', max_num=2, label='Related articles'),
		InlinePanel('linked_projects', max_num=2, label='Related projects'),
		InlinePanel('downloads', label='Files to downloads'),
	]

	def timeline_position(self):
		d0 = datetime(self.date_published.year, 1, 1).date()
		d1 = self.date_published
		delta = d1 - d0
		position = delta.days * 100 / 365
		return position

	def short_intro(self):
		return self.hero_title[0:70]

	def is_long_intro(self):
		long_intro = True
		if len(self.hero_title) <= 70:
			long_intro = False
		return long_intro

	def thumbnail(self):
		
		dir_path = os.path.dirname(os.path.realpath(__file__))
		par_dir = os.path.abspath(os.path.join(dir_path, os.pardir))
		if self.path_to_thumbnail is None:
			cache_path = par_dir+'/media/'
			pdf_or_odt_to_preview_path = par_dir+self.hero_image.url
			manager = PreviewManager(cache_path, create_folder= True)
			path_to_preview_image = manager.get_jpeg_preview(pdf_or_odt_to_preview_path, height=270,width=431)
			path, file = path_to_preview_image.split('/media/')
			self.thumbnail = file
			print(self.thumbnail)
			return self.thumbnail
		else:		
			return self.path_to_thumbnail



class NewspaperArticlePage(Page):
	hero_image = models.ImageField(null=True, blank=True)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	date_published = models.DateField("Date article published", blank=True, null=True)
	url_article = models.CharField(max_length=500, null=True, blank=True)
	path_to_thumbnail = models.CharField(max_length=255, null=True, blank=True)


	content_panels = Page.content_panels + [
		FieldPanel('hero_image'),
		FieldPanel('hero_title'),
		FieldPanel('hero_subtitle'),
		FieldPanel('date_published'),
		FieldPanel('url_article'),
	]

	def short_intro(self):
		return self.hero_title[0:70]

	def is_long_intro(self):
		long_intro = True
		if len(self.hero_title) <= 70:
			long_intro = False
		return long_intro

	parent_page_types = ['FolderNewspaperPage']
	subpage_types = []

	def thumbnail(self):
		
		dir_path = os.path.dirname(os.path.realpath(__file__))
		par_dir = os.path.abspath(os.path.join(dir_path, os.pardir))
		if self.path_to_thumbnail is None:
			cache_path = par_dir+'/media/'
			pdf_or_odt_to_preview_path = par_dir+self.hero_image.url
			manager = PreviewManager(cache_path, create_folder= True)
			path_to_preview_image = manager.get_jpeg_preview(pdf_or_odt_to_preview_path, height=270,width=431)
			path, file = path_to_preview_image.split('/media/')
			self.thumbnail = file
			print(self.thumbnail)
			return self.thumbnail
		else:		
			return self.path_to_thumbnail

class NewsIndexPage(Page):

	subpage_types = ['FolderNewspaperPage','FolderArticlePage']
	parent_page_types = ['about.aboutPage']
	hero_image = models.ImageField(null=True, blank=True)
	navbar_transparent = models.BooleanField('Transparency of the navigation bar', blank=True, null=True)
	navbar_inverted = models.BooleanField('Colorful navigation bar', blank=True, null=True)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)

	content_panels = Page.content_panels + [
		FieldPanel('navbar_transparent', widget=forms.CheckboxInput),
		FieldPanel('navbar_inverted', widget=forms.CheckboxInput),
		FieldPanel('hero_image'),
		FieldPanel('hero_title'),
		FieldPanel('hero_subtitle')
	]

	def get_news(self):
		result_list = sorted(
			chain(NewsPage.objects.live(), NewspaperArticlePage.objects.live()),
			key=attrgetter('date_published'), reverse=True)
		return result_list

	def get_context(self, request):
		context = super(NewsIndexPage, self).get_context(request)

		news = self.get_news()
		context['news'] = news
		context['not_last'] = len(news)>6
		context['current_news'] = news[0:6]

		return context


class FolderNewspaperPage(Page):
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	subpage_types = ['NewspaperArticlePage']
	parent_page_types = ['NewsIndexPage']

	content_panels = Page.content_panels + [
		FieldPanel('hero_title'),
	]

class FolderArticlePage(Page):
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	subpage_types = ['NewsPage']
	parent_page_types = ['NewsIndexPage']

	content_panels = Page.content_panels + [
		FieldPanel('hero_title'),
	]
