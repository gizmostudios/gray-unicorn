from django.db import models
from django import forms

from modelcluster.fields import ParentalKey

from wagtail.core.fields import StreamField
from wagtail.core.models import Page, Orderable
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, PageChooserPanel, StreamFieldPanel
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.snippets.models import register_snippet

from wagtail.core import blocks
from django.forms.widgets import Select
from news.blocks import BaseStreamBlock
from news.models import *


class CarouselImage(Orderable):
    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    page = ParentalKey('ContactPage', related_name='carousel_images')

    panels = [
         ImageChooserPanel('image'),
    ]

@register_snippet
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

@register_snippet
class Partner(Orderable):
    company = models.CharField(max_length=255, null=True, blank=True)
    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    
    panels = [
        FieldPanel('company'),
        ImageChooserPanel('image'),
    ]

    def __str__(self):
        return self.company

class EventCalendarPage(Page):
    parent_page_types = ['about.AboutPage']

    content_panels = Page.content_panels

class CareerPage(Page):
    parent_page_types = ['about.AboutPage']

    hero_image = models.ImageField(null=True, blank=True)
    hero_title = models.CharField(max_length=255, null=True, blank=True)
    hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
    navbar_transparent = models.BooleanField('Transparency of the navigation bar', blank=True, null=True)
    navbar_inverted = models.BooleanField('Colorful navigation bar', blank=True, null=True)

    body = StreamField(BaseStreamBlock(), verbose_name="Page body", blank=True)

    content_panels = Page.content_panels + [
        FieldPanel('navbar_transparent', widget=forms.CheckboxInput),
        FieldPanel('navbar_inverted', widget=forms.CheckboxInput),
        FieldPanel('hero_image'),
        FieldPanel('hero_title'),
        FieldPanel('hero_subtitle'),
        StreamFieldPanel('body'),
    ]

    def get_open_positions(self):
        open_positions = NewsPage.objects.filter(type_of_news='OP').order_by('-date_published').all()
        return open_positions

    def get_context(self, request):
        context = super(CareerPage, self).get_context(request)

        context['open_positions'] = self.get_open_positions()
        return context

class ContactPage(Page):
    parent_page_types = ['about.AboutPage']

    hero_image = models.ImageField(null=True, blank=True)
    hero_title = models.CharField(max_length=255, null=True, blank=True)
    hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
    navbar_transparent = models.BooleanField('Transparency of the navigation bar', blank=True, null=True)
    navbar_inverted = models.BooleanField('Colorful navigation bar', blank=True, null=True)
    

    body = StreamField(BaseStreamBlock(), verbose_name="Page body", blank=True)

    content_panels = Page.content_panels + [
        FieldPanel('navbar_transparent', widget=forms.CheckboxInput),
        FieldPanel('navbar_inverted', widget=forms.CheckboxInput),
        FieldPanel('hero_image'),
        FieldPanel('hero_title'),
        FieldPanel('hero_subtitle'),
        StreamFieldPanel('body'),
        InlinePanel('carousel_images', label="Carousel Images"),
    ]


    
class AboutPage(Page):
    parent_page_types = ['index.HomePage']
    subpage_types = ['people.PeoplePage','news.NewsIndexPage', 'about.CareerPage', 'about.ContactPage', 'about.EventCalendarPage']
    
    hero_image = models.ImageField(null=True, blank=True)
    hero_title = models.CharField(max_length=255, null=True, blank=True)
    hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
    except_introduction = models.TextField(blank=True)
    team_introduction = RichTextField(blank=True)
    collaboration_introduction = RichTextField(blank=True)
    navbar_transparent = models.BooleanField('Transparency of the navigation bar', blank=True, null=True)
    navbar_inverted = models.BooleanField('Colorful navigation bar', blank=True, null=True)
    quote = models.ForeignKey(
        'about.Quote',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+')

    content_panels = Page.content_panels + [
        FieldPanel('navbar_transparent', widget=forms.CheckboxInput),
        FieldPanel('navbar_inverted', widget=forms.CheckboxInput),
        FieldPanel('hero_image'),
        FieldPanel('hero_title'),
        FieldPanel('hero_subtitle'),
        FieldPanel('except_introduction', classname="full"),
        FieldPanel('team_introduction', classname="full"),
        FieldPanel('collaboration_introduction', classname="full"),
        FieldPanel('quote'),
    ]

    def get_context(self, request):
        context = super(AboutPage, self).get_context(request)

        context['partners'] = Partner.objects.all()

        return context