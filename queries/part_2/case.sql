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

