from django.db import models
from django import forms
from datetime import date
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

import os

from datetime import datetime
from preview_generator.manager import PreviewManager

from modelcluster.fields import ParentalKey

from wagtail.core.fields import StreamField
from wagtail.core.models import Page, Orderable
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, PageChooserPanel, StreamFieldPanel, MultiFieldPanel
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.snippets.models import register_snippet

from wagtail.core.fields import RichTextField

from django.forms.widgets import Select

from wagtail.core import blocks
from wagtail.images.blocks import ImageChooserBlock
from news.blocks import BaseStreamBlock
from services.models import WorkingAreaPage as Service

from modelcluster.fields import ParentalManyToManyField

# Images for carousels in hero section

class TopImage(Orderable):
	image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=False,
		on_delete=models.SET_NULL,
		related_name='+'
	)
	page = ParentalKey('ArticlePage', related_name='top_images')

	panels = [
		ImageChooserPanel('image'),
	]

# Uploaded file to go in Media & Download section of news

class File(models.Model):
	name = models.CharField(max_length=255, null=True, blank=False)
	file = models.FileField(null=True, blank=False)
	path_to_thumbnail = models.CharField(max_length=255, null=True, blank=True)

	page = ParentalKey('ArticlePage', related_name='downloads', null=True)

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

# Connection with related articles

class ConnectedArticle(Orderable):
	page = ParentalKey('ArticlePage', related_name='linked_articles')

	element = models.ForeignKey('knowledge.ArticlePage', on_delete=models.SET_NULL, null=True, blank=False, verbose_name="Article")

	panels = [
		FieldPanel('element'),
	]

# Connection with related projects

class ConnectedProject(Orderable):
	page = ParentalKey('ArticlePage', related_name='linked_projects')

	element = models.ForeignKey('projects.ProjectPage', on_delete=models.SET_NULL, null=True, blank=False, verbose_name="Project")

	panels = [
		FieldPanel('element'),
	]

class ArticlePage(Page):

	parent_page_types = ['KnowledgePage']
	subpage_types = []
	hero_old_image = models.ImageField(null=True, blank=True)


	highlight = models.BooleanField(blank=True, null=True)
	hero_title = models.CharField(max_length=255, null=True, blank=False)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	date_published = models.DateField("Date of publication", blank=True, default=date.today)
	intro = RichTextField(blank=False, null=True, verbose_name="Introduction text")

	body = StreamField(BaseStreamBlock(), verbose_name="Article body", blank=False)
	author = models.ForeignKey('people.People',on_delete=models.SET_NULL, null=True, blank=False)
	service = models.ForeignKey(
		Service,
		on_delete=models.SET_NULL,
		null=True,
		blank=False,
		verbose_name="Working Area"
	)
	



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
				FieldPanel('service'),
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

	def short_intro(self):
		return self.hero_title[0:70]

	def is_long_intro(self):
		long_intro = True
		if len(self.hero_title) <= 70:
			long_intro = False
		return long_intro

# Index page for articles

class KnowledgePage(Page):
	parent_page_types = ['index.HomePage']
	subpage_types = ['knowledge.ArticlePage']
	
	hero_image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=True,
		on_delete=models.SET_NULL,
		related_name='+',
	)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	description_title = models.CharField(max_length=255, null=True, blank=True, verbose_name="Title")
	intro = models.TextField(blank=True, verbose_name="text")

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
		MultiFieldPanel([
				FieldPanel('description_title'),
				FieldPanel('intro', classname="full"),
			],
			heading='Articles description',
			classname="collapsible"
		),
	]
	
	def get_resources(self):
		return ArticlePage.objects.all().order_by('-date_published')


	def highlight_resources(self):
		return ArticlePage.objects.filter(highlight=True).order_by('-date_published').all()


	def get_context(self, request):
		context = super(KnowledgePage, self).get_context(request)

		resources_all = self.get_resources()

		context['not_last'] = len(resources_all)>8

		context['resources'] = resources_all[0:8]
		context['latest_resources'] = resources_all[0:2]

		context['highlights'] = self.highlight_resources()[0:4]
		context['services'] = Service.objects.all()

		return context
