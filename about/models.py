from datetime import date

from django.db import models
from django.core.files.images import ImageFile

from wagtail.admin.edit_handlers import (
    FieldPanel, StreamFieldPanel, MultiFieldPanel, InlinePanel,
)
from wagtail.core.fields import StreamField
from wagtail.core.models import Page, Orderable
from wagtail.images.models import Image
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.snippets.models import register_snippet
from wagtail.search import index

from preview_generator.manager import PreviewManager
from modelcluster.fields import ParentalKey

from except_wagtail.abstract_models import AbstractHero
from except_wagtail.blocks import BaseStreamBlock
from news.models import NewsPage


class AboutPageQuote(Orderable):
    """
    Quote model for Carousel on the About page.

    """
    text = models.TextField(
        help_text='Line breaks will be respected. Use an empty line between '
                  'paragraphs to separate them.'
    )
    author = models.TextField()
    position = models.TextField()
    page = ParentalKey('AboutPage', related_name='quotes')

    panels = [
        FieldPanel('text', classname='full'),
        FieldPanel('author'),
        FieldPanel('position'),
    ]


class AboutPage(AbstractHero, Page):
    """
    About page model.

    """
    # Introduction (first) section:
    intro_first = models.TextField(
        help_text='Line breaks will be respected. Use an empty line between '
                  'paragraphs to separate them.',
    )
    intro_second = models.TextField(
        blank=True,
        help_text='Line breaks will be respected. Use an empty line between '
                  'paragraphs to separate them.',
    )
    intro_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
        verbose_name='Intro Image',
    )
    # Second section is Quotes Carousel.
    # Third section:
    video = models.TextField(
        blank=True,
        help_text='Use the "Share" button on YouTube, click "Embed" and copy '
        'the code starting with <iframe>. Works with other services too.',
    )
    # Fourth section:
    fourth_section_title = models.CharField(max_length=70)
    fourth_section_text = models.TextField(
        help_text='Line breaks will be respected. Use an empty line between '
                  'paragraphs to separate them.',
    )
    fourth_section_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    # Fifth section:
    fifth_section_title = models.CharField(max_length=70)
    fifth_section_text = models.TextField(
        help_text='Line breaks will be respected. Use an empty line between '
                  'paragraphs to separate them.',
    )
    fifth_section_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    # Sixth section:
    sixth_section_title = models.CharField(max_length=70)
    sixth_section_text = models.TextField(
        help_text='Line breaks will be respected. Use an empty line between '
                  'paragraphs to separate them.',
    )
    sixth_section_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    # Seventh section (with partners):
    seventh_section_title = models.CharField(max_length=70)
    seventh_section_text = models.TextField(
        help_text='Line breaks will be respected. Use an empty line between '
                  'paragraphs to separate them.',
    )

    search_fields = Page.search_fields + [
        index.SearchField('hero_title'),
        index.SearchField('hero_subtitle'),
        index.SearchField('intro_first'),
        index.SearchField('intro_second'),
        index.SearchField('fourth_section_title'),
        index.SearchField('fourth_section_text'),
        index.SearchField('fifth_section_text'),
        index.SearchField('fifth_section_text'),
        index.SearchField('sixth_section_text'),
        index.SearchField('sixth_section_text'),
        index.SearchField('seventh_section_text'),
        index.SearchField('seventh_section_text'),

    ]

    content_panels = Page.content_panels + [
        FieldPanel('intro_first', classname='full'),
        FieldPanel('intro_second', classname='full'),
        ImageChooserPanel('intro_image'),
        InlinePanel(
            'quotes',
            max_num=4,
            label='Quotes',
        ),
        FieldPanel('video', classname='full'),
        FieldPanel('fourth_section_title'),
        FieldPanel('fourth_section_text', classname='full'),
        ImageChooserPanel('fourth_section_image'),
        FieldPanel('fifth_section_title'),
        FieldPanel('fifth_section_text', classname='full'),
        ImageChooserPanel('fifth_section_image'),
        FieldPanel('sixth_section_title'),
        FieldPanel('sixth_section_text', classname='full'),
        ImageChooserPanel('sixth_section_image'),
        FieldPanel('seventh_section_title'),
        FieldPanel('seventh_section_text', classname='full'),
    ]

    parent_page_types = ['index.HomePage']
    subpage_types = [
        'people.PeoplePage',
        'news.NewsIndexPage',
        'CareerPage',
        'ContactPage',
        'EventCalendarPage',
        'ResourcesPage',
    ]

    def get_context(self, request):
        context = super(AboutPage, self).get_context(request)

        context['partners'] = Partner.objects.all().order_by('image__title')

        return context


class ContactPage(AbstractHero, Page):
    body = StreamField(BaseStreamBlock(), verbose_name='Page body')

    search_fields = Page.search_fields + [
        index.SearchField('hero_title'),
        index.SearchField('hero_subtitle'),
        index.SearchField('body'),
    ]

    content_panels = Page.content_panels + [
        MultiFieldPanel([
            FieldPanel('hero_title'),
            FieldPanel('hero_subtitle'),
            FieldPanel('hero_video'),
            ImageChooserPanel('hero_video_poster'),
            ImageChooserPanel('hero_image'),
        ], heading='Hero section'),
        MultiFieldPanel([
            StreamFieldPanel('body'),
        ], heading='Page body'),
    ]

    parent_page_types = ['about.AboutPage']


