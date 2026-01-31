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
  -- List the titles of books along with the country of their authors.
  SELECT b.title,a.country FROM books b INNER JOIN authors a ON b.author_id=a.author_id;
  -- Find the names of libraries that contain books published in 2025
  SELECT l.library_name FROM libraries l INNER JOIN library_books lb ON l.library_id=lb.library_id
   INNER JOIN books b ON lb.book_id=b.book_id WHERE b.year_published=2025;
   -- Show authors who have at least one book stored in a library.
   SELECT DISTINCT a.author_name FROM authors a INNER JOIN books b ON a.author_id=b.author_id INNER JOIN 
   library_books lb ON b.book_id=lb.book_id INNER JOIN libraries l ON lb.library_id=l.library_id;
   -- Display each book title with its author and the library city where it is available.
   SELECT b.title,a.author_name,l.city FROM authors a INNER JOIN books b ON a.author_id=b.author_id INNER JOIN
   library_books lb ON b.book_id=lb.book_id INNER JOIN libraries l ON lb.library_id=l.library_id;
   -- Find all authors whose books are stored in more than one library.
   SELECT a.author_name FROM authors a INNER JOIN books b ON a.author_id=b.author_id INNER JOIN
   library_books lb ON b.book_id=lb.book_id INNER JOIN libraries l ON lb.library_id=l.library_id
   GROUP BY a.author_name HAVING COUNT(DISTINCT lb.library_id)>1 ;