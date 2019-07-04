from django.template.loader import render_to_string
from django.views.decorators.csrf import csrf_exempt
from news.models import *
from services.models import ServicePage as Service
from django.http import HttpResponse
import json as simplejson
from html import unescape
from django.utils import translation

@csrf_exempt
def lang_selection(request):
	body = simplejson.loads(request.body)
	url = body["url"]
	if translation.get_language() == 'en':
		user_language = 'nl'
	else:
		user_language = 'en'
	translation.activate(user_language)
	request.session[translation.LANGUAGE_SESSION_KEY] = user_language
	html = render_to_string("news/latest_news.html")
	mimetype = 'application/json'
	res = {'html' : html}
	return HttpResponse( simplejson.dumps(res), mimetype)