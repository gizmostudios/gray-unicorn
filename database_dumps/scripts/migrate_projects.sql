INSERT INTO except_wagtail.wagtailcore_page
(
 id,
 path,
 depth,
 numchild,
 title,
 slug,
 live,
 has_unpublished_changes,
 url_path,
 seo_title,
 show_in_menus,
 search_description,
 go_live_at,
 expire_at,
 expired,
 content_type_id,
 owner_id,
 locked,
 latest_revision_created_at,
 first_published_at,
 live_revision_id,
 last_published_at,
 draft_title
 )

SELECT

id,
CONCAT('000100010004000', id),
4,
0,
title,
slug,
1,
0,
CONCAT('/home/projects/', title, '/'),
'',
0,
'',
null,
null,
0,
2,
1,
0,
released_at,
created_at,
null,
published_at,
title

FROM django_web.main_asset WHERE assettype = 'Project' AND django_web.main_asset.id != 3 AND  django_web.main_asset.id != 9