#LEFT JOIN(LEFT OUTER JOIN) returns all records from the left table(the first table), and the matched
-- records from the right table(second table) (if no match, the result is NULL on the side of the right table)
-- Syntax: SELECT columns FROM table1 LEFT JOIN table2 ON tablee1.column_name=table2.column_name;
--  List all authors and their books
SELECT a.author_name,b.title FROM authors a LEFT JOIN books b ON a.author_id=b.author_id;
-- List all authors and the libraries where their books are stored 
SELECT a.author_name,l.library_name FROM authors a LEFT JOIN books b ON a.author_id=b.author_id
INNER JOIN library_books lb ON b.book_id=lb.book_id LEFT JOIN libraries l ON lb.library_id=l.library_id;