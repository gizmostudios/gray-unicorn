from services.models import *
from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

@register(ServicePage)
class ServicePageTR(TranslationOptions):
	fields = (
		'hero_title',
		'hero_subtitle',
		)

@register(SubServicePage)
class SubServicePageTR(TranslationOptions):
	fields = (
		'hero_title',
		)

@register(ServiceIndexPage)
class ServiceIndexPageTR(TranslationOptions):
	fields = (
		'hero_title',
		)