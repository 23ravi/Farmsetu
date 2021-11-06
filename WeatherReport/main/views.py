from django.shortcuts import render
from sqlalchemy.sql import selectable
from dbsource.dbsource import DBsource
from rest_framework.decorators import api_view
from rest_framework.response import Response
# Create your views here.
from django.http import HttpResponse


def index(request):
    '''
    This function will render the main page and send the required data to be 
    populated on the main page to front end
    '''
    country_list = DBsource.get_country_list()
    parameter_list = DBsource.get_parameters_list()
    timeline_list = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sept','Oct','Nov','Dec','Win','Spr','Sum','Aut','Ann']
    return render(request,'index.html',{'queryset':country_list,'parameter_list':parameter_list,'timeline_list':timeline_list})
    # return HttpResponse("Hello, world. You're at the polls index.")

@api_view(['GET'])
def get_regions(request):
    '''
    This function will get the country name from the front end and 
    return the list of all regions in that country
    '''
    country_name = request.GET['country']
    regions_object_list = DBsource.get_regions_list(country_name)
    regions_list = []
    for region in regions_object_list:
        regions_list.append(region.name)
    return Response(regions_list)



@api_view(['GET','POST'])
def get_data(request):
    '''
    This function will get all the inputs entered in the UI and send back the required response
    '''
    try:
        selected_country = request.POST['country']
        selected_region = request.POST['region']
        selected_parameter = request.POST['parameter']
        selected_year = request.POST['year']
        selected_timeline = request.POST['timeline']

        # Call the DBsource function with all the input value to get the required weather data for the corresponding inputs
        val = DBsource.get_desired_value(selected_country,selected_region,selected_parameter,selected_year,selected_timeline)
        return Response(val)
    except Exception as e:
        return Response("Failed")


