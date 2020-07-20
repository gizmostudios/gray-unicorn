from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

from about.models import (
    AboutPage, CareerPage, ContactPage, EventCalendarPage, Partner, Resource,
    ResourcesPage, PrivacyPage,
)


@register(AboutPage)
class AboutPageTR(TranslationOptions):
    fields = (
        'hero_title',
        'hero_subtitle',
        'intro_first',
        'intro_second',
        'fourth_section_title',
        'fourth_section_text',
        'fifth_section_text',
        'fifth_section_text',
        'sixth_section_text',
        'sixth_section_text',
        'seventh_section_text',
        'seventh_section_text',
    )


@register(ContactPage)
class ContactPageTR(TranslationOptions):
    fields = (
        'hero_title',
        'hero_subtitle',
        'body',
    )


@register(CareerPage)
class CareerPageTR(TranslationOptions):
    fields = (
        'hero_title',
        'hero_subtitle',
        'body_title',
        'body',
    )


@register(Partner)
class PartnerTR(TranslationOptions):
    fields = (
        'company_name',
        'subtitle',
        'short_description',
        'body',
    )


@register(Resource)
class ResourceTR(TranslationOptions):
    fields = (
        'name',
        'description',
    )


@register(EventCalendarPage)
class EventCalendarPageTR(TranslationOptions):
    fields = ()


@register(ResourcesPage)
class ResourcesPageTR(TranslationOptions):
    fields = (
        'hero_title',
        'hero_subtitle',
    )


@register(PrivacyPage)
class PrivacyPageTR(TranslationOptions):
    fields = (
        'body',
    )
