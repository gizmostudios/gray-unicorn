from django.db import models
from django import forms
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from datetime import datetime

from modelcluster.fields import ParentalKey

from wagtail.core.fields import StreamField
from wagtail.core.models import Page, Orderable
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, PageChooserPanel, StreamFieldPanel, MultiFieldPanel
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.snippets.models import register_snippet

from django.forms.widgets import Select

from wagtail.core import blocks
from wagtail.images.blocks import ImageChooserBlock
from news.blocks import BaseStreamBlock

# Specific area with services we offer

class ServicePage(Page):
	parent_page_types = ['WorkingAreaPage']
	subpage_types = []

	hero_title = models.CharField(max_length=100, null=True, blank=False)
	hero_image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=False,
		on_delete=models.SET_NULL,
		related_name='+'
	)
	description = models.TextField(null=True, blank=False)

	content_panels = Page.content_panels + [
		FieldPanel('hero_title'),
		ImageChooserPanel('hero_image'),
		FieldPanel('description'),
	]

# Should be working area this is our domains of intervention

class WorkingAreaPage(Page):
	hero_title = models.CharField(max_length=100, null=True, blank=False)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	color = models.CharField(max_length=100, blank=False, null=True)
	hero_image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=False,
		on_delete=models.SET_NULL,
		related_name='+'
	)
	summary = models.CharField(max_length=100, blank=False, null=True, verbose_name='Summary (1 or 2 sentences max)')
	introduction = models.TextField(null=True, blank=False, verbose_name="Introduction")
	body = models.TextField(null=True, verbose_name="Service details", blank=False)

	def __str__(self):
		return self.hero_title

	class Meta:
		verbose_name_plural = "Services"


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
				FieldPanel('color'),
			],
			heading='Meta data',
			classname="collapsible"
		),
		MultiFieldPanel([
				FieldPanel('summary'),
				FieldPanel('introduction'),
				FieldPanel('body'),
			],
			heading='Service information',
			classname="collapsible"
		),
	]

	def get_subservices(self):
		subservices = ServicePage.objects.descendant_of(self)
		return subservices

	def get_projects(self):
		projects = self.projectpage_set.all()[0:5]
		return projects

	def get_articles(self):
		resources = self.articlepage_set.all()[0:5]
		print(resources)
		return resources

	def get_context(self, request):
		context = super(WorkingAreaPage, self).get_context(request)

		context['projects'] = self.get_projects()
		context['last_project'] = self.get_projects()[len(self.get_projects())-1]
		context['previous_last_project'] = self.get_projects()[len(self.get_projects())-2]
		context['articles'] = self.get_articles()
		context['parent_page'] = ServiceIndexPage.objects.ancestor_of(self).first()
		context['subservices'] = self.get_subservices()
		return context

	parent_page_types = ['ServiceIndexPage']
	subpage_types = ['ServicePage']


class ServiceIndexPage(Page):

	subpage_types = ['WorkingAreaPage']
	parent_page_types = ['index.HomePage']
	hero_image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=False,
		on_delete=models.SET_NULL,
		related_name='+'
	)
	hero_title = models.CharField(max_length=255, null=True, blank=False)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	service_introduction = models.TextField(blank=False)



	[
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
		FieldPanel('service_introduction'),
	]

	def get_news(self):
		return WorkingAreaPage.objects.live()


	def get_context(self, request):
		context = super(ServiceIndexPage, self).get_context(request)

		services = self.get_news()
		context['service_list'] = services

		return context