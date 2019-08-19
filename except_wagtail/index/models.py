from django.db import models
from django import forms

from modelcluster.fields import ParentalKey

from wagtail.core.models import Page, Orderable
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, PageChooserPanel, TabbedInterface, ObjectList, MultiFieldPanel
from wagtail.images.edit_handlers import ImageChooserPanel

from django.forms.widgets import Select

from wagtail.core.fields import RichTextField

from knowledge.models import *
from news.models import *
from projects.models import *
from services.models import *

from modeltranslation.utils import build_localized_fieldname
from django.conf import settings


class CarouselImage(Orderable):
	image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=True,
		on_delete=models.SET_NULL,
		related_name='+'
	)
	page = ParentalKey('HomePage', related_name='carousel_images')
	scaling = models.CharField(max_length=15, default='fit', choices=(
		('fit', 'fit'), ('fill', 'fill')
	))

	panels = [
		ImageChooserPanel('image'),
		FieldPanel('scaling'),
	]

class CarouselItem(Orderable):
	link = models.ForeignKey(
		'wagtailcore.Page',
		null=True,
		blank=True,
		on_delete=models.SET_NULL,
		related_name='+')
	page = ParentalKey('HomePage', related_name='carousel_links')
	link_description = models.CharField(max_length=255, null=True, blank=True)

	panels = [
		PageChooserPanel('link'),
		MultiFieldPanel([FieldPanel('link_description', classname="full")], heading='Link button text'),
	]

class HomePage(Page):
	subpage_types = ['about.AboutPage','services.ServiceIndexPage','knowledge.KnowledgePage','projects.ProjectIndexPage']
	hero_image = models.ImageField(null=True, blank=True)
	navbar_inverted = models.BooleanField(null=True, blank=True)
	navbar_transparent = models.BooleanField(null=True, blank=True)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	introduction_title = models.CharField(max_length=255, null=True, blank=True)
	introduction_image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=True,
		on_delete=models.SET_NULL,
		related_name='+'
	)
	introduction_text = models.TextField(blank=True)
	carousel_title = models.CharField(max_length=255, null=True, blank=True)
	carousel_description = models.TextField(blank=True)
	introduction_link = models.ForeignKey(
		'wagtailcore.Page',
		null=True,
		blank=True,
		on_delete=models.SET_NULL,
		related_name='+')
	video_link = models.CharField(max_length=1000, null=True, blank=True)
	video_description = models.TextField(blank=True)

	content_panels = [
		MultiFieldPanel([
            FieldPanel('title'),
        ], heading='Title'),
		FieldPanel('hero_image'),
		MultiFieldPanel([FieldPanel('hero_title')], heading='Top section title'),
		MultiFieldPanel([FieldPanel('hero_subtitle')], heading='Top section subtitle'),
		FieldPanel('navbar_inverted', widget=forms.CheckboxInput),
		FieldPanel('navbar_transparent', widget=forms.CheckboxInput),
		MultiFieldPanel([FieldPanel('introduction_title', classname="full")], heading='Introduction Title'),
		ImageChooserPanel('introduction_image'),
		MultiFieldPanel([FieldPanel('carousel_title', classname="full")], heading='Carousel Section Title'),
		MultiFieldPanel([FieldPanel('carousel_description', classname="full")], heading='Carousel Section Description'),
		InlinePanel('carousel_links', label="Carousel Section Links"),
		PageChooserPanel('introduction_link'),
		InlinePanel('carousel_images', label="Carousel Images"),
		FieldPanel('video_link'),
		FieldPanel('video_description'),
	]

	def get_highlight_videos(self):
		resources = Resource.objects.filter(highlight=True).order_by('-date_published').all()
		for resource in resources:
			if resource.file.name.split('.')[1] == 'pdf':
				highlight = resource
				return highlight
		return

	def get_highlight_resources(self):
		highlight = Resource.objects.filter(highlight=True).order_by('-date_published').all()
		print(highlight[0:2])
		return highlight

	def get_highlight_news(self):
		highlight = NewsPage.objects.filter(highlight=True).order_by('-date_published').all()
		return highlight

	def get_highlight_projects(self):
		highlight = ProjectPage.objects.filter(highlight=True).order_by('-date_published').all()
		return highlight

	def get_context(self, request):
		context = super(HomePage, self).get_context(request)

		services = ServicePage.objects.live()
		indexService = ServiceIndexPage.objects.live()[0]

		context['highlight_video'] = self.get_highlight_videos()
		context['highlight_resources'] = self.get_highlight_resources()[0:2]
		context['highlight_news'] = self.get_highlight_news()[0:2]
		context['highlight_projects'] = self.get_highlight_projects()[0:2]
		context['services'] = services
		context['indexService'] = indexService

		return context