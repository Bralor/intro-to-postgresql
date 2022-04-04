-- LIKE & ILIKE
-- return sum of the users thier names begin with 'M' and surnames with 'H'
SELECT COUNT(first_name) FROM customer
WHERE first_name LIKE 'M%' AND last_name LIKE 'H%';

