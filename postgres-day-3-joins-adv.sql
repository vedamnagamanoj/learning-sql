SELECT * FROM film;

SELECT * FROM actor;

SELECT * FROM actor
WHERE first_name = 'Nick' AND last_name = 'Wahlberg';

SELECT * FROM film_actor;

SELECT * FROM actor
SELECT * FROM film_actor
WHERE actor_id = 2;

SELECT title, first_name, last_name FROM actor
INNER JOIN film_actor;

SELECT title, first_name, last_name FROM actor
INNER JOIN film_actor
ON film_actor.actor_id = actor.actor_id;

SELECT title, first_name, last_name
FROM film_actor
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE first_name = 'Nick'
AND last_name = 'Wahlberg';

SHOW timezone;
SELECT NOW();
SELECT TIMEOFDAY();
SELECT CURRENT_TIME;
SELECT CURRENT_DATE;

SELECT EXTRACT(CENTURY FROM TIMESTAMP '2001-02-16 20:38:40');
SELECT EXTRACT(YEAR FROM TIMESTAMP '2001-02-16 20:38:40') AS my_year;
SELECT EXTRACT(MONTH FROM TIMESTAMP '2001-02-16 20:38:40') AS my_month;

SELECT AGE(payment_date) FROM payment;
SELECT TO_CHAR(payment_date,'month-yyyy') FROM payment;
SELECT TO_CHAR(payment_date,'mon/dd/YYYY') FROM payment;
SELECT TO_CHAR(payment_date,'month yyyy') AS month_year FROM payment;


SELECT AGE(TIMESTAMP '2001-02-16 20:38:40');

-- Challenge

SELECT DISTINCT(TO_CHAR(payment_date, 'Month')) AS payment_months FROM payment;

SELECT COUNT(*)
FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1;

-- Lecture

SELECT ROUND(rental_rate/replacement_cost,2) * 100 as per_cost FROM film;

SELECT LENGTH(first_name) FROM customer;

SELECT UPPER(first_name) ||' '|| last_name AS full_name
FROM customer;

SELECT LOWER(first_name)||'.'||LOWER(last_name)||'@sakilacustomer.org' AS customer_email 
FROM customer;

SELECT LOWER(LEFT(first_name,1))|| LOWER(last_name) || '@email.com' AS customer_email
FROM customer;

SELECT AVG(rental_rate) FROM film;

SELECT title, rental_rate FROM film 
WHERE rental_rate >= (SELECT AVG(rental_rate) FROM film)
ORDER BY rental_rate;

SELECT * FROM rental;
SELECT * FROM inventory;

SELECT film_id, title
FROM film
WHERE film_id IN
(SELECT inventory.film_id FROM rental
INNER JOIN inventory
ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30');

SELECT * FROM payment;

SELECT * 
FROM customer AS c
WHERE EXISTS
(SELECT * FROM payment AS p
WHERE p.customer_id = c.customer_id
AND amount > 11);


SELECT title, length FROM film
WHERE length = 117;

SELECT a.title AS ref_title, b.title AS mat_title, a.length as runtime
FROM film AS a
INNER JOIN film AS b
ON a.film_id != b.film_id AND a.length = b.length;





