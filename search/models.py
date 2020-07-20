from django.conf import settings
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.http import JsonResponse
from django.template.loader import render_to_string

from wagtail.core.models import Page
from wagtail.search.models import Query


class Search(Page):
    parent_page_types = ['index.HomePage']

    def get_context(self, request):
        context = super(Search, self).get_context(request)

        search_query = request.GET.get('query', None)
        if search_query:
            search_results = Page.objects.live().search(search_query)
            query = Query.get(search_query)
            query.add_hit()
        else:
            search_results = Page.objects.none()

        paginator = Paginator(search_results, settings.PAGINATOR_ITEMS_COUNT)
        page = request.GET.get('page')
        try:
            posts = paginator.page(page)
        except PageNotAnInteger:
            posts = paginator.page(1)
        except EmptyPage:
            posts = paginator.page(paginator.num_pages)

        context['query'] = search_query
        context['posts'] = posts

        return context

    def serve(self, request, *args, **kwargs):
        if request.is_ajax():
            context = self.get_context(request)
            next = context['posts'].next_page_number() if context['posts'].has_next() else None
            prev = context['posts'].previous_page_number() if context['posts'].has_previous() else None
            html = render_to_string(
                '_includes/index_item_search.html',
                context,
            )
            return JsonResponse({
                'html': html,
                'next': next,
                'prev': prev,
            })
        else:
            return super().serve(request, *args, **kwargs)
