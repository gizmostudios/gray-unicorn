from about.models import *
from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

@register(AboutPage)
class AboutPageTR(TranslationOptions):
	fields = (
		'hero_title',
		'hero_subtitle',
		'about_title',
		'about_text',
		'vision_title',
		'vision_text',
		)

@register(CareerPage)
class CareerPageTR(TranslationOptions):
	fields = (
		'hero_title',
		'hero_subtitle',
		'body',
		)

@register(ContactPage)
class ContactPageTR(TranslationOptions):
	fields = (
		'hero_title',
		'hero_subtitle',
		'body',
		)

@register(EventCalendarPage)
class EventCalendarPageTR(TranslationOptions):
	fields = (
		)

@register(Resource)
class ResourceTR(TranslationOptions):
	fields = (
		'name',
		'description',
		)

@register(ResourcesPage)
class ResourcesPageTR(TranslationOptions):
	fields = (
		'hero_title',
		'hero_subtitle',
		)