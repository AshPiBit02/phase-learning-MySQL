CREATE TABLE EMPLOYEE(
    EMP_ID INT(4),
    NAME VARCHAR(20),
    AGE INT(3),
    DOB DATE,
    SALARY DECIMAL(7,2)
);

INSERT INTO EMPLOYEE VALUES (121, 'AJAY KUMAR', 23, '1987-09-12', 23456.32);
INSERT INTO EMPLOYEE VALUES (132, 'BOBBY DEOL', 34, '1989-02-19', 84164.56);
INSERT INTO EMPLOYEE VALUES (246, 'ELVISH SMITH', 27, '1996-01-29', 51876.97);
INSERT INTO EMPLOYEE VALUES (955, 'GEORGE CLARKE', 31, '1992-09-21', 91451.64);
INSERT INTO EMPLOYEE VALUES (729, 'MONICA GELLER', 28, '1985-11-18', 98329.43);
SELECT * FROM employee;
--to create a copy we use AS KEYWORD
CREATE TABLE EMPLOYEE_COPY AS SELECT * FROM EMPLOYEE;
SELECT * FROM employee_copy;
--Create new table to illustrate methods for cloning tables 
--AUTO_INCREMENT automatically generates new number
CREATE TABLE Learner (student_id int NOT NULL AUTO_INCREMENT, name varchar(100) NOT NULL,
roll_no VARCHAR(10) NOT NULL UNIQUE,PRIMARY KEY(student_id));-- we can also initialize the auto_incremet before semicolon as 'AUTO_INCREMENT=101'
ALTER Table learner AUTO_INCREMENT=101; --auto_increment will start from 101
TRUNCATE TABLE learner;
INSERT INTO Learner(name,roll_no) VALUES('Ritwik Dalmia','S100'),('Roshan Singh','S200'),('Mohan Singh','S300');
SELECT * FROM learner;
-- #1 Simple Cloning(simple cloning or copying only copies the tables records and domain not the key definitions( primary key, auto_increment ,etc))
CREATE TABLE LEARNER_COLONE AS SELECT * FROM learner;
SELECT * FROM learner_colone;
--Difference can be seen here
DESC learner;
DESC learner_colone;
-- #2 Shallow Cloning (in this method clone table gets the same structure as well as indices (such as primary key,unique key,auto_increment,etc)
--as the original table preserving constraints but not copies the data )
CREATE TABLE learner_shallow_clone LIKE learner;--doesn't copy the data
DESC learner_shallow_clone;
INSERT INTO learner_shallow_clone SELECT * FROM learner;--inserts all the records of learner into shallow clone
SELECT * FROM learner_shallow_clone;
-- #3  Deep Cloning(inherits all the properties of original table including constraints as well as the existin data)
CREATE TABLE learner_deep_clone LIKE learner;--deep cloning first part
INSERT INTO learner_deep_clone SELECT * FROM learner;--deep cloning second part
SELECT * FROM learner_deep_clone;


