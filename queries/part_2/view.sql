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
