CREATE TABLE StudentCoursesRaw (
    student_id INT,
    student_name VARCHAR(50),
    phone_numbers VARCHAR(100),   -- multiple values in one column
    course_ids VARCHAR(100),      -- multiple courses in one column
    course_names VARCHAR(200),    -- redundant with course_ids
    dept_name VARCHAR(50),        -- department repeated for each course
    professor_name VARCHAR(50),   -- professor depends on dept, not student
    PRIMARY KEY (student_id)
);
INSERT INTO StudentCoursesRaw VALUES
(1, 'Aashish', '9841,9812', 'C101,C102', 'DBMS, OOP', 'Computer Science', 'Dr. Sharma'),
(2, 'Sita', '9803', 'C103', 'Maths', 'Mathematics', 'Dr. Koirala');
SELECT * FROM studentcoursesraw;

#1NF
CREATE TABLE student1NF(
    student_id INT,
    student_name VARCHAR(30),
    phone_numbers VARCHAR(10),
    course_id VARCHAR(23),
    course_name VARCHAR(20),
    dept_name VARCHAR(30),
    professor_name VARCHAR(40)
)

INSERT INTO student1NF VALUES
(1, 'Aashish', '9841', 'C101', 'DBMS', 'Computer Science', 'Dr. Sharma'),
(1, 'Aashish', '9812', 'C102', 'OOP', 'Computer Science', 'Dr. Sharma'),
(2, 'Sita', '9803', 'C103', 'Maths', 'Mathematics', 'Dr. Koirala');
SELECT * FROM student1nf AS 1NF;

#2NF
CREATE TABLE 
