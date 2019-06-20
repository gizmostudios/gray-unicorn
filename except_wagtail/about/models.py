from django.db import models
from django import forms

from modelcluster.fields import ParentalKey

from wagtail.core.models import Page, Orderable
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, PageChooserPanel
from wagtail.images.edit_handlers import ImageChooserPanel

from django.forms.widgets import Select

class Quote(Orderable):
    company = models.CharField(max_length=255, null=True, blank=True)
    caption = RichTextField(blank=True)
    name = models.CharField(max_length=255, null=True, blank=True)
    page = ParentalKey('AboutPage', related_name='quotes')

    panels = [
        FieldPanel('company'),
        FieldPanel('name'),
        FieldPanel('caption', classname="full")
    ]

class Partner(Orderable):
    image = models.ImageField(null=True, blank=True)
    page = ParentalKey('AboutPage', related_name='partners')

    panels = [
        FieldPanel('image')
    ]

class AboutPage(Page):
    parent_page_types = ['index.HomePage']
    subpage_types = []
    
    hero_image = models.ImageField(null=True, blank=True)
    hero_title = models.CharField(max_length=255, null=True, blank=True)
    hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
    except_introduction = models.TextField(blank=True)
    team_introduction = RichTextField(blank=True)
    collaboration_introduction = RichTextField(blank=True)
    navbar_transparent = models.BooleanField('Transparency of the navigation bar', blank=True, null=True)
    navbar_inverted = models.BooleanField('Colorful navigation bar', blank=True, null=True)

    content_panels = Page.content_panels + [
        FieldPanel('navbar_transparent', widget=forms.CheckboxInput),
        FieldPanel('navbar_inverted', widget=forms.CheckboxInput),
        FieldPanel('hero_image'),
        FieldPanel('hero_title'),
        FieldPanel('hero_subtitle'),
        FieldPanel('except_introduction', classname="full"),
        FieldPanel('team_introduction', classname="full"),
        FieldPanel('collaboration_introduction', classname="full"),
        InlinePanel('quotes', label="Quotes"),
        InlinePanel('partners', label="Partners"),
    ]