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
from people.models import *
from about.models import *

class TeamMember(Orderable):   
	page = ParentalKey('ProjectPage', related_name='team_members')

	member = models.ForeignKey('people.People', on_delete=models.SET_NULL, null=True, blank=True,)

	panels = [
		FieldPanel('member'),
	]

class ProjectPartner(Orderable):   
	page = ParentalKey('ProjectPage', related_name='project_partners')

	partner = models.ForeignKey('about.Partner', on_delete=models.SET_NULL, null=True, blank=True,)

	panels = [
		FieldPanel('partner'),
	]

class CarouselItem(Orderable):
	image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=True,
		on_delete=models.SET_NULL,
		related_name='+'
	)
	description = models.CharField(max_length=255, blank=True)
	page = ParentalKey('ProjectPage', related_name='carousel_items')

	panels = [
		ImageChooserPanel('image'),
		FieldPanel('description'),
	]

class ProjectResource(Orderable):
	page = ParentalKey('ProjectPage', related_name='project_resources')

	resource = models.ForeignKey('knowledge.Resource', on_delete=models.SET_NULL, null=True, blank=True,)

	panels = [
		FieldPanel('resource'),
	]


class ProjectPage(Page):

	parent_page_types = ['ProjectIndexPage']
	subpage_types = []

	hero_image = models.ImageField(null=True, blank=True)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	date_published = models.DateField("Date article published", blank=False, null=False)
	summary = models.CharField('Summary (1 or 2 sentences max', max_length=255, null=True, blank=True)
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
		InlinePanel('team_members', label="Team members"),
		InlinePanel('project_partners', label="Partners of the project"),
		InlinePanel('project_resources', label="Resources related to the project"),
		FieldPanel('intro', classname="full"),
		FieldPanel('summary'),
		InlinePanel('carousel_items', label="Image Carousel"),
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
		context = super(ProjectPage, self).get_context(request)

		resources = Resource.objects.all().filter(service__id=self.service.id).order_by('-date_published')[0:3]
		projects = ProjectPage.objects.live().filter(service__id=self.service.id).exclude(id=self.id).order_by('-date_published')[0:3]

		context["related_resources"] = resources
		context["projects"] = projects

		return context


class CarouselIndexItem(Orderable):   
    page = ParentalKey('ProjectIndexPage', related_name='carousel_items')

    project = models.ForeignKey('ProjectPage', on_delete=models.SET_NULL, null=True, blank=True,)

    panels = [
        FieldPanel('project'),
    ]


class ProjectIndexPage(Page):

	subpage_types = ['ProjectPage']
	parent_page_types = ['index.HomePage']
	hero_image = models.ImageField(null=True, blank=True)
	navbar_transparent = models.BooleanField('Transparency of the navigation bar', blank=True, null=True)
	navbar_inverted = models.BooleanField('Colorful navigation bar', blank=True, null=True)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	intro = models.TextField(blank=True)


	content_panels = Page.content_panels + [
		FieldPanel('navbar_transparent', widget=forms.CheckboxInput),
		FieldPanel('navbar_inverted', widget=forms.CheckboxInput),
		FieldPanel('hero_image'),
		FieldPanel('hero_title'),
		FieldPanel('hero_subtitle'),
		InlinePanel('carousel_items', label="Project carousel item"),
	]

	def get_projects(self):
		return ProjectPage.objects.live().order_by('-date_published')


	def paginate_projects(self, request, *args):
		page = request.GET.get('page')
		paginator = Paginator(self.get_projects(), 8)
		try:
			pages = paginator.page(page)
		except PageNotAnInteger:
			pages = paginator.page(1)
		except EmptyPage:
			pages = paginator.page(paginator.num_pages)
		return pages


	def get_context(self, request):
		context = super(ProjectIndexPage, self).get_context(request)

		projects = self.paginate_projects(request, self.get_projects())

		projects_all = self.get_projects()
		last_year = projects_all.first().date_published.year
		first_year = projects_all.last().date_published.year

		services = Service.objects.live()

		context['latest_project'] = projects[0:5]
		context['current_projects'] = projects
		context['services'] = services
		context['years'] = range(first_year, last_year+1)

		return context