from django.db import models

from .managers import CoreManager


class CoreModel(models.Model):
    objects = CoreManager()

    created_at = models.DateTimeField(auto_now=True)
    updated_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        abstract = True
