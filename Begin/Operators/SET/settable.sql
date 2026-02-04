CREATE DATABASE TourismDB;
USE TourismDB;

CREATE TABLE Local_Tourism (
  tour_id VARCHAR(5) PRIMARY KEY,
  destination VARCHAR(50),
  category VARCHAR(30),
  visitors INT
);

INSERT INTO Local_Tourism VALUES
('L1','Pokhara','Lake',12000),
('L2','Chitwan','Wildlife',8000),
('L3','Lumbini','Heritage',15000),
('L4','Mustang','Mountain',5000),
('L5','Kathmandu Durbar','Heritage',20000),
('L6','Rara Lake','Lake',4000),
('L7','Janakpur','Pilgrimage',7000),
('L8','Ilam','Tea Garden',6000);
 CREATE TABLE International_Tourism (
  tour_id VARCHAR(5) PRIMARY KEY,
  destination VARCHAR(50),
  category VARCHAR(30),
  visitors INT
);

INSERT INTO International_Tourism VALUES
('I1','Paris','Heritage',50000),
('I2','London','Heritage',45000),
('I3','Pokhara','Lake',12000),   -- overlap with Local
('I4','Dubai','Modern',60000),
('I5','Singapore','Modern',55000),
('I6','Chitwan','Wildlife',8000), -- overlap with Local
('I7','New York','Modern',65000),
('I8','Sydney','Harbor',40000);