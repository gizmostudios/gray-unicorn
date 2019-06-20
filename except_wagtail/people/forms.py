from django import forms
from django.utils.translation import ugettext_lazy as _
from wagtail.core.fields import RichTextField
from wagtail.users.forms import UserEditForm, UserCreationForm


class CustomUserEditForm(UserEditForm):
    biography = RichTextField(blank=True)
    introduction = RichTextField(blank=True)
    picture = forms.ImageField(required=True)
    job_title = forms.CharField(required=True)
    phone = forms.CharField(required=False)

class CustomUserCreationForm(UserCreationForm):
    biography = RichTextField(blank=True)
    introduction = RichTextField(blank=True)
    picture = forms.ImageField(required=True)
    job_title = forms.CharField(required=True)
    phone = forms.CharField(required=False)