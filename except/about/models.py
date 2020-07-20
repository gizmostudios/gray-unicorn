from django.db import models
from django import forms
from datetime import date

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

# Image for the carousel in contact page

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

# Partners (clients) of Except stored in snippets for easier management

@register_snippet
class Partner(Orderable):
    company_name = models.CharField(max_length=255, blank=False, default="Placeholder", verbose_name="Name of the company")
    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
        verbose_name="Logo of the company"
    )

    
    panels = [
        FieldPanel('company_name'),
        ImageChooserPanel('image'),
    ]

    def __str__(self):
        return self.company

# Downloadable files, content...

@register_snippet
class Resource(Orderable):
    name = models.CharField(max_length=255, blank=False, default="Placeholder", verbose_name="Name of resource")
    file = models.FileField(null=True, verbose_name="File")
    description = models.CharField(max_length=255, null=True, blank=True, verbose_name="Description")
    path_to_thumbnail = models.CharField(max_length=255, null=True, blank=True)
    date_published = models.DateField("Date article published", blank=True, default=date.today)

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
        MultiFieldPanel([
            FieldPanel('name'),
            FieldPanel('file'),
        ], heading='Resource'),
        MultiFieldPanel([
            FieldPanel('name'),
        ], heading='Short description of the resource'),
        FieldPanel('date_published'),
    ]

# Placeholder page for event calendar

class EventCalendarPage(Page):
    parent_page_types = ['about.AboutPage']

    content_panels = Page.content_panels

# Page for downloadables (articles, piece of content that are not articles)

class ResourcesPage(Page):
    parent_page_types = ['about.AboutPage']

    hero_title = models.CharField(max_length=255, blank=False, default="Placeholder")
    hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
    

    content_panels = Page.content_panels + [
        MultiFieldPanel([
            FieldPanel('hero_title'),
            FieldPanel('hero_subtitle'),
        ], heading='Top section'),      
    ]

    def get_context(self, request):
        context = super(ResourcesPage, self).get_context(request)

        context['resources'] = Resource.objects.order_by('-date_published').all()
        return context

# Page for the work with us section

class CareerPage(Page):
    parent_page_types = ['about.AboutPage']

    hero_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    hero_title = models.CharField(max_length=255, blank=False, default="Placeholder")
    hero_subtitle = models.CharField(max_length=255, null=True, blank=True)

    body = StreamField(BaseStreamBlock(), verbose_name="Page body", blank=True)

    content_panels = Page.content_panels + [
        MultiFieldPanel([
            FieldPanel('hero_title'),
            FieldPanel('hero_subtitle'),
            ImageChooserPanel('hero_image'),
        ], heading='Top section'),
        MultiFieldPanel([
            StreamFieldPanel('body'),
        ], heading='Page body'),
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

    hero_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    hero_title = models.CharField(max_length=255, blank=False, default="Placeholder")
    hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
    

    body = StreamField(BaseStreamBlock(), verbose_name="Page body", blank=True)

    content_panels = Page.content_panels + [
        MultiFieldPanel([
            FieldPanel('hero_title'),
            FieldPanel('hero_subtitle'),
            ImageChooserPanel('hero_image'),
        ], heading='Top section'),
        MultiFieldPanel([
            StreamFieldPanel('body'),
            InlinePanel('carousel_images', label="Carousel of images"),
        ], heading='Page body'),
    ]


class AboutPage(Page):
    parent_page_types = ['index.HomePage']
    subpage_types = ['people.PeoplePage','news.NewsIndexPage', 'about.CareerPage', 'about.ContactPage', 'about.EventCalendarPage','about.ResourcesPage']
    
    hero_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    hero_title = models.CharField(max_length=255, blank=False, default="Placeholder")
    hero_subtitle = models.CharField(max_length=255, null=True, blank=True)
    about_title = models.CharField(max_length=255, blank=False, default="To be defined", verbose_name="Title")
    about_text = StreamField(BaseStreamBlock(), verbose_name="Text", blank=True)
    vision_title = models.CharField(max_length=255, blank=False, default="To be defined", verbose_name="Title")
    vision_text = StreamField(BaseStreamBlock(), verbose_name="Text", blank=True)
    vision_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
        verbose_name="Image"
    )

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
                FieldPanel('about_title', classname="full"),
                FieldPanel('about_text', classname="full"),
            ],
            heading='First section',
            classname="collapsible collapsed"
        ),
        MultiFieldPanel([
                FieldPanel('vision_title', classname="full"),
                FieldPanel('vision_text', classname="full"),
                ImageChooserPanel('vision_image'),
            ],
            heading='Second section',
            classname="collapsible collapsed"
        ),
    ]

    def get_context(self, request):
        context = super(AboutPage, self).get_context(request)

        context['partners'] = Partner.objects.all()

        return context