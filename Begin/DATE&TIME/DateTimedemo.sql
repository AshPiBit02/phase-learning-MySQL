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
-- 11. Find the longest duration of each event
SELECT event_name,TIMEDIFF(end_time,start_time) as duration FROM eventschedule ORDER BY duration DESC LIMIT 1;
-- 12. find the shortest duration event 
SELECT event_name,TIMEDIFF(end_time,start_time) as duration FROM eventschedule ORDER BY duration ASC LIMIT 1;
-- 13. Convert event duration into minutes
SELECT event_name,TIME_TO_SEC(TIMEDIFF(end_time,start_time))/60 AS duration_min FROM eventschedule;
-- 14. Show events created in the last 10 days
SELECT event_name,event_date FROM eventschedule WHERE DATEDIFF(CURDATE(),DATE(created_at))<=10;
-- 15. Find events scheduled today using
SELECT event_name FROM eventschedule WHERE event_date=CURDATE();