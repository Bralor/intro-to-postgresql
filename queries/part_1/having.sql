-- HAVING
-- what customer ids are eligible for platinum status (have 40 or more payments)
SELECT customer_id, COUNT(payment_id)
FROM payment
GROUP BY customer_id
HAVING COUNT(payment_id) >= 40;

-- what are the customers ids of customers who have spent more than $100 with
-- with our staff id 2?
SELECT staff_id, customer_id, SUM(amount)
FROM payment
GROUP BY staff_id, customer_id
HAVING staff_id = 2 AND SUM(amount) > 100
ORDER BY SUM(amount) DESC;

-- what are the customers ids of customers who have spent more than $110 with
-- with our staff id 2?
SELECT staff_id, customer_id, SUM(amount)
FROM payment
GROUP BY staff_id, customer_id
HAVING staff_id = 2 AND SUM(amount) >= 110;

-- how many films begin with the letter "J"?
SELECT COUNT(title)
FROM film
WHERE title LIKE 'J%';

-- what customer has the highest customer ID number whose name starts
-- with an 'E' and has an address ID lower than 500?
SELECT customer_id, first_name, address_id
FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;

