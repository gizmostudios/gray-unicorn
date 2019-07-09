from news.models import *
from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

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
		)

@register(NewsIndexPage)
class NewsIndexPagePageTR(TranslationOptions):
	fields = (
		'hero_title',
		'hero_subtitle',
		)

@register(FolderNewspaperPage)
class FolderNewspaperPageTR(TranslationOptions):
	fields = (
		'hero_title',
		)

@register(FolderArticlePage)
class FolderArticlePageTR(TranslationOptions):
	fields = (
		'hero_title',
		)