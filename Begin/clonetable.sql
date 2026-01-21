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
