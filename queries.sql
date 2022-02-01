-- WHERE clausule
-- Select number of columns that contain value 'R' or 'PG-13'
-- SELECT COUNT(rating) FROM film
-- WHERE rating = 'R'
-- OR rating = 'PG-13';


-- what is the email address for the customer 'Nancy Thomas'?
-- SELECT email FROM customer
-- WHERE first_name = 'Nancy'
-- AND last_name = 'Thomas';

-- return description of the movie 'Outlaw Hanky'
-- SELECT description FROM film
-- WHERE title = 'Outlaw Hanky';

-- return the phone number of the customer who lives at '259 Ipoh Drive'
-- SELECT phone FROM address
-- WHERE address = '259 Ipoh Drive';

-- ORDER BY & LIMIT
-- SELECT customer_id, first_name, last_name FROM customer
-- ORDER BY customer_id ASC
-- LIMIT 10;

-- return the 'customer_id' of the first paying customers
-- SELECT customer_id FROM payment
-- ORDER BY payment_date ASC
-- LIMIT 10;

-- what are the titles of the 5 shortest movies
-- SELECT COUNT(title) FROM film
-- WHERE length <= 50;

-- LIKE & ILIKE
-- return sum of the users thier names begin with 'M' and surnames with 'H'
-- SELECT COUNT(first_name) FROM customer
-- WHERE first_name LIKE 'M%' AND last_name LIKE 'H%';

-- TASKS
-- how many payment trans. were greater than $5.00
-- SELECT COUNT(amount) FROM payment
-- WHERE amount > 5.00;

-- how many actors have a first name that starts with the letter 'P'
-- SELECT COUNT(first_name) FROM actor
-- WHERE first_name LIKE 'P%';

-- how many unique districts are our customers from
-- SELECT COUNT(DISTINCT(district)) FROM address;

-- how many films have rating 'R' and replacements cost between $5-$15?
-- SELECT title, replacement_cost FROM film
-- WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

-- how many films have the word Truman somewhere in the title
-- SELECT COUNT(title) FROM film
-- WHERE title LIKE '%Truman%';

-- MIN/MAX
-- SELECT MAX(film_id) FROM film
-- LIMIT 5;

-- ROUND
-- SELECT ROUND(AVG(replacement_cost), 4)
-- FROM film;

-- GROUP BY
-- what 'customer_id' is spending the largest amount of money
-- SELECT customer_id, SUM(amount)
-- FROM payment
-- GROUP BY customer_id
-- ORDER BY SUM(amount) DESC;

-- SELECT staff_id, customer_id, SUM(amount)
-- FROM payment
-- GROUP BY staff_id, customer_id
-- ORDER BY staff_id, customer_id;

-- select date from the datetime column and return the amount of money
-- SELECT DATE(payment_date) as da, SUM(amount)
-- FROM payment
-- GROUP BY da

-- we want to give a bonus to the staff member that handled the most payments
-- SELECT staff_id, COUNT(payment_id)
-- FROM payment
-- GROUP BY staff_id;

-- what is the average replacement cost per MPAA rating?
-- SELECT rating, ROUND(AVG(replacement_cost), 1) as repl_cost
-- FROM film
-- GROUP BY rating
-- ORDER BY repl_cost ASC; 

-- what are the customers ids of the top 5 customers by total spend
-- SELECT customer_id, SUM(amount) as amount
-- FROM payment
-- GROUP BY customer_id
-- ORDER BY amount DESC
-- LIMIT 5;

-- HAVING
-- what customer ids are eligible for platinum status (have 40 or more payments)
-- SELECT customer_id, COUNT(payment_id)
-- FROM payment
-- GROUP BY customer_id
-- HAVING COUNT(payment_id) >= 40;

-- what are the customers ids of customers who have spent more than $100 with
-- with our staff id 2?
-- SELECT staff_id, customer_id, SUM(amount)
-- FROM payment
-- GROUP BY staff_id, customer_id
-- HAVING staff_id = 2 AND SUM(amount) > 100
-- ORDER BY SUM(amount) DESC;

-- what are the customers ids of customers who have spent more than $110 with
-- with our staff id 2?
-- SELECT staff_id, customer_id, SUM(amount)
-- FROM payment
-- GROUP BY staff_id, customer_id
-- HAVING staff_id = 2 AND SUM(amount) >= 110;

-- how many films begin with the letter "J"?
-- SELECT COUNT(title)
-- FROM film
-- WHERE title LIKE 'J%';

-- what customer has the highest customer ID number whose name starts
-- with an 'E' and has an address ID lower than 500?
-- SELECT customer_id, first_name, address_id
-- FROM customer
-- WHERE first_name LIKE 'E%' AND address_id < 500
-- ORDER BY customer_id DESC
-- LIMIT 1;

