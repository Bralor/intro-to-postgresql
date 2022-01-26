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


