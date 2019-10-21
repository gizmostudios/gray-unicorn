from django.contrib.auth.models import AbstractUser
from django.db import models
from django import forms
from django.conf import settings
from modelcluster.fields import ParentalKey
from modelcluster.models import ClusterableModel

from wagtail.core.fields import StreamField
from wagtail.core.models import Page, Orderable
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, PageChooserPanel, StreamFieldPanel
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.snippets.models import register_snippet

from django.forms.widgets import Select
from news.blocks import BaseStreamBlock
from projects.models import *
from news.models import *

# Skills and Expertise of people

class Expertise(Orderable):
	parent = ParentalKey('People', related_name='expertises')
	competency = models.CharField(max_length=255, null=True, blank=True)

	panels = [
		FieldPanel('competency'),
	]

# Hobbies & liked activities of people

class Hobby(Orderable):
	parent = ParentalKey('People', related_name='hobbies')
	activity = models.CharField(max_length=255, null=True, blank=True)

	panels = [
		FieldPanel('activity'),
	]

# Full profile of an user register in snippet to manage visibility on the website

@register_snippet
class People(ClusterableModel):
	user = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.CASCADE,null=True,blank=True,)
	education_title = models.CharField(max_length=255, null=True, blank=True)
	date_joined = models.DateField("Date joined", blank=True, null=True)
	biography = models.TextField(blank=True)
	introduction = StreamField(BaseStreamBlock(), verbose_name="Page body", blank=True)
	picture = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
	job_title = models.CharField(max_length=255, null=True, blank=True)
	phone = models.CharField(max_length=255, null=True, blank=True)

	panels = [
		FieldPanel('user'),
		FieldPanel('education_title'),
		FieldPanel('date_joined'),
		ImageChooserPanel('picture'),
		FieldPanel('job_title'),
		FieldPanel('phone'),
		InlinePanel('expertises', label="Areas of expertise"),
		InlinePanel('hobbies', label="Hobbies"),
		FieldPanel('biography'),
		StreamFieldPanel('introduction'),
	]

	class Meta:
		verbose_name_plural = "People"

	def __str__(self):
		return self.user.first_name +" "+ self.user.last_name

# Page related to a people models one page per person

class ProfilePage(Page):

	subpage_types = []
	parent_page_types = ['PeoplePage']

	person = models.ForeignKey(People,on_delete=models.SET_NULL,null=True,blank=True,)	
	content_panels = Page.content_panels + [
		FieldPanel('person'),
	]

	def get_projects(self):
		participations = TeamMember.objects.filter(member=self.person).all()
		projects = ProjectPage.objects.filter(team_members__in=participations).all()

		return projects

	def get_articles(self):
		articles = ArticlePage.objects.filter(author=self.person).all()
		return articles

	def get_context(self, request):
		context = super(ProfilePage, self).get_context(request)

		context['projects'] = self.get_projects()
		context['articles'] =self.get_articles()

		context['parent_page'] = PeoplePage.objects.ancestor_of(self).first()
		context['person'] = self.person
		context['user'] = self.person.user
		print(context)
		return context

# Page introducing the team and listing all people in the company

class PeoplePage(Page):
	parent_page_types = ['about.AboutPage']
	subpage_types = ['ProfilePage']
	
	hero_image = models.ImageField(null=True, blank=True)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	description_title = models.CharField(max_length=255, null=True, blank=True)
	intro = models.TextField(blank=True)
	description = models.TextField(blank=True)
	navbar_transparent = models.BooleanField('Transparency of the navigation bar', blank=True, null=True)
	navbar_inverted = models.BooleanField('Colorful navigation bar', blank=True, null=True)

	content_panels = Page.content_panels + [
		FieldPanel('navbar_transparent', widget=forms.CheckboxInput),
		FieldPanel('navbar_inverted', widget=forms.CheckboxInput),
		FieldPanel('hero_image'),
		FieldPanel('hero_title'),
		FieldPanel('hero_subtitle'),
		FieldPanel('description_title'),
		FieldPanel('intro', classname="full"),
		FieldPanel('description', classname="full"),
	]

	def get_context(self, request):
		context = super(PeoplePage, self).get_context(request)
		
		people = self.get_people()
		missing_columns_number = 3-len(self.get_people())%3
		context['people_list'] = self.get_people()
		context['missing_columns'] = people[0:missing_columns_number]
		return context

	def get_people(self):
		return ProfilePage.objects.order_by('person__date_joined')

