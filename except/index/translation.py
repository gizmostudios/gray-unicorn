from index.models import *
from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

@register(HomePage)
class HomePageTR(TranslationOptions):
	fields = (
		'hero_title',
		'hero_subtitle',
		'introduction_title',
		'introduction_text',
		'carousel_title',
		'carousel_description',
		'video_description',
		)

@register(CarouselItem)
class CarouselItemR(TranslationOptions):
	fields = (
		'link_description',
		)