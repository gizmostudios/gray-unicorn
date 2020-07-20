from datetime import date
from itertools import chain
from operator import attrgetter

from django import forms
from django.conf import settings
from django.core.files.images import ImageFile
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db import models
from django.http import JsonResponse
from django.template.loader import render_to_string

from wagtail.admin.edit_handlers import (
    FieldPanel, InlinePanel, StreamFieldPanel, MultiFieldPanel
)
from wagtail.core.fields import StreamField
from wagtail.core.models import Page, Orderable
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.images.models import Image
from wagtail.search import index

from modelcluster.fields import ParentalKey
from preview_generator.manager import PreviewManager

from except_wagtail.abstract_models import AbstractHero
from except_wagtail.blocks import BaseStreamBlock


# Images for carousels in hero section
class HeroImage(Orderable):
    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=False,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    page = ParentalKey('Newspage', related_name='hero_images')

    panels = [
        ImageChooserPanel('image'),
    ]


# Uploaded file to go in Media & Download section of news
class File(models.Model):
    name = models.CharField(max_length=64)
    fileobj = models.FileField(upload_to='news_files/')
    thumbnail = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.CASCADE,
        related_name='+',
    )
    page = ParentalKey('NewsPage', related_name='downloads', null=True)

    panels = [
        FieldPanel('name'),
        FieldPanel('fileobj'),
    ]

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


# Connection with related news
class RelatedArticle(Orderable):
    page = ParentalKey('NewsPage', related_name='linked_articles')
    element = models.ForeignKey(
        'news.NewsPage',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        verbose_name='Article',
    )

    panels = [
        FieldPanel('element'),
    ]


# Connection with related projects
class RelatedProject(Orderable):
    page = ParentalKey('NewsPage', related_name='linked_projects')
    element = models.ForeignKey(
        'projects.ProjectPage',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        verbose_name='Project',
    )

    panels = [
        FieldPanel('element'),
    ]


# Piece of news written by Except
class NewsPage(AbstractHero, Page):
    ARTICLE = 'AR'
    EVENT = 'EV'
    OPEN_POSITION = 'OP'
    list_of_type = (
        (ARTICLE, 'Article'),
        (EVENT, 'Event'),
        (OPEN_POSITION, 'Open position'),
    )

    type_of_news = models.CharField(
        max_length=2,
        choices=list_of_type,
        default=ARTICLE,
        verbose_name='Type of news (Article, Event, Position)',
    )
    highlight = models.BooleanField(default=False)
    date_published = models.DateField(
        'Date of publication',
        default=date.today,
    )
    intro = models.TextField(verbose_name='Introduction text')
    body = StreamField(
        BaseStreamBlock(), verbose_name='Article body', blank=True,
    )
    author = models.ForeignKey(
        'people.People', on_delete=models.SET_NULL, null=True, blank=False,
    )

    search_fields = Page.search_fields + [
        index.SearchField('hero_title'),
        index.SearchField('hero_subtitle'),
        index.SearchField('intro'),
        index.SearchField('body'),
    ]

    content_panels = Page.content_panels + [
        MultiFieldPanel([
                FieldPanel('hero_title'),
                FieldPanel('hero_subtitle'),
                FieldPanel('hero_video'),
                ImageChooserPanel('hero_video_poster'),
                ImageChooserPanel('hero_image'),
                InlinePanel(
                    'hero_images', label='Hero section carousel images',
                ),
            ],
            heading='Hero section',
            classname='collapsible',
        ),
        MultiFieldPanel([
                FieldPanel('highlight', widget=forms.CheckboxInput),
                FieldPanel('type_of_news'),
                FieldPanel('date_published'),
                FieldPanel('author'),
            ],
            heading='Meta data',
            classname='collapsible collapsed',
        ),
        MultiFieldPanel([
                FieldPanel('intro', classname='full'),
                StreamFieldPanel('body'),
            ],
            heading='Article contain',
            classname='collapsible collapsed',
        ),
        MultiFieldPanel([
                InlinePanel(
                    'linked_articles', max_num=2, label='Related articles',
                ),
                InlinePanel(
                    'linked_projects', max_num=2, label='Related projects',
                ),
                InlinePanel('downloads', label='Files to downloads'),
            ],
            heading='Related assets',
            classname='collapsible collapsed',
        ),
    ]

    parent_page_types = ['FolderArticlePage']


# Link to a newspaper article talking about Except
class NewspaperArticlePage(AbstractHero, Page):
    date_published = models.DateField(
        'Date of publication',
        default=date.today,
    )
    url_article = models.CharField(
        max_length=500,
        verbose_name='Link to the article',
    )

    content_panels = [
        MultiFieldPanel([
            FieldPanel('title'),
        ], heading='Title'),
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
        FieldPanel('date_published'),
        FieldPanel('url_article'),
    ]

    parent_page_types = ['FolderNewspaperPage']


class NewsIndexPage(AbstractHero, Page):
    content_panels = [
        MultiFieldPanel([
            FieldPanel('title'),
        ], heading='Title'),
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
    ]

    subpage_types = ['FolderNewspaperPage', 'FolderArticlePage']
    parent_page_types = ['about.aboutPage']

    def get_news(self, news_type=None):
        if news_type:
            news = NewsPage.objects.live().filter(type_of_news=news_type)
        else:
            news = NewsPage.objects.live()

        result_list = sorted(
            chain(
                news,
                NewspaperArticlePage.objects.live(),
            ),
            key=attrgetter('date_published'), reverse=True)
        return result_list

    def get_context(self, request):
        context = super(NewsIndexPage, self).get_context(request)

        news_type = request.GET.get('type')
        if news_type == 'article':
            news = self.get_news(NewsPage.ARTICLE)
        elif news_type == 'event':
            news = self.get_news(NewsPage.EVENT)
        elif news_type == 'open_position':
            news = self.get_news(NewsPage.OPEN_POSITION)
        else:
            news = self.get_news()
            news_type == ''

        paginator = Paginator(news, settings.PAGINATOR_ITEMS_COUNT)
        page = request.GET.get('page')
        try:
            posts = paginator.page(page)
        except PageNotAnInteger:
            posts = paginator.page(1)
        except EmptyPage:
            posts = paginator.page(paginator.num_pages)

        context['posts'] = posts
        context['news_type'] = news_type

        return context

    def serve(self, request, *args, **kwargs):
        if request.is_ajax():
            context = self.get_context(request)
            next = context['posts'].next_page_number() if context['posts'].has_next() else None
            prev = context['posts'].previous_page_number() if context['posts'].has_previous() else None
            html = render_to_string(
                '_includes/index_item_cards.html',
                context,
            )
            return JsonResponse({
                'html': html,
                'next': next,
                'prev': prev,
            })
        else:
            return super().serve(request, *args, **kwargs)


# Empty page for structure in Wagtail
class FolderArticlePage(Page):
    subpage_types = ['NewsPage']
    parent_page_types = ['NewsIndexPage']


# Empty page for structure in Wagtail
class FolderNewspaperPage(Page):
    subpage_types = ['NewspaperArticlePage']
    parent_page_types = ['NewsIndexPage']
