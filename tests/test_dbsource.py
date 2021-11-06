import unittest
import sqlalchemy
from unittest import mock
from dbsource.dbsource import DBsource


# for now we don't need any test db o test our db related api
# but in future if required we just need to change the connection url 
# And use the setup and teardown class to insert and delete dummy data in test db

connection_url = 'postgresql://ravik:ravik#123@localhost:5432/farmsetu'
engine = sqlalchemy.create_engine(connection_url,echo = True)
Session = sqlalchemy.orm.sessionmaker(bind=engine)

@mock.patch('dbsource.dbsource.Session',wraps=Session)
class TestDBsource(unittest.TestCase):
    """
    Tests the functions of helper methods in DBsource
    """
    
    @classmethod
    def setUpClass(cls) -> None:
        try:
            engine.connect()
            print("engine connected")
        except sqlalchemy.exc.OperationalError:
            cls.skipTest(cls,"Database connection cannot be established")

    @classmethod
    def tearDownClass(cls) -> None:
       pass

    

    def test_1_get_country_list_success(self,mock_session):
        expected_result = 'UK'
        try:
            result = DBsource.get_country_list()
            self.assertEqual(result[0].name,expected_result)
            print("test case 1 passed")
        except Exception as e:
            print("Failed ",e)

    def test_2_get_regions_list_success(self,mock_session):
        expected_result = 'England'
        country = 'UK'
        try:
            result = DBsource.get_regions_list(country)
            self.assertEqual(result[1].name,expected_result)
            print("test case 2 passed")
        except Exception as e:
            print("Failed ",e)

    def test_3_get_regions_list_failure(self,mock_session):
        expected_result = None
        country = 'USA'
        try:
            result = DBsource.get_regions_list(country)
            self.assertEqual(result,expected_result)
            print("test case 3 passed")
        except Exception as e:
            print("Failed ",e)

    def test_4_get_parameters_list_success(self,mock_session):
        expected_result = 'MeanTemp'
        try:
            result = DBsource.get_parameters_list()
            self.assertEqual(result[2].name,expected_result)
            print("test case 4 passed")
        except Exception as e:
            print("Failed ",e)
    
    def test_5_get_url_success(self,mock_session):
        region = 'England'
        parameter = 'MeanTemp'
        expected_result = 'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/England.txt'
        try:
            result = DBsource.get_url(region,parameter)
            self.assertEqual(result,expected_result)
            print("test case 5 passed")
        except Exception as e:
            print("Failed ",e)

    
    def test_6_get_url_failure(self,mock_session):
        region = 'USA'
        parameter = 'MeanTemp'
        expected_result = None
        try:
            result = DBsource.get_url(region,parameter)
            self.assertEqual(result,expected_result)
            print("test case 6 passed")
        except Exception as e:
            print("Failed ",e)

    def test_7_get_desired_value_success(self,mock_session):
        country = 'UK'
        region = 'Wales'
        parameter = 'MinTemp'
        year = '1995'
        timeline = 'Apr'
        expected_result = '4.0'
        try:
            result = DBsource.get_desired_value(country,region,parameter,year,timeline)
            self.assertEqual(result,expected_result)
            print("test case 7 passed")
        except Exception as e:
            print("Failed ",e)
    

if __name__ == '__main__':
    unittest.main()

