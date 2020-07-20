
{% load wagtail_modeltranslation %}
{% slugurl_trans 'slug-of-the-page' %} to reverse urls

{% trans %}

single quote, 4 spaces

2 spaces for html

imports go as
1. Python lib imports
2. Django imports
3. Wagtail imports
4. Third-party libs imports
5. Local project impors

`media` and `static` in project root are ignored and used for media and static. Assets are located in `except_wagtail/assets`.

Use `<section class="section"></section>` for blocks of content and if you need the block to be restricted in width use `<article class="container"></article>` right inside the section. Otherwise the section will take all available viewport width.

# Except Wagtail Edition
Migration project of the old Django based website to Wagtail

## Links
- [Wagtail documentation](http://docs.wagtail.io)

## Requirements
- Python 3.7
- mySQL v8.0.12

## How to run the website on your local machine
- Make sure you have your mySQL server running
- Navigate to except_website in your terminal
- Run the following commands:
```
virtualenv env -p python3
source env/bin/activate
cd except
sudo apt-get install zlib1g-dev libjpeg-dev python3-pythonmagick inkscape xvfb poppler-utils libfile-mimeinfo-perl qpdf libimage-exiftool-perl ufraw-batch ffmpeg
sudo apt-get install python-dev python3-dev
sudo apt-get install libmysqlclient-dev
pip3 install -r requirements.txt
```

- Create the database 'except_wagtail'
- Open knowledge/models.py and comment out:
    - The lines 93 to 100 and 158:
```
class ConnectedProject(Orderable):
    page = ParentalKey('ArticlePage', related_name='linked_projects')

    element = models.ForeignKey('projects.ProjectPage', on_delete=models.SET_NULL, null=True, blank=False, verbose_name="Project")

    panels = [
        FieldPanel('element'),
    ]
```
```
InlinePanel('linked_projects', max_num=2, label='Related projects'),
```
- The following lines will add all the (new) models to the database

```
python3 ./manage.py makemigrations about
python3 ./manage.py makemigrations except_wagtail
python3 ./manage.py makemigrations index
python3 ./manage.py makemigrations knowledge
python3 ./manage.py makemigrations news
python3 ./manage.py makemigrations people
python3 ./manage.py makemigrations projects
python3 ./manage.py makemigrations search
python3 ./manage.py migrate
```
- Then uncomment the previous lines
- Run the following commands:
```
python3 ./manage.py makemigrations knowledge
python3 ./manage.py migrate
```
- After migrations start the server, and open `localhost:8000` in your browser
```
python3 ./manage.py runserver
```

- You can reach the admin on `localhost:8000/admin` by creating your own credentials via this command:
```
python manage.py createsuperuser
```
