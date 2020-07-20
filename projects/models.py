from datetime import datetime, date

from django import forms
from django.conf import settings
from django.core.files.images import ImageFile
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db import models
from django.db.models import Q
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
from wagtail.snippets.models import register_snippet

from modelcluster.fields import ParentalKey
from modelcluster.models import ClusterableModel

from except_wagtail.abstract_models import AbstractHero
from except_wagtail.blocks import BaseStreamBlock


# Images for carousels in hero section
class HeroImage(Orderable):
    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=False,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    page = ParentalKey('ProjectPage', related_name='hero_images')

    panels = [
        ImageChooserPanel('image'),
    ]


# Uploaded file to go in Media & Download section of news
class File(models.Model):
    name = models.CharField(max_length=64)
    fileobj = models.FileField(upload_to='project_files/')
    thumbnail = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.CASCADE,
        related_name='+',
    )
    page = ParentalKey('ProjectPage', related_name='downloads', null=True)

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


# People within Except participating to the project
class TeamMember(Orderable):
    page = ParentalKey('ProjectPage', related_name='team_members')
    member = models.ForeignKey(
        'people.People', on_delete=models.SET_NULL, null=True, blank=True,
    )

    panels = [
        FieldPanel('member'),
    ]

    def get_page(self):
        try:
            return self.member.profilepage_set.first()
        except:
            return ''


# Clients and companies collaborating with Except on the project
class ProjectPartner(Orderable):
    page = ParentalKey('ProjectPage', related_name='project_partners')
    partner = models.ForeignKey(
        'about.Partner', on_delete=models.SET_NULL, null=True, blank=True,
    )

    panels = [
        FieldPanel('partner'),
    ]


# External member from partners or freelancer working on the project
class ExternalMember(Orderable):
    page = ParentalKey('ProjectPage', related_name='external_members')
    first_name = models.CharField(max_length=64, blank=True)
    last_name = models.CharField(max_length=64, blank=True)
    company = models.CharField(max_length=96, blank=True)
    job_title = models.CharField(max_length=64, blank=True)

    panels = [
        FieldPanel('first_name'),
        FieldPanel('last_name'),
        FieldPanel('company'),
        FieldPanel('job_title'),
    ]


# Connection with related articles
class LinkedArticle(Orderable):
    page = ParentalKey('ProjectPage', related_name='linked_articles')
    element = models.ForeignKey(
        'knowledge.ArticlePage',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )

    panels = [
        FieldPanel('element'),
    ]


# Connection with related projects
class LinkedProject(Orderable):
    page = ParentalKey('ProjectPage', related_name='linked_projects')
    element = models.ForeignKey(
        'projects.ProjectPage',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )

    panels = [
        FieldPanel('element'),
    ]


@register_snippet
class ProjectCategory(ClusterableModel):
    name = models.CharField(max_length=24)
    color = models.CharField(max_length=6, help_text='HEX value of the color')
    sort_order = models.PositiveSmallIntegerField(default=0)

    panels = [
        FieldPanel('name'),
        FieldPanel('color'),
        FieldPanel('sort_order'),
    ]

    class Meta:
        ordering = ['sort_order', 'id']
        verbose_name_plural = 'Project Categories'

    def __str__(self):
        return self.name


class SecondaryCategory(ClusterableModel):
    page = ParentalKey(
        'ProjectPage',
        related_name='other_categories'
    )
    category = models.ForeignKey(
        'ProjectCategory',
        on_delete=models.CASCADE,
        related_name='+'
    )
    panels = [
        FieldPanel('category'),
    ]


