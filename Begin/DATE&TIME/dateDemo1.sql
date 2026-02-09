-- 1. Fetch all events that happened in September 2023.
SELECT * FROM eventlog WHERE YEAR(event_date) ='2023' AND MONTH(event_date)='9';
-- 2. Find events scheduled after 2023-08-01.
SELECT * FROM eventlog WHERE event_date>'2023-08-01';
-- 3. Get events that were created before their event_date.
SELECT event_name FROM eventlog WHERE created_at<event_date;
-- 4. List all events in Kathmandu during 2023.
SELECT event_name FROM eventlog WHERE city='Kathmandu' AND YEAR(event_date)='2023';
-- 5. Find the earliers event_date.
SELECT event_date FROM eventlog WHERE event_date=(SELECT MIN(event_date) FROM eventlog);
-- 6. Find the latest event_date.
SELECT event_date FROM eventlog WHERE event_date=(SELECT MAX(event_date) FROM eventlog);
-- 7. Get events where created_at is in the morning.
SELECT event_name FROM eventlog WHERE HOUR(created_at)<12;
-- 8. Show events updated in Octorber 2023.
SELECT event_name FROM eventlog WHERE YEAR(updated_at)=2023 AND MONTH(updated_at)=10;
-- 9. Count how many events happend in Pokhara.
SELECT COUNT(event_name) as even_count_pokhara FROM eventlog WHERE city='Pokhara';
-- 10. Show events sorted by event_date DESC.
SELECT event_name FROM eventlog ORDER BY event_date DESC;
-- 11. Get day name of each event.
SELECT event_name,DAYNAME(event_date) as event_day FROM eventlog;
-- 12. Find events created on a weekend.
SELECT event_name,event_date FROM eventlog WHERE DAYNAME(event_date)='Saturday';
-- 13. Show events where event_date and created_at are in the same month.
SELECT event_name,event_date,created_at FROM eventlog WHERE MONTH(event_date)=MONTH(created_at);

