from django.template.loader import render_to_string
from django.views.decorators.csrf import csrf_exempt
from news.models import *
from django.http import HttpResponse
import json as simplejson
from html import unescape

@csrf_exempt
def filter_news(request):
	body = simplejson.loads(request.body)
	categories = body["categories"]
	decoded_categories = []
	for category in categories:
		decoded_categories.append(unescape(category))
	type_article = body["type"]

	if (type_article == "except"):
		news = NewsPage.objects.live().filter(category__title__in=decoded_categories).all()
	else:
		news = NewspaperArticlePage.objects.live().filter(category__title__in=decoded_categories).all()


	mimetype = 'application/json'
	
	html = render_to_string("news/latest_news.html", {'current_news' : news, 'type':type_article})
	res = {'html' : html}
	return HttpResponse( simplejson.dumps(res), mimetype)

@csrf_exempt
def filter_timeline(request):
	body = simplejson.loads(request.body)
	categories = body["categories"]
	decoded_categories = []
	for category in categories:
		decoded_categories.append(unescape(category))

	news = NewsPage.objects.filter(category__title__in=decoded_categories).all()

	last_year = news.first().date_published.year
	first_year = news.last().date_published.year
	years = range(first_year, last_year+1)

	mimetype = 'application/json'
	
	html = render_to_string("news/timeline.html", {'news' : news, 'years' : years})
	res = {'html' : html}
	return HttpResponse( simplejson.dumps(res), mimetype)