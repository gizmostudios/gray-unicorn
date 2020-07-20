from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

from .models import Search


@register(Search)
class SearchTR(TranslationOptions):
    fields = ()
