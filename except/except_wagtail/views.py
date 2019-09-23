from django.template.loader import render_to_string
from django.views.decorators.csrf import csrf_exempt
from news.models import *
from services.models import ServicePage as Service
from django.http import HttpResponse
import json as simplejson
from html import unescape
from django.utils import translation

from itertools import chain
from operator import attrgetter

from projects.models import *
from news.models import *
from except_wagtail.models import *
from services.models import *

# Language selection

@csrf_exempt
def lang_selection(request):
	body = simplejson.loads(request.body.decode('utf-8'))
	url = body["url"]
	if translation.get_language() == 'en':
		user_language = 'nl'
	else:
		user_language = 'en'
	translation.activate(user_language)
	request.session[translation.LANGUAGE_SESSION_KEY] = user_language
	html = render_to_string("modules/grid_8.html")
	mimetype = 'application/json'
	res = {'html' : html}
	return HttpResponse( simplejson.dumps(res), mimetype)

# Load elements when there is a "Load more" buttons

@csrf_exempt
def load_elements(request):
	body = simplejson.loads(request.body.decode('utf-8'))
	model_type = body['dataType']
	iteration = body["iteration"]
	lang = translation.get_language()
	if iteration > 0:
		iteration = 1

	if model_type == 'news':
		res = load_more_news(iteration, lang)
	elif model_type == 'articles':
		res = load_more_resources(iteration, body, lang)
	else:
		res = load_more_projects(iteration, body, lang)

	mimetype = 'application/json'
	return HttpResponse( simplejson.dumps(res), mimetype)

# Load function for news

def load_more_news(iteration, lang):
	news = sorted(
    		chain(NewsPage.objects.live(), NewspaperArticlePage.objects.live()),
    		key=attrgetter('date_published'), reverse=True)
	if iteration == 0:
		min_len_news = min(6*(iteration+1),len(news))
	
		news_live = news[6*(iteration):min_len_news]
		not_last = min_len_news!=len(news)
	else:
		news_live = news[6*(iteration):]
		not_last = False
	

	html = render_to_string("modules/grid_6.html", {'elements' : news_live, 'current_language': lang, 'is_loadable' : True})+"|"+render_to_string("modules/button_load.html", {'not_last' : not_last, 'current_language': lang})
	res = {'html' : html}
	return res

# Load function for projects

def load_more_projects(iteration, body, lang):
	decoded_services = get_services(body)
	projects = ProjectPage.objects.live().filter(service__title__in=decoded_services).all().order_by('-date_published')
	if iteration == 0:
		min_len_projects = min(8,len(projects))
		projects_live = projects[0:min_len_projects]
		not_last = min_len_projects!=len(projects)
	else:
		projects_live = projects[8*(iteration):]
		not_last = False

	html = render_to_string("modules/grid_8.html", {'elements' : projects_live, 'current_language': lang, 'is_loadable' : True})+"|"+render_to_string("modules/button_load.html", {'not_last' : not_last, 'current_language': lang})
	res = {'html' : html}
	return res

# Load function for article in knowledge section

def load_more_resources(iteration, body, lang):
	decoded_services = get_services(body)
	resources = ArticlePage.objects.filter(service__hero_title__in=decoded_services).all().order_by('-date_published')

	if iteration == 0:
		min_len_resources = min(8*(iteration+1),len(resources))
		
		resources_live = resources[8*(iteration):min_len_resources]
		not_last = min_len_resources!=len(resources)
	else:
		resources_live = resources[8*(iteration):]
		not_last = False
	print(resources_live)
	html = render_to_string("modules/grid_8.html", {'elements' : resources_live, 'current_language': lang, 'is_loadable' : True})+"|"+render_to_string("modules/button_load.html", {'not_last' : not_last, 'current_language': lang})
	res = {'html' : html}
	return res

# Retrieve services filtered

def get_services(body):
	services = body["services"]
	decoded_services = []
	lang = translation.get_language()
	for service in services:
		if lang == 'en':
			decoded_services.append(unescape(service))
		else:
			service_name = ServicePage.objects.live().filter(hero_title_nl=unescape(service)).first().title
			decoded_services.append(unescape(service_name))

	return decoded_services

# Load calendar

@csrf_exempt
def load_calendar(request):
	events = Event.objects.all()
	results = [event.as_json() for event in events]
	return HttpResponse(simplejson.dumps(results), content_type="application/json")