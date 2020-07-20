from except_wagtail.models import *
from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

@register(FooterCategory)
class FooterCategoryTR(TranslationOptions):
	fields = (
		'name',
		)

@register(FooterLink)
class FooterLinkTR(TranslationOptions):
	fields = (
		'name',
		)

@register(Event)
class EventTR(TranslationOptions):
	fields = (
		'name',
		)