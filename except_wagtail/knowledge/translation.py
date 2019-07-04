from knowledge.models import KnowledgePage
from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

@register(KnowledgePage)
class KnowledgePageTR(TranslationOptions):
	fields = (
		'hero_title',
		'hero_subtitle',
		)