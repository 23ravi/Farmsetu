from sqlalchemy import create_engine

from sqlalchemy.ext.declarative import declarative_base

from sqlalchemy.orm import sessionmaker

#change the path of cofig file as per your directory path

import sys

sys.path.insert(1, '/home/satya/Documents/VegeeProject_Folder/application')

from config.db_config import db_config

connection_url = 'postgresql://'+db_config['username']+':'+db_config['password']+'@'+db_config['ip']+':'+db_config['port']+'/'+db_config['db_name']

Base = declarative_base()

engine = create_engine(connection_url,echo = True)

Session = sessionmaker(bind=engine)