from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

from knowledge.models import KnowledgePage, ArticlePage, File


@register(KnowledgePage)
class KnowledgePageTR(TranslationOptions):
    fields = (
        'hero_title',
        'hero_subtitle',
        'description_title',
        'intro',
    )


@register(ArticlePage)
class ArticlePageTR(TranslationOptions):
    fields = (
        'hero_title',
        'hero_subtitle',
        'intro',
        'body',
    )


@register(File)
class FileTR(TranslationOptions):
    fields = (
        'name',
    )
