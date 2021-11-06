# Project Setup

## Case1: Docker 
1. Go to Farmsetu folder where dockerfile is located and Build the docker image in your system
         docker build -t getting-started .
2. Run the image by doing volume mapping to the code base in your system
        sudo docker run -it --privileged --net=host -e DISPLAY=unixDISPLAY -v path_of_directory_up_to_Farmsetu_folder/:/home/Farmsetu/ image_name:tag   
3. export the python path
        export PYTHONPATH=/home/Farmsetu/


## Case2: Local Host

1. Create a Python3 virtual environment

2. Install requirement.txt file using
    pip3 install requirements.txt

3. Setup Database

4. export the python path
    export PYTHONPATH=/home/Farmsetu/

# Database setup
## Case1:  If you have postgres in your system
1. Load the farmsetu.sql file in your localhost
      psql -U postgres < /path_to/farmsetu.sql

2. Go to the db_config.py in code base and update the username and password of your postgres
     Farmsetu/config/db_config.py

## Case2:  If you don't have postgres in your system

1. Pull the latest postgres docker image
    docker pull postgres

2. create one folder in Farmsetu folder called db_data where all the postgres data will be stored and volume map that folder while starting the postgres image.
    docker run -P --name pg-docker -e POSTGRES_PASSWORD=docker -v /path_to/Farmsetu/db_data:/var/lib/postgresql/data --net=host postgres


3. Copy the farmsetu.sql file inside this docker container
    sudo docker cp /path_to/farmsetu.sql pg-docker:/

4. Run the postgres container
     docker exec -it pg-docker bash

5. Load the sql file
     psql -U postgres < /path_to/farmsetu.sql

6. go to psql prompt by typing  
     psql -U postgres

7. create a new user 
    CREATE USER ravik WITH PASSWORD ‘ravik#123';

8. Change the owner of db to ravik
    alter database farmsetu owner to ravik;

9. Go to the db_config.py in code base and update the ip as per your docker ip
     Farmsetu/config/db_config.py


# Run the project 
1. After project and db setup go to WeatherReport folder in your project docker and run
    python3 manage.py runserver

2. Open 127.0.0.1:800 in your browser 

3. A simple html page will come. You can use that page to test the UI and REST APIs


# Database APIs testing

1. Go to tests folder in your code base and run test_dbsource module
      python3 test_dbsource.py

2. It will run all the test cases written in that module related to database.


