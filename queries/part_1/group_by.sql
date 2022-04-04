-- GROUP BY
-- what 'customer_id' is spending the largest amount of money
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

SELECT staff_id, customer_id, SUM(amount)
FROM payment
GROUP BY staff_id, customer_id
ORDER BY staff_id, customer_id;

-- select date from the datetime column and return the amount of money
SELECT DATE(payment_date) as da, SUM(amount)
FROM payment
GROUP BY da

-- we want to give a bonus to the staff member that handled the most payments
SELECT staff_id, COUNT(payment_id)
FROM payment
GROUP BY staff_id;

-- what is the average replacement cost per MPAA rating?
SELECT rating, ROUND(AVG(replacement_cost), 1) as repl_cost
FROM film
GROUP BY rating
ORDER BY repl_cost ASC; 

-- what are the customers ids of the top 5 customers by total spend
SELECT customer_id, SUM(amount) as amount
FROM payment
GROUP BY customer_id
ORDER BY amount DESC
LIMIT 5;


