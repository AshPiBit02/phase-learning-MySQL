-- 1. List all events with their year
SELECT event_name,YEAR(event_date) AS event_year FROM eventschedule;
-- 2. Show events with their month name
SELECT event_name,MONTHNAME(event_date) AS event_month FROM eventschedule;
-- 3. Find events scheduled in February
SELECT event_name FROM eventschedule WHERE MONTHNAME(event_date)='February';
-- 4. Get the day of the month for each event
SELECT event_name,DAYNAME(event_date) AS event_day FROM eventschedule;
-- 5. Show events scheduled on a weekend
SELECT event_name FROM eventschedule WHERE DAYNAME(event_date)='Saturday';
-- 6. Find events scheduled on a weekend using DAYOFWEEK()
SELECT event_name,DAYOFWEEK(event_date) AS dw FROM eventschedule;
-- 7. Get events created in the morning
SELECT event_name FROM eventschedule WHERE HOUR(start_time)<12;
-- 8. Show events that start in the afternoon(12-17)
SELECT event_name FROM eventschedule WHERE HOUR(start_time) BETWEEN 12 AND 17;
-- 9. Find events that end after 8 PM
SELECT event_name FROM eventschedule WHERE HOUR(end_time)>20;
-- 10. Calculate the duration of each event
SELECT event_name,start_time,end_time,TIMEDIFF(end_time,start_time) AS duration FROM eventschedule;
--