CREATE TABLE test_01(product_name VARCHAR(20) PRIMARY KEY,quantity INT NOT NULL,price DECIMAL(5,2) NOT NULL);
INSERT INTO test_01 VALUES("Noodles",60,50),("Cookies",30,55),("Chocolates",60,70);
SELECT * FROM test_01;

DELIMITER $$
CREATE PROCEDURE product_extracto(IN input_price DECIMAL(5,2))
BEGIN
SELECT product_name,quantity AS filtered_products FROM test_01 WHERE price>input_price;
END $$
DELIMITER;

CALL product_extracto(50);
