-- Subqueries
SELECT
    title,
    rental_rate
FROM film
WHERE rental_rate >
(
    SELECT
        AVG(rental_rate)
    FROM film
);

-- return list of films they were returned 29-5-2005 to 30-5-2005
SELECT film_id, title
FROM film
WHERE film_id IN
(
    SELECT inventory.film_id
    FROM rental
    INNER JOIN inventory
    ON inventory.inventory_id = rental.inventory_id
    WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30'
)

return the name and surname of customers that have payment greater than 11 $
SELECT
    first_name,
    last_name
FROM customer
WHERE EXISTS
(
    SELECT *
    FROM payment
    WHERE payment.customer_id = customer.customer_id
    AND amount > 11
)

