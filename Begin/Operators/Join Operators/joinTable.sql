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
