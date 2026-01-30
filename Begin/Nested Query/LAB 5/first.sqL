CREATE TABLE student_infos (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(59) NOT NULL,
    email VARCHAR(59) UNIQUE NOT NULL,
    age INT CHECK (age >= 16),
    gender CHAR(1) CHECK (gender IN ('M','F')),
    admission_date DATE DEFAULT (CURDATE())
);
SELECT * FROM student_infos;
INSERT INTO student_infos(student_id,student_name,email,age,gender) VALUES('101','Sabin Thapa','sabin@gmail.com',20,'M);

CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL
);


