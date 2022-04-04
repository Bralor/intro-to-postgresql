-- database 'testme'
-- creating new table w/ demo customers
CREATE TABLE simple(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40) NOT NULL
)

SELECT * FROM simple;

-- inserting 6 PK
INSERT INTO simple(
	customer_id,
	first_name,
	last_name
)
VALUES (
	6,
	'Vladimir',
	'Sladimir'
);