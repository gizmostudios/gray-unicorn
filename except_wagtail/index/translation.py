from index.models import *
from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

@register(HomePage)
class HomePageTR(TranslationOptions):
	fields = (
		'hero_title',
		'hero_subtitle',
		)

@register(CarouselItem)
class CarouselItemR(TranslationOptions):
	fields = (
		)