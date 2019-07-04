from people.models import *
from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

@register(PeoplePage)
class PeoplePageTR(TranslationOptions):
	fields = (
		'hero_title',
		'hero_subtitle',
		)

@register(ProfilePage)
class ProfilePageTR(TranslationOptions):
	fields = (
		)