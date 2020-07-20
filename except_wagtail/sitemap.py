from django.conf import settings
from django.contrib.sitemaps import views as sitemap_views
from django.utils import translation

from wagtail.contrib.sitemaps import Sitemap


class ExceptSitemap(Sitemap):
    i18n = True

    def _urls(self, page, protocol, domain):
        urls = []
        last_mods = set()

        for item in self.paginator.page(page).object_list:
            url_info_items = item.get_sitemap_urls(self.request)

            for url_info in url_info_items:
                if getattr(self, 'i18n', False) \
                  and 'alternatives' not in url_info:
                    url_info['alternatives'] = []
                    current_lang_code = translation.get_language()
                    for lang_code, lang_name in settings.LANGUAGES:
                        translation.activate(lang_code)
                        url_info['alternatives'].append({
                            'language': lang_code,
                            'href': item.get_full_url(self.request)
                        })
                    translation.activate(current_lang_code)

                urls.append(url_info)
                last_mods.add(url_info.get('lastmod'))

        # last_mods might be empty if the whole site is private
        if last_mods and None not in last_mods:
            self.latest_lastmod = max(last_mods)
        return urls


def sitemap(request, **kwargs):
    sitemaps = {'wagtail': ExceptSitemap(request)}
    return sitemap_views.sitemap(request, sitemaps, **kwargs)
