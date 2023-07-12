--1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name
FROM customer c 
JOIN address a 
ON c.address_id = a.address_id
WHERE district = 'Texas'

--Answer: 5 people
--Jennifer Davis
--Kim Cruz
--Richard Mccrary
--Bryan	Hardison
--Ian Still


--2. Get all payments above $6.99 with the Customer's Full Name
SELECT CONCAT(first_name, ' ', last_name) AS full_name, amount, payment_id
FROM customer c 
JOIN payment p 
ON c.customer_id = p.customer_id 
WHERE amount > 6.99

--Answer: 
--Peter Menard	7.99	17503
--Peter Menard	7.99	17505
--Peter Menard	7.99	17507
--Douglas Graf	8.99	17517
--Ryan Salisbury	8.99	17529
--etc...

--3. Show all customers names who have made payments over $175(use subqueries)

SELECT first_name,last_name
FROM customer c 
WHERE customer_id IN (
	SELECT customer_id 
	FROM payment p 
	GROUP BY customer_id 
	HAVING SUM(amount) > 175
)
--Asnwer: 6 people
--Rhonda Kennedy
--Clara	Shaw
--Eleanor Hunt
--Marion Snyder
--Tommy	Collazo
--Karl Seal

--4. List all customers that live in Nepal (use the city table)

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM customer c 
JOIN address a 
ON c.address_id = a.address_id 
JOIN city c2 
ON c2.city_id = a.city_id
JOIN country c3 
ON c3.country_id = c2.country_id 
WHERE country = 'Nepal'

--Answer: 1 person - Kevin Schuler

--5. Which staff member had the most transactions?
SELECT CONCAT(first_name,' ',last_name) AS full_name, count(payment_id)
FROM staff s 
JOIN payment p
ON s.staff_id = p.staff_id
GROUP BY full_name

--Answer: Jon Stephens - 7,304

--6. How many movies of each rating are there?
SELECT rating, COUNT(title) AS movies
FROM film f 
GROUP BY rating

--answer: 
--PG- 194
--R	- 195
--NC-17 - 210
--PG-13 - 223
--G - 178


--7.Show all customers who have made a single payment
--above $6.99 (Use Subqueries)
 
SELECT CONCAT(first_name,' ',last_name) AS full_name
FROM customer c 
WHERE customer_id IN (
	SELECT customer_id  
	FROM payment p 
	GROUP BY customer_id, amount
	HAVING amount > 6.99 AND count(*) = 1
)

--Answer: 
--Jared Ely
--Mary Smith
--Patricia Johnson
--Linda Williams
--Barbara Jones
--etc...


--8. How many free rentals did our stores give away?
SELECT count(amount)
FROM rental r
JOIN payment p 
ON p.rental_id = r.rental_id 
WHERE amount = 0

--Answer = 24


