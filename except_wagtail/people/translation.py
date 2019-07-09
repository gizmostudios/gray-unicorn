from people.models import *
from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

@register(PeoplePage)
class PeoplePageTR(TranslationOptions):
	fields = (
		'hero_title',
		'hero_subtitle',
		'description',
		'description_title',
		'intro',
		)

@register(People)
class PeopleTR(TranslationOptions):
	fields = (
		'biography',
		'introduction',
		'job_title',
		)

@register(Expertise)
class ExpertiseTR(TranslationOptions):
	fields = (
		'competency',
		)

@register(Hobby)
class HobbyTR(TranslationOptions):
	fields = (
		'activity',
		)

@register(ProfilePage)
class ProfilePageTR(TranslationOptions):
	fields = (
		)