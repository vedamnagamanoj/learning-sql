SELECT * FROM actor;
select * from film;
SELECT first_name, last_name FROM actor;
select * from city;

-- Challenge - 1
SELECT * FROM customer;
SELECT first_name, last_name, email FROM customer;

SELECT * FROM customer;
SELECT DISTINCT(store_id) FROM customer;
SELECT DISTINCT(rental_duration) FROM film;
SELECT DISTINCT(rental_rate) FROM film;

-- Challenge - 2
SELECT DISTINCT(rating) FROM film;

SELECT COUNT(DISTINCT rating) FROM film;

SELECT COUNT(amount) FROM payment;
SELECT COUNT(*) FROM payment;

SELECT COUNT(DISTINCT(amount)) FROM payment;

SELECT first_name, last_name FROM actor WHERE first_name = 'Johnny' OR last_name = 'Cage'

SELECT * FROM customer
WHERE last_name = 'Smith';

SELECT COUNT(title) FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating = 'R';

-- Challenge - 3
SELECT email FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';

-- Challenge - 4
SELECT description FROM film
WHERE title = 'Outlaw Hanky';

-- Challenge - 5
SELECT * FROM address;
SELECT phone FROM address
WHERE address = '259 Ipoh Drive';

SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id ASC, first_name ASC;


SELECT * FROM customer ORDER BY last_name DESC LIMIT 50;

SELECT * FROM payment
ORDER BY payment_date DESC
LIMIT 5;


-- Challenge - 6
SELECT customer_id
FROM payment
ORDER BY payment_date ASC
LIMIT 10;

-- Challenge - 7
SELECT title, length
FROM film
ORDER BY length ASC
LIMIT 10;

-- Challenge - Bonus
SELECT COUNT(title)
FROM film
WHERE length <= 50;