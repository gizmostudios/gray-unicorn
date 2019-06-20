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
	

class Expertise(Orderable):
	image = models.ImageField(null=True, blank=True)
	title = models.CharField(max_length=255, null=True, blank=True)
	page = ParentalKey('ServiceIndexPage', related_name='expertises')

	panels = [
		FieldPanel('title'),
		FieldPanel('image'),
	]

class ServicePage(Page):
	hero_title = models.CharField(max_length=100)
	color = models.CharField(max_length=100, blank=True, null=True)
	image = models.ImageField(null=True, blank=True)

	def __str__(self):
		return self.hero_title

	class Meta:
		verbose_name_plural = "Services"


	content_panels = Page.content_panels + [
		FieldPanel('hero_title'),
		FieldPanel('color'),
		FieldPanel('image'),
	]

	parent_page_types = ['ServiceIndexPage']
	subpage_types = []


class ServiceIndexPage(Page):

	subpage_types = ['ServicePage']
	parent_page_types = ['index.HomePage']
	hero_image = models.ImageField(null=True, blank=True)
	navbar_transparent = models.BooleanField('Transparency of the navigation bar', blank=True, null=True)
	navbar_inverted = models.BooleanField('Colorful navigation bar', blank=True, null=True)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	expertise_background = models.ImageField(null=True, blank=True)



	content_panels = Page.content_panels + [
		FieldPanel('navbar_transparent', widget=forms.CheckboxInput),
		FieldPanel('navbar_inverted', widget=forms.CheckboxInput),
		FieldPanel('hero_image'),
		FieldPanel('hero_title'),
		FieldPanel('hero_subtitle'),
		FieldPanel('expertise_background'),
		InlinePanel('expertises', label="Expertises"),
	]

	def get_news(self):
		return ServicePage.objects.live()

	def get_context(self, request):
		context = super(ServiceIndexPage, self).get_context(request)

		services = self.get_news()
		context['services'] = services

		return context