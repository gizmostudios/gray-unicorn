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
    
    Redirect 301 /en/news/{id}-{slug} https://except.eco/about/news/excepts-news/{slug}/
    Redirect 301 /nl/news/{id}-{slug} https://except.eco/nl/about/news/excepts-news/{slug}/

    Redirect 301 /en/projects/{id}-{slug} https://except.eco/projects/{slug}/
    Redirect 301 /nl/projects/{id}-{slug} https://except.eco/nl/{slug}/

CSV fields
----------

    id,assettype,status,priority,title,title_en,title_nl,subtitle,subtitle_en,subtitle_nl,short_description,short_description_en,short_description_nl,body,body_en,body_nl,supplemental_info,supplemental_info_en,supplemental_info_nl,template,p_title,p_title_en,p_title_nl,p_subtitle,p_subtitle_en,p_subtitle_nl,p_short_description,p_short_description_en,p_short_description_nl,p_body,p_body_en,p_body_nl,p_supplemental_info,p_template,contact,contact_en,contact_nl,updated_at,published_at,created_at,author_id,slug,url,released_at,p_supplemental_info_en,p_supplemental_info_nl,telephone,twitter,youtube_video_id
"""
import csv

csv.field_size_limit(csv.field_size_limit() * 10)

r_article_en = 'Redirect 301 /en/articles/{id}-{slug} https://except.eco/knowledge/{slug}/'
r_article_nl = 'Redirect 301 /nl/articles/{id}-{slug} https://except.eco/nl/knowledge/{slug}/'
    
r_news_en = 'Redirect 301 /en/news/{id}-{slug} https://except.eco/about/news/excepts-news/{slug}/'
r_news_nl = 'Redirect 301 /nl/news/{id}-{slug} https://except.eco/nl/about/news/excepts-news/{slug}/'

r_project_en = 'Redirect 301 /en/projects/{id}-{slug} https://except.eco/projects/{slug}/'
r_project_nl = 'Redirect 301 /nl/projects/{id}-{slug} https://except.eco/nl/projects/{slug}/'


with open('tables/main_asset.csv', encoding='utf8') as csv_file:
    csv_reader = csv.DictReader(csv_file)

    for row in csv_reader:
        if row['status'] == 'p' and row['assettype'] == 'Article':
            print(r_article_en.format(id=row['id'], slug=row['slug']))
            print(r_article_nl.format(id=row['id'], slug=row['slug']))

    print()

with open('tables/main_asset.csv', encoding='utf8') as csv_file:
    csv_reader = csv.DictReader(csv_file)

    for row in csv_reader:
        if row['status'] == 'p' and row['assettype'] == 'NewsItem':
            print(r_news_en.format(id=row['id'], slug=row['slug']))
            print(r_news_nl.format(id=row['id'], slug=row['slug']))

    print()

with open('tables/main_asset.csv', encoding='utf8') as csv_file:
    csv_reader = csv.DictReader(csv_file)

    for row in csv_reader:
        if row['status'] == 'p' and row['assettype'] == 'Project':
            print(r_project_en.format(id=row['id'], slug=row['slug']))
            print(r_project_nl.format(id=row['id'], slug=row['slug']))
