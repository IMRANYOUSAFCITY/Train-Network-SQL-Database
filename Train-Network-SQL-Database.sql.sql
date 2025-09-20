/*
Student Name: Imran Yousaf
Student Username: addj540
*/

/* SECTION 1 - CREATE TABLE STATEMENTS */
CREATE TABLE addj540_route (
route_name VARCHAR(32) PRIMARY KEY,
route_type VARCHAR(32) NOT NULL,
start_station VARCHAR(32) NOT NULL,
number_of_stops INTEGER(10) NOT NULL,
destination VARCHAR(32) NOT NULL);

CREATE TABLE addj540_trainModel(
train_model VARCHAR(32) PRIMARY KEY,
engine_type VARCHAR(32) NOT NULL,
top_speed INTEGER(10) NOT NULL,
number_of_engine_cars INTEGER(10) NOT NULL,
number_of_cars INTEGER(10) NOT NULL,
seats_per_engine_car INTEGER(10) NOT NULL,
seats_per_car INTEGER(10) NOT NULL,
doors_per_car INTEGER(10) NOT NULL,
first_class BIT(1));

CREATE TABLE addj540_staffDriver(
driver_staff_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(32) NOT NULL,
surname VARCHAR(32) NOT NULL,
age INTEGER(10) NOT NULL,
address VARCHAR(32) NOT NULL,
phone_number CHAR(11) NOT NULL UNIQUE,
email_address VARCHAR(32) NOT NULL UNIQUE,
annual_salary INTEGER(10) NOT NULL,
train_licence_number INTEGER(8) NOT NULL UNIQUE,
personal_track_saftey_certificate BIT(1) NOT NULL);

CREATE TABLE addj540_staffGuard(
guard_staff_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(32) NOT NULL,
surname VARCHAR(32) NOT NULL,
age INTEGER(10) NOT NULL,
address VARCHAR(32) NOT NULL,
phone_number CHAR(11) NOT NULL UNIQUE,
email_address VARCHAR(32) NOT NULL UNIQUE,
annual_salary INTEGER(10) NOT NULL,
first_aid_certificate_number INTEGER(9) NOT NULL UNIQUE,
physical_intervention_certificate BIT(1) NOT NULL);

CREATE TABLE addj540_trainJourney(
start_date DATE,
start_time TIME,
route_name VARCHAR(32),
train_model VARCHAR(32),
passengers_transported INTEGER(10),
driver_staff_ID INTEGER(10),
guard_staff_ID INTEGER(10),
completed BIT(1),
planned_end_time TIME,
actual_end_time TIME,
FOREIGN KEY (route_name) REFERENCES addj540_route (route_name) ON DELETE CASCADE,
FOREIGN KEY (train_model) REFERENCES addj540_trainModel (train_model) ON DELETE CASCADE,
FOREIGN KEY (driver_staff_ID) REFERENCES addj540_staffDriver (driver_staff_ID) ON DELETE CASCADE,
FOREIGN KEY (guard_staff_ID) REFERENCES addj540_staffGuard (guard_staff_ID) ON DELETE CASCADE,
CONSTRAINT journey PRIMARY KEY (start_date, start_time, route_name));

/* SECTION 2 - INSERT STATEMENTS */
INSERT INTO addj540_route VALUES
("Gatwick Express To", "Local", "London Bridge", 3, "Gatwick Airport"),
("Gatwick Express From", "Local", "Gatwick Airport", 3, "London Bridge"),
("Coastal Express To", "Local", "London Victoria",3 , "Brighton"),
("Coastal Express From", "Local", "Brighton", 3, "London Victoria"),
("Gatwick Line To", "Local", "London Bridge", 10, "Gatwick Airport"),
("Gatwick Line From", "Local", "Gatwick Airport", 10, "London Bridge"),
("Coastal Line To", "Local", "London Victoria", 8, "Brighton"),
("Coastal Line From", "Local", "Brighton", 8, "London Victoria"),
("Bedford Line To", "Local", "Brighton", 15, "Bedford"),
("Bedford Line From", "Local", "Bedford", 15, "Brighton");

