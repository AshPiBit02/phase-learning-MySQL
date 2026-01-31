CREATE TABLE student_infos (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(59) NOT NULL,
    email VARCHAR(59) UNIQUE NOT NULL,
    age INT CHECK (age >= 16),
    gender CHAR(1) CHECK (gender IN ('M','F')),
    admission_date DATE DEFAULT (CURDATE())
);
INSERT INTO student_infos(student_id,student_name,email,age,gender) VALUES('101','Sabin Thapa','sabin@gmail.com',20,'M')


CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL
);
INSERT INTO course VALUES (1,'Not Specified'),(2,'Computer'),(3,'Software'),(4,'IT'),(5,'Civil'),(6,'Architecture');
ALTER TABLE student_infos ADD course_id INT DEFAULT 1;
SELECT * FROM student_infos;

ALTER TABLE student_infos ADD CONSTRAINT fk_student_course FOREIGN KEY (course_id) REFERENCES course(course_id);
SELECT NOW();
SELECT TIMEDIFF('10:00:00','08:30:00');
SELECT DATEDIFF('2022-01-01','2020-12-31');
CREATE DATABASE Employee;
USE Employee;
CREATE Table emp_time(Eid VARCHAR(10) PRIMARY KEY,Name VARCHAR(50),)