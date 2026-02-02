# RIGHT JOIN (RIGHT OUTER JOIN )
-- returns all records from the right table(the second table),and the matched records from the left
-- table(the first table).
-- If there is no match, the result is NULL on the side of the left table
-- Syntax: SELECT columns FROM table1 RIGHT JOIN table2 table1.column_name=table2.column_name;

-- List all sessions and the speakers assigned to them
SELECT ses.session_title,s.speaker_name FROM sessions ses
RIGHT JOIN speaker_sessions ss ON ses.session_id=ss.session_id
RIGHT JOIN speakers s ON ss.speaker_id=s.speaker_id;
-- List all veneues and the sessions hosted there
SELECT v.venue_name,v.city,ses.session_title FROM venues v 
RIGHT JOIN session_venues sv ON v.venue_id=sv.venue_id
RIGHT JOIN sessions ses ON sv.session_id=ses.session_id;
-- List all sessions and the venues where they are scheduled.
SELECT ses.session_title,v.venue_name FROM sessions ses 
RIGHT JOIN session_venues sv ON ses.session_id=sv.session_id
RIGHT JOIN venues v ON sv.venue_id=v.venue_id;
-- List all sessions and the countries of the speakers presenting them.
SELECT ses.session_title,s.country AS speaker_country FROM sessions ses
RIGHT JOIN speaker_sessions ss ON ses.session_id=ss.session_id
RIGHT JOIN speakers s ON ss.speaker_id=s.speaker_id;
-- List all venues and the speakers presenting there.
SELECT v.venue_name,v.city,s.speaker_name FROM venues v 
RIGHT JOIN session_venues vs ON v.venue_id=vs.venue_id
RIGHT JOIN speaker_sessions ss ON vs.session_id=ss.session_id
RIGHT JOIN speakers s ON ss.speaker_id=s.speaker_id;