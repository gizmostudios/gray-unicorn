from django.template.loader import render_to_string
from django.views.decorators.csrf import csrf_exempt
from news.models import *
from django.http import HttpResponse
import json as simplejson
from html import unescape
from knowledge.models import *
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger


@csrf_exempt
def filter_resources(request):
	body = simplejson.loads(request.body)
	resources = get_resources(body)

	mimetype = 'application/json'
	
	html = render_to_string("knowledge/resource_list.html", {'resources' : resources})
	res = {'html' : html}
	return HttpResponse( simplejson.dumps(res), mimetype)

@csrf_exempt
def update_pagination(request):
	body = simplejson.loads(request.body)
	pages = get_pagination(body)
	mimetype = 'application/json'
	html = render_to_string("includes/pagination.html", {'subpages' : pages})
	res = {'html' : html}
	return HttpResponse( simplejson.dumps(res), mimetype)


def get_pagination(body):
	decoded_categories = get_categories(body)

	url = "/home"+body["page_url"]

	page = KnowledgePage.objects.all().filter(url_path=url).all()[0]
	resources = Resource.objects.all().filter(category__title__in=decoded_categories).all().order_by('-date_published')
	paginator = Paginator(resources, 12)

	try:
		page_number = body["page_number"]
	except:
		page_number = 1


	try:
		pages = paginator.page(page_number)
	except PageNotAnInteger:
		pages = paginator.page(1)
	except EmptyPage:
		pages = paginator.page(paginator.num_pages)
	return pages


def get_resources(body):
	decoded_categories = get_categories(body)
	try:
		page_number = int(body["page_number"])
	except:
		page_number = 1

	resources = Resource.objects.all().filter(category__title__in=decoded_categories).all().order_by('-date_published')
	min_len_resources = min(12*(page_number),len(resources))
	print(12*(page_number-1))
	print(min_len_resources)
	print(resources[12:17])
	resources_live = resources[12*(page_number-1):min_len_resources]
	print(resources_live)
	return resources_live


def get_categories(body):
	categories = body["categories"]
	decoded_categories = []
	for category in categories:
		decoded_categories.append(unescape(category))

	return decoded_categories