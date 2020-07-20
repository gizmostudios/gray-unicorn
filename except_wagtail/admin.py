from django.contrib import admin

from .models import PressReference
from .models import Quote


class PressReferenceAdmin(admin.ModelAdmin):
    list_display = ['description', 'source']


class QuoteAdmin(admin.ModelAdmin):
    list_display = ['quote', 'who']

admin.site.register(PressReference, PressReferenceAdmin)
admin.site.register(Quote, QuoteAdmin)
