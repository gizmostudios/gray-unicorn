from django.db import models
from django import forms
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from datetime import datetime, date

from modelcluster.fields import ParentalKey

from wagtail.core.fields import StreamField
from wagtail.core.models import Page, Orderable
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, PageChooserPanel, StreamFieldPanel
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.snippets.models import register_snippet

from wagtail.core.fields import RichTextField

from django.forms.widgets import Select

from wagtail.core import blocks
from wagtail.images.blocks import ImageChooserBlock
from news.blocks import BaseStreamBlock
from services.models import WorkingAreaPage
from about.models import *

# Images for carousels in hero section

class TopImage(Orderable):
	image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=False,
		on_delete=models.SET_NULL,
		related_name='+'
	)
	page = ParentalKey('ProjectPage', related_name='top_images')

	panels = [
		ImageChooserPanel('image'),
	]

# Uploaded file to go in Media & Download section of news

class File(models.Model):
	name = models.CharField(max_length=255, null=True, blank=True)
	file = models.FileField(null=True, blank=True)
	path_to_thumbnail = models.CharField(max_length=255, null=True, blank=True)

	page = ParentalKey('ProjectPage', related_name='downloads', null=True)

	def extension(self):
		name, extension = os.path.splitext(self.file.name)
		return extension

	def thumbnail(self):
		
		dir_path = os.path.dirname(os.path.realpath(__file__))
		par_dir = os.path.abspath(os.path.join(dir_path, os.pardir))
		if self.path_to_thumbnail is None:
			cache_path = par_dir+'/media/'
			pdf_or_odt_to_preview_path = par_dir+self.file.url
			manager = PreviewManager(cache_path, create_folder= True)
			path_to_preview_image = manager.get_jpeg_preview(pdf_or_odt_to_preview_path)
			path, file = path_to_preview_image.split('/media/')
			self.thumbnail = file
			print(self.thumbnail)
			return self.thumbnail
		else:		
			return self.path_to_thumbnail

	panels = [
		FieldPanel('name'),
		FieldPanel('file'),
	]

# People within Except participating to the project

class TeamMember(Orderable):   
	page = ParentalKey('ProjectPage', related_name='team_members')

	member = models.ForeignKey('people.People', on_delete=models.SET_NULL, null=True, blank=True,)

	panels = [
		FieldPanel('member'),
	]

	def get_page(self):
		page = self.member.profilepage_set.first()
		return page

# Clients and companies collaborating with Except on the project

class ProjectPartner(Orderable):   
	page = ParentalKey('ProjectPage', related_name='project_partners')

	partner = models.ForeignKey('about.Partner', on_delete=models.SET_NULL, null=True, blank=True,)

	panels = [
		FieldPanel('partner'),
	]

# External member from partners or freelancer working on the project

class ExternalMember(Orderable):
	page = ParentalKey('ProjectPage', related_name='external_members')

	first_name = models.CharField(max_length=255, null=True, blank=True, verbose_name="First name")
	last_name = models.CharField(max_length=255, null=True, blank=True, verbose_name="Last name")
	company = models.CharField(max_length=255, null=True, blank=True, verbose_name="Company")
	job_title = models.CharField(max_length=255, null=True, blank=True, verbose_name="Job title")

	panels = [
		FieldPanel('first_name'),
		FieldPanel('last_name'),
		FieldPanel('company'),
		FieldPanel('job_title'),
	]

# Connection with related articles

class LinkedArticle(Orderable):
	page = ParentalKey('ProjectPage', related_name='linked_articles')

	element = models.ForeignKey('knowledge.ArticlePage', on_delete=models.SET_NULL, null=True, blank=True, verbose_name="Article")

	panels = [
		FieldPanel('element'),
	]

# Connection with related projects

class LinkedProject(Orderable):
	page = ParentalKey('ProjectPage', related_name='linked_projects')

	element = models.ForeignKey('projects.ProjectPage', on_delete=models.SET_NULL, null=True, blank=True, verbose_name="Project")

	panels = [
		FieldPanel('element'),
	]


