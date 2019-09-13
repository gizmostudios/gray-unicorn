
"""
WSGI config for except_wagtail project.
It exposes the WSGI callable as a module-level variable named ``application``.
For more information on this file, see
https://docs.djangoproject.com/en/2.0/howto/deployment/wsgi/
"""

import os
import sys

from django.core.wsgi import get_wsgi_application


sys.path.append('/var/www/html/except.eco/gray-unicorn/except')
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "except_wagtail.settings.production")

application = get_wsgi_application()