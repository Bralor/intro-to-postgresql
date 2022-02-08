-- database 'dvd_rental'
-- CASE statements
SELECT customer_id,
CASE
	WHEN (customer_id <= 100) THEN 'Premium'
	WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus'
	ELSE 'Normal'
END AS customer_class
FROM customer;

-- CASE expressions
SELECT customer_id,
CASE customer_id
	WHEN 2 THEN 'Winner'
	WHEN 5 THEN 'Second Place'
	ELSE 'Normal'
END AS raffle_results
FROM customer;

-- calling functions on the results of CASE expressions
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

-- We want to know and compare the various amounts of films we have per movie rating
SELECT
SUM(CASE rating
	WHEN 'R' THEN 1
	ELSE 0
END) as r,
SUM(CASE rating
	WHEN 'PG' THEN 1
	ELSE 0
END) as pg,
SUM(CASE rating
	WHEN 'PG-13' THEN 1
	ELSE 0
END) as pg13
FROM film;

-- COALESCE, NULLIF, CAST
-- selecting value str as integer64
SELECT CAST('5' AS INTEGER);

-- unable to change the type
SELECT CAST('five' AS INTEGER);

-- change the type and return the length of values
SELECT CHAR_LENGTH(CAST(user_id AS VARCHAR)) FROM account_job;

-- NULLIF example
-- creating a new table
CREATE TABLE depts(
	first_name VARCHAR(50),
	department VARCHAR(50)
);

-- inserting values into the table
INSERT INTO depts(
	first_name,
	department
)
VALUES (
	'Vinton',
	'A'
),
('Lauren', 'A'),
('Claire', 'B');

SELECT * FROM depts;

-- counting the departments ratio
SELECT (
	SUM(
		CASE WHEN department = 'A' THEN 1
		ELSE 0
	   	END
	) / NULLIF(
	SUM(
		CASE WHEN department = 'B' THEN 1
		ELSE 0
		END
	), 0)
	) AS department_ratio
FROM depts;

DELETE FROM depts
WHERE department = 'B';

-- database 'dvd_rental'
-- creating VIEW
CREATE VIEW customer_info AS
SELECT
	first_name,
	last_name,
	address
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

SELECT * FROM customer_info;

-- update the view with another column
CREATE OR REPLACE VIEW customer_info AS
SELECT
	first_name,
	last_name,
	address,
	district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

DROP VIEW IF EXISTS customer_info;

-- change the name of the view
ALTER VIEW customer_info RENAME TO c_info;

--

SELECT * FROM c_info;