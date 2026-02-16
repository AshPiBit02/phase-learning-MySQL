CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    grade VARCHAR(5),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO students (name, age, grade)
VALUES 
('Ram', 20, 'A'),
('Sita', 19, 'B'),
('Hari', 21, 'A');
SELECT * FROM students;
UPDATE students SET grade='B' WHERE name='Hari';
SELECT * FROM students;
DELETE FROM students WHERE name='Sita';

CREATE TABLE students_log(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    action VARCHAR(20),
    log_time TIMESTAMP DEFAULT NOW()
);
CREATE TRIGGER before_student_delete
BEFORE DELETE ON students
FOR EACH ROW
BEGIN
INSERT INTO students_log(student_id,action)
VALUES(OLD.student_id,'DELETED');
END;
SHOW TRIGGERS LIKE 'students';
DELETE FROM students where grade='C';
