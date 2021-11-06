from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('get_regions/', views.get_regions, name='get_regions'),
    path('get_data/', views.get_data, name='get_data'),
]