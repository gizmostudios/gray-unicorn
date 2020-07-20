"""
Environment variables
---------------------

export DB_NAME='except_wagtail'
export DB_USER='except_wagtail'
export DB_PASS='11qq00pp'
export BASE_URL='https://except.eco'
export DEBUG=''
export SECRET_KEY='!xeg6r95bydqdtdijw9#mgci8e=s-iymdhqb9vc)lyj-ncgd2$'
export HOST='except.eco'
export MAPS_KEY='AIzaSyBFDwBQRIZxbjsZARn1yuIfWwLXW_GFa6A'

Data to import
--------------

     32 Article     -> Knowledge
     66 Client
    157 NewsItem    -> News
     10 Partner
     70 Project     -> Projects

Redirect codes
--------------

    Redirect 301 /en/articles/{id}-{slug} https://except.eco/knowledge/{slug}/
    Redirect 301 /nl/articles/{id}-{slug} https://except.eco/nl/knowledge/{slug}/

CSV fields
----------

    id,assettype,status,priority,title,title_en,title_nl,subtitle,subtitle_en,subtitle_nl,short_description,short_description_en,short_description_nl,body,body_en,body_nl,supplemental_info,supplemental_info_en,supplemental_info_nl,template,p_title,p_title_en,p_title_nl,p_subtitle,p_subtitle_en,p_subtitle_nl,p_short_description,p_short_description_en,p_short_description_nl,p_body,p_body_en,p_body_nl,p_supplemental_info,p_template,contact,contact_en,contact_nl,updated_at,published_at,created_at,author_id,slug,url,released_at,p_supplemental_info_en,p_supplemental_info_nl,telephone,twitter,youtube_video_id
"""
import csv
from datetime import datetime
import json
import os
import sys

import django

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "except_wagtail.settings")
django.setup()

from knowledge.models import ArticlePage, KnowledgePage
from people.models import People

author = People.objects.get(pk=5)
main = KnowledgePage.objects.all()[0]
i = 1

csv.field_size_limit(csv.field_size_limit() * 10)

# delete previously imported
print('delete previously imported')
[article.delete() for article in ArticlePage.objects.all() if not article.body]

# import entries
print('import entries')
with open('main_asset.csv') as csv_file:
    csv_reader = csv.DictReader(csv_file)

    for row in csv_reader:
        if row['status'] == 'p' and row['assettype'] == 'Article':

            date_published = datetime.strptime(row['published_at'], "%Y-%m-%d %H:%M:%S")

            # print('nl  id', row['id'])

            try:
                post = ArticlePage(  # .objects.create(
                    author=author,
                    body=json.dumps([{'type': 'raw_html', 'value': row['body']}]),
                    body_en=json.dumps([{'type': 'raw_html', 'value': row['body_en']}]),
                    body_nl=json.dumps([{'type': 'raw_html', 'value': row['body_nl']}]),
                    date_published=date_published,
                    intro=row['short_description'],
                    intro_en=row['short_description_en'],
                    intro_nl=row['short_description_nl'],
                    service=None,
                    slug=row['slug'],
                    slug_en=row['slug'],
                    slug_nl=row['slug'],
                    title=row['title'],
                    title_en=row['title_en'],
                    title_nl=row['title_nl'],
                    
                    hero_title_en=row['title_en'],
                    hero_title_nl=row['title_nl'],
                    hero_subtitle_en=row['subtitle_en'],
                    hero_subtitle_nl=row['subtitle_nl'],
                )
                main.add_child(instance=post)
                main.save()

                # print('eco id', post.pk)
                
                # markdown code
                old_site = 'https://except.nl/en/articles/%s-%s' % (row['id'], row['slug'])
                old_site_admin = 'http://except.nl/admin/main/article/%s/' % row['id']
                html_en = 'file:///C:/Users/luzdealba/OneDrive/Work/Except/backups/articles/%s_en.txt' % row['id']
                html_nl = 'file:///C:/Users/luzdealba/OneDrive/Work/Except/backups/articles/%s_nl.txt' % row['id']
                new_site = 'https://except.eco/knowledge/%s/' % row['slug']
                new_site_admin = 'https://except.eco/admin/pages/%s/edit/' % post.pk

                print('%s. [ ] %s\\' % (i, row['title']))
                print('  [old site](%s)' % old_site)
                print('  ([admin](%s),' % old_site_admin)
                print('  [HTML en](%s),' % html_en)
                print('  [HTML nl](%s)) //' % html_nl)
                print('  [new site](%s)' % new_site)
                print('  [admin](%s)' % new_site_admin)

                i += 1
            except Exception as e:
                pass
                # print(str(e))
            
            # print('---')
