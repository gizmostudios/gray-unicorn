from .base import *
import os

DEBUG = False

SECRET_KEY = '*d7hN$@<GsVb`y3}|QN"vn5~e2`b5='

STATIC_URL = '/var/www/htmk/except.eco/gray-unicorn/except/static/'

ALLOWED_HOSTS = ['*'] 

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'


try:
    from .local import *
except ImportError:
    pass
