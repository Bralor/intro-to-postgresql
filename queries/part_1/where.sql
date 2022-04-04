-- WHERE clausule
-- Select number of columns that contain value 'R' or 'PG-13'
SELECT COUNT(rating) FROM film
WHERE rating = 'R'
OR rating = 'PG-13';

-- what is the email address for the customer 'Nancy Thomas'?
SELECT email FROM customer
WHERE first_name = 'Nancy'
AND last_name = 'Thomas';

-- return description of the movie 'Outlaw Hanky'
SELECT description FROM film
WHERE title = 'Outlaw Hanky';

-- return the phone number of the customer who lives at '259 Ipoh Drive'
SELECT phone FROM address
WHERE address = '259 Ipoh Drive';

