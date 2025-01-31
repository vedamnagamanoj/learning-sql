SELECT customer_id,
CASE 
	WHEN (customer_id <= 100)  THEN 'Premium'
	WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus'
	ELSE 'Normal'
END AS customer_class
FROM customer;


SELECT customer_id,
CASE customer_id
	WHEN 100 THEN 'Winner'
	WHEN 500 THEN 'Second Place'
	ELSE 'Normal'
END AS lottery_results
FROM customer;

SELECT * FROM film;


SELECT 
SUM(CASE rental_rate 
	WHEN 0.99 THEN 1
	ELSE 0
END) AS num_bargains
FROM film;

SELECT rental_rate, COUNT(rental_rate) AS num_bargains
FROM film
GROUP BY rental_rate;

SELECT 
SUM(CASE rental_rate 
	WHEN 0.99 THEN 1
	ELSE 0
END) AS bargains,
SUM(CASE rental_rate 
	WHEN 2.99 THEN 1
	ELSE 0
END) AS regular,
SUM(CASE rental_rate 
	WHEN 4.99 THEN 1
	ELSE 0
END) AS premium
FROM film;

SELECT * FROM film;

SELECT
SUM(CASE rating
	WHEN 'R' THEN 1 ELSE 0
END) AS r,
SUM(CASE rating
	WHEN 'PG' THEN 1 ELSE 0
END) AS pg,
SUM(CASE rating
	WHEN 'PG-13' THEN 1 ELSE 0
END) AS pg13
FROM film;

SELECT CAST('5' AS INTEGER) AS new_int;

SELECT '5'::INTEGER;

SELECT * FROM rental;
SELECT DISTINCT(CHAR_LENGTH(CAST(inventory_id AS VARCHAR))) AS casted_id_type FROM rental;

 
CREATE VIEW customer_info AS
SELECT first_name, last_name, address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

SELECT * FROM customer_info;
SELECT * FROM c_info;

CREATE OR REPLACE VIEW customer_info AS 
SELECT first_name, last_name, address, district FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

ALTER VIEW customer_info RENAME TO c_info;

DROP VIEW IF EXISTS c_info;


CREATE TABLE depts(
	first_name VARCHAR(50),
	department VARCHAR(50)
);

INSERT INTO depts(first_name, department)
VALUES
('Lauren', 'A'),
('Vinton', 'A'),
('Claire', 'B');

SELECT * FROM depts;

SELECT (
SUM(CASE department WHEN 'A' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END), 0)
) AS department_ratio
FROM depts;


DELETE FROM depts
WHERE department = 'B';

CREATE VIEW customer_info AS
SELECT first_name, last_name, address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;


-- C:\Users\vedam\Desktop

CREATE TABLE simple(
A INTEGER,
B INTEGER,
C INTEGER
);

SELECT * FROM simple;





























