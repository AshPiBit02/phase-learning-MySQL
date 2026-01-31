# An INNER JOIN returns recors that have matching values in both tables.
-- Syntax: SELECT columns FROM table_1 INNER JOIN table_2 on table_1.column_name=table_2.column_name;
-- List all books along with their author names.
SELECT b.book_id,b.title,a.author_name FROM books b INNER JOIN
 authors a ON b.author_id=a.author_id;
 -- Show the libraries and the books they currently hold
 SELECT l.library_name,b.title FROM libraries l INNER JOIN library_books lb ON l.library_id=lb.library_id
INNER JOIN books b ON lb.book_id=b.book_id;
-- Find authors and the libraries where their books are availabe.
SELECT a.author_name,b.title,l.library_name FROM authors a INNER JOIN books b ON a.author_id=b.author_id INNER JOIN 
library_books lb ON b.book_id=lb.book_id INNER JOIN libraries l ON lb.library_id=l.library_id;
-- Display all books published after 2022 together with their authors.
SELECT b.title,a.author_name,b.year_published FROM authors a INNER JOIN books b ON
 a.author_id=b.author_id WHERE year_published>2022;
 --Show all libraries that have books written by authors from Nepal
 SELECT l.library_name,a.author_name,b.title FROM authors a INNER JOIN books b ON 
 a.author_id=b.author_id INNER JOIN library_books lb ON b.book_id=lb.book_id
  INNER JOIN libraries l ON lb.library_id=l.library_id WHERE a.country='Nepal';
  -- 