from except_wagtail.models import *



def footer_categories(request):
	categories = FooterCategory.objects.all()
	return {"footer_categories": categories}