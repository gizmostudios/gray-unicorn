from django.template.loader import render_to_string
from django.views.decorators.csrf import csrf_exempt
from news.models import *
from django.http import HttpResponse
import json as simplejson

@csrf_exempt
def filter_news(request):
	category = request.POST.get('category', None)
	news = NewsPage.objects.filter(category__title=category).all()

	mimetype = 'application/json'
	
	html = render_to_string("news/latest_articles.html", {'current_news' : news})
	res = {'html' : html}
	return HttpResponse( simplejson.dumps(res), mimetype)

@csrf_exempt
def filter_timeline(request):
	category = request.POST.get('category', None)
	news = NewsPage.objects.filter(category__title=category).all()

	last_year = news.first().date_published.year
	first_year = news.last().date_published.year
	years = range(first_year, last_year+1)

	mimetype = 'application/json'
	
	html = render_to_string("news/timeline.html", {'news' : news, 'years' : years})
	res = {'html' : html}
	return HttpResponse( simplejson.dumps(res), mimetype)