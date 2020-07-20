INSERT INTO except_wagtail.wagtailcore_pagerevision
(
 id,
 submitted_for_moderation,
 created_at,
 content_json,
 approved_go_live_at,
 page_id,
 user_id
 )

SELECT
null,
0,
latest_revision_created_at,
CONCAT('{"pk": ', id ,', "path": "0001000100040001", "depth": 4, "numchild": 0, "title": "', title ,'", "draft_title": "', title ,'", "slug": "', slug ,'", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "', url_path ,'", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null}'),
null,
id,
1

FROM 
except_wagtail.wagtailcore_page
WHERE
id > 9