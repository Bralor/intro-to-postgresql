-- TASKS #01
-- how many payment trans. were greater than $5.00
SELECT COUNT(amount) FROM payment
WHERE amount > 5.00;

-- how many actors have a first name that starts with the letter 'P'
SELECT COUNT(first_name) FROM actor
WHERE first_name LIKE 'P%';

-- how many unique districts are our customers from
SELECT COUNT(DISTINCT(district)) FROM address;

-- how many films have rating 'R' and replacements cost between $5-$15?
SELECT title, replacement_cost FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

-- how many films have the word Truman somewhere in the title
SELECT COUNT(title) FROM film
WHERE title LIKE '%Truman%';

