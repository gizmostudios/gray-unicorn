from django.db import models

from wagtail.core.fields import StreamField
from wagtail.core.models import Page, Orderable
from wagtail.admin.edit_handlers import (
    FieldPanel, MultiFieldPanel, StreamFieldPanel, InlinePanel,
    PageChooserPanel,
)
from wagtail.images.edit_handlers import ImageChooserPanel

from modelcluster.fields import ParentalKey

from except_wagtail.abstract_models import AbstractHero
from except_wagtail.blocks import BaseStreamBlock


class ServiceIndexPageQuote(Orderable):
    text = models.TextField()
    author = models.TextField()
    position = models.TextField(blank=True)
    page = ParentalKey('ServiceIndexPage', related_name='quotes')

    panels = [
        FieldPanel('text', classname='full'),
        FieldPanel('author'),
        FieldPanel('position'),
    ]


class ServiceIndexPage(AbstractHero, Page):
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
    intro_first_icon = models.FileField(
        max_length=255,
        upload_to='homepage/',
        help_text='SVG icon',
    )
    intro_first_text = models.CharField(
        max_length=64,
    )
    intro_second_icon = models.FileField(
        max_length=255,
        upload_to='homepage/',
        help_text='SVG icon',
    )
    intro_second_text = models.CharField(
        max_length=64,
    )
    intro_third_icon = models.FileField(
        max_length=255,
        upload_to='homepage/',
        help_text='SVG icon',
    )
    intro_third_text = models.CharField(
        max_length=64,
    )
    intro_fourth_icon = models.FileField(
        max_length=255,
        upload_to='homepage/',
        help_text='SVG icon',
    )
    intro_fourth_text = models.CharField(
        max_length=64,
    )
    intro_link_title = models.CharField(max_length=12, blank=True)
    intro_link_page = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    info_title = models.CharField(max_length=128)
    info_introduction = models.TextField()
    info_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    info_link_title = models.CharField(max_length=12, blank=True)
    info_link_page = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )

    content_panels = Page.content_panels + [
        MultiFieldPanel([
                FieldPanel('hero_title'),
                FieldPanel('hero_subtitle'),
                FieldPanel('hero_video'),
                FieldPanel('hero_video'),
                ImageChooserPanel('hero_video_poster'),
                ImageChooserPanel('hero_image'),
            ],
            heading='Hero section',
            classname='collapsible',
        ),
        FieldPanel('intro_first', classname='full'),
        FieldPanel('intro_second', classname='full'),
        FieldPanel('intro_first_icon'),
        FieldPanel('intro_first_text'),
        FieldPanel('intro_second_icon'),
        FieldPanel('intro_second_text'),
        FieldPanel('intro_third_icon'),
        FieldPanel('intro_third_text'),
        FieldPanel('intro_fourth_icon'),
        FieldPanel('intro_fourth_text'),
        FieldPanel('intro_link_title'),
        PageChooserPanel('intro_link_page'),
        FieldPanel('info_title'),
        FieldPanel('info_introduction', classname='full'),
        ImageChooserPanel('info_image'),
        FieldPanel('info_link_title'),
        PageChooserPanel('info_link_page'),
        InlinePanel(
            'quotes',
            max_num=4,
            label='Quotes',
        ),
    ]

    parent_page_types = ['index.HomePage']
    subpage_types = ['WorkingAreaPage']

    def get_context(self, request):
        context = super(ServiceIndexPage, self).get_context(request)

        context['services_list'] = WorkingAreaPage.objects.live()

        return context


class ServiceLinkedArticle(Orderable):
    page = ParentalKey(
        'WorkingAreaPage',
        related_name='service_linked_articles',
    )
    element = models.ForeignKey(
        'knowledge.ArticlePage',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )

    panels = [
        FieldPanel('element'),
    ]


# Should be working area this is our domains of intervention
class WorkingAreaPage(AbstractHero, Page):
    thumbnail = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    summary = StreamField(
        BaseStreamBlock(),
        verbose_name='Service summary',
        help_text='Short description for Services Page',
    )
    introduction = models.CharField(max_length=255, blank=True)
    details = StreamField(
        BaseStreamBlock(),
        verbose_name='Service summary',
        help_text='Short description for Services Page',
        blank=True,
    )
    color = models.CharField(max_length=32)
    sort_order = models.PositiveSmallIntegerField(default=0)

    parent_page_types = ['ServiceIndexPage']
    subpage_types = ['ServicePage']

    def __str__(self):
        return self.hero_title

    class Meta:
        verbose_name_plural = 'Services'

    content_panels = Page.content_panels + [
        MultiFieldPanel([
                FieldPanel('hero_title'),
                FieldPanel('hero_subtitle'),
                FieldPanel('hero_video'),
                ImageChooserPanel('hero_video_poster'),
                ImageChooserPanel('hero_image'),
            ],
            heading='Hero section',
            classname='collapsible',
        ),
        MultiFieldPanel([
                ImageChooserPanel('thumbnail'),
                StreamFieldPanel('summary'),
                FieldPanel('introduction'),
                StreamFieldPanel('details'),
                FieldPanel('color'),
                FieldPanel('sort_order'),
                InlinePanel(
                    'service_linked_articles',
                    max_num=4,
                    label='Related articles',
                ),
            ],
            heading='Service information',
            classname='collapsible',
        ),
    ]

    def get_context(self, request):
        context = super(WorkingAreaPage, self).get_context(request)

        context['highlighted_projects'] = [[]]
        projects = self.projectpage_set.live().order_by('-date_published')[:4]
        for project in projects:
            if len(context['highlighted_projects'][-1]) < 2:
                context['highlighted_projects'][-1].append(project)
            else:
                context['highlighted_projects'].append([project])

        context['subservices'] = ServicePage.objects.descendant_of(self)

        return context

    def get_most_recent_article(self):
        return self.articlepage_set.live().order_by(
            '-date_published',
        )[0]

    def get_second_recent_article(self):
        return self.articlepage_set.live().order_by(
            '-date_published',
        )[1]


# Specific area with services we offer
class ServicePage(Page):
    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=False,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    service_description = StreamField(
        BaseStreamBlock(),
        verbose_name='Service description',
    )
    body = StreamField(
        BaseStreamBlock(),
        verbose_name='Service body',
        blank=True,
    )

    content_panels = Page.content_panels + [
        ImageChooserPanel('image'),
        StreamFieldPanel('service_description'),
        StreamFieldPanel('body'),
    ]

    parent_page_types = ['WorkingAreaPage']
