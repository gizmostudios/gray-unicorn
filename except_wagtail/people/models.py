from django.contrib.auth.models import AbstractUser
from django.db import models

from modelcluster.fields import ParentalKey

from wagtail.core.models import Page, Orderable
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, PageChooserPanel
from wagtail.images.edit_handlers import ImageChooserPanel

from django.forms.widgets import Select

class People(AbstractUser):
    biography = models.TextField(blank=True)
    introduction = models.TextField(blank=True)
    picture = models.ImageField(null=True, blank=True)
    job_title = models.CharField(max_length=255, null=True, blank=True)
    phone = models.CharField(max_length=255, null=True, blank=True)


class PeoplePage(Page):
	hero_image = models.ImageField(null=True, blank=True)
	hero_title = models.CharField(max_length=255, null=True, blank=True)
	hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
	description_title = models.CharField(max_length=255, null=True, blank=True)
	intro = models.TextField(blank=True)
	description = models.TextField(blank=True)

	content_panels = Page.content_panels + [
        FieldPanel('hero_image'),
        FieldPanel('hero_title'),
        FieldPanel('hero_subtitle'),
        FieldPanel('description_title'),
        FieldPanel('intro', classname="full"),
        FieldPanel('description', classname="full"),
    ]

	def get_people(self):
		return People.objects.exclude(username = 'admin').order_by('-date_joined')