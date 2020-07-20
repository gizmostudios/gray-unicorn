from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

from people.models import PeoplePage, People, Expertise, Hobby, ProfilePage


@register(PeoplePage)
class PeoplePageTR(TranslationOptions):
    fields = (
        'hero_title',
        'hero_subtitle',
        'description',
        'description_title',
    )


@register(People)
class PeopleTR(TranslationOptions):
    fields = (
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
    fields = ()
