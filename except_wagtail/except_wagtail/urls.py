from django.conf import settings
from django.conf.urls import include, url
from django.contrib import admin

from wagtail.admin import urls as wagtailadmin_urls
from wagtail.core import urls as wagtail_urls
from wagtail.documents import urls as wagtaildocs_urls
from news import views as news_views
from knowledge import views as knowledge_views
from projects import views as projects_views


from search import views as search_views

urlpatterns = [
    url(r'^django-admin/', admin.site.urls),

    url(r'^admin/', include(wagtailadmin_urls)),
    url(r'^documents/', include(wagtaildocs_urls)),

    url(r'^search/$', search_views.search, name='search'),

    url(r'ajax/filter_news/$',news_views.filter_news, name="filter_news"),
    url(r'ajax/filter_timeline/$',news_views.filter_timeline, name="filter_timeline"),
    url(r'ajax/filter_resources/$',knowledge_views.filter_resources, name="filter_resources"),
    url(r'ajax/update_pagination/$',knowledge_views.update_pagination, name="update_pagination"),
    url(r'ajax/update_pagination_news/$',news_views.update_pagination, name="update_pagination"),
    url(r'ajax/update_pagination_projects/$',projects_views.update_pagination, name="update_pagination"),
    url(r'ajax/filter_timeline_projects/$',projects_views.filter_timeline, name="filter_timeline"),
    url(r'ajax/filter_projects/$',projects_views.filter_projects, name="filter_resources"),

    # For anything not caught by a more specific rule above, hand over to
    # Wagtail's page serving mechanism. This should be the last pattern in
    # the list:
    url(r'', include(wagtail_urls)),

    # Alternatively, if you want Wagtail pages to be served from a subpath
    # of your site, rather than the site root:
    #    url(r'^pages/', include(wagtail_urls)),
]


if settings.DEBUG:
    from django.conf.urls.static import static
    from django.contrib.staticfiles.urls import staticfiles_urlpatterns

    # Serve static and media files from development server
    urlpatterns += staticfiles_urlpatterns()
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
