from django.conf import settings
from django.contrib import admin
from django.urls import include, path
from drf_spectacular.views import (
    SpectacularJSONAPIView,
    SpectacularRedocView,
    SpectacularSwaggerView,
    SpectacularYAMLAPIView,
)

urlpatterns = [
    path("admin/", admin.site.urls),
]

if settings.DEBUG:
    urlpatterns += [
        path("api-auth/", include("rest_framework.urls")),
        path("api/openapi.json", SpectacularJSONAPIView.as_view(), name="schema-json"),
        path("api/openapi.yaml", SpectacularYAMLAPIView.as_view(), name="schema"),
        path("api/swagger-ui/", SpectacularSwaggerView.as_view(), name="swagger-ui"),
        path("api/redoc/", SpectacularRedocView.as_view(), name="redoc"),
    ]