class ProjectPage(AbstractHero, Page):
    highlight = models.BooleanField(default=False)
    date_published = models.DateField(
        'Date of publication',
        default=date.today,
    )
    header_title = models.CharField(max_length=96)
    header_subtitle = models.CharField(max_length=128)
    header_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    intro = models.TextField(blank=True, verbose_name='Introduction')
    body = StreamField(
        BaseStreamBlock(),
        verbose_name='Article body',
        blank=True,
    )
    author = models.ForeignKey(
        'people.People',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )
    service = models.ForeignKey(
        'services.WorkingAreaPage',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        verbose_name='Working area',
    )
    category = models.ForeignKey(
        'projects.ProjectCategory',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='main_category',
        help_text='Pick the main category for the project. The color of the '
                  'picked category will be used in the timeline.',
    )

    search_fields = Page.search_fields + [
        index.SearchField('hero_title'),
        index.SearchField('hero_subtitle'),
        index.SearchField('header_title'),
        index.SearchField('header_subtitle'),
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
                FieldPanel('category'),
                InlinePanel('other_categories'),
                FieldPanel('author'),
            ],
            heading='Meta data',
            classname='collapsible collapsed',
        ),
        MultiFieldPanel([
                InlinePanel('team_members', label='Team members'),
                InlinePanel('external_members', label='External members'),
                InlinePanel(
                    'project_partners', label='Partners of the project',
                ),
            ],
            heading='Participants',
            classname='collapsible collapsed',
        ),
        MultiFieldPanel([
                FieldPanel('header_title'),
                FieldPanel('header_subtitle'),
                ImageChooserPanel('header_image'),
                FieldPanel('date_published'),
                FieldPanel('intro', classname='full'),
                StreamFieldPanel('body'),
            ],
            heading='Article',
            classname='collapsible collapsed',
        ),
        MultiFieldPanel([
                InlinePanel(
                    'linked_articles', max_num=2, label='Related articles',
                ),
                InlinePanel(
                    'linked_projects', max_num=2, label='Related projects',
                ),
                InlinePanel('downloads', label='Files to download'),
            ],
            heading='Related assets',
            classname='collapsible collapsed',
        ),
    ]

    parent_page_types = ['ProjectIndexPage']

    def serve(self, request, *args, **kwargs):
        if request.is_ajax() and request.method == 'GET':
            context = self.get_context(request)
            html = render_to_string(
                '_includes/project_short.html',
                context,
            )
            return JsonResponse({
                'html': html,
            })
        else:
            return super().serve(request, *args, **kwargs)


class ProjectIndexPage(AbstractHero, Page):
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
    # Timeline settings:
    timeline_start = models.PositiveSmallIntegerField(default=2000)
    timeline_middle = models.PositiveSmallIntegerField(default=2010)
    timeline_project = models.ForeignKey(
        'projects.ProjectPage',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        help_text='Project in timeline shown by default.',
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
                FieldPanel('intro_first', classname='full'),
                FieldPanel('intro_second', classname='full'),
                FieldPanel('timeline_start'),
                FieldPanel('timeline_middle'),
                FieldPanel('timeline_project'),
            ],
            heading='Articles description',
            classname='collapsible',
        ),
    ]

    subpage_types = ['ProjectPage']
    parent_page_types = ['index.HomePage']

    def get_context(self, request):
        context = super(ProjectIndexPage, self).get_context(request)

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

        recent_projects = ProjectPage.objects.live().order_by(
            '-date_published'
        )[:6]
        recent_projects_ids = [x.id for x in recent_projects]
        projects = ProjectPage.objects.live().exclude(
            id__in=recent_projects_ids,
        ).order_by('-date_published')

        timeline_projects = ProjectPage.objects.live().filter(
            category__isnull=False
        ).order_by('date_published')

        date_initial = datetime.strptime(str(self.timeline_start), '%Y').date()
        delta_initial = timeline_projects.latest(
            'date_published'
        ).date_published - date_initial

        updated_projects = []
        for project in timeline_projects:
            delta = project.date_published - date_initial
            project.timeline_position = "%.3f" % (delta / delta_initial * 100)
            updated_projects.append(project)

        active_category = request.GET.get('category')
        active_id = 0
        if active_category:
            try:
                category = ProjectCategory.objects.get(
                    id=active_category,
                )
            except (
                ProjectCategory.DoesNotExist,
                ProjectCategory.MultipleObjectsReturned,
            ):
                pass
            else:
                projects = projects.filter(
                    Q(category=category) |
                    Q(other_categories__category=category),
                ).distinct()
                active_id = category.id
            print(projects)

        paginator = Paginator(projects, settings.PAGINATOR_ITEMS_COUNT)
        page = request.GET.get('page')
        try:
            posts = paginator.page(page)
        except PageNotAnInteger:
            posts = paginator.page(1)
        except EmptyPage:
            posts = paginator.page(paginator.num_pages)

        context['posts'] = posts
        context['recent_projects'] = recent_projects
        context['categories'] = ProjectCategory.objects.all()
        context['active_id'] = active_id
        context['timeline_projects'] = updated_projects
        context['timeline_end'] = timeline_projects.latest(
            'date_published'
        ).date_published.year
        context['highlighted'] = ProjectPage.objects.live().filter(
            highlight=True
        ).order_by(
            '-date_published'
        )[:4]

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
