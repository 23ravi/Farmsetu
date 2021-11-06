from sqlalchemy import Column, Integer, Enum

from .base_model import Base

class Parameter(Base):

    '''

    Mapping class for the parameter table

    '''

    __tablename__ = 'parameter'

    id = Column(Integer, primary_key=True)

    name = Column(Enum('MaxTemp','MinTemp', 'MeanTemp', 'Sunshine', 'Rainfall','RainDays1mm','AirFrost', name="variables", create_type=False))