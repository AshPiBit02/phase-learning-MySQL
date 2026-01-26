# ORDER BY clause is used to sort the result of SELECT query
CREATE TABLE MarketLedger (
    ledger_id INT PRIMARY KEY,
    trader_name VARCHAR(50),
    commodity VARCHAR(40),
    trade_volume INT,
    trade_price DECIMAL(10,2),
    trade_date DATE
);
INSERT INTO MarketLedger 
(ledger_id, trader_name, commodity, trade_volume, trade_price, trade_date) 
VALUES
(201, 'Ramesh Adhikari', 'Rice', 120, 45.50, '2026-01-10'),
(202, 'Sita Bhandari', 'Wheat', 80, 52.00, '2026-01-12'),
(203, 'Kiran Shrestha', 'Maize', 200, 38.75, '2026-01-08'),
(204, 'Maya Gurung', 'Barley', 150, 41.20, '2026-01-15'),
(205, 'Dipesh KC', 'Soybean', 60, 55.00, '2026-01-11');
-- show all traders sorted by trade_price in ascending order
SELECT * FROM marketledger ORDER BY trade_price ASC;
-- list traders sorted by trade_volume in descending order
SELECT * FROM marketledger ORDER BY trade_volume DESC;
-- Display commodities sorted alphabetically by commodity
SELECT * FROM marketledger ORDER BY commodity ASC;
-- Find all traders where trader_volumne > 100, sorted by trade_price;
SELECT * FROM marketledger WHERE trade_volume>100 ORDER BY trade_price ; 
-- show trades sorted first by trade_date(latest first), then by trader_name;
SELECT * FROM marketledger ORDER BY trade_date DESC,trade_price ASC;
-- Display trader names and commodities sorted by trade_price descending, but only for trades after '2026-01-10'
SELECT trader_name,commodity FROM marketledger WHERE trade_date>'2026-01-10' ORDER BY trade_price DESC;
-- show the top 3 traders with the highest trade_volumn(use order by + limit)
SELECT * FROM marketledger ORDER BY trade_volume DESC LIMIT 3;--( LIMIT restricts the output to only the top 3 rows)
