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
CREATE TABLE stu_coursee(
    student_id INT,
    course_id INT,
    dept_name VARCHAR(24),
    professor_name VARCHAR(30),
    PRIMARY KEY(student_id,course_id),
    FOREIGN KEY(student_id) REFERENCES stu_id_name(student_id),
    FOREIGN KEY(course_id) REFERENCES course_id_name(course_id)
)

CREATE TABLE stu_id_name(
    student_id INT,
    student_name VARCHAR(40),
    PRIMARY KEY(student_id)
)

CREATE TABLE course_id_name(
    course_id INT,
    course_name VARCHAR(30),
    PRIMARY KEY(course_id)
)

CREATE TABLE stu_id_phone(
    student_id INT,
    phone_number VARCHAR(10),
    FOREIGN KEY(student_id) REFERENCES stu_id_name(student_id)
)

#3NF
CREATE TABLE stu_coursee(
    student_id INT,
    course_id INT,
    PRIMARY KEY(student_id,course_id),
    FOREIGN KEY(student_id) REFERENCES stu_id_name(student_id),
    FOREIGN KEY(course_id) REFERENCES course_id_name(course_id),
    FOREIGN KEY(dept_name) REFERENCES dept_prof(dept_name)
)


CREATE TABLE department( -- helps to acqure multiple professor in single department
    dept_name VARCHAR(30),
    PRIMARY KEY(dept_name)
)
CREATE TABLE professor( -- single department for single professor
    dept_name VARCHAR(30),
    professor_name VARCHAR(30),
    PRIMARY KEY (professor_name),
    FOREIGN KEY(dept_name) REFERENCES department(dept_name)
)

CREATE TABLE stu_id_name(
    student_id INT,
    student_name VARCHAR(40),
    PRIMARY KEY(student_id)
)

CREATE TABLE course_id_name(
    course_id INT,
    course_name VARCHAR(30),
    PRIMARY KEY(course_id)
)

CREATE TABLE stu_id_phone(
    student_id INT,
    phone_number VARCHAR(10),
    FOREIGN KEY(student_id) REFERENCES stu_id_name(student_id)
)
# BCNF
-- the 3NF table is table is already in BCNF as all the determinant are candidite KEY

# 4NF
CREATE TABLE StudentHobby ( -- 3NF table
    student_id INT,
    hobby VARCHAR(30),
    phone_no VARCHAR(10),
    PRIMARY KEY(student_id, hobby,phone_no),
    FOREIGN KEY(student_id) REFERENCES stu_id_name(student_id)
);
CREATE TABLE student_hobby -- 4NF(no multi-valued dependency)
(
    student_id INT,
    hobby VARCHAR(40),
    PRIMARY KEY(student_id,hobby)
)

CREATE TABLE Student_phone(  -- no multi-valued dependency
    student_id INT,
    phone_no VARCHAR(10),
    PRIMARY KEY(student_id,phone_no)
)

# 5NF
CREATE TABLE StudentProjectRole ( -- 4NF table
    student_id INT,
    project_id INT,
    role VARCHAR(30),
    PRIMARY KEY(student_id, project_id, role)
);

-- Which student works on which project
CREATE TABLE StudentProject (
    student_id INT,
    project_id INT,
    PRIMARY KEY(student_id, project_id)
);

-- Which roles a student can take
CREATE TABLE StudentRole (
    student_id INT,
    role VARCHAR(30),
    PRIMARY KEY(student_id, role)
);

-- Which roles are valid for a project
CREATE TABLE ProjectRole (
    project_id INT,
    role VARCHAR(30),
    PRIMARY KEY(project_id, role)
);

