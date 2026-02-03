CREATE TABLE Authors (
    author_id VARCHAR(5) PRIMARY KEY,
    author_name VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE Books (
    book_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(100),
    author_id VARCHAR(5),
    year_published INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Libraries (
    library_id VARCHAR(5) PRIMARY KEY,
    library_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Library_Books (
    library_id VARCHAR(5),
    book_id VARCHAR(5),
    FOREIGN KEY (library_id) REFERENCES Libraries(library_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Authors (author_id, author_name, country) VALUES
('A1', 'Kiran', 'Nepal'),
('A2', 'Maya', 'India'),
('A3', 'John', 'USA'),
('A4', 'Hana', 'Japan'),
('A5','Sophia','UK');
INSERT INTO Books (book_id, title, author_id, year_published) VALUES
('B101', 'AI Revolution', 'A1', 2023),
('B102', 'Data Dreams', 'A2', 2022),
('B103', 'Cloud Horizons', 'A3', 2024),
('B104', 'Quantum Tales', 'A5', 2025);
INSERT INTO Libraries (library_id, library_name, city) VALUES
('L1', 'Knowledge Hub', 'Pokhara'),
('L2', 'Wisdom House', 'Kathmandu'),
('L3', 'Future Reads', 'Delhi');
INSERT INTO Library_Books (library_id, book_id) VALUES
('L1', 'B101'),
('L1', 'B102'),
('L2', 'B103'),
('L3', 'B104');

CREATE TABLE Speakers (
    speaker_id INT PRIMARY KEY,
    speaker_name VARCHAR(50),
    country VARCHAR(30)
);
CREATE TABLE Sessions (
    session_id INT PRIMARY KEY,
    session_title VARCHAR(100),
    topic VARCHAR(50)
);
 CREATE TABLE Speaker_Sessions (
    speaker_id INT,
    session_id INT,
    FOREIGN KEY (speaker_id) REFERENCES Speakers(speaker_id),
    FOREIGN KEY (session_id) REFERENCES Sessions(session_id)
);
CREATE TABLE Venues (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(50),
    city VARCHAR(30)
);
 CREATE TABLE Session_Venues (
    session_id INT,
    venue_id INT,
    FOREIGN KEY (session_id) REFERENCES Sessions(session_id),
    FOREIGN KEY (venue_id) REFERENCES Venues(venue_id)
);
 INSERT INTO Speakers (speaker_id, speaker_name, country) VALUES
(1, 'Aashish', 'Nepal'),
(2, 'Priya', 'India'),
(3, 'John', 'USA'),
(4, 'Sophia', 'UK'),
(5, 'Carlos', 'Spain'),
(6, 'Mei', 'China');
INSERT INTO Sessions (session_id, session_title, topic) VALUES
(101, 'Future of AI', 'Technology'),
(102, 'Global Trade Trends', 'Economics'),
(103, 'Robotics in Action', 'Engineering'),
(104, 'Cybersecurity 2026', 'Security'),
(105, 'Green Energy', 'Environment'),
(106, 'Quantum Computing', 'Technology');
INSERT INTO Speaker_Sessions (speaker_id, session_id) VALUES
(1, 101),  -- Aashish → Future of AI
(2, 102),  -- Priya → Global Trade Trends
(3, 103),  -- John → Robotics in Action
(4, 104),  -- Sophia → Cybersecurity 2026
(1, 106),  -- Aashish → Quantum Computing
(5, 105);  -- Carlos → Green Energy
 INSERT INTO Venues (venue_id, venue_name, city) VALUES
(201, 'Tech Arena', 'Kathmandu'),
(202, 'Business Hall', 'Delhi'),
(203, 'Innovation Hub', 'London'),
(204, 'Cyber Dome', 'New York'),
(205, 'Eco Center', 'Madrid');
INSERT INTO Session_Venues (session_id, venue_id) VALUES
(101, 201),  -- Future of AI → Kathmandu
(102, 202),  -- Global Trade Trends → Delhi
(103, 203),  -- Robotics in Action → London
(104, 204),  -- Cybersecurity 2026 → New York
(105, 205);  -- Green Energy → 

CREATE DATABASE Agriculture;
USE Agriculture;

CREATE TABLE Farmers (
  farmer_id VARCHAR(5) PRIMARY KEY,
  farmer_name VARCHAR(50),
  crop VARCHAR(50)
);

CREATE TABLE Market_Stalls (
  stall_id VARCHAR(5) PRIMARY KEY,
  stall_name VARCHAR(50),
  farmer_id VARCHAR(5)
);

INSERT INTO Farmers VALUES
('F1','Ram','Rice'),
('F2','Sita','Maize'),
('F3','Hari','Wheat'),
('F4','Gopal',NULL);

INSERT INTO Market_Stalls VALUES
('S1','Green Corner','F1'),
('S2','Fresh Hub','F2'),
('S3','Organic Mart',NULL),
('S4','Agro Point','F5');
CREATE DATABASE LibrarySystem;
USE LibrarySystem;

CREATE TABLE Libraries (
  lib_id VARCHAR(5) PRIMARY KEY,
  library_name VARCHAR(50),
  city VARCHAR(50)
);

CREATE TABLE Book_Donations (
  donation_id VARCHAR(5) PRIMARY KEY,
  donor_name VARCHAR(50),
  lib_id VARCHAR(5)
);

INSERT INTO Libraries VALUES
('L1','City Central','Kathmandu'),
('L2','Knowledge Hub','Pokhara'),
('L3','Wisdom House','Delhi');

INSERT INTO Book_Donations VALUES
('D1','Priya','L1'),
('D2','John','L2'),
('D3','Carlos',NULL),
('D4','Sophia','L4');
CREATE DATABASE MusicFest;
USE MusicFest;

CREATE TABLE Musicians (
  musician_id VARCHAR(5) PRIMARY KEY,
  musician_name VARCHAR(50),
  instrument VARCHAR(50)
);

CREATE TABLE Concerts (
  concert_id VARCHAR(5) PRIMARY KEY,
  concert_name VARCHAR(50),
  musician_id VARCHAR(5)
);

INSERT INTO Musicians VALUES
('M1','Aashish','Guitar'),
('M2','Mei','Violin'),
('M3','Carlos','Drums');

INSERT INTO Concerts VALUES
('C1','Rock Night','M1'),
('C2','Jazz Evening','M2'),
('C3','Folk Festival',NULL),
('C4','Fusion Fiesta','M4');
