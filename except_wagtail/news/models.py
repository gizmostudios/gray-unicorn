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
from services.models import ServicePage as Service
from knowledge.models import *


class NewsPage(Page):

	parent_page_types = ['FolderArticlePage']
	subpage_types = []

	hero_image = models.ImageField(null=True, blank=True)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	date_published = models.DateField("Date article published", blank=True, null=True)
	intro = models.TextField(blank=True)
	navbar_transparent = models.BooleanField('Transparency of the navigation bar', blank=True, null=True)
	navbar_inverted = models.BooleanField('Colorful navigation bar', blank=True, null=True)
	body = StreamField(BaseStreamBlock(), verbose_name="Page body", blank=True)
	author = models.ForeignKey('people.People',on_delete=models.SET_NULL,null=True,blank=True,)
	service = models.ForeignKey(
		Service,
		on_delete=models.SET_NULL,
		null=True,
		blank=True,
	)


	content_panels = Page.content_panels + [
		FieldPanel('navbar_transparent', widget=forms.CheckboxInput),
		FieldPanel('navbar_inverted', widget=forms.CheckboxInput),
		FieldPanel('service'),
		FieldPanel('hero_image'),
		FieldPanel('hero_title'),
		FieldPanel('hero_subtitle'),
		FieldPanel('intro', classname="full"),
		StreamFieldPanel('body'),
		FieldPanel('date_published'),
		FieldPanel('author'),
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

	def get_context(self, request):
		context = super(NewsPage, self).get_context(request)

		resources = Resource.objects.all().filter(service__id=self.service.id).order_by('-date_published')[0:3]
		articles = NewsPage.objects.live().filter(service__id=self.service.id).exclude(id=self.id).order_by('-date_published')[0:3]

		context["related_resources"] = resources
		context["related_articles"] = articles

		return context


class NewspaperArticlePage(Page):
	hero_image = models.ImageField(null=True, blank=True)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	date_published = models.DateField("Date article published", blank=True, null=True)
	url_article = models.CharField(max_length=500, null=True, blank=True)
	service = models.ForeignKey(
		Service,
		on_delete=models.SET_NULL,
		null=True,
		blank=True,
	)


	content_panels = Page.content_panels + [
		FieldPanel('service'),
		FieldPanel('hero_image'),
		FieldPanel('hero_title'),
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
	parent_page_types = ['index.HomePage']
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
		return NewsPage.objects.live().order_by('-date_published')

	def get_articles(self):
		return NewspaperArticlePage.objects.live().order_by('-date_published')

	def paginate_news(self, request, *args):
		page = request.GET.get('page')
		paginator = Paginator(self.get_news(), 6)
		try:
			pages = paginator.page(page)
		except PageNotAnInteger:
			pages = paginator.page(1)
		except EmptyPage:
			pages = paginator.page(paginator.num_pages)
		return pages

	def paginate_articles(self, request, *args):
		page = request.GET.get('page')
		paginator = Paginator(self.get_articles(), 8)
		try:
			pages = paginator.page(page)
		except PageNotAnInteger:
			pages = paginator.page(1)
		except EmptyPage:
			pages = paginator.page(paginator.num_pages)
		return pages


	def get_context(self, request):
		context = super(NewsIndexPage, self).get_context(request)

		news = self.paginate_news(request, self.get_news())
		articles = self.paginate_articles(request, self.get_articles())

		news_all = self.get_news()
		articles_all = self.get_articles()
		last_year = news_all.first().date_published.year
		first_year = articles_all.last().date_published.year

		services = Service.objects.live()

		context['current_articles'] = articles
		context['current_news'] = news
		context['services'] = services
		context['news'] = news
		context['years'] = range(first_year, last_year+1)

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
