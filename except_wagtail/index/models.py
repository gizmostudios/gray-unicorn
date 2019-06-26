from django.db import models
from django import forms

from modelcluster.fields import ParentalKey

from wagtail.core.models import Page, Orderable
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, PageChooserPanel
from wagtail.images.edit_handlers import ImageChooserPanel

from django.forms.widgets import Select
from about.models import *
from knowledge.models import *
from news.models import *
from people.models import *
from services.models import *
from projects.models import *

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
		FieldPanel('title'),
		FieldPanel('caption'),
		FieldPanel('link_title'),
		PageChooserPanel('link_page'),
	]

class HomePage(Page):
	subpage_types = [AboutPage,PeoplePage,ServiceIndexPage,NewsIndexPage,KnowledgePage,ProjectIndexPage]
	hero_image = models.ImageField(null=True, blank=True)
	navbar_inverted = models.BooleanField(null=True, blank=True)
	navbar_transparent = models.BooleanField(null=True, blank=True)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	intro = models.TextField(blank=True)
	services_image = models.ImageField(null=True, blank=True)

	content_panels = Page.content_panels + [
		FieldPanel('hero_image'),
		FieldPanel('navbar_inverted', widget=forms.CheckboxInput),
		FieldPanel('navbar_transparent', widget=forms.CheckboxInput),
		FieldPanel('hero_title'),
		FieldPanel('hero_subtitle'),
		FieldPanel('intro', classname="full"),
		InlinePanel('carousel_items', label="Carousel Items"),
		FieldPanel('services_image'),
	]

	def get_context(self, request):
		context = super(HomePage, self).get_context(request)

		services = ServicePage.objects.live()
		indexService = ServiceIndexPage.objects.live()[0]

		context['services'] = services
		context['indexService'] = indexService

		return context