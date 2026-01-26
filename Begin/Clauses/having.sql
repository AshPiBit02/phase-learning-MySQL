#HAVING clause(used to filter records that are grouped together by the GROUP BY  clause)
-- Syntax: SELECT cloumn1,column2, AGGREGATE_FUNCTION(column3) 
--         FROM table_name
--         GROUP BY column1,column2
--         HAVING aggregate_condition
CREATE TABLE HarvestLog (
    log_id INT PRIMARY KEY,
    farmer_name VARCHAR(50),
    crop_type VARCHAR(30),
    harvest_kg INT,
    region VARCHAR(40),
    harvest_date DATE
);
INSERT INTO HarvestLog 
(log_id, farmer_name, crop_type, harvest_kg, region, harvest_date) 
VALUES
(301, 'Ramesh Adhikari', 'Rice', 1200, 'Lamjung', '2025-11-10'),
(302, 'Sita Bhandari', 'Wheat', 800, 'Baglung', '2025-11-12'),
(303, 'Kiran Shrestha', 'Maize', 2000, 'Gorkha', '2025-11-08'),
(304, 'Maya Gurung', 'Rice', 1500, 'Parbat', '2025-11-15'),
(305, 'Dipesh KC', 'Wheat', 600, 'Tanahun', '2025-11-11'),
(306, 'Ramesh Adhikari', 'Maize', 1800, 'Lamjung', '2025-11-18'),
(307, 'Sita Bhandari', 'Rice', 900, 'Baglung', '2025-11-20');
-- Show total harvest per farmer_name, but only those who harvested more than 2000kg in total
SELECT farmer_name ,SUM(harvest_kg) AS total_harvest FROM harvestlog
GROUP BY farmer_name HAVING SUM(harvest_kg)>2000; 
-- List total harvest per crop_type, but only crops with average harvest above 1000kg
SELECT crop_type,SUM(harvest_kg) AS total_harvest_crop FROM harvestlog
GROUP BY crop_type HAVING AVG(harvest_kg)>1000;
-- Show total harvest per region, but only regions with at least 2 entries
SELECT region,COUNT(*) AS entry_count, SUM(harvest_kg) AS total_harvest FROM harvestlog
GROUP BY region HAVING COUNT(*)>1;
-- Display farmers who harvested Maize, grouped by name and only include thosee with total Maize harvest >1500 kg
SELECT farmer_name,SUM(harvest_kg) AS total_maize_harvested FROM harvestlog WHERE crop_type='Maize'
GROUP BY farmer_name HAVING SUM(harvest_kg)>1500;
-- Show farmers whose average harvest per entry is below 1000kg
SELECT farmer_name,AVG(harvest_kg) AS AVG_harvest FROM harvestlog
GROUP BY farmer_name HAVING AVG(harvest_kg)<1000;
--Show regions where total rice harvest exceeds 2000 kg
SELECT region,SUM(harvest_kg) AS total_rice_harvested FROM harvestlog WHERE crop_type='Rice'
GROUP BY region HAVING SUM(harvest_kg)>1000;
--