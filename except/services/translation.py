from services.models import *
from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

@register(WorkingAreaPage)
class WorkingAreaPageTR(TranslationOptions):
	fields = (
		'hero_title',
		'hero_subtitle',
		'introduction',
		'body',
		)

@register(ServicePage)
class ServicePageTR(TranslationOptions):
	fields = (
		'hero_title',
		'description',
		)

@register(ServiceIndexPage)
class ServiceIndexPageTR(TranslationOptions):
	fields = (
		'hero_title',
		'hero_subtitle',
		'service_introduction',
		)