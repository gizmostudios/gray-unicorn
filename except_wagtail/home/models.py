from django.db import models

from modelcluster.fields import ParentalKey

from wagtail.core.models import Page, Orderable
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, PageChooserPanel
from wagtail.images.edit_handlers import ImageChooserPanel

from django.forms.widgets import Select

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
    hero_image = models.ImageField(null=True, blank=True)
    hero_title = models.CharField(max_length=255, null=True, blank=True)
    hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
    body = RichTextField(blank=True)

    content_panels = Page.content_panels + [
        FieldPanel('hero_image'),
        FieldPanel('hero_title'),
        FieldPanel('hero_subtitle'),
        FieldPanel('body', classname="full"),
        InlinePanel('carousel_items', label="Carousel Items"),
    ]

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
    hero_image = models.ImageField(null=True, blank=True)
    hero_title = models.CharField(max_length=255, null=True, blank=True)
    hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
    except_introduction = RichTextField(blank=True)
    team_introduction = RichTextField(blank=True)
    collaboration_introduction = RichTextField(blank=True)

    content_panels = Page.content_panels + [
        FieldPanel('hero_image'),
        FieldPanel('hero_title'),
        FieldPanel('hero_subtitle'),
        FieldPanel('except_introduction', classname="full"),
        FieldPanel('team_introduction', classname="full"),
        FieldPanel('collaboration_introduction', classname="full"),
        InlinePanel('quotes', label="Quotes"),
        InlinePanel('partners', label="Partners"),
    ]
