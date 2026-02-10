-- 1. Fetch all activities that start before 06:00:00
SELECT activity FROM dailyroutine WHERE HOUR(start_time)<6;
-- 2. Find activities that end after 20:00:00.
SELECT activity FROM dailyroutine WHERE HOUR(end_time)>20;
-- 3. Show activities that happen entirely in the morning 
SELECT activity FROM dailyroutine WHERE HOUR(start_time)<12 AND HOUR(end_time)<12;
-- 4. List activities that overlap with lunch break;
SELECT activity
FROM DailyRoutine
WHERE start_time >= (SELECT start_time FROM DailyRoutine WHERE activity = 'Lunch Break')
  AND end_time   <= (SELECT end_time   FROM DailyRoutine WHERE activity = 'Lunch Break');
-- 5. Find the longest duriation activity 
SELECT activity,TIMEDIFF(end_time,start_time) 
AS Duration FROM dailyroutine ORDER BY Duration DESC LIMIT 1; 

-- 6. Find the shortes duriation activity 
SELECT activity,TIMEDIFF(end_time,start_time) 
AS Duration FROM dailyroutine ORDER BY Duration ASC LIMIT 1; 
-- 7. Show activites that start in the afternoon(12:00 to 21:00)
SELECT activity FROM dailyroutine WHERE HOUR(start_time) BETWEEN 12 AND 21; 
-- 8. Find activities time diff is more than 2 hours.
SELECT activity FROM dailyroutine WHERE HOUR(TIMEDIFF(end_time,start_time))>2;
-- 9. Show activities that start at the same time in differenct cities.
SELECT start_time, GROUP_CONCAT(activity,'(',city,')') AS activities,
COUNT(DISTINCT city) AS city_count FROM dailyroutine GROUP BY start_time HAVING city_count>1;
-- 10. Find activities that end exactly at 23:00:00
SELECT activity FROM dailyroutine WHERE end_time='23:00:00';
-- 11. Show activites with start_time later than their end_time( to test invalid data)
SELECT activity,start_time,end_time,TIMEDIFF(end_time,start_time) AS pos_valid_neg_invalid FROM dailyroutine;