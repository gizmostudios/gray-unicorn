from knowledge.models import *
from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

@register(KnowledgePage)
class KnowledgePageTR(TranslationOptions):
	fields = (
		'hero_title',
		'hero_subtitle',
		'hero_subtitle',
		)


@register(ArticlePage)
class ArticlePageTR(TranslationOptions):
	fields = (
		'hero_title',
		)