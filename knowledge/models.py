from datetime import date

from django import forms
from django.conf import settings
from django.core.files.images import ImageFile
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db import models
from django.http import JsonResponse
from django.template.loader import render_to_string

from wagtail.admin.edit_handlers import (
    FieldPanel, InlinePanel, StreamFieldPanel, MultiFieldPanel,
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
from services.models import WorkingAreaPage


# Images for carousels in hero section
class HeroImage(Orderable):
    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=False,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    page = ParentalKey('ArticlePage', related_name='hero_images')

    panels = [
        ImageChooserPanel('image'),
    ]


# Uploaded file to go in Media & Download section of news
class File(models.Model):
    name = models.CharField(max_length=64)
    fileobj = models.FileField(upload_to='knowledge_files/')
    thumbnail = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.CASCADE,
        related_name='+',
    )
    page = ParentalKey('ArticlePage', related_name='downloads', null=True)

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


# Connection with related articles
class ConnectedArticle(Orderable):
    page = ParentalKey('ArticlePage', related_name='linked_articles')
    element = models.ForeignKey(
        'knowledge.ArticlePage',
        on_delete=models.SET_NULL,
        null=True,
        blank=False,
        verbose_name='Article',
    )

    panels = [
        FieldPanel('element'),
    ]


# Connection with related projects
class ConnectedProject(Orderable):
    page = ParentalKey('ArticlePage', related_name='linked_projects')
    element = models.ForeignKey(
        'projects.ProjectPage',
        on_delete=models.SET_NULL,
        null=True,
        blank=False,
        verbose_name='Project',
    )

    panels = [
        FieldPanel('element'),
    ]


class ArticlePage(AbstractHero, Page):
    highlight = models.BooleanField(default=False)
    thumbnail = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
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
    service = models.ForeignKey(
        'services.WorkingAreaPage',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        verbose_name='Working Area',
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
                FieldPanel('service'),
                FieldPanel('date_published'),
                FieldPanel('author'),
            ],
            heading='Meta data',
            classname='collapsible collapsed',
        ),
        MultiFieldPanel([
                ImageChooserPanel('thumbnail'),
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

    parent_page_types = ['KnowledgePage']


# Index page for articles
class KnowledgePage(AbstractHero, Page):
    description_title = models.CharField(max_length=128, blank=True)
    intro = models.TextField(blank=True)
    selected_article = models.ForeignKey(
        'knowledge.ArticlePage',
        on_delete=models.SET_NULL,
        null=True,
    )

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
                FieldPanel('description_title'),
                FieldPanel('intro', classname='full'),
                FieldPanel('selected_article'),
            ],
            heading='Articles description',
            classname='collapsible',
        ),
    ]

    parent_page_types = ['index.HomePage']
    subpage_types = ['knowledge.ArticlePage']

    def get_context(self, request):
        context = super(KnowledgePage, self).get_context(request)

        services = WorkingAreaPage.objects.live().all()
        exclude_ids = []
        for service in services:
            exclude_ids.append(service.get_most_recent_article().id)
            exclude_ids.append(service.get_second_recent_article().id)

        articles = ArticlePage.objects.live().exclude(
            id__in=exclude_ids,
        ).order_by('-date_published').all()

        active_service = request.GET.get('service')
        active_id = 0
        if active_service:
            try:
                service = WorkingAreaPage.objects.live().get(
                    id=active_service,
                )
            except (
                WorkingAreaPage.DoesNotExist,
                WorkingAreaPage.MultipleObjectsReturned,
            ):
                pass
            else:
                articles = articles.filter(service=service)
                active_id = service.id

        paginator = Paginator(articles, settings.PAGINATOR_ITEMS_COUNT)
        page = request.GET.get('page')
        try:
            posts = paginator.page(page)
        except PageNotAnInteger:
            posts = paginator.page(1)
        except EmptyPage:
            posts = paginator.page(paginator.num_pages)

        context['posts'] = posts
        context['services'] = WorkingAreaPage.objects.live().all()
        context['active_id'] = active_id

        return context

    def serve(self, request, *args, **kwargs):
        if request.is_ajax():
            context = self.get_context(request)
            next = context['posts'].next_page_number() if context['posts'].has_next() else None
            prev = context['posts'].previous_page_number() if context['posts'].has_previous() else None
            context['three_in_row'] = True
            html = render_to_string(
                '_includes/index_item_cards_knowledge.html',
                context,
            )
            return JsonResponse({
                'html': html,
                'next': next,
                'prev': prev,
            })
        else:
            return super().serve(request, *args, **kwargs)
