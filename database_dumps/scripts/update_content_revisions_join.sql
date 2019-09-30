update
wagtailcore_page
inner join 
wagtailcore_pagerevision
on
wagtailcore_page.id = wagtailcore_pagerevision.page_id
set
wagtailcore_page.live_revision_id = wagtailcore_pagerevision.id
where
wagtailcore_page.id > 9