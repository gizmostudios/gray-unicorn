from django.template.loader import render_to_string
from django.views.decorators.csrf import csrf_exempt
from news.models import *
from services.models import ServicePage as Service
from django.http import HttpResponse
import json as simplejson
from html import unescape

from itertools import chain
from operator import attrgetter

@csrf_exempt
def load_more_news(request):
	body = simplejson.loads(request.body)
	iteration = get_iteration(body)
	news = get_news(iteration,body)
	not_last = is_last(iteration,body)

	mimetype = 'application/json'
	
	html = render_to_string("news/latest_news.html", {'current_news' : news})+"|"+render_to_string("news/button_load.html", {'not_last' : not_last})
	res = {'html' : html}
	return HttpResponse( simplejson.dumps(res), mimetype)


def get_news(iteration,body):
	news = sorted(
    		chain(NewsPage.objects.live(), NewspaperArticlePage.objects.live()),
    		key=attrgetter('date_published'), reverse=True)
	min_len_news = min(6*(iteration+1),len(news))
	news_live = news[6*(iteration):min_len_news]
	return news_live

def is_last(iteration,body):
	news = sorted(
    		chain(NewsPage.objects.live(), NewspaperArticlePage.objects.live()),
    		key=attrgetter('date_published'), reverse=True)
	min_len_news = min(6*(iteration+1),len(news))
	return min_len_news!=len(news)


def get_iteration(body):
	iteration = body["iteration"]
	return iteration