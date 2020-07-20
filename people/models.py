from django.db import models
from django.conf import settings
from modelcluster.fields import ParentalKey
from modelcluster.models import ClusterableModel

from datetime import date

from wagtail.admin.edit_handlers import (
    FieldPanel, InlinePanel, MultiFieldPanel, StreamFieldPanel,
)
from wagtail.core.fields import StreamField
from wagtail.core.models import Page, Orderable
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.snippets.models import register_snippet

from except_wagtail.abstract_models import AbstractHero
from except_wagtail.blocks import BaseStreamBlock
from projects.models import ProjectPage, TeamMember
from knowledge.models import ArticlePage


# Page introducing the team and listing all people in the company
class PeoplePage(AbstractHero, Page):
    description_title = models.CharField(max_length=128)
    description = models.CharField(max_length=256, blank=True)

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
                FieldPanel('description'),
            ],
            heading='Team description',
            classname='collapsible',
        ),
    ]

    parent_page_types = ['about.AboutPage']
    subpage_types = ['ProfilePage']

    def get_context(self, request):
        context = super(PeoplePage, self).get_context(request)

        context['people_list'] = ProfilePage.objects.order_by(
            'person__sort_order', 'person__user__first_name'
        ).all()

        return context


# Skills and Expertise of people
class Expertise(Orderable):
    parent = ParentalKey('People', related_name='expertises')
    competency = models.CharField(max_length=96)

    panels = [
        FieldPanel('competency'),
    ]


# Hobbies & liked activities of people
class Hobby(Orderable):
    parent = ParentalKey('People', related_name='hobbies')
    activity = models.CharField(max_length=96)

    panels = [
        FieldPanel('activity'),
    ]


# Full profile of an user register in snippet to manage visibility on website
@register_snippet
class People(ClusterableModel):
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
    )
    education_title = models.CharField(
        max_length=96,
        verbose_name='Education title (BSc, MSc, PhD)',
        blank=True,
    )
    date_joined = models.DateField(
        verbose_name='Date of joining the company',
        default=date.today,
    )
    introduction = StreamField(
        BaseStreamBlock(),
        verbose_name='People introduction',
    )
    picture = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=False,
        on_delete=models.SET_NULL,
        related_name='+',
        verbose_name='Profile picture',
    )
    job_title = models.CharField(max_length=96, verbose_name='Job title')
    phone = models.CharField(
        max_length=32,
        blank=True,
        verbose_name='Phone number',
    )
    sort_order = models.PositiveSmallIntegerField(default=255)

    panels = [
        MultiFieldPanel([
                FieldPanel('user'),
                FieldPanel('education_title'),
                FieldPanel('job_title'),
                FieldPanel('date_joined'),
                ImageChooserPanel('picture'),
                FieldPanel('sort_order'),
            ],
            heading='People information',
            classname='collapsible',
        ),
        MultiFieldPanel([
                FieldPanel('phone'),
            ],
            heading='Contact information',
            classname='collapsible',
        ),
        MultiFieldPanel([
                StreamFieldPanel('introduction'),
                InlinePanel('expertises', label='Areas of expertise'),
                InlinePanel('hobbies', label='Hobbies'),
            ],
            heading='Curriculum',
            classname='collapsible',
        ),
    ]

    class Meta:
        verbose_name_plural = 'People'

    def __str__(self):
        return self.user.first_name + ' ' + self.user.last_name


# Page related to a people models one page per person
class ProfilePage(Page):
    person = models.ForeignKey(
        People, on_delete=models.SET_NULL, null=True, blank=True,
    )

    content_panels = Page.content_panels + [
        FieldPanel('person'),
    ]

    subpage_types = []
    parent_page_types = ['PeoplePage']

    def get_projects(self):
        participations = TeamMember.objects.filter(member=self.person).all()
        return ProjectPage.objects.live().filter(
            team_members__in=participations
        ).all()

    def get_articles(self):
        return ArticlePage.objects.live().filter(author=self.person).all()

    def get_context(self, request):
        context = super(ProfilePage, self).get_context(request)

        context['projects'] = self.get_projects()
        context['articles'] = self.get_articles()

        context['parent_page'] = PeoplePage.objects.ancestor_of(self).first()
        context['person'] = self.person
        context['user'] = self.person.user

        return context