-- INNER JOIN .. ON
-- SELECT payment_id, payment.customer_id, first_name
-- FROM payment
-- INNER JOIN customer
-- ON payment.customer_id = customer.customer_id
-- LIMIT 5;

-- FULL OUTER JOIN .. ON
-- SELECT first_name, customer.customer_id, payment_id
-- FROM customer
-- FULL OUTER JOIN payment
-- ON customer.customer_id = payment.customer_id
-- WHERE customer.customer_id IS null
-- OR payment.payment_id IS null;

-- LEFT OUTER JOIN .. ON
-- SELECT film.film_id, film.title, inventory_id, store_id
-- FROM film
-- LEFT OUTER JOIN inventory
-- ON inventory.film_id = film.film_id
-- WHERE inventory.film_id IS null;

-- RIGHT OUTER JOIN .. ON
-- SELECT film.film_id, film.title, inventory_id, store_id
-- FROM inventory
-- RIGHT OUTER JOIN film
-- ON inventory.film_id = film.film_id
-- WHERE inventory.film_id IS null;

-- what are the emails of the customers who live in California
-- SELECT district, email
-- FROM address
-- INNER JOIN customer
-- ON address.address_id = customer.address_id
-- WHERE district = 'California';

-- get a list of all the movies 'Nick Wahlberg' has been in
-- SELECT title, first_name, last_name
-- FROM actor
-- INNER JOIN film_actor
-- ON actor.actor_id = film_actor.actor_id
-- INNER JOIN film
-- ON film_actor.film_id = film.film_id
-- WHERE first_name = 'Nick' AND last_name = 'Wahlberg';

-- SHOW ALL
-- SHOW TIMEZONE

-- SELECT NOW
-- SELECT NOW()

-- timedate as string
-- SELECT TIMEOFDAY()

-- current time
-- SELECT CURRENT_TIME

-- current date
-- SELECT CURRENT_DATE

-- select quarter of the year
-- SELECT
-- 	EXTRACT(QUARTER FROM payment_date) AS my_year
-- FROM payment
-- LIMIT 5;

-- time functions AGE, TO_CHAR
-- SELECT
-- 	AGE(payment_date)
-- FROM payment
-- LIMIT 5;

-- select month/year with TO_CHAR function
-- SELECT
-- 	TO_CHAR(payment_date,'mm/dd/YYYY')
-- FROM payment
-- LIMIT 5;

-- during which mounts did payments occur
-- SELECT
-- 	DISTINCT(TO_CHAR(payment_date, 'MONTH'))
-- FROM payment;

-- how many payments occurred on a Monday?
-- SELECT
-- 	COUNT(*)
-- FROM payment
-- WHERE EXTRACT(dow FROM payment_date) = 1;

-- calculate the rental_r / repl_cost in percents
-- SELECT
-- 	ROUND(rental_rate / replacement_cost, 4) * 100 as percent_cost
-- FROM film;

-- concatenate two string values
-- SELECT
-- 	first_name || ' ' || last_name AS full_name
-- FROM customer;

-- create email address from lowercase fist letter of the name and surname
-- SELECT
-- 	LOWER(SUBSTRING(first_name FOR 1)) || '.' ||  LOWER(last_name) || '@comp.com'
-- FROM customer
-- LIMIT 5;

-- Subqueries
-- SELECT
-- 	title,
-- 	rental_rate
-- FROM film
-- WHERE rental_rate >
-- (
-- 	SELECT
-- 		AVG(rental_rate)
-- 	FROM film
-- );

-- return list of films they were returned 29-5-2005 to 30-5-2005
-- SELECT film_id, title
-- FROM film
-- WHERE film_id IN
-- (
-- 	SELECT inventory.film_id
-- 	FROM rental
-- 	INNER JOIN inventory
-- 	ON inventory.inventory_id = rental.inventory_id
-- 	WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30'
-- )

-- return the name and surname of customers that have payment greater than 11 $
-- SELECT
-- 	first_name,
-- 	last_name
-- FROM customer
-- WHERE EXISTS
-- (
-- 	SELECT *
-- 	FROM payment
-- 	WHERE payment.customer_id = customer.customer_id
-- 	AND amount > 11
-- )

-- SELF-JOIN
-- find all the films that have the same length
SELECT
	f1.title,
	f2.title,
	f1.length
FROM film AS f1
INNER JOIN film AS f2
ON f1.film_id != f2.film_id
AND f1.length = f2.length;




		 
		 
		 
		 
		 