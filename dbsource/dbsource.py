from config.db_config import db_config
from sqlalchemy import or_
## Import all the models

from dbsource.models.base_model import Base, Session, engine
from dbsource.models.country import Country
from dbsource.models.region import Region
from dbsource.models.parameter import Parameter
from dbsource.models.urlmapping import UrlMapping

from dbsource.data_parsing import Parse

class DBsource():
    '''
    This class is to connect with postgres database and do all database related operations
    '''


    @staticmethod
    def get_country_list():
        try:
            session = Session()
            country_list = session.query(Country).all()
            return country_list
        except Exception as e:
            print("error occured in getting country list: ",e)
            return None

    @staticmethod
    def get_regions_list(country_name):
        try:
            session = Session()
            country_id = (session.query(Country).filter(Country.name==country_name).first()).id
            # print("country id is ",country_id)
            region_list = session.query(Region).filter(Region.country==country_id).all()
            # print(region_list)
            return region_list
        except Exception as e:
            print("error occured in getting regions list ",e)
            return None


    @staticmethod
    def get_parameters_list():
        try:
            session = Session()
            parameter_list = session.query(Parameter).all()
            return parameter_list
        except Exception as e:
            print("error occured in getting parameters list")
            return None


    @staticmethod
    def get_url(region_name,parameter_name):
        try:
            session = Session()
            region_id = (session.query(Region).filter(Region.name==region_name).first()).id
            parameter_id = (session.query(Parameter).filter(Parameter.name==parameter_name).first()).id
            url_obj = session.query(UrlMapping).filter(UrlMapping.region_id==region_id,UrlMapping.parameter_id==parameter_id).first()
            return str(url_obj.url)
        except Exception as e:

            print("No data available for this parameter in this region")
            return None

    @staticmethod
    def get_desired_value(country,region,parameter,year,timeline):
        try:
            print("************************")
            print(country,region,parameter,year,timeline)
            url = DBsource.get_url(region,parameter)
            parse_obj = Parse(country,region,parameter,year,timeline,url)
            val = parse_obj.get_value()
            return val
        except Exception as e:
            print("error occurred while getting value: ",e)
            return None

