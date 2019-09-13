from .base import *
import os

DEBUG = False

SECRET_KEY = '*d7hN$@<GsVb`y3}|QN"vn5~e2`b5='

try:
    from .local import *
except ImportError:
    pass
