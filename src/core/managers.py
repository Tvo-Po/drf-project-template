from django.db.models.manager import Manager
from django.db.models.query import QuerySet


class CoreQuerySet(QuerySet):
    """QuerySet for all project models"""


class CoreManager(Manager):
    def get_queryset(self) -> CoreQuerySet:
        return CoreQuerySet(self.model, using=self.db)
