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

@register_snippet
class FooterCategory(models.Model):
	name = models.CharField(max_length=100)

	class Meta:
		verbose_name_plural = "Footer categories"

	def __str__(self):
		return self.name

	def get_links(self):
		links = FooterLink.objects.filter(category=self).all()
		return links

	panels = [        
		FieldPanel('name'),
	]

@register_snippet
class FooterLink(models.Model):
	category = models.ForeignKey(
		FooterCategory,
		on_delete=models.SET_NULL,
		null=True,
		blank=True,
	)
	name = models.CharField(max_length=100)
	link_page = models.ForeignKey(
		'wagtailcore.Page',
		null=True,
		blank=True,
		on_delete=models.SET_NULL,
		related_name='+',
	)
	link = models.CharField("Link to an external page (Leave it blank for a link to a page on the website)", max_length=10000, null=True, blank=True)

	def __str__(self):
		return self.name

	class Meta:
		verbose_name_plural = "Footer links"

	panels = [        
		FieldPanel('name'),
		FieldPanel('category'),
		PageChooserPanel('link_page'),
		FieldPanel('link'),
	]

