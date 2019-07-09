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
from services.models import ServicePage as Service

from modelcluster.fields import ParentalManyToManyField
from news.models import *

@register_snippet
class Resource(models.Model):
	hero_title = models.CharField(max_length=100)
	service = models.ForeignKey(
		Service,
		on_delete=models.SET_NULL,
		null=True,
		blank=True,
	)
	file = models.FileField(null=True, blank=True)
	hero_image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=True,
		on_delete=models.SET_NULL,
		related_name='+'
	)

	highlight = models.BooleanField(blank=True, null=True)
	date_published = models.DateField("Date resource published", blank=True, null=True)

	def __str__(self):
		return self.hero_title

	class Meta:
		verbose_name_plural = "Resources"

	panels = [
		FieldPanel('highlight', widget=forms.CheckboxInput),        
		FieldPanel('hero_title'),
		FieldPanel('file'),
		FieldPanel('service'),
		ImageChooserPanel('hero_image'),
		FieldPanel('date_published'),
	]

class KnowledgePage(Page):
	parent_page_types = ['index.HomePage']
	subpage_types = []
	
	hero_image = models.ImageField(null=True, blank=True)
	navbar_inverted = models.BooleanField(null=True, blank=True)
	navbar_transparent = models.BooleanField(null=True, blank=True)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	intro = models.TextField(blank=True)

	content_panels = Page.content_panels + [
		FieldPanel('hero_image'),
		FieldPanel('navbar_inverted', widget=forms.CheckboxInput),
		FieldPanel('navbar_transparent', widget=forms.CheckboxInput),
		FieldPanel('hero_title'),
		FieldPanel('hero_subtitle'),
		FieldPanel('intro', classname="full"),
	]
	
	def get_resources(self):
		return Resource.objects.all().order_by('-date_published')

	def get_news(self):
		return NewsPage.objects.live().order_by('-date_published').all()[0:5]

	def highlight_resources(self):
		return Resource.objects.filter(highlight=True).order_by('-date_published').all()

	def paginate(self, request, *args):
		page = request.GET.get('page')
		paginator = Paginator(self.get_resources(), 12)
		try:
			pages = paginator.page(page)
		except PageNotAnInteger:
			pages = paginator.page(1)
		except EmptyPage:
			pages = paginator.page(paginator.num_pages)
		return pages

	def get_context(self, request):
		context = super(KnowledgePage, self).get_context(request)

		resources = self.paginate(request, self.get_resources())

		context['highlights'] = self.highlight_resources()[0:4]
		context['news'] = self.get_news()
		context['resources'] = resources
		context['services'] = Service.objects.all()

		return context