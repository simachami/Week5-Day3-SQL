--outter query
--where primary in(subquery)

--Find all the payments that are larger than average

SELECT *
FROM payment p 

SELECT count(payment_id)
FROM payment p 
WHERE amount > (
	SELECT AVG(amount)
	FROM payment p2 
)


--Find all films in English
SELECT *
FROM "language"
WHERE name = 'English';

SELECT title, language_id 
FROM film
WHERE "language_id" = 1

SELECT title
FROM film
WHERE language_id IN (
	SELECT language_id 
	FROM "language"
	WHERE name = 'English'
	);

-- Find all the films with an actor with last name Allen
SELECT title
FROM film
WHERE film_id IN (
SELECT film_id 
FROM film_actor fa
WHERE actor_id IN 
(SELECT actor_id 
FROM actor
WHERE last_name = 'Allen')
)


SELECT first_name, last_name  
FROM actor a
WHERE last_name = 'Allen'

-- Find all of the payments above staff member 1's avg payment amount
SELECT staff_id, payment_id, amount 
FROM payment p
WHERE amount > (
	SELECT AVG(amount)
	FROM payment p2 
	WHERE staff_id = 1
)


SELECT staff_id, payment_id, amount 
FROM payment p
WHERE amount > (
	SELECT AVG(amount)
	FROM payment p2 
	WHERE staff_id = 1
) AND staff_id =1



