DROP DATABASE IF EXISTS farmsetu;
CREATE DATABASE farmsetu;

\c farmsetu;

CREATE TABLE Country
(
    id SERIAL PRIMARY KEY,
    name varchar(30) UNIQUE
);

CREATE TABLE Region
(
    id SERIAL PRIMARY KEY,
    name varchar(30) UNIQUE,
    country int REFERENCES Country(id)
);

CREATE TYPE Variables AS ENUM ('MaxTemp','MinTemp', 'MeanTemp', 'Sunshine', 'Rainfall','RainDays1mm','AirFrost');

CREATE TABLE Parameter
(
    id SERIAL PRIMARY KEY,
    name Variables
);

CREATE TABLE UrlMapping
(
    id SERIAL PRIMARY KEY,
    region_id int REFERENCES Region(id) NOT NULL,
    parameter_id int REFERENCES Parameter(id) NOT NULL,
    url text NOT NULL
);


INSERT INTO Country(name) VALUES('UK');


INSERT INTO Region(name,country) VALUES('UK',1);
INSERT INTO Region(name,country) VALUES('England',1);
INSERT INTO Region(name,country) VALUES('Wales',1);
INSERT INTO Region(name,country) VALUES('Scotland',1);
INSERT INTO Region(name,country) VALUES('Northern Ireland',1);
INSERT INTO Region(name,country) VALUES('England & Wales',1);
INSERT INTO Region(name,country) VALUES('England N',1);
INSERT INTO Region(name,country) VALUES('England S',1);
INSERT INTO Region(name,country) VALUES('Scotland N',1);
INSERT INTO Region(name,country) VALUES('Scotland E',1);
INSERT INTO Region(name,country) VALUES('Scotland W',1);
INSERT INTO Region(name,country) VALUES('England E & NE',1);
INSERT INTO Region(name,country) VALUES('England NW/Wales N',1);
INSERT INTO Region(name,country) VALUES('Midlands',1);
INSERT INTO Region(name,country) VALUES('East Angila',1);
INSERT INTO Region(name,country) VALUES('England SW/Wales S',1);
INSERT INTO Region(name,country) VALUES('England SE/Central S',1);



INSERT INTO Parameter(name) VALUES('MaxTemp');
INSERT INTO Parameter(name) VALUES('MinTemp');
INSERT INTO Parameter(name) VALUES('MeanTemp');
INSERT INTO Parameter(name) VALUES('Sunshine');
INSERT INTO Parameter(name) VALUES('Rainfall');
INSERT INTO Parameter(name) VALUES('RainDays1mm');
INSERT INTO Parameter(name) VALUES('AirFrost');



INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(1,1,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/UK.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(1,2,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/UK.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(1,3,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/UK.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(1,4,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/UK.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(1,5,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/UK.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(1,6,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Raindays1mm/date/UK.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(1,7,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/AirFrost/date/UK.txt');


INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(2,1,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/England.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(2,2,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/England.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(2,3,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/England.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(2,4,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/England.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(2,5,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/England.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(2,6,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Raindays1mm/date/England.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(2,7,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/AirFrost/date/England.txt');


INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(3,1,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(3,2,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(3,3,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(3,4,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(3,5,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(3,6,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Raindays1mm/date/Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(3,7,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/AirFrost/date/Wales.txt');

INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(4,1,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/Scotland.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(4,2,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/Scotland.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(4,3,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/Scotland.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(4,4,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/Scotland.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(4,5,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/Scotland.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(4,6,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Raindays1mm/date/Scotland.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(4,7,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/AirFrost/date/Scotland.txt');


INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(5,1,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/Northern_Ireland.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(5,2,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/Northern_Ireland.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(5,3,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/Northern_Ireland.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(5,4,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/Northern_Ireland.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(5,5,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/Northern_Ireland.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(5,6,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Raindays1mm/date/Northern_Ireland.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(5,7,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/AirFrost/date/Northern_Ireland.txt');


INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(6,1,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/England_and_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(6,2,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/England_and_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(6,3,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/England_and_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(6,4,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/England_and_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(6,5,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/England_and_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(6,6,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Raindays1mm/date/England_and_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(6,7,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/AirFrost/date/England_and_Wales.txt');


INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(7,1,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/England_N.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(7,2,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/England_N.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(7,3,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/England_N.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(7,4,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/England_N.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(7,5,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/England_N.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(7,6,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Raindays1mm/date/England_N.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(7,7,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/AirFrost/date/England_N.txt');


INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(8,1,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/England_S.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(8,2,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/England_S.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(8,3,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/England_S.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(8,4,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/England_S.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(8,5,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/England_S.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(8,6,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Raindays1mm/date/England_S.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(8,7,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/AirFrost/date/England_S.txt');


INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(9,1,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/Scotland_N.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(9,2,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/Scotland_N.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(9,3,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/Scotland_N.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(9,4,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/Scotland_N.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(9,5,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/Scotland_N.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(9,6,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Raindays1mm/date/Scotland_N.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(9,7,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/AirFrost/date/Scotland_N.txt');


INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(10,1,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/Scotland_E.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(10,2,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/Scotland_E.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(10,3,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/Scotland_E.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(10,4,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/Scotland_E.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(10,5,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/Scotland_E.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(10,6,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Raindays1mm/date/Scotland_E.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(10,7,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/AirFrost/date/Scotland_E.txt');



INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(11,1,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/Scotland_W.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(11,2,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/Scotland_W.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(11,3,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/Scotland_W.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(11,4,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/Scotland_W.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(11,5,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/Scotland_W.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(11,6,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Raindays1mm/date/Scotland_W.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(11,7,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/AirFrost/date/Scotland_W.txt');



INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(12,1,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/England_E_and_NE.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(12,2,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/England_E_and_NE.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(12,3,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/England_E_and_NE.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(12,4,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/England_E_and_NE.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(12,5,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/England_E_and_NE.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(12,6,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Raindays1mm/date/England_E_and_NE.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(12,7,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/AirFrost/date/England_E_and_NE.txt');


INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(13,1,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/England_NW_and_N_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(13,2,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/England_NW_and_N_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(13,3,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/England_NW_and_N_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(13,4,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/England_NW_and_N_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(13,5,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/England_NW_and_N_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(13,6,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Raindays1mm/date/England_NW_and_N_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(13,7,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/AirFrost/date/England_NW_and_N_Wales.txt');


INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(14,1,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/Midlands.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(14,2,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/Midlands.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(14,3,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/Midlands.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(14,4,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/Midlands.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(14,5,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/Midlands.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(14,6,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Raindays1mm/date/Midlands.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(14,7,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/AirFrost/date/Midlands.txt');



INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(15,1,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/East_Anglia.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(15,2,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/East_Anglia.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(15,3,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/East_Anglia.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(15,4,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/East_Anglia.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(15,5,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/East_Anglia.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(15,6,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Raindays1mm/date/East_Anglia.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(15,7,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/AirFrost/date/East_Anglia.txt');



INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(16,1,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/England_SW_and_S_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(16,2,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/England_SW_and_S_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(16,3,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/England_SW_and_S_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(16,4,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/England_SW_and_S_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(16,5,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/England_SW_and_S_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(16,6,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Raindays1mm/date/England_SW_and_S_Wales.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(16,7,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/AirFrost/date/England_SW_and_S_Wales.txt');



INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(17,1,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmax/date/England_SE_and_Central_S.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(17,2,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmin/date/England_SE_and_Central_S.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(17,3,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Tmean/date/England_SE_and_Central_S.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(17,4,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/England_SE_and_Central_S.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(17,5,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Rainfall/date/England_SE_and_Central_S.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(17,6,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Raindays1mm/date/England_SE_and_Central_S.txt');
INSERT INTO UrlMapping(region_id,parameter_id,url) VALUES(17,7,'https://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/AirFrost/date/England_SE_and_Central_S.txt');







