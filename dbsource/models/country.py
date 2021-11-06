from sqlalchemy import Column, Integer, String

from .base_model import Base

class Country(Base):

    '''

    Mapping class for the country table

    '''

    __tablename__ = 'country'

    id = Column(Integer, primary_key=True)

    name = Column(String)
