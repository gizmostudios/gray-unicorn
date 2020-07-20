from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

from .models import ProjectPage, ProjectIndexPage, File, ProjectCategory


@register(ProjectPage)
class ProjectPageTR(TranslationOptions):
    fields = (
        'hero_title',
        'hero_subtitle',
        'header_title',
        'header_subtitle',
        'intro',
        'body',
    )


@register(ProjectIndexPage)
class ProjectIndexPageTR(TranslationOptions):
    fields = (
        'hero_title',
        'hero_subtitle',
        'intro_first',
        'intro_second',
    )


@register(File)
class FileTR(TranslationOptions):
    fields = (
        'name',
    )


@register(ProjectCategory)
class ProjectCategoryTR(TranslationOptions):
    fields = (
        'name',
    )
