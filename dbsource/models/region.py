from sqlalchemy import Column, Integer, String, DateTime, Date, Time, ForeignKey, Text, Numeric

from .base_model import Base

class Region(Base):

    '''

    Mapping class for the region table

    '''

    __tablename__ = 'region'

    id = Column(Integer, primary_key=True)

    name = Column(String)

    country = Column(Integer, ForeignKey('country.id'))
