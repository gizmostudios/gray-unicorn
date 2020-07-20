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
from about.models import *

from modeltranslation.utils import build_localized_fieldname
from django.conf import settings
from PIL import Image

# Images for carousel in hero section

class TopImage(Orderable):
	image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=True,
		on_delete=models.SET_NULL,
		related_name='+',
	)
	page = ParentalKey('HomePage', related_name='top_images')

	panels = [
		ImageChooserPanel('image'),
	]

class HomePage(Page):
	subpage_types = ['about.AboutPage','services.ServiceIndexPage','knowledge.KnowledgePage','projects.ProjectIndexPage']

	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	introduction_title = models.CharField(max_length=255, null=True, blank=True, verbose_name="Title")
	introduction_text = models.TextField(blank=True, verbose_name="Text")
	carousel_title = models.CharField(max_length=255, null=True, blank=True, verbose_name="Title")
	carousel_description = models.TextField(blank=True, verbose_name="Text")
	carousel_image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=True,
		on_delete=models.SET_NULL,
		related_name='+',
		verbose_name="Image"
	)
	video_link = models.CharField(max_length=1000, null=True, blank=True, verbose_name="link to the video (in latest news section)")
	video_description = models.TextField(blank=True, verbose_name="Description of the video (in latest news section)")

	content_panels = [
		MultiFieldPanel([
            FieldPanel('title'),
        ], heading='Title'),
		MultiFieldPanel([
				FieldPanel('hero_title'),
				FieldPanel('hero_subtitle'),
				InlinePanel('top_images', label='Top section carousel images'),
			],
			heading='Top section',
			classname="collapsible"
		),
		MultiFieldPanel([
				FieldPanel('introduction_title', classname="full"),
				FieldPanel('introduction_text', classname="full"),
			],
			heading='First section',
			classname="collapsible collapsed"
		),
		MultiFieldPanel([
				FieldPanel('carousel_title', classname="full"),
				FieldPanel('carousel_description', classname="full"),
				ImageChooserPanel('carousel_image'),
			],
			heading='Second section',
			classname="collapsible collapsed"
		),
		MultiFieldPanel([
				FieldPanel('video_link'),
				FieldPanel('video_description'),
			],
			heading='Link & Resource in Latest News',
			classname="collapsible collapsed"
		),
	]


	def get_highlight_resources(self):
		highlight = ArticlePage.objects.filter(highlight=True).order_by('-date_published').all()
		return highlight

	def get_highlight_article(self):
		highlight = NewsPage.objects.filter(highlight=True, type_of_news='AR').order_by('-date_published').all()
		return highlight

	def get_highlight_event(self):
		highlight = NewsPage.objects.filter(highlight=True, type_of_news='EV').order_by('-date_published').all()
		return highlight

	def get_highlight_open_position(self):
		highlight = NewsPage.objects.filter(highlight=True, type_of_news='OP').order_by('-date_published').all()
		return highlight

	def get_highlight_projects(self):
		highlight = ProjectPage.objects.filter(highlight=True).order_by('-date_published').all()
		return highlight

	def get_link_resources(self):
		return KnowledgePage.objects.live().first()

	def get_link_news(self):
		return NewsIndexPage.objects.live().first()

	def get_link_projects(self):
		return ProjectIndexPage.objects.live().first()

	def get_link_work_with_us(self):
		return CareerPage.objects.live().first()

	def get_event_calendar(self):
		return EventCalendarPage.objects.live().first()

	def get_context(self, request):
		context = super(HomePage, self).get_context(request)

		services = WorkingAreaPage.objects.live()
		indexService = ServiceIndexPage.objects.live()[0]

		context['highlight_pdf'] = self.get_highlight_resources().first()
		context['link_resources'] = self.get_link_resources()
		context['link_news'] = self.get_link_news()
		context['link_projects'] = self.get_link_projects()
		context['link_work_with_us'] = self.get_link_work_with_us()
		context['link_calendar'] = self.get_event_calendar()
		context['highlight_resources'] = self.get_highlight_resources().all()[1]
		context['highlight_article'] = self.get_highlight_article().first()
		context['highlight_event'] = self.get_highlight_event().first()
		context['highlight_open_position'] = self.get_highlight_open_position().first()
		context['highlight_projects'] = self.get_highlight_projects().first()
		context['news_index'] = NewsIndexPage.objects.live().first()
		context['projects_index'] = ProjectIndexPage.objects.live().first()
		context['knowledge'] = KnowledgePage.objects.live().first()
		context['services'] = services
		context['indexService'] = indexService

		return context