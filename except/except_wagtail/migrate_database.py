import time
from django.db import models
from django import forms
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from datetime import datetime

from modelcluster.fields import ParentalKey

from wagtail.core.fields import StreamField, RichTextField
from wagtail.core.models import Page, Orderable
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, PageChooserPanel, StreamFieldPanel, MultiFieldPanel
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.snippets.models import register_snippet

from django.forms.widgets import Select

from wagtail.core import blocks
from wagtail.images.blocks import ImageChooserBlock
from news.blocks import FooterStreamBlock
from services.models import ServicePage as Service
from projects.models import *

settings.configure()

file = open("../database_dumps/separated_tables/test_migrate.sql","r")

print("-- Reading file --")

def process_entry(entry):
	coma_split_items = entry.split(',')
	list_items = []
	temp_item = ''
	for item in coma_split_items:
		if (item.count('\'') == 1 and temp_item == "") or (temp_item != "" and item.count('\'') == 0) or (temp_item != "" and item.count('\\\'') >= 1 and item.count('\'') == item.count('\\\'')):
			temp_item += item
		elif temp_item != "" and item.count('\'') >= 1:
			temp_item += item
			list_items.append(temp_item)
			temp_item = ""		
		else:
			list_items.append(item)
	return list_items

if file.mode == "r":
	content = file.readlines()
	print("-- Extracting assets --")
	entries = content[0].split("),(")
	id_relation_table={}
	len_entries = len(entries)
	for idx, entry in enumerate(entries):
		print('Progress: {0} extracted items'.format(str(idx+1)), end="\r")

		if idx == 0:
			entry = entry[1:]
		if idx == len_entries-1:
			entry = entry[:-2]

		entry_items = process_entry(entry)

		entry_id = entry_items[0]
		entry_type = entry_items[1].replace('\'','')
		entry_status = entry_items[2].replace('\'','')
		entry_priority = entry_items[3].replace('\'','')
		entry_title_en = entry_items[5].replace('\'','')
		entry_title_nl = entry_items[6].replace('\'','')
		entry_subtitle_en = entry_items[8].replace('\'','')
		entry_subtitle_nl = entry_items[9].replace('\'','')
		entry_intro_en = entry_items[11].replace('\'','')
		entry_intro_nl = entry_items[12].replace('\'','')
		entry_body_en = entry_items[14].replace('\'','')
		entry_body_nl = entry_items[15].replace('\'','')

		id_relation_table[idx]=entry_id

		try:
			test = int(entry_id)
			test = int(entry_priority)
		except ValueError:
			print("Parsing issue for entry number "+entry_id)
			print("Entry data:")
			print(entry)

		if entry_type == "Project" and entry_status == "p" and idx == 0:
			print(idx)
			project_folder_page = ProjectIndexPage.objects.live().first()
			if int(entry_priority) < 2:
				new_project_page = ProjectPage(title_en = entry_title_en,
					title_nl = entry_title_nl,
					hero_title_en = entry_title_en,
					hero_title_nl = entry_title_nl,
					hero_subtitle_en = entry_subtitle_en,
					hero_subtitle_nl = entry_subtitle_nl,
					intro_en = entry_intro_en,
					intro_nl = entry_intro_nl,
					body_en = entry_body_en,
					body_nl = entry_body_nl,
					highlight = True)
			else:
				new_project_page = ProjectPage(title_en = entry_title_en,
					title_nl = entry_title_nl,
					hero_title_en = entry_title_en,
					hero_title_nl = entry_title_nl,
					hero_subtitle_en = entry_subtitle_en,
					hero_subtitle_nl = entry_subtitle_nl,
					intro_en = entry_intro_en,
					intro_nl = entry_intro_nl,
					body_en = entry_body_en,
					body_nl = entry_body_nl,
					highlight = False)
			project_folder_page.add_child(instance=new_project_page)
			new_project_page.save_revision().publish() 