from django.db import models

from wagtail.admin.edit_handlers import FieldPanel
from wagtail.admin.edit_handlers import PageChooserPanel
from wagtail.admin.edit_handlers import StreamFieldPanel
from wagtail.admin.edit_handlers import MultiFieldPanel
from wagtail.core.fields import StreamField
from wagtail.contrib.settings.models import BaseSetting, register_setting
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.snippets.models import register_snippet

from except_wagtail.blocks import BaseStreamBlock


# Type of footer link (Media, Quick links...)
@register_snippet
class FooterCategory(models.Model):
    name = models.CharField(max_length=20)

    panels = [
        FieldPanel('name'),
    ]

    class Meta:
        verbose_name_plural = 'Footer categories'

    def __str__(self):
        return self.name

    def get_links(self):
        return FooterLink.objects.filter(category=self).order_by('id')


# Type of link (Internal page, External page, html)
@register_snippet
class LinkType(models.Model):
    name = models.CharField(max_length=100)

    panels = [
        FieldPanel('name'),
    ]

    class Meta:
        verbose_name_plural = 'Link types'

    def __str__(self):
        return self.name

    def get_links(self):
        return FooterLink.objects.filter(type=self).all()


# Footer link
@register_snippet
class FooterLink(models.Model):
    name = models.CharField(max_length=30, blank=True)
    category = models.ForeignKey(
        FooterCategory,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )
    type_link = models.ForeignKey(
        LinkType,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )
    link_page = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    link = models.CharField(
        'Link to an external page', max_length=100, blank=True,
    )
    popup_html = models.TextField(
        verbose_name='HTML for the pop-up',
        blank=True,
    )

    panels = [
        FieldPanel('name'),
        FieldPanel('category'),
        FieldPanel('type_link'),
        PageChooserPanel('link_page'),
        FieldPanel('link'),
        FieldPanel('popup_html'),
    ]

    class Meta:
        verbose_name_plural = 'Footer links'

    def __str__(self):
        return self.name


# Event for the calendar connected if possible to an article of Event type
@register_snippet
class Event(models.Model):
    name = models.CharField(max_length=100)
    date_start = models.DateField('Starting date', null=True, blank=True)
    date_end = models.DateField(
        'Ending date (leave it blank if one day event)', null=True, blank=True,
    )
    article = models.ForeignKey(
        'news.NewsPage',
        limit_choices_to={'type_of_news': 'EV'},
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )

    panels = [
        FieldPanel('name'),
        FieldPanel('date_start'),
        FieldPanel('date_end'),
        FieldPanel('article'),
    ]

    class Meta:
        verbose_name_plural = 'Events'

    def __str__(self):
        return self.name

    def get_links(self):
        return FooterLink.objects.filter(category=self).all()

    def as_json(self):
        if self.date_end and self.date_start and self.article:
            return dict(
                title=self.name,
                start=self.date_start.isoformat(),
                end=self.date_end.isoformat(),
                url=self.article.url
            )
        elif self.date_start and self.article:
            return dict(
                title=self.name,
                start=self.date_start.isoformat(),
                url=self.article.url
            )
        elif self.date_start:
            return dict(
                title=self.name,
                start=self.date_start.isoformat()
            )
        else:
            return


# Press references
@register_snippet
class PressReference(models.Model):
    description = models.TextField(max_length=128)
    source = models.CharField(max_length=64)
    link = models.URLField(null=True, blank=True)
    
    related_page = models.ForeignKey(
        'wagtailcore.Page',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )

    panels = [
        MultiFieldPanel([
            FieldPanel('description'),
            FieldPanel('source'),
            FieldPanel('link'),
        ], heading='Press reference information'),
        MultiFieldPanel([
            PageChooserPanel('related_page', 
                ['knowledge.ArticlePage', 'news.NewsPage', 'projects.ProjectPage']
            ),
        ], heading='Relation'),
    ]

    def __str__(self):
        return self.description


# Quotes
@register_snippet
class Quote(models.Model):
    quote = models.TextField()
    who = models.CharField(max_length=64)
    description = models.CharField(max_length=128)
    link = models.URLField(null=True, blank=True)
    
    related_page = models.ForeignKey(
        'wagtailcore.Page',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )

    panels = [
        MultiFieldPanel([
            FieldPanel('quote'),
            FieldPanel('who'),
            FieldPanel('description'),
            FieldPanel('link'),
        ], heading='Quote information'),
        MultiFieldPanel([
            PageChooserPanel('related_page', 
                ['knowledge.ArticlePage', 'news.NewsPage', 'projects.ProjectPage']
            ),
        ], heading='Relation'),
    ]

    def __str__(self):
        return self.quote


# Settings
@register_setting
class WebsiteSettings(BaseSetting):
    logo = models.ImageField(
        max_length=255,
        upload_to='logos/',
        height_field='logo_h',
        width_field='logo_w',
        help_text='Logo of the Organization',
    )
    logo_h = models.CharField(max_length=8)
    logo_w = models.CharField(max_length=8)
    name = models.CharField(
        max_length=48, help_text='Name of the Organization',
    )
    legal_name = models.CharField(
        max_length=64, help_text='Legal name of the Organization (e. LLC)',
    )
    phone = models.CharField(
        max_length=32, help_text='Phone of the Organization',
    )
    email = models.CharField(
        max_length=64, help_text='Email of the Organization',
    )
    address = models.CharField(
        max_length=64, help_text='Address of the Organization',
    )
    locality = models.CharField(
        max_length=32, help_text='City of the Organization',
    )
    region = models.CharField(
        max_length=32, help_text='Region of the Organization',
    )
    country = models.CharField(
        max_length=32, help_text='Country of the Organization',
    )
    postal_code = models.CharField(
        max_length=12, help_text='Postal code of the Organization',
    )
    facebook = models.URLField(help_text='Facebook page URL')
    twitter = models.URLField(help_text='Twitter page URL')
    linkedin = models.URLField(help_text='LinkedIn page URL')
    youtube = models.URLField(help_text='YouTube channel or user account URL')
    footer_contact = models.TextField(
        help_text='Address and phone number block in the footer ' +
        '(linebreaks are supported)',
    )
    footer_worktime = models.TextField(
        help_text='Working time in the footer (linebreaks are supported)'
    )

    panels = [
        MultiFieldPanel([
            FieldPanel('logo'),
            FieldPanel('name'),
            FieldPanel('legal_name'),
            FieldPanel('phone'),
            FieldPanel('email'),
            FieldPanel('address'),
            FieldPanel('locality'),
            FieldPanel('region'),
            FieldPanel('country'),
            FieldPanel('postal_code'),
            FieldPanel('footer_contact'),
            FieldPanel('footer_worktime'),
        ], heading='Organization\'s information'),
        MultiFieldPanel([
            FieldPanel('facebook'),
            FieldPanel('twitter'),
            FieldPanel('linkedin'),
            FieldPanel('youtube'),
        ], heading='Social Media links'),
    ]
