-- ORDER BY & LIMIT
SELECT customer_id, first_name, last_name FROM customer
ORDER BY customer_id ASC
LIMIT 10;

-- return the 'customer_id' of the first paying customers
SELECT customer_id FROM payment
ORDER BY payment_date ASC
LIMIT 10;

-- what are the titles of the 5 shortest movies
SELECT COUNT(title) FROM film
WHERE length <= 50;

