from modelcluster.fields import ParentalKey

from django.db import models

from wagtail.admin.edit_handlers import (
    FieldPanel, InlinePanel, MultiFieldPanel, PageChooserPanel
)
from wagtail.core.models import Page, Orderable
from wagtail.images.edit_handlers import ImageChooserPanel

from about.models import EventCalendarPage, CareerPage
from except_wagtail.abstract_models import AbstractHero
from knowledge.models import ArticlePage, KnowledgePage
from news.models import NewsPage, NewsIndexPage
from projects.models import ProjectPage, ProjectIndexPage
from services.models import ServiceIndexPage, WorkingAreaPage


class HeroImage(Orderable):
    """
    Image for carousel in hero section.

    """
    image = models.ForeignKey(
        'wagtailimages.Image',
        on_delete=models.SET_NULL,
        blank=True,
        null=True,
        related_name='+',
    )
    page = ParentalKey('HomePage', related_name='hero_images')

    content_panels = [
        ImageChooserPanel('image'),
    ]


class AboutUsSection(Orderable):
    """
    About us section on the HomePage.

    """
    image = models.ForeignKey(
        'wagtailimages.Image',
        on_delete=models.SET_NULL,
        blank=False,
        null=True,
        related_name='+',
    )
    title = models.CharField(max_length=128)
    description = models.TextField(
        help_text='Line breaks will be respected. Use an empty line between '
                  'paragraphs to separate them.',
    )
    first_link_title = models.CharField(max_length=24, blank=True)
    first_link_page = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    second_link_title = models.CharField(max_length=24, blank=True)
    second_link_page = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    page = ParentalKey('HomePage', related_name='aboutus')

    panels = [
        ImageChooserPanel('image'),
        FieldPanel('title'),
        FieldPanel('description', classname='full'),
        FieldPanel('first_link_title'),
        PageChooserPanel('first_link_page'),
        FieldPanel('second_link_title'),
        PageChooserPanel('second_link_page'),
    ]


