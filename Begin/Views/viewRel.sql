CREATE DATABASE view;
USE view;
CREATE TABLE Employees (
  emp_id VARCHAR(5) PRIMARY KEY,
  emp_name VARCHAR(50),
  department VARCHAR(30),
  salary INT,
  hire_date DATE
);

INSERT INTO Employees VALUES
('E1','Ram','IT',50000,'2020-01-15'),
('E2','Sita','HR',40000,'2019-03-10'),
('E3','Hari','Finance',60000,'2021-07-01'),
('E4','Gita','IT',55000,'2022-02-20'),
('E5','Mohan','Marketing',45000,'2018-11-05'),
('E6','Rita','Finance',70000,'2020-09-12'),
('E7','Shyam','HR',42000,'2021-12-01'),
('E8','Anita','Marketing',48000,'2022-06-18');

CREATE TABLE Departments (
  dept_id VARCHAR(5) PRIMARY KEY,
  dept_name VARCHAR(30),
  location VARCHAR(30)
);

INSERT INTO Departments VALUES
('D1','IT','Kathmandu'),
('D2','HR','Pokhara'),
('D3','Finance','Biratnagar'),
('D4','Marketing','Chitwan');