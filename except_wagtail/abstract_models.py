from django.db import models

from wagtail.core.models import Page


class AbstractHero(Page):
    """
    Abstract model for any Page that might need Hero (basically all).

    """
    hero_title = models.CharField(max_length=70, blank=True)
    hero_subtitle = models.CharField(max_length=120, blank=True)
    hero_video = models.FileField(
        max_length=255, upload_to='hero_videos/', blank=True,
    )
    hero_video_poster = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    hero_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    class Meta:
        abstract = True
