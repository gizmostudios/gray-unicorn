from django.template.loader import render_to_string
from django.views.decorators.csrf import csrf_exempt
from projects.models import *
from services.models import ServicePage as Service
from django.http import HttpResponse
import json as simplejson
from html import unescape

@csrf_exempt
def filter_projects(request):
	body = simplejson.loads(request.body)
	services = get_services(body)
	news = get_projects(type_article,body)
	mimetype = 'application/json'
	
	html = render_to_string("projects/projects_list.html", {'projects' : projects})
	res = {'html' : html}
	return HttpResponse( simplejson.dumps(res), mimetype)

@csrf_exempt
def filter_timeline(request):
	body = simplejson.loads(request.body)
	services = get_services(body)
	
	projects = ProjectPage.objects.filter(service__title__in=services).all()

	last_year = news.first().date_published.year
	first_year = news.last().date_published.year
	years = range(first_year, last_year+1)

	mimetype = 'application/json'
	
	html = render_to_string("news/timeline.html", {'news' : projects, 'years' : years})
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

def get_projects(body):
	decoded_services = get_services(body)
	try:
		page_number = int(body["page_number"])
	except:
		page_number = 1

	projects = ProjectPage.objects.live().filter(service__title__in=decoded_services).all().order_by('-date_published')
	min_len_projects = min(8*(page_number),len(projects))
	projects_live = projects[8*(page_number-1):min_len_projects]

	return projects_live


def get_services(body):
	services = body["services"]
	decoded_services = []
	for service in services:
		decoded_services.append(unescape(service))

	return decoded_services


def get_pagination(body):
	decoded_services = get_services(body)
	type_article = get_type(body)

	url = "/home"+body["page_url"]

	page = ProjectIndexPage.objects.all().filter(url_path=url).all()[0]

	
	projects = ProjectPage.objects.live().filter(service__title__in=decoded_services).all().order_by('-date_published')
	paginator = Paginator(projects, 8)

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