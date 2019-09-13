from .base import *

DEBUG = False

SECRET_KEY = get_env_variable('SECRET_KEY')

try:
    from .local import *
except ImportError:
    pass
