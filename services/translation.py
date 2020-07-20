from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

from .models import WorkingAreaPage, ServicePage, ServiceIndexPage


@register(ServiceIndexPage)
class ServiceIndexPageTR(TranslationOptions):
    fields = (
        'hero_title',
        'hero_subtitle',
        'intro_first',
        'intro_second',
        'intro_first_text',
        'intro_second_text',
        'intro_third_text',
        'intro_fourth_text',
        'intro_link_title',
        'info_title',
        'info_introduction',
        'info_link_title',
    )


@register(WorkingAreaPage)
class WorkingAreaPageTR(TranslationOptions):
    fields = (
        'hero_title',
        'hero_subtitle',
        'summary',
        'introduction',
        'details',
    )


@register(ServicePage)
class ServicePageTR(TranslationOptions):
    fields = (
        'service_description',
        'body',
    )
