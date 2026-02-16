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
-- 16. Get events created in the same month as today
SELECT event_name FROM eventschedule WHERE MONTH(created_at)=MONTH(CURRENT_DATE());
-- 17. Show events created in the same year as today 
SELECT event_name FROM eventschedule WHERE YEAR(created_at)=YEAR(CURDATE());
-- 18. Find events where start_time is earlier than end_time(valid date check)
SELECT event_name FROM eventschedule WHERE start_time<end_time;
-- 19. Show events grouped by weekday 
SELECT DAYNAME(event_date) AS weekday,COUNT(*) AS total_events 
FROM eventschedule GROUP BY weekday ORDER BY total_events DESC;
-- 20. Show events grouped by hour of start_time 
SELECT HOUR(start_time) AS st_hour_time,COUNT(*) AS total_events
FROM eventschedule GROUP BY st_hour_time ORDER BY total_events;
-- 21. Show events created on the last day of any month 
SELECT event_name,LAST_DAY(created_at) AS last_day_month FROM eventschedule
 WHERE created_at=LAST_DAY(created_at); -- LAST_DAY retuns the last day of month
-- 22. Find events created in the first quarter of the year

SELECT event_name FROM eventschedule WHERE QUARTER(created_at)=1;
-- 23. Show events created on in the second half of the day
SELECT event_name FROM eventschedule WHERE HOUR(created_at)>=12;
-- 24. Find events scheduled in the first week of the year
SELECT event_name FROM eventschedule WHERE WEEK(event_date)=1;
-- 25. Show events scheduled in the last week of the year
SELECT event_name FROM eventschedule WHERE WEEK(event_date)=WEEK(LAST_DAY(event_date));
-- 26. Find events where created_at and event_date are in the same month
SELECT event_name FROM eventschedule WHERE MONTH(created_at)=MONTH(event_date);
-- 27. Show events where the weekday of event_date matches the weekday of created_at
SELECT event_name FROM eventschedule WHERE WEEKDAY(event_date)=WEEKDAY(created_at);
