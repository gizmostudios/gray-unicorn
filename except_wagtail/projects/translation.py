from projects.models import *
from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

@register(ProjectPage)
class ProjectPageTR(TranslationOptions):
	fields = (
		'hero_title',
		'hero_subtitle',
		)

@register(ProjectIndexPage)
class ProjectIndexPageTR(TranslationOptions):
	fields = (
		'hero_title',
		'hero_subtitle',
		)