class HomePage(AbstractHero, Page):
    """
    Home Page model.

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
    # Fourth (What We Do) section:
    what_we_do_first_icon = models.FileField(
        max_length=255,
        upload_to='homepage/',
        help_text='SVG icon',
    )
    what_we_do_first_link = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    what_we_do_first_text = models.CharField(
        max_length=64,
    )
    what_we_do_second_icon = models.FileField(
        max_length=255,
        upload_to='homepage/',
        help_text='SVG icon',
    )
    what_we_do_second_link = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    what_we_do_second_text = models.CharField(
        max_length=64,
    )
    what_we_do_third_icon = models.FileField(
        max_length=255,
        upload_to='homepage/',
        help_text='SVG icon',
    )
    what_we_do_third_link = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    what_we_do_third_text = models.CharField(
        max_length=64,
    )
    what_we_do_fourth_icon = models.FileField(
        max_length=255,
        upload_to='homepage/',
        help_text='SVG icon',
    )
    what_we_do_fourth_link = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    what_we_do_fourth_text = models.CharField(
        max_length=64,
    )
    what_we_do_first_pillar_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    what_we_do_first_pillar_link = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    what_we_do_first_pillar_text = models.CharField(
        max_length=64,
    )
    what_we_do_second_pillar_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    what_we_do_second_pillar_link = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    what_we_do_second_pillar_text = models.CharField(
        max_length=64,
    )
    what_we_do_third_pillar_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    what_we_do_third_pillar_link = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    what_we_do_third_pillar_text = models.CharField(
        max_length=64,
    )
    # Fifth (Latest News) section:
    video = models.FileField(
        max_length=255,
        upload_to='hero_videos/',
    )
    video_poster = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    video_link = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    video_text = models.CharField(max_length=64)

    content_panels = Page.content_panels + [
        MultiFieldPanel([
                FieldPanel('hero_title'),
                FieldPanel('hero_subtitle'),
                FieldPanel('hero_video'),
                ImageChooserPanel('hero_video_poster'),
                ImageChooserPanel('hero_image'),
                InlinePanel(
                    'hero_images', label='Hero section carousel images'
                ),
            ],
            heading='Hero section',
            classname='collapsible',
        ),
        MultiFieldPanel([
                FieldPanel('intro_first', classname='full'),
                FieldPanel('intro_second', classname='full'),
            ],
            heading='First section',
            classname='collapsible',
        ),
        MultiFieldPanel([
                InlinePanel(
                    'aboutus', label='About Us Section'
                ),
            ],
            heading='Second section',
            classname='collapsible',
        ),
        MultiFieldPanel([
                FieldPanel('what_we_do_first_icon'),
                PageChooserPanel('what_we_do_first_link'),
                FieldPanel('what_we_do_first_text'),
                FieldPanel('what_we_do_second_icon'),
                PageChooserPanel('what_we_do_second_link'),
                FieldPanel('what_we_do_second_text'),
                FieldPanel('what_we_do_third_icon'),
                PageChooserPanel('what_we_do_third_link'),
                FieldPanel('what_we_do_third_text'),
                FieldPanel('what_we_do_fourth_icon'),
                PageChooserPanel('what_we_do_fourth_link'),
                FieldPanel('what_we_do_fourth_text'),
                ImageChooserPanel('what_we_do_first_pillar_image'),
                PageChooserPanel('what_we_do_first_pillar_link'),
                FieldPanel('what_we_do_first_pillar_text'),
                ImageChooserPanel('what_we_do_second_pillar_image'),
                PageChooserPanel('what_we_do_second_pillar_link'),
                FieldPanel('what_we_do_second_pillar_text'),
                ImageChooserPanel('what_we_do_third_pillar_image'),
                PageChooserPanel('what_we_do_third_pillar_link'),
                FieldPanel('what_we_do_third_pillar_text'),
            ],
            heading='What we do section',
            classname='collapsible',
        ),
        MultiFieldPanel([
                FieldPanel('video'),
                ImageChooserPanel('video_poster'),
                FieldPanel('video_text'),
                PageChooserPanel('video_link'),
            ],
            heading='Latest news section',
            classname='collapsible',
        ),
    ]

    subpage_types = [
        'about.AboutPage',
        'knowledge.KnowledgePage',
        'projects.ProjectIndexPage',
        'services.ServiceIndexPage',
        'search.Search',
    ]

    def get_context(self, request):
        context = super(HomePage, self).get_context(request)

        context['highlighted_projects'] = [[]]
        highlighted_projects = ProjectPage.objects.live().filter(
            highlight=True
        ).order_by('-date_published')[:6]

        # Split highlighted project in arrays of two items each:
        for project in highlighted_projects:
            if len(context['highlighted_projects'][-1]) < 2:
                context['highlighted_projects'][-1].append(project)
            else:
                context['highlighted_projects'].append([project])

        context['link_resources'] = KnowledgePage.objects.live().first().url
        context['link_news'] = NewsIndexPage.objects.live().first().url
        context['link_projects'] = ProjectIndexPage.objects.live().first().url
        context['link_work_with_us'] = CareerPage.objects.live().first().url
        context['link_calendar'] = EventCalendarPage.objects.live().first().url

        context['news_index'] = NewsIndexPage.objects.live().first()
        context['projects_index'] = ProjectIndexPage.objects.live().first()
        context['knowledge'] = KnowledgePage.objects.live().first()
        context['services'] = WorkingAreaPage.objects.live()
        context['service_index'] = ServiceIndexPage.objects.live()[0]

        context['highlight_doubleblock'] = ArticlePage.objects.live().filter(
            highlight=True
        ).order_by('-date_published').first()

        context['highlight_resource'] = ArticlePage.objects.live().filter(
            highlight=True
        ).order_by('-date_published').all()[1]

        context['highlight_articles'] = NewsPage.objects.live().filter(
            highlight=True, type_of_news='AR'
        ).order_by('-date_published').all()[:3]

        context['highlight_events'] = NewsPage.objects.live().filter(
            highlight=True, type_of_news='EV'
        ).order_by('-date_published').all()[:2]

        context['highlight_open_position'] = NewsPage.objects.live().filter(
            highlight=True, type_of_news='OP'
        ).order_by('-date_published').first()

        context['highlight_projects'] = ProjectPage.objects.live().filter(
            highlight=True
        ).order_by('-date_published').all()[:4]

        return context
