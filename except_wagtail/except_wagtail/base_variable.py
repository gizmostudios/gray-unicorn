from except_wagtail.models import *
from index.models import *



def footer_categories(request):
	categories = FooterCategory.objects.all()
	return {"footer_categories": categories}

def logo_link(request):
	home_page = HomePage.objects.all().first()
	return {'home_page': home_page}