INSERT INTO addj540_trainModel VALUES
("377", "D-E Hybrid", 160, 2, 6, 15, 30, 6, 0),
("801", "Electric", 210, 2, 8, 20, 35, 4, 1),
("707", "D-E Hybrid", 160, 2, 6, 20, 20, 4, 1),
("444", "Diesel", 160, 2, 6, 25, 25, 4, 1),
("68E", "Diesel", 160, 1, 5, 14, 30, 4, 0),
("HST", "D-E Hybrid", 220, 2, 8, 42, 45, 4, 1),
("221", "Diesel", 200, 2, 3, 25, 30, 4, 0),
("357", "Diesel", 150, 2, 3, 20, 30, 4, 0),
("717", "D-E hybrid", 180, 2, 4, 15, 25, 4, 1),
("350", "Electric", 190, 2, 4, 15, 30, 4, 1);


INSERT INTO addj540_staffDriver (first_name, surname, age, address, phone_number, email_address, annual_salary, train_licence_number, personal_track_saftey_certificate) VALUES
("John", "Smith", 31, "17 Lands Close", "07264130284", "JSo@icloud.com", 32000, 39571395,1),
("Jane", "Bell", 29, "274 Busel Avenue", "07934818873", "bels@icloud.com", 32000, 38264920,1),
("Alex", "Senes", 20, "65 klose Road", "07630594820", "xela@outlook.com", 28000, 084308694,0),
("Bella", "Helsa", 25, "29 Chimnel Way", "07182740909", "hel@outlook.com", 28000, 99938474,0),
("Ande", "Saller", 31, "47 Emmerdale Way", "07835666543", "ASE@icloud.com", 32000, 14637599,1),
("Miller", "Winsdor", 37, "40 Sitch Road", "07990922456", "relli@icloud.com", 32000, 37294738,1),
("Su", "We", 37, "7 Kristia Naldo", "07223388475", "CR9@icloud.com", 32000, 12392911,1),
("James", "Shelby", 28, "20 Blinds Way", "07009322122", "PB@outlook.com", 32000, 88876928,1),
("himls", "Helta", 25, "94 Hoslers Close", "07090932654", "hets@outlook.com", 28000, 29873643,0),
("The", "Goat", 20, "22 Warldcup Avenue", "07878909831", "GOAT@outlook.com", 28000, 98731232,0);

INSERT INTO addj540_staffGuard (first_name, surname, age, address, phone_number, email_address, annual_salary, first_aid_certificate_number, physical_intervention_certificate) VALUES
("Ben", "Swan", 29, "18 Cannaing road", "07842702777", "gams@gmail.com", 30000, 730296554,1),
("Swen", "Glance", 35, "389 Toon Road", "07746359887", "glance@icloud.com", 30000, 037488647,1),
("Mia", "kels", 34, "46 Lammer Way", "07510928090", "slek@outlook.com", 30000, 930726473,1),
("Joey", "Trek", 22, "49 Threeway Avenue", "07534466298", "JK@icloud.com", 28000, 554377682,0),
("Liala", "Losc", 28, "442 Malwas Close", "07663287907", "lis@gmail.com", 30000, 457679843,1),
("Joel", "Tress", 23, "42 Markensore Road", "07738732948", "Jt@icloud.com", 28000, 659874321,0),
("Liala", "Bess", 24, "76 Airtress Avenue", "07098479283", "MR@icloud.com", 28000, 987609864,0),
("Fralice", "Gaia", 24, "49 Comes Avenue", "07093847566", "lalsk@icloud.com", 28000, 123874321,0),
("Hapese", "Kiona", 36, "27 Wallianton Road", "07009988332", "HK@gmail.com", 30000, 093256478,1),
("Peter", "laped", 33, "10 peskerd Close", "07384659181", "Peted@gmail.com", 30000, 874985763,1);

