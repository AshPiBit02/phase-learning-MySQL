#LEFT JOIN(LEFT OUTER JOIN) returns all records from the left table(the first table), and the matched
-- records from the right table(second table) (if no match, the result is NULL on the side of the right table)
-- Syntax: SELECT columns FROM table1 LEFT JOIN table2 ON tablee1.column_name=table2.column_name;
--  List all authors and their books
SELECT a.author_name,b.title FROM authors a LEFT JOIN books b ON a.author_id=b.author_id;
-- List all authors and the libraries where their books are stored 
SELECT a.author_name,l.library_name FROM authors a LEFT JOIN books b ON a.author_id=b.author_id
INNER JOIN library_books lb ON b.book_id=lb.book_id LEFT JOIN libraries l ON lb.library_id=l.library_id;
-- List all libraries and the books they contain 
SELECT l.library_name,b.title FROM libraries l LEFT JOIN library_books lb ON l.library_id=lb.library_id
LEFT JOIN books b ON lb.book_id=b.book_id;
-- List all books and the cities of the libraries where they are stored 
SELECT b.title,l.city FROM books b LEFT JOIN library_books lb ON b.book_id=lb.book_id
INNER JOIN libraries l ON lb.library_id=l.library_id;

-- List all speakers and the sessions they are assigned to.
SELECT s.speaker_name,sec.session_title FROM speakers s LEFT JOIN speaker_sessions ss 
ON s.speaker_id=ss.speaker_id LEFT JOIN sessions sec ON ss.session_id=sec.session_id;
-- List all sessions and the speakers assigned to them
SELECT sec.session_title,s.speaker_name FROM sessions sec LEFT JOIN speaker_sessions ss ON 
sec.session_id=ss.session_id LEFT JOIN speakers s ON ss.speaker_id=s.speaker_id;
-- List all speakers and the veneues where their session are scheduled.
SELECT s.speaker_name,v.venue_name,v.city FROM speakers s LEFT JOIN speaker_sessions ss ON 
s.speaker_id=ss.speaker_id LEFT JOIN session_venues sv ON ss.session_id=sv.session_id
LEFT JOIN venues v ON sv.venue_id=v.venue_id;
-- List all venues and the sessions hosted there 
SELECT v.venue_name,v.city,ses.session_title FROM venues v LEFT JOIN session_venues sv ON 
v.venue_id=sv.venue_id LEFT JOIN sessions ses ON sv.session_id=ses.session_id;
-- 
