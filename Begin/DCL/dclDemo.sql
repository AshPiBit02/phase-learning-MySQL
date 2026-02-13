CREATE USER 'student1'@'localhost' IDENTIFIED BY 'pas1';
CREATE USER 'librarian1'@'localhost' IDENTIFIED BY 'pas1';
CREATE USER 'librarian2'@'localhost' IDENTIFIED BY 'pas1';
CREATE USER 'librarian3'@'localhost' IDENTIFIED BY 'pas1';
CREATE USER 'admin1'@'localhost' IDENTIFIED BY 'pas1';
CREATE USER 'superadmin'@'localhost' IDENTIFIED BY 'pas1';
CREATE USER 'guest1'@'localhost' IDENTIFIED BY 'pas1';
CREATE USER 'student2'@'localhost' IDENTIFIED BY 'pas1';
CREATE ROLE readers;
CREATE ROLE editors;
CREATE TABLE LibraryBooks (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    genre VARCHAR(30),
    published_year INT,
    available BOOLEAN
);
INSERT INTO LibraryBooks (title, author, genre, published_year, available) VALUES
('Database Systems', 'Elmasri', 'Education', 2015, TRUE),
('Clean Code', 'Robert Martin', 'Programming', 2008, TRUE),
('The Pragmatic Programmer', 'Andrew Hunt', 'Programming', 1999, TRUE),
('Introduction to Algorithms', 'Cormen', 'Education', 2009, FALSE),
('Artificial Intelligence', 'Russell', 'Education', 2010, TRUE);

-- 1. Grant SELECT privilege on LibraryBooks to user student1.
GRANT SELECT ON LibraryBooks TO 'student1'@'localhost';
-- 2. Grant INSERT privilege on LibraryBooks to user librarian1
GRANT INSERT ON LibraryBooks TO 'librarian1'@'localhost';
-- 3. Grant both UPDATE and DELETE privileges on LibraryBooks to user admin1
GRANT UPDATE,DELETE ON LibraryBooks TO 'admin1'@'localhost';
-- 4. Revoke INSERT privilege from user librarian1.
REVOKE INSERT ON libraryBooks FROM 'librarian1'@'localhost';
-- 5. Revoke DELETE privilege from user admin1.
REVOKE DELETE ON librarybooks FROM 'admin1'@'localhost';
-- 6. GRANT ALL privileges on libraryBooks to user superadmin.
GRANT ALL PRIVILEGES ON libraryBooks TO 'superadmin'@'localhost';
-- 7. Grant SELECT privilege on only the title and author columns of LibraryBooks to user guest1.
GRANT SELECT(title,author) ON libraryBooks TO 'guest1'@'localhost';
-- 8. Revoke UPDATE privilege from user admin1.
REVOKE UPDATE ON libraryBooks FROM 'admin1'@'localhost';
-- 9. Grant SELECT privilege on LibraryBooks to role readers.
GRANT SELECT ON libraryBooks TO 'readers';
-- 10. Grant INSERT and UPDATE privileges on LibraryBooks to role editors.
GRANT INSERT,UPDATE ON librarybooks TO 'editors';
-- 11. Revoke all privileges from user student1.
REVOKE ALL PRIVILEGES ON librarybooks FROM 'student1'@'localhost';