# Page for the work with us section
class CareerPage(AbstractHero, Page):
    body_title = models.CharField(max_length=128, verbose_name='Page title')
    body = StreamField(BaseStreamBlock(), verbose_name='Page body')

    search_fields = Page.search_fields + [
        index.SearchField('hero_title'),
        index.SearchField('hero_subtitle'),
        index.SearchField('body_title'),
        index.SearchField('body'),
    ]

    content_panels = Page.content_panels + [
        MultiFieldPanel([
            FieldPanel('hero_title'),
            FieldPanel('hero_subtitle'),
            FieldPanel('hero_video'),
            ImageChooserPanel('hero_video_poster'),
            ImageChooserPanel('hero_image'),
        ], heading='Hero section'),
        MultiFieldPanel([
            FieldPanel('body_title'),
            StreamFieldPanel('body'),
        ], heading='Page body'),
    ]

    parent_page_types = ['about.AboutPage']

    def get_context(self, request):
        context = super(CareerPage, self).get_context(request)

        context['open_positions'] = NewsPage.objects.live().filter(
            type_of_news='OP'
        ).order_by('-date_published').all()

        return context


# Partners (clients) of Except stored in snippets for easier management
@register_snippet
class Partner(Orderable):
    TYPE = (
        ('C', 'Client'),
        ('P', 'Partner'),
    )

    entry_type =  models.CharField(
        default='P',
        choices=TYPE,
        max_length=1,
        verbose_name='Type',
    )
    company_name = models.CharField(
        max_length=128,
        verbose_name='Name of the company',
    )
    subtitle = models.CharField(
        blank=True,
        max_length=128,
        null=True,
    )
    short_description = models.TextField(
        blank=True,
        null=True,
    )
    body = StreamField(
        BaseStreamBlock(),
        blank=True,
        null=True,
    )

    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
        verbose_name='Logo of the company',
    )
    link = models.URLField(
        blank=True,
        null=True,
    )

    panels = [
        MultiFieldPanel([
            FieldPanel('entry_type'),
            FieldPanel('company_name'),
            FieldPanel('subtitle'),
            FieldPanel('short_description'),
            StreamFieldPanel('body'),
        ], heading='Partner/Client information'),
        MultiFieldPanel([
            ImageChooserPanel('image'),
            FieldPanel('link'),
        ], heading='Logo and link'),
    ]

    def __str__(self):
        return self.company_name

    class Meta:
        verbose_name = 'Partner or Client'
        verbose_name_plural = 'Partners and Clients'


# Downloadable files, content...
@register_snippet
class Resource(Orderable):
    name = models.CharField(max_length=64)
    fileobj = models.FileField(upload_to='resources/')
    thumbnail = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.CASCADE,
        related_name='+',
    )
    description = models.CharField(max_length=128, blank=True)
    date_published = models.DateField(default=date.today)

    panels = [
        MultiFieldPanel([
            FieldPanel('name'),
            FieldPanel('fileobj'),
            FieldPanel('description'),
            FieldPanel('date_published'),
        ], heading='Resource'),
    ]

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)

        if not self.thumbnail:
            try:
                manager = PreviewManager('/tmp/', create_folder=True)
                path_to_preview = manager.get_jpeg_preview(
                    self.fileobj.path,
                    width=2000,
                    height=2000,
                )
                with open(path_to_preview, 'rb') as preview:
                    wagtail_image = Image.objects.create(
                        title=self.name,
                        file=ImageFile(preview, name=self.name),
                    )
                self.thumbnail = wagtail_image
                self.save()
            except:
                # Not good exception handling, but in this case it's fine.
                pass


# Placeholder page for event calendar
class EventCalendarPage(Page):
    content_panels = Page.content_panels

    search_fields = Page.search_fields

    parent_page_types = ['about.AboutPage']


# Page for downloadables (articles, piece of content that are not articles)
class ResourcesPage(AbstractHero, Page):
    search_fields = Page.search_fields + [
        index.SearchField('hero_title'),
        index.SearchField('hero_subtitle'),
    ]

    content_panels = Page.content_panels + [
        MultiFieldPanel([
            FieldPanel('hero_title'),
            FieldPanel('hero_subtitle'),
            FieldPanel('hero_video'),
            ImageChooserPanel('hero_video_poster'),
            ImageChooserPanel('hero_image'),
        ], heading='Hero section'),
    ]

    parent_page_types = ['about.AboutPage']

    def get_context(self, request):
        context = super(ResourcesPage, self).get_context(request)

        context['resources'] = Resource.objects.order_by(
            '-date_published'
        ).all()
        return context


class PrivacyPage(Page):
    body = StreamField(BaseStreamBlock(), verbose_name='Page body')

    content_panels = Page.content_panels + [
        StreamFieldPanel('body'),
    ]

    parent_page_types = ['about.AboutPage']
