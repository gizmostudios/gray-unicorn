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

class Expertise(Orderable):
	parent = ParentalKey('People', related_name='expertises')
	competency = models.CharField(max_length=255, null=True, blank=True)

	panels = [
		FieldPanel('competency'),
	]

class Hobby(Orderable):
	parent = ParentalKey('People', related_name='hobbies')
	activity = models.CharField(max_length=255, null=True, blank=True)

	panels = [
		FieldPanel('activity'),
	]

@register_snippet
class People(ClusterableModel):
	user = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.CASCADE,null=True,blank=True,)
	education_title = models.CharField(max_length=255, null=True, blank=True)
	date_joined = models.DateField("Date joined", blank=True, null=True)
	biography = models.TextField(blank=True)
	introduction = StreamField(BaseStreamBlock(), verbose_name="Page body", blank=True)
	picture = models.ImageField(null=True, blank=True)
	job_title = models.CharField(max_length=255, null=True, blank=True)
	phone = models.CharField(max_length=255, null=True, blank=True)

	panels = [
        FieldPanel('user'),
        FieldPanel('education_title'),
        FieldPanel('date_joined'),
        FieldPanel('picture'),
        FieldPanel('job_title'),
        FieldPanel('phone'),
        InlinePanel('expertises', label="Areas of expertise"),
        InlinePanel('hobbies', label="Hobbies"),
        FieldPanel('biography'),
        StreamFieldPanel('introduction'),
    ]

	def __str__(self):
		return self.user.first_name +" "+ self.user.last_name

class ProfilePage(Page):

	subpage_types = []
	parent_page_types = ['PeoplePage']

	person = models.ForeignKey(People,on_delete=models.SET_NULL,null=True,blank=True,)	
	content_panels = Page.content_panels + [
		FieldPanel('person'),
	]

	def get_projects(self):
		projects = ProjectPage.objects.filter(team_members__member__contains=self).all()
		return projects

	def get_articles(self):
		articles = NewsPage.objects.filter(author=self).all()
		return articles

	def get_context(self, request):
		context = super(ProfilePage, self).get_context(request)

		context['projects'] = self.get_projects()
		context['articles'] =self.get_articles()

		context['parent_page'] = PeoplePage.objects.ancestor_of(self).first()
		context['person'] = self.person
		context['user'] = self.person.user
		return context


class PeoplePage(Page):
	parent_page_types = ['index.HomePage']
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

		context['people_list'] = self.get_people()
		return context

	def get_people(self):
		return ProfilePage.objects.order_by('person__date_joined')

