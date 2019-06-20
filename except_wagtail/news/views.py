from django.template.loader import render_to_string
from django.views.decorators.csrf import csrf_exempt
from news.models import *
from services.models import ServicePage as Service
from django.http import HttpResponse
import json as simplejson
from html import unescape

@csrf_exempt
def filter_news(request):
	body = simplejson.loads(request.body)
	services = get_services(body)
	type_article = get_type(body)
	news = get_news(type_article,body)
	print('test')
	mimetype = 'application/json'
	
	html = render_to_string("news/latest_news.html", {'current_news' : news, 'type':type_article})
	res = {'html' : html}
	return HttpResponse( simplejson.dumps(res), mimetype)

@csrf_exempt
def filter_timeline(request):
	body = simplejson.loads(request.body)
	services = get_services(body)
	
	news = NewsPage.objects.filter(service__title__in=services).all()

	last_year = news.first().date_published.year
	first_year = news.last().date_published.year
	years = range(first_year, last_year+1)

	mimetype = 'application/json'
	
	html = render_to_string("news/timeline.html", {'news' : news, 'years' : years})
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

def get_news(type_article,body):
	decoded_services = get_services(body)
	try:
		page_number = int(body["page_number"])
	except:
		page_number = 1

	if (type_article == "except"):
		news = NewsPage.objects.live().filter(service__title__in=decoded_services).all().order_by('-date_published')
		min_len_news = min(6*(page_number),len(news))
		news_live = news[6*(page_number-1):min_len_news]
	else:
		news = NewspaperArticlePage.objects.live().filter(service__title__in=decoded_services).all().order_by('-date_published')
		min_len_news = min(8*(page_number),len(news))
		news_live = news[8*(page_number-1):min_len_news]
	return news_live


def get_services(body):
	services = body["services"]
	decoded_services = []
	for service in services:
		decoded_services.append(unescape(service))

	return decoded_services

def get_type(body):
	type_article = body["type"]
	return type_article


def get_pagination(body):
	decoded_services = get_services(body)
	type_article = get_type(body)

	url = "/home"+body["page_url"]

	page = NewsIndexPage.objects.all().filter(url_path=url).all()[0]

	if (type_article == "except"):
		news = NewsPage.objects.live().filter(service__title__in=decoded_services).all().order_by('-date_published')
		paginator = Paginator(news, 6)
	else:
		news = NewspaperArticlePage.objects.live().filter(service__title__in=decoded_services).all().order_by('-date_published')
		paginator = Paginator(news, 8)

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