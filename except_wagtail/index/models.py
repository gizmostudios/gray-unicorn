from django.db import models
from django import forms

from modelcluster.fields import ParentalKey

from wagtail.core.models import Page, Orderable
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, PageChooserPanel, TabbedInterface, ObjectList, MultiFieldPanel
from wagtail.images.edit_handlers import ImageChooserPanel

from django.forms.widgets import Select

from knowledge.models import *
from news.models import *
from projects.models import *
from services.models import *

from modeltranslation.utils import build_localized_fieldname
from django.conf import settings


class CarouselItem(Orderable):
	image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=True,
		on_delete=models.SET_NULL,
		related_name='+'
	)
	
	link_page = models.ForeignKey(
		'wagtailcore.Page',
		null=True,
		blank=True,
		on_delete=models.SET_NULL,
		related_name='+',
	)
	title = models.CharField(max_length=255, blank=True)
	caption = models.CharField(max_length=255, blank=True)
	link_title = models.CharField(max_length=255, blank=True)
	page = ParentalKey('HomePage', related_name='carousel_items')
	scaling = models.CharField(max_length=15, default='fit', choices=(
		('fit', 'fit'), ('fill', 'fill')
	))

	panels = [
		ImageChooserPanel('image'),
		FieldPanel('scaling'),
		MultiFieldPanel([FieldPanel('title')], heading='Title'),
		MultiFieldPanel([FieldPanel('caption')], heading='Caption'),
		MultiFieldPanel([FieldPanel('link_title')], heading='Link Title'),
		PageChooserPanel('link_page'),
	]

class HomePage(Page):
	subpage_types = ['about.AboutPage','services.ServiceIndexPage','knowledge.KnowledgePage','projects.ProjectIndexPage']
	hero_image = models.ImageField(null=True, blank=True)
	navbar_inverted = models.BooleanField(null=True, blank=True)
	navbar_transparent = models.BooleanField(null=True, blank=True)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	introduction = models.TextField(blank=True)
	services_image = models.ImageField(null=True, blank=True)

	content_panels = [
		MultiFieldPanel([
            FieldPanel('title'),
        ], heading='Title'),
		FieldPanel('hero_image'),
		MultiFieldPanel([FieldPanel('hero_title')], heading='Top section title'),
		MultiFieldPanel([FieldPanel('hero_subtitle')], heading='Top section subtitle'),
		FieldPanel('navbar_inverted', widget=forms.CheckboxInput),
		FieldPanel('navbar_transparent', widget=forms.CheckboxInput),
		MultiFieldPanel([FieldPanel('introduction', classname="full")], heading='Introduction'),
		InlinePanel('carousel_items', label="Carousel Items"),
		FieldPanel('services_image'),
	]

	def get_highlight_resources(self):
		highlight = Resource.objects.filter(hightlight=True).order_by('-date_published')
		return highlight

	def get_highlight_news(self):
		highlight = NewsPage.objects.filter(hightlight=True).order_by('-date_published')
		return highlight

	def get_highlight_projects(self):
		highlight = ProjectPage.objects.filter(hightlight=True).order_by('-date_published')
		return highlight

	def get_context(self, request):
		context = super(HomePage, self).get_context(request)

		services = ServicePage.objects.live()
		indexService = ServiceIndexPage.objects.live()[0]

		context['services'] = services
		context['indexService'] = indexService

		return context