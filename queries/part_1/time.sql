-- SHOW ALL
-- SHOW TIMEZONE

-- SELECT NOW
SELECT NOW()

-- timedate as string
SELECT TIMEOFDAY()

-- current time
SELECT CURRENT_TIME

-- current date
SELECT CURRENT_DATE

-- select quarter of the year
SELECT
    EXTRACT(QUARTER FROM payment_date) AS my_year
FROM payment
LIMIT 5;

-- time functions AGE, TO_CHAR
SELECT
    AGE(payment_date)
FROM payment
LIMIT 5;

-- select month/year with TO_CHAR function
SELECT
    TO_CHAR(payment_date,'mm/dd/YYYY')
FROM payment
LIMIT 5;

-- during which mounts did payments occur
SELECT
    DISTINCT(TO_CHAR(payment_date, 'MONTH'))
FROM payment;

-- how many payments occurred on a Monday?
SELECT
    COUNT(*)
FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1;

-- calculate the rental_r / repl_cost in percents
SELECT
    ROUND(rental_rate / replacement_cost, 4) * 100 as percent_cost
FROM film;

