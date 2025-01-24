SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-14'; -- Includes only timestamps upto 14th feb 00:00 Hrs

SELECT DISTINCT amount FROM payment
ORDER BY amount;

SELECT * FROM payment
WHERE customer_id IN(341, 342, 343)
ORDER BY customer_id DESC;

SELECT COUNT(*) FROM payment
WHERE amount NOT IN (0.99, 1.98, 1.99);

SELECT COUNT(*) FROM customer
WHERE first_name LIKE 'j%' AND last_name LIKE 's%';

-- Challenge - 1
SELECT COUNT(*) FROM payment
WHERE amount > 5;

-- Challenge - 2
SELECT COUNT(*) FROM actor
WHERE first_name LIKE 'P%';

-- Challenge - 3
SELECT * FROM address;
SELECT COUNT(DISTINCT(district)) FROM address;

-- Challenge - 4
SELECT * FROM address;
SELECT DISTINCT(district) FROM address;

-- Challenge - 5
SELECT COUNT(*) FROM film
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 AND 15;

-- Challenge - 5
SELECT * FROM film;
SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman&';









