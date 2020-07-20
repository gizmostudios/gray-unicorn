from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

from .models import HomePage, AboutUsSection


@register(HomePage)
class HomePageTR(TranslationOptions):
    fields = (
        'hero_title',
        'hero_subtitle',
        'intro_first',
        'intro_second',
        'what_we_do_first_text',
        'what_we_do_second_text',
        'what_we_do_third_text',
        'what_we_do_fourth_text',
        'what_we_do_first_pillar_text',
        'what_we_do_second_pillar_text',
        'what_we_do_third_pillar_text',
    )


@register(AboutUsSection)
class AboutUsSectionTR(TranslationOptions):
    fields = (
        'title',
        'description',
        'first_link_title',
        'second_link_title',
    )
