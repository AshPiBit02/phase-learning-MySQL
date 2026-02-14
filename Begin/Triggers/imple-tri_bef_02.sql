CREATE TABLE quantum_learners (
    learner_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50)
);

CREATE TRIGGER before_quantum_learners_insert
BEFORE INSERT ON quantum_learners
FOR EACH ROW
BEGIN
 IF NEW.age<0 THEN
 SET NEW.age=0;
 END IF;
 END;
INSERT INTO quantum_learners(name,age,course) VALUES('Rak','22','computer science');
INSERT INTO quantum_learners(name,age,course) VALUES('Wak','-5','software engineering');
INSERT INTO quantum_learners(name,age,course) VALUES('Sak','21','computer engineering'),
('Jak',-2,'architecture');
SELECT * FROM quantum_learners;

