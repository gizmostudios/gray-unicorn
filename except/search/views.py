from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.shortcuts import render

from django.conf import settings

from wagtail.core.models import Page
from wagtail.search.models import Query
from knowledge.models import *
from news.models import *
from people.models import *
from projects.models import *
from services.models import *


def search(request):
    # Search
    search_query = request.GET.get('query', None)
    if search_query:
        if 'elasticsearch2' in settings.WAGTAILSEARCH_BACKENDS['default']['BACKEND']:
            # In production, use ElasticSearch and a simplified search query, per
            # http://docs.wagtail.io/en/v1.12.1/topics/search/backends.html
            # like this:
            search_results = Page.objects.live().search(search_query)
        else:
            # If we aren't using ElasticSearch for the demo, fall back to native db search.
            # But native DB search can't search specific fields in our models on a `Page` query.
            # So for demo purposes ONLY, we hard-code in the model names we want to search.
            article_results = ArticlePage.objects.live().search(search_query)
            article_page_ids = [p.page_ptr.id for p in article_results]

            except_news_results = NewsPage.objects.live().search(search_query)
            article_page_ids = [p.page_ptr.id for p in except_news_results]

            newspaper_news_results = NewspaperArticlePage.objects.live().search(search_query)
            newspaper_news_ids = [p.page_ptr.id for p in newspaper_news_results]

            people_results = ProfilePage.objects.live().search(search_query)
            people_ids = [p.page_ptr.id for p in people_results]

            project_results = ProjectPage.objects.live().search(search_query)
            project_ids = [p.page_ptr.id for p in project_results]

            service_results = ServicePage.objects.live().search(search_query)
            service_ids = [p.page_ptr.id for p in service_results]

            page_ids = article_page_ids + article_page_ids + newspaper_news_ids + people_ids + project_ids + service_ids
            search_results = Page.objects.live().filter(id__in=page_ids)

        query = Query.get(search_query)

        # Record hit
        query.add_hit()

    else:
        search_results = Page.objects.none()

    # Pagination
    page = request.GET.get('page', 1)
    paginator = Paginator(search_results, 50)
    try:
        search_results = paginator.page(page)
    except PageNotAnInteger:
        search_results = paginator.page(1)
    except EmptyPage:
        search_results = paginator.page(paginator.num_pages)

    return render(request, 'search/search_results.html', {
        'search_query': search_query,
        'search_results': search_results,
    })
