from django.db import models
from django import forms
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from datetime import datetime

from modelcluster.fields import ParentalKey

from wagtail.core.fields import StreamField, RichTextField
from wagtail.core.models import Page, Orderable
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, PageChooserPanel, StreamFieldPanel, MultiFieldPanel
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.snippets.models import register_snippet

from django.forms.widgets import Select

from wagtail.core import blocks
from wagtail.images.blocks import ImageChooserBlock
from news.blocks import FooterStreamBlock
from services.models import ServicePage as Service

from modelcluster.fields import ParentalManyToManyField

# Type of footer link (Media, Quick links...)

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

# Type of link (Internal page, External page, html)

@register_snippet
class LinkType(models.Model):
	name = models.CharField(max_length=100)

	class Meta:
		verbose_name_plural = "Link types"

	def __str__(self):
		return self.name

	def get_links(self):
		links = FooterLink.objects.filter(type=self).all()
		return links

	panels = [        
		FieldPanel('name'),
	]

# Footer link

@register_snippet
class FooterLink(models.Model):
	category = models.ForeignKey(
		FooterCategory,
		on_delete=models.SET_NULL,
		null=True,
		blank=True,
	)
	type_link = models.ForeignKey(
		LinkType,
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
	link = models.CharField("Link to an external page", max_length=10000, null=True, blank=True)
	popup_html = StreamField(FooterStreamBlock(), verbose_name="HTML for the pop-up", null=True, blank=True)

	def __str__(self):
		return self.name

	class Meta:
		verbose_name_plural = "Footer links"

	panels = [        
		FieldPanel('name'),
		FieldPanel('category'),
		FieldPanel('type_link'),
		PageChooserPanel('link_page'),
		FieldPanel('link'),
		StreamFieldPanel('popup_html',classname='full'),
	]

# Event for the calendar connected if possible to an article of Event type

@register_snippet
class Event(models.Model):
	name = models.CharField(max_length=100)
	date_start = models.DateField("Starting date", null=True, blank=True,)
	date_end = models.DateField("Ending date (leave it blank if one day event)", null=True, blank=True,)
	article = models.ForeignKey('news.NewsPage', limit_choices_to = {'type_of_news': 'EV'}, on_delete=models.SET_NULL, null=True, blank=True,)

	class Meta:
		verbose_name_plural = "Events"

	def __str__(self):
		return self.name

	def get_links(self):
		links = FooterLink.objects.filter(category=self).all()
		return links

	panels = [        
		FieldPanel('name'),
		FieldPanel('date_start'),
		FieldPanel('date_end'),
		FieldPanel('article'),
	]

	def as_json(self):
		if self.date_end and self.date_start and self.article:
			return dict(title=self.name, start=self.date_start.isoformat(), end=self.date_end.isoformat(), url=self.article.url)
		elif self.date_start and self.article:
			return dict(title=self.name, start=self.date_start.isoformat(), url=self.article.url)
		elif self.date_start:
			return dict(title=self.name, start=self.date_start.isoformat())
		else:
			return