import errno
from socket import error as socket_error
from dbsource.urlopener import AppURLopener

opener = AppURLopener()

class Parse():
    def __init__(self,country,region,parameter,year,timeline,url):
        self.country = country
        self.region = region
        self.parameter = parameter
        self.year = year
        self.timeline = timeline
        self.target_url = url

    def remove_empty_space(self,l1:list):
        result = []
        for item in l1:
            if(item!=''):
                result.append(item)
        return result

    def get_index(self,timeline):
        if(timeline=='Jan'):
            return 1
        elif(timeline=='Feb'):
            return 2
        elif(timeline=='Mar'):
            return 3
        elif(timeline=='Apr'):
            return 4
        elif(timeline=='May'):
            return 5
        elif(timeline=='Jun'):
            return 6
        elif(timeline=='Jul'):
            return 7
        elif(timeline=='Aug'):
            return 8
        elif(timeline=='Sept'):
            return 9
        elif(timeline=='Oct'):
            return 10
        elif(timeline=='Nov'):
            return 11
        elif(timeline=='Dec'):
            return 12
        elif(timeline=='Win'):
            return 13
        elif(timeline=='Spr'):
            return 14
        elif(timeline=='Sum'):
            return 15
        elif(timeline=='Aut'):
            return 16
        elif(timeline=='Ann'):
            return 17

    def get_value(self):
        try:
            # print("url is: ",self.target_url)
            response = opener.open(self.target_url)
            file = response.readlines()
            for line in file:
                line = str(line)
                
                a = (line.split(" "))
                target_year = "b'"+str(self.year)
                # print(a[0])
                # print(target_year)
                if(a[0]==target_year):
                    # print(a)
                    new_list = self.remove_empty_space(a)
                    # print(new_list)
                    # Get index of the list to be returned
                    index = self.get_index(self.timeline)
                    # print(index)
                    val =  new_list[index]
                    
                    # if data is not available for any particular timeline
                    if(val=='---'):
                        return "Not available"
                    return val

            return "Invalid year or timeline"
        except socket_error as serr:
            print(serr)
            return "Invalid URL"

        except Exception as e:
            print("errorrrrr")

if __name__ == '__main__':
    target_url = "https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/England.txt"

