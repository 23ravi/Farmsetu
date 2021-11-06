from sqlalchemy import Column, Integer, ForeignKey, Text

from .base_model import Base

class UrlMapping(Base):

    '''

    Mapping class for the urlmapping table

    '''

    __tablename__ = 'urlmapping'

    id = Column(Integer, primary_key=True)

    region_id = Column(Integer, ForeignKey('region.id'))

    parameter_id = Column(Integer, ForeignKey('parameter.id'))

    url = Column(Text)
