from django.contrib.auth.models import AbstractUser
from django.db import models

from core.models import CoreModel

from .managers import CustomUserManager


class CustomUser(CoreModel, AbstractUser):
    username = None
    email = models.EmailField(unique=True)

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS: list[str] = []

    objects = CustomUserManager()