INSERT INTO addj540_trainJourney VALUES
("2022-12-17", "08:00:00", "Gatwick Line From", "717", 183, 4, 1, 1, "09:40:00", "09:43:00"),
("2022-12-17", "08:40:00", "Bedford Line To", "377", 200, 5, 2, 1, "10:00:00", "10:01:00"),
("2022-12-17", "09:20:00", "Bedford Line From", "444", 225, 8, 9, 1, "11:40:00", "11:40:00"),
("2022-12-17", "08:00:00", "Gatwick Line To", "357", 167, 10, 8, 1, "09:30:00", "09:32:00"),
("2022-12-17","10:20:00", "Coastal Express To", "801", 301, 3, 5, 1, "11:50:00", "12:04:00"),
("2022-12-17", "12:10:00", "Coastal Line From", "350", 234, 9, 7, 1, "13:50:00", "13:56:00"),
("2022-12-17", "15:20:00", "Bedford Line To", "350", 265, 7, 6, 1, "17:00:00", "17:00:00"),
("2022-12-17", "18:40:00", "Gatwick Express From", "HST", 356, 6, 3, 1, "19:30:00", "19:34:00"),
("2022-12-17", "20:20:00", "Gatwick Line To", "717", 174, 1, 9, 1, "21:50:00", "21:52:00"),
("2022-12-17", "15:00:00", "Gatwick Express To", "357", 184, 2, 10, 1, "16:40:00", "16:50:00"),
("2022-12-18", "08:40:00", "Bedford Line To", "717", NULL, 9, 6, 1, "11:00:00", NULL),
("2022-12-18", "09:00:00", "Bedford Line From", "707", NULL, 10, 1, 1, "10:40:00", NULL),
("2022-12-18", "10:10:00", "Gatwick Express To", "444", NULL, 6, 4, 1, "11:50:00", NULL),
("2022-12-18", "12:30:00", "Coastal Line To", "68E", NULL, 8, 9, 1, "13:40:00", NULL),
("2022-12-18", "14:50:00", "Bedford Line From", "717", NULL, 2, 3, 1, "17:00:00", NULL),
("2022-12-18", "15:30:00", "Gatwick Line From", "HST", NULL, 4, 1, 1, "16:50:00", NULL),
("2022-12-18", "17:10:00", "Coastal Express To", "350", NULL, 5, 6, 1, "18:40:00", NULL),
("2022-12-18", "19:20:00", "Coastal Line From", "801", NULL, 1, 2, 1, "20:40:00", NULL),
("2022-12-18", "20:40:00", "Gatwick Line To", "707", NULL, 6, 3, 1, "21:50:00", NULL),
("2022-12-18", "22:30:00", "Bedford Line To", "377", NULL, 9, 8, 1, "23:50:00", NULL);


/* SECTION 3 - UPDATE STATEMENTS */
UPDATE addj540_route
SET route_type = "Express"
WHERE route_name LIKE "%Express%";

UPDATE addj540_trainJourney
SET completed = 0
WHERE actual_end_time IS NULL;
/* SECTION 4 - SINGLE TABLE SELECT STATEMENTS */

/* 1) List the information of journeys that take the "Gatwick Line To" route */
SELECT DATE_FORMAT(start_date,"%D %M %Y") AS start_date, start_time, train_model, completed, planned_end_time, actual_end_time FROM addj540_trainJourney WHERE route_name = "Gatwick Line To";

/* 2) List the start/end times and the route name for all the train journeys that have been delayed by more than 5 minutes */
SELECT DATE_FORMAT(start_date,"%D %M %Y") AS start_date, start_time, route_name, planned_end_time, TIMEDIFF(actual_end_time,planned_end_time) AS delay_duration, actual_end_time FROM addj540_trainJourney HAVING delay_duration > "00:05:00"; 

/* 3) List the routes that start at Brighton rail station */
SELECT * FROM addj540_route WHERE start_station = "Brighton"; 

/* 4) Calculate the total number of passengers transported on the 17th December 2022 */
SELECT DATE_FORMAT(start_date,"%D %M %Y") AS start_date, SUM(passengers_transported) AS Total_passengers_transported FROM addj540_trainJourney WHERE start_date = "2022-12-17" GROUP BY start_date;

/* 5) For each train model, show it's top speed, engine type and calculate it's total passenger capacity  */ 
SELECT train_model, engine_type, top_speed, ((seats_per_car * number_of_cars)+(seats_per_engine_car * number_of_engine_cars)) AS total_capacity, first_class FROM addj540_trainModel;