class ProjectPage(Page):

	parent_page_types = ['ProjectIndexPage']
	subpage_types = []

	hero_old_image = models.ImageField(null=True, blank=True)

	highlight = models.BooleanField(blank=True, null=True)
	hero_title = models.CharField(max_length=255, null=True, blank=False)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	date_published = models.DateField("Date of publication", blank=False, null=False, default=date.today)
	summary = models.CharField('Summary (1 or 2 sentences max)', max_length=255, null=True, blank=True)
	intro = RichTextField(blank=True, null=True, verbose_name="Introduction")
	body = StreamField(BaseStreamBlock(), verbose_name="Article body", blank=True)
	author = models.ForeignKey('people.People',on_delete=models.SET_NULL,null=True,blank=True,)
	service = models.ForeignKey(
		WorkingAreaPage,
		on_delete=models.SET_NULL,
		null=True,
		blank=True,
		verbose_name="Working area"
	)

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
				FieldPanel('highlight', widget=forms.CheckboxInput),
				FieldPanel('service'),
				FieldPanel('date_published'),
				FieldPanel('author'),
			],
			heading='Meta data',
			classname="collapsible collapsed"
		),
		MultiFieldPanel([
				InlinePanel('team_members', label="Team members"),
				InlinePanel('external_members', label="External members"),
				InlinePanel('project_partners', label="Partners of the project"),
			],
			heading='Participants',
			classname="collapsible collapsed"
		),
		MultiFieldPanel([
				FieldPanel('summary'),
				FieldPanel('intro', classname="full"),
				StreamFieldPanel('body'),
			],
			heading='Article contain',
			classname="collapsible collapsed"
		),
		MultiFieldPanel([
				InlinePanel('linked_articles', max_num=2, label='Related articles'),
				InlinePanel('linked_projects', max_num=2, label='Related projects'),
				InlinePanel('downloads', label='Files to downloads'),
			],
			heading='Related assets',
			classname="collapsible collapsed"
		),
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
		try:
			if len(self.hero_title) <= 70:
				long_intro = False
			return long_intro
		except:
			return

	def image_version(self):
		if len(self.top_images) == 0:
			return "http://media.except.nl/media/"+hero_old_image.url
		else:
			return self.top_images[0]


class ProjectIndexPage(Page):

	subpage_types = ['ProjectPage']
	parent_page_types = ['index.HomePage']
	hero_image = models.ForeignKey(
		'wagtailimages.Image',
		null=True,
		blank=True,
		on_delete=models.SET_NULL,
		related_name='+',
	)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	description_title = models.CharField(max_length=255, null=True, blank=True, verbose_name="Title")
	intro = models.TextField(blank=True, verbose_name="text")

	content_panels = [
		MultiFieldPanel([
            FieldPanel('title'),
        ], heading='Title'),
		MultiFieldPanel([
				FieldPanel('hero_title'),
				FieldPanel('hero_subtitle'),
				ImageChooserPanel('hero_image'),
			],
			heading='Top section',
			classname="collapsible"
		),
		MultiFieldPanel([
				FieldPanel('description_title'),
				FieldPanel('intro', classname="full"),
			],
			heading='Articles description',
			classname="collapsible"
		),
	]

	def get_projects(self):
		return ProjectPage.objects.live().order_by('-date_published')

	def highlight_projects(self):
		return ProjectPage.objects.live().filter(highlight=True).order_by('-date_published').all()


	def get_context(self, request):
		context = super(ProjectIndexPage, self).get_context(request)


		projects_all = self.get_projects()
		last_year = projects_all.first().date_published.year
		first_year = projects_all.last().date_published.year

		services = WorkingAreaPage.objects.live()

		context['not_last'] = len(projects_all)>8
		context['highlights'] = self.highlight_projects()[0:4]
		context['latest_project'] = projects_all[0:3]
		context['current_projects'] = projects_all[0:8]
		context['projects'] = projects_all
		context['services'] = services
		context['years'] = range(first_year, last_year+1)

		return context