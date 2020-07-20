from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

from news.models import (
    NewsPage, NewspaperArticlePage, NewsIndexPage, FolderNewspaperPage,
    FolderArticlePage, File,
)


@register(NewsPage)
class NewsPageTR(TranslationOptions):
    fields = (
        'hero_title',
        'hero_subtitle',
        'intro',
        'body',
    )


@register(NewspaperArticlePage)
class NewspaperArticlePageTR(TranslationOptions):
    fields = (
        'hero_title',
        'hero_subtitle',
    )


@register(NewsIndexPage)
class NewsIndexPagePageTR(TranslationOptions):
    fields = (
        'hero_title',
        'hero_subtitle',
    )


@register(FolderNewspaperPage)
class FolderNewspaperPageTR(TranslationOptions):
    fields = ()


@register(FolderArticlePage)
class FolderArticlePageTR(TranslationOptions):
    fields = ()


@register(File)
class FilePageTR(TranslationOptions):
    fields = (
        'name',
    )
