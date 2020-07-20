# coding: utf-8

from django.core.management.base import BaseCommand

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
from knowledge.models import *
from datetime import datetime

import json


class Command(BaseCommand):
	
	def handle(self, *args, **options):

		file = open("../database_dumps/separated_tables/test_migrate.sql","r")

		print("1 - Cleaning models")

		ProjectPage.objects.all().delete()
		ArticlePage.objects.all().delete()
		NewsPage.objects.all().delete()

		def process_entry(entry):

			coma_split_items = entry.split(',')
			list_items = []
			temp_item = ''
			for item in coma_split_items:
				if(item.count('\'') == item.count('\\\'')+1 and temp_item == "") or (temp_item != "" and item.count('\'') == item.count('\\\'')):
					temp_item += item
				elif temp_item != "" and item.count('\'') >= 1:
					temp_item += item
					list_items.append(temp_item)
					temp_item = ""		
				else:
					list_items.append(item)
			return list_items

		def process_images():

			print("2 - Extracting images")

			image_file = open("../database_dumps/separated_tables/asset_image.sql","r")
			list_images={}

			if image_file.mode == 'r':
				image_content = image_file.readlines()[0].split("),(")

				for idx, image in enumerate(image_content):
					print('-- Progress: {0} extracted images'.format(str(idx+1)), end="\r")
					if idx == len(image_content)-1:
						print('-- Finished: {0} extracted images'.format(str(idx+1)))

					image_asset_id = image.split(',')[1]
					image_asset_path = image.split(',\'')[2].split('\'')[0]
					list_images.setdefault(image_asset_id, []).append(image_asset_path)

				return list_images


		if file.mode == "r":
			content = file.readlines()
			images = process_images()
			print("3 - Extracting assets")
			entries = content[0].split("),(")
			id_relation_table={}
			len_entries = len(entries)
			for idx, entry in enumerate(entries):
				print('-- Progress: {0} extracted assets'.format(str(idx+1)), end="\r")

				if idx == 0:
					entry = entry[1:]
				if idx == len_entries-1:
					print('-- Finished: {0} extracted assets'.format(str(idx+1)))
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
				entry_intro_en = entry_items[11].replace('\'','').replace('\\r\\n','')
				entry_intro_nl = entry_items[12].replace('\'','').replace('\\r\\n','')
				entry_body_en = entry_items[14].replace('\\','').replace('rn','').replace('<h2>','<h3 class="h3">')
				raw_json_en = json.dumps([{'type': 'html_block', 'value': entry_body_en}])
				entry_body_nl = entry_items[15].replace('\'','').replace('\\r\\n','')
				raw_json_nl = json.dumps([{'type': 'html_block', 'value': entry_body_nl}])

				try:
					entry_published = datetime.strptime(entry_items[38].replace('\'',''), '%Y-%m-%d %H:%M:%S')
				except ValueError:
					for item in entry_items:
						print('--------------------------')
						print(item)
					print(entry_items[38].replace('\'',''))
					return

				try:
					test = int(entry_id)
					test = int(entry_priority)
				except ValueError:
					print("Parsing issue for entry number "+entry_id)
					print("Entry data:")
					print(entry)

				if images.get(entry_id):
					entry_image = images.get(entry_id)[0]
				else:
					entry_image = ""

				if entry_type == "Project" and entry_status == "p":
					project_folder_page = ProjectIndexPage.objects.live().first()
					if int(entry_priority) < 2:
						new_project_page = ProjectPage(title_en = entry_title_en,
							title_nl = entry_title_nl,
							hero_old_image = entry_image,
							hero_title_en = entry_title_en,
							hero_title_nl = entry_title_nl,
							hero_subtitle_en = entry_subtitle_en,
							hero_subtitle_nl = entry_subtitle_nl,
							navbar_transparent=True,
							navbar_inverted=False,
							intro_en = entry_intro_en,
							intro_nl = entry_intro_nl,
							body_en = raw_json_en,
							body_nl = raw_json_nl,
							date_published=entry_published,
							highlight = True)
					else:
						new_project_page = ProjectPage(title_en = entry_title_en,
							title_nl = entry_title_nl,
							hero_old_image = entry_image,
							hero_title_en = entry_title_en,
							hero_title_nl = entry_title_nl,
							hero_subtitle_en = entry_subtitle_en,
							hero_subtitle_nl = entry_subtitle_nl,
							navbar_transparent=True,
							navbar_inverted=False,
							intro_en = entry_intro_en,
							intro_nl = entry_intro_nl,
							body_en = raw_json_en,
							body_nl = raw_json_nl,
							date_published=entry_published,
							highlight = False)
					project_folder_page.add_child(instance=new_project_page)
					new_project_page.save_revision().publish()
					id_relation_table[entry_id]=new_project_page.id

				elif entry_type == "Article" and entry_status == "p":
					articles_folder_page = KnowledgePage.objects.live().first()
					if int(entry_priority) < 2:
						new_article_page = ArticlePage(title_en = entry_title_en,
							title_nl = entry_title_nl,
							hero_old_image = entry_image,
							hero_title_en = entry_title_en,
							hero_title_nl = entry_title_nl,
							hero_subtitle_en = entry_subtitle_en,
							hero_subtitle_nl = entry_subtitle_nl,
							navbar_transparent=True,
							navbar_inverted=False,
							intro_en = entry_intro_en,
							intro_nl = entry_intro_nl,
							body_en = raw_json_en,
							body_nl = raw_json_nl,
							date_published=entry_published,
							highlight = True)
					else:
						new_article_page = ArticlePage(title_en = entry_title_en,
							title_nl = entry_title_nl,
							hero_old_image = entry_image,
							hero_title_en = entry_title_en,
							hero_title_nl = entry_title_nl,
							hero_subtitle_en = entry_subtitle_en,
							hero_subtitle_nl = entry_subtitle_nl,
							navbar_transparent=True,
							navbar_inverted=False,
							intro_en = entry_intro_en,
							intro_nl = entry_intro_nl,
							body_en = raw_json_en,
							body_nl = raw_json_nl,
							date_published=entry_published,
							highlight = False)
					articles_folder_page.add_child(instance=new_article_page)
					new_article_page.save_revision().publish()
					id_relation_table[entry_id]=new_article_page.id
				elif entry_type=="NewsItem" and entry_status == "p":
					news_folder_page = FolderArticlePage.objects.live().first()
					if int(entry_priority) < 2:
						new_article_page = NewsPage(title_en = entry_title_en,
							title_nl = entry_title_nl,
							hero_old_image = entry_image,
							hero_title_en = entry_title_en,
							hero_title_nl = entry_title_nl,
							hero_subtitle_en = entry_subtitle_en,
							hero_subtitle_nl = entry_subtitle_nl,
							type_of_news = "AR",
							navbar_transparent=True,
							navbar_inverted=False,
							intro_en = entry_intro_en,
							intro_nl = entry_intro_nl,
							body_en = raw_json_en,
							body_nl = raw_json_nl,
							date_published=entry_published,
							highlight = True)
					else:
						new_article_page = NewsPage(title_en = entry_title_en,
							title_nl = entry_title_nl,
							hero_old_image = entry_image,
							hero_title_en = entry_title_en,
							hero_title_nl = entry_title_nl,
							hero_subtitle_en = entry_subtitle_en,
							hero_subtitle_nl = entry_subtitle_nl,
							type_of_news = "AR",
							navbar_transparent=True,
							navbar_inverted=False,
							intro_en = entry_intro_en,
							intro_nl = entry_intro_nl,
							body_en = raw_json_en,
							body_nl = raw_json_nl,
							date_published=entry_published,
							highlight = False)
					news_folder_page.add_child(instance=new_article_page)
					new_article_page.save_revision().publish()
					id_relation_table[entry_id]=new_article_page.id
				elif entry_type=="UserProfile" and entry_status == "p":
					print(entry_id)
					print(entry_title_en)

		print("3 - Building asset connections")

		file = open("../database_dumps/separated_tables/test_article_to_article.sql","r")
		if file.mode == "r":
			content = file.readlines()
			connectionList = content[0].split("),(")
			for idx, connection in enumerate(connectionList):
				print('-- Progress: {0} extracted article to article connections'.format(str(idx+1)), end="\r")
				if idx == len(connectionList)-1:
					print('-- Finished: {0} extracted article to article connections'.format(str(idx+1)))
				elements = connection.split(",")
				from_article_old_id = elements[1].replace("(","")
				to_article_old_id = elements[2].replace(")","")
				try:
					from_article_new_id = id_relation_table.get(from_article_old_id)
					to_article_news_id = id_relation_table.get(to_article_old_id)
				except:
					continue
				if(from_article_new_id != None and to_article_news_id != None):
					from_article = ArticlePage.objects.get(pk=from_article_new_id)
					to_article = ArticlePage.objects.get(pk=to_article_news_id)
					new_connection = ConnectedArticle(page_id = from_article_new_id, element = to_article)
					new_connection.save()
					from_article.linked_articles.add(new_connection)

		file = open("../database_dumps/separated_tables/test_article_to_project.sql","r")
		if file.mode == "r":
			content = file.readlines()
			connectionList = content[0].split("),(")
			for idx, connection in enumerate(connectionList):
				print('-- Progress: {0} extracted article to project connection'.format(str(idx+1)), end="\r")
				if idx == len(connectionList)-1:
					print('-- Finished: {0} extracted article to project connection'.format(str(idx+1)))
				elements = connection.split(",")
				from_project_old_id = elements[1].replace("(","")
				to_article_old_id = elements[2].replace(")","")
				try:
					from_project_new_id = id_relation_table.get(from_project_old_id)
					to_article_new_id = id_relation_table.get(to_article_old_id)
				except:
					continue
				if(from_project_new_id != None and to_article_new_id != None):
					from_project = ProjectPage.objects.get(pk=from_project_new_id)
					to_article = ArticlePage.objects.get(pk=to_article_new_id)
					new_connection = ConnectedProject(page_id = to_article_new_id, element = from_project)
					new_connection.save()
					to_article.linked_projects.add(new_connection)
					new_connection = LinkedArticle(page_id = from_project_new_id, element = to_article)
					new_connection.save()
					from_project.linked_articles.add(new_connection)

			file = open("../database_dumps/separated_tables/test_project_to_project.sql","r")
			if file.mode == "r":
				content = file.readlines()
				connectionList = content[0].split("),(")
				for idx, connection in enumerate(connectionList):
					print('-- Progress: {0} extracted project to project connection'.format(str(idx+1)), end="\r")
					if idx == len(connectionList)-1:
						print('-- Finished: {0} extracted project to project connection'.format(str(idx+1)))
					elements = connection.split(",")
					from_project_old_id = elements[1].replace("(","")
					to_project_old_id = elements[2].replace(")","")
					try:
						from_project_new_id = id_relation_table.get(from_project_old_id)
						to_project_new_id = id_relation_table.get(to_project_old_id)
					except:
						continue
					if(from_project_new_id != None and to_project_new_id != None):
						from_project = ProjectPage.objects.get(pk=from_project_new_id)
						to_project = ProjectPage.objects.get(pk=to_project_new_id)
						new_connection = LinkedProject(page_id = to_project_new_id, element = from_project)
						new_connection.save()
						to_project.linked_projects.add(new_connection)

			file = open("../database_dumps/separated_tables/test_news_to_news.sql","r")
			if file.mode == "r":
				content = file.readlines()
				connectionList = content[0].split("),(")
				for idx, connection in enumerate(connectionList):
					print('-- Progress: {0} extracted news to news connection'.format(str(idx+1)), end="\r")
					if idx == len(connectionList)-1:
						print('-- Finished: {0} extracted news to news connection'.format(str(idx+1)))
					elements = connection.split(",")
					from_news_old_id = elements[1].replace("(","")
					to_news_old_id = elements[2].replace(")","")
					try:
						from_news_new_id = id_relation_table.get(from_news_old_id)
						to_news_new_id = id_relation_table.get(to_news_old_id)
					except:
						continue
					if(from_news_new_id != None and to_news_new_id != None):
						from_news = NewsPage.objects.get(pk=from_news_new_id)
						to_news = NewsPage.objects.get(pk=to_news_new_id)
						new_connection = RelatedArticle(page_id = to_news_new_id, element = from_news)
						new_connection.save()
						to_news.linked_articles.add(new_connection)

			file = open("../database_dumps/separated_tables/test_news_to_project.sql","r")
			if file.mode == "r":
				content = file.readlines()
				connectionList = content[0].split("),(")
				for idx, connection in enumerate(connectionList):
					print('-- Progress: {0} extracted news to article connection'.format(str(idx+1)), end="\r")
					if idx == len(connectionList)-1:
						print('-- Finished: {0} extracted news to article connection'.format(str(idx+1)))
					elements = connection.split(",")
					from_project_old_id = elements[1].replace("(","")
					to_news_old_id = elements[2].replace(")","")
					try:
						from_project_new_id = id_relation_table.get(from_project_old_id)
						to_news_new_id = id_relation_table.get(to_news_old_id)
					except:
						continue
					if(from_project_new_id != None and to_news_new_id != None):
						from_project= ProjectPage.objects.get(pk=from_project_new_id)
						to_news = NewsPage.objects.get(pk=to_news_new_id)
						new_connection = RelatedProject(page_id = to_news_new_id, element = from_project)
						new_connection.save()
						to_news.linked_projects.add(new_connection)

		print("FINISH - Migration successful")