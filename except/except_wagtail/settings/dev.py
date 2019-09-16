from .base import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '!xeg6r95bydqdtdijw9#mgci8e=s-iymdhqb9vc)lyj-ncgd2$'

# SECURITY WARNING: define the correct hosts in production!
ALLOWED_HOSTS = ['*'] 

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

MEDIA_ROOT = '/var/www/html/except.eco/gray-unicorn/except/media'


try:
    from .local import *
except ImportError:
    pass
