from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

from .models import FooterCategory
from .models import FooterLink
from .models import Event
from .models import PressReference
from .models import Quote
from .models import WebsiteSettings


@register(FooterCategory)
class FooterCategoryTR(TranslationOptions):
    fields = (
        'name',
    )


@register(FooterLink)
class FooterLinkTR(TranslationOptions):
    fields = (
        'name',
    )


@register(Event)
class EventTR(TranslationOptions):
    fields = (
        'name',
    )


@register(PressReference)
class PressReferenceTR(TranslationOptions):
    fields = (
        'description',
        'source',
    )


@register(Quote)
class QuoteTR(TranslationOptions):
    fields = (
        'quote',
        'description',
    )


@register(WebsiteSettings)
class WebsiteSettingsTR(TranslationOptions):
    fields = (
        'name',
        'legal_name',
        'address',
        'locality',
        'region',
        'country',
        'footer_contact',
        'footer_worktime',
    )
