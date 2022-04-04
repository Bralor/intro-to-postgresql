-- INNER JOIN .. ON
SELECT payment_id, payment.customer_id, first_name
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
LIMIT 5;

-- FULL OUTER JOIN .. ON
SELECT first_name, customer.customer_id, payment_id
FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null
OR payment.payment_id IS null;

-- LEFT OUTER JOIN .. ON
SELECT film.film_id, film.title, inventory_id, store_id
FROM film
LEFT OUTER JOIN inventory
ON inventory.film_id = film.film_id
WHERE inventory.film_id IS null;

-- RIGHT OUTER JOIN .. ON
SELECT film.film_id, film.title, inventory_id, store_id
FROM inventory
RIGHT OUTER JOIN film
ON inventory.film_id = film.film_id
WHERE inventory.film_id IS null;

-- what are the emails of the customers who live in California
SELECT district, email
FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'California';

-- get a list of all the movies 'Nick Wahlberg' has been in
SELECT title, first_name, last_name
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE first_name = 'Nick' AND last_name = 'Wahlberg';

