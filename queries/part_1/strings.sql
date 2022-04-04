-- concatenate two string values
SELECT
    first_name || ' ' || last_name AS full_name
FROM customer;

-- create email address from lowercase fist letter of the name and surname
SELECT
    LOWER(SUBSTRING(first_name FOR 1)) || '.' ||  LOWER(last_name) || '@comp.com'
FROM customer
LIMIT 5;

