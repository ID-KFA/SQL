DROP DATABASE IF EXISTS lesson_5;
CREATE DATABASE lesson_5;
USE lesson_5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

CREATE OR REPLACE VIEW cheap_cars
AS
SELECT
`name`, cost
FROM cars
WHERE cost < 25000;


ALTER VIEW cheap_cars
AS 
SELECT
`name`, cost
FROM cars
WHERE cost < 30000;

CREATE OR REPLACE VIEW european_cars
AS
SELECT
`name`, cost
FROM cars
WHERE `name` = "Skoda" OR `name` = "Audi";

DROP TABLE IF EXISTS trains;
CREATE TABLE trains

(
	train_id INT,
    station VARCHAR(45),
    station_time TIME
   
    
);


INSERT trains
VALUES
	(110, "San Francisco","10:00:00"),
    (110, "Redwood City","10:54:00"),
    (110, "Palo Alto","11:02:00"),
	(110, "San Jose","12:35:00"),
	(120, "San Francisco","11:00:00"),
    (120, "Palo Alto","12:49:00"),
	(120, "San Jose","13:30:00");
    
--     SELECT *
-- FROM trains;
    
SELECT
train_id, station, station_time,
    
    TIMEDIFF(LEAD(station_time) OVER(PARTITION BY train_id),station_time) AS `time_to_next_station`
   
   FROM trains;
    
    