/* 6) List the route names that have had more than 1 completed journey on it so far*/
SELECT route_name, COUNT(route_name) AS number_of_journeys FROM addj540_trainJourney WHERE completed = 1 GROUP BY route_name HAVING COUNT(route_name) > 1;
/* SECTION 5 - MULTIPLE TABLE SELECT STATEMENTS */

/* 1)  List the infomation of all the train journeys that take local routes*/
SELECT DATE_FORMAT(start_date,"%D %M %Y") AS start_date, start_time, T1.route_name, driver_staff_ID, guard_staff_ID, completed, planned_end_time, actual_end_time FROM addj540_trainJourney AS T1 
JOIN addj540_route AS T2 ON T1.route_name = T2.route_name WHERE T2.route_type = "Local"
ORDER BY start_time;

/* 2) Show a schedule for all the staff members that have journeys to do with their full name, date, the route name ,the station they start at and the time they have to be there(start time)*/
SELECT DATE_FORMAT(start_date,"%D %M %Y") AS start_date, start_time, T2.route_name, T4.start_station, CONCAT(T1.first_name," ",T1.surname) AS driver_name, CONCAT(T3.first_name," ",T3.surname) AS guard_name FROM addj540_staffDriver AS T1
JOIN addj540_trainJourney AS T2 ON T1.driver_staff_ID = T2.driver_staff_ID
JOIN addj540_staffGuard AS T3 ON T3.guard_staff_ID = T2.guard_staff_ID
JOIN addj540_route AS T4 ON T2.route_name = T4.route_name
WHERE completed = 0
ORDER BY start_date, start_time;

/* 3) List the journeys for passengers that want to go to brighton station when it is the 18th December 2pm*/
SELECT DATE_FORMAT(start_date,"%D %M %Y") AS start_date, start_time, start_station, T1.route_name, planned_end_time FROM addj540_trainJourney AS T1
JOIN addj540_route AS T2 ON T1.route_name = T2.route_name
WHERE destination = "Brighton" AND start_time > "14:00:00" AND start_date = "2022-12-18";

/* 4) List all of the driver's full names and the total number of stations they have stopped at on the 17th December 2022 */
SELECT DATE_FORMAT(start_date,"%D %M %Y") AS start_date, CONCAT(T3.first_name," ", T3.surname) AS driver_name, SUM(T2.number_of_stops) AS stations_stopped_at FROM addj540_trainJourney AS T1
JOIN addj540_route AS T2 ON T1.route_name = T2.route_name
JOIN addj540_staffDriver AS T3 ON T1.driver_staff_ID = T3.driver_staff_ID
WHERE completed = 1
GROUP BY start_date, driver_name;

/* 5) List the route_names and show the total number of passengers that traveled on them so far*/
SELECT T2.route_name, SUM(passengers_transported) AS passengers_transported FROM addj540_trainJourney AS T1, addj540_route AS T2 WHERE T1.route_name = T2.route_name GROUP BY T2.route_name;

/* 6) List the informations of all the journeys that have transported more passengers than the average on the 17th December 2022*/
       
SELECT DATE_FORMAT(start_date,"%D %M %Y") AS start_date, start_time, route_name, train_model, passengers_transported, driver_staff_ID, guard_staff_ID, completed, planned_end_time, actual_end_time FROM addj540_trainJourney WHERE start_date = "2022-12-17" AND passengers_transported > (SELECT AVG(passengers_transported) FROM addj540_trainJourney WHERE start_date = "2022-12-17");

/* SECTION 6 - DELETE ROWS (make sure the SQL is commented out in this section)

DELETE FROM addj540_trainJourney WHERE start_date = "22-12-18" AND start_time BETWEEN "12:00:00" AND "18:00:00"; 

DELETE FROM addj540_trainModel WHERE train_model = "68E" OR train_model = "357";
*/

/* SECTION 7 - DROP TABLES (make sure the SQL is commented out in this section)
DROP TABLE addj540_trainJourney, addj540_staffGuard, addj540_staffDriver, addj540_trainModel, addj540_route;
*/