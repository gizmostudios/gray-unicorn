from django.utils import translation

from about.models import ContactPage
from index.models import HomePage
from .models import FooterCategory


def footer_categories(request):
    categories = FooterCategory.objects.all()
    return {'footer_categories': categories}


def logo_link(request):
    home_page = HomePage.objects.all().first()
    return {'home_page': home_page}


def current_language(request):
    lang = translation.get_language()
    return {'current_language': lang}


def contact_page(request):
    contact_page = ContactPage.objects.all().first()
    return {'contact_page': contact_page}
