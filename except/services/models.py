from django.db import models
from django import forms
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from datetime import datetime

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

# Skills of our team (Research & Analysis, Design...)

class Expertise(Orderable):
	image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
	title = models.CharField(max_length=255, null=True, blank=True)
	page = ParentalKey('ServiceIndexPage', related_name='expertises')

	panels = [
		FieldPanel('title'),
		ImageChooserPanel('image'),
	]

# Specific area with services we offer

class SubServicePage(Page):
	parent_page_types = ['ServicePage']
	subpage_types = []

	hero_title = models.CharField(max_length=100)
	description = models.TextField(blank=True)
	body = StreamField(BaseStreamBlock(), verbose_name="Page body", blank=True)

	content_panels = Page.content_panels + [
		FieldPanel('hero_title'),
		FieldPanel('description', classname="full"),
		StreamFieldPanel('body'),
	]

# Should be working area this is our domains of intervention

class ServicePage(Page):
	hero_title = models.CharField(max_length=100)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	color = models.CharField(max_length=100, blank=True, null=True)
	image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
	introduction = models.TextField(null=True, blank=True)

	def __str__(self):
		return self.hero_title

	class Meta:
		verbose_name_plural = "Services"


	content_panels = Page.content_panels + [
		FieldPanel('hero_title'),
		FieldPanel('hero_subtitle'),
		FieldPanel('color'),
		ImageChooserPanel('image'),
		FieldPanel('introduction')
	]

	def get_subservices(self):
		subservices = SubServicePage.objects.descendant_of(self)
		return subservices

	def get_projects(self):
		projects = self.projectpage_set.all()[0:5]
		return projects

	def get_articles(self):
		resources = self.articlepage_set.all()[0:5]
		print(resources)
		return resources

	def get_context(self, request):
		context = super(ServicePage, self).get_context(request)

		context['projects'] = self.get_projects()
		context['articles'] = self.get_articles()
		context['parent_page'] = ServiceIndexPage.objects.ancestor_of(self).first()
		context['subservices'] = self.get_subservices()
		return context

	parent_page_types = ['ServiceIndexPage']
	subpage_types = ['SubServicePage']


class ServiceIndexPage(Page):

	subpage_types = ['ServicePage']
	parent_page_types = ['index.HomePage']
	hero_image = models.ImageField(null=True, blank=True)
	navbar_transparent = models.BooleanField('Transparency of the navigation bar', blank=True, null=True)
	navbar_inverted = models.BooleanField('Colorful navigation bar', blank=True, null=True)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	expertise_background = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )



	content_panels = Page.content_panels + [
		FieldPanel('navbar_transparent', widget=forms.CheckboxInput),
		FieldPanel('navbar_inverted', widget=forms.CheckboxInput),
		FieldPanel('hero_image'),
		FieldPanel('hero_title'),
		FieldPanel('hero_subtitle'),
		ImageChooserPanel('expertise_background'),
		InlinePanel('expertises', label="Expertises"),
	]

	def get_news(self):
		return ServicePage.objects.live()

	def get_expertises(self):
		return Expertise.objects.filter(page=self).all()

	def get_context(self, request):
		context = super(ServiceIndexPage, self).get_context(request)

		services = self.get_news()
		missing_columns_number = 4-len(self.get_expertises())%4
		context['service_list'] = services
		context['missing_columns'] = services[0:missing_columns_number]

		return context