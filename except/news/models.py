from django.db import models
from django import forms
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

import os 

from datetime import datetime, date
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

# Images for carousels in hero section

class TopImage(Orderable):
	image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=False,
		on_delete=models.SET_NULL,
		related_name='+'
	)
	page = ParentalKey('Newspage', related_name='top_images')

	panels = [
		ImageChooserPanel('image'),
	]

# Uploaded file to go in Media & Download section of news

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

# Connection with related news

class RelatedArticle(Orderable):
	page = ParentalKey('NewsPage', related_name='linked_articles')

	element = models.ForeignKey('news.NewsPage', on_delete=models.SET_NULL, null=True, blank=True, verbose_name="Article")

	panels = [
		FieldPanel('element'),
	]

# Connection with related projects

class RelatedProject(Orderable):
	page = ParentalKey('NewsPage', related_name='linked_projects')

	element = models.ForeignKey('projects.ProjectPage', on_delete=models.SET_NULL, null=True, blank=True, verbose_name="Project")

	panels = [
		FieldPanel('element'),
	]

# Piece of news written by Except

class NewsPage(Page):

	parent_page_types = ['FolderArticlePage']
	subpage_types = []

	ARTICLE = 'AR'
	EVENT = 'EV'
	OPEN_POSITION = 'OP'

	hero_old_image = models.ImageField(null=True, blank=True)

	highlight = models.BooleanField(blank=True, null=True)
	hero_title = models.CharField(max_length=255, null=True, blank=False)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	date_published = models.DateField("Date of publication", blank=False, null=False, default=date.today)
	intro = models.TextField(blank=False, verbose_name="Introduction text")

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
		verbose_name="Type of news (Article, Event, Position)"
	)
	body = StreamField(BaseStreamBlock(), verbose_name="Article body", blank=False)
	author = models.ForeignKey('people.People',on_delete=models.SET_NULL,null=True,blank=False,)
	
	content_panels = [
		MultiFieldPanel([
            FieldPanel('title'),
        ], heading='Title'),
		MultiFieldPanel([
				FieldPanel('hero_title'),
				FieldPanel('hero_subtitle'),
				InlinePanel('top_images', label='Top section carousel images'),
			],
			heading='Top section',
			classname="collapsible"
		),
		MultiFieldPanel([
				FieldPanel('highlight', widget=forms.CheckboxInput),
				FieldPanel('type_of_news'),
				FieldPanel('date_published'),
				FieldPanel('author'),
			],
			heading='Meta data',
			classname="collapsible collapsed"
		),
		MultiFieldPanel([
				FieldPanel('intro', classname="full"),
				StreamFieldPanel('body'),
			],
			heading='Article contain',
			classname="collapsible collapsed"
		),
		MultiFieldPanel([
				InlinePanel('linked_articles', max_num=2, label='Related articles'),
				InlinePanel('linked_projects', max_num=2, label='Related projects'),
				InlinePanel('downloads', label='Files to downloads'),
			],
			heading='Related assets',
			classname="collapsible collapsed"
		),
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


# Link to a newspaper article talking about Except

class NewspaperArticlePage(Page):
	hero_image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=False,
		on_delete=models.SET_NULL,
		related_name='+',
		verbose_name="Image"
	)
	hero_title = models.CharField(max_length=255, null=True, blank=False)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	date_published = models.DateField("Date of publication", blank=False, null=False, default=date.today)
	url_article = models.CharField(max_length=500, null=True, blank=False, verbose_name="Link to the article")


	content_panels = [
		MultiFieldPanel([
            FieldPanel('title'),
        ], heading='Title'),
		MultiFieldPanel([
				FieldPanel('hero_title'),
				FieldPanel('hero_subtitle'),
				ImageChooserPanel('hero_image'),
			],
			heading='Top section',
			classname="collapsible"
		),
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

class NewsIndexPage(Page):

	subpage_types = ['FolderNewspaperPage','FolderArticlePage']
	parent_page_types = ['about.aboutPage']

	hero_image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=False,
		on_delete=models.SET_NULL,
		related_name='+',
		verbose_name="Image"
	)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)

	content_panels = [
		MultiFieldPanel([
            FieldPanel('title'),
        ], heading='Title'),
		MultiFieldPanel([
				FieldPanel('hero_title'),
				FieldPanel('hero_subtitle'),
				ImageChooserPanel('hero_image'),
			],
			heading='Top section',
			classname="collapsible"
		),
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

# Empty page for structure in Wagtail

class FolderNewspaperPage(Page):
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	subpage_types = ['NewspaperArticlePage']
	parent_page_types = ['NewsIndexPage']

	content_panels = Page.content_panels + [
		FieldPanel('hero_title'),
	]

# Empty page for structure in Wagtail

class FolderArticlePage(Page):
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	subpage_types = ['NewsPage']
	parent_page_types = ['NewsIndexPage']

	content_panels = Page.content_panels + [
		FieldPanel('hero_title'),
	]
