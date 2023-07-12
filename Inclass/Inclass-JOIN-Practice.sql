-- find first & last name of all actors in film alice fantasia

-- find the name of all the films in the category: animation




SELECT a.first_name, a.last_name
FROM actor a 
JOIN film_actor fa
ON a.actor_id = fa.actor_id
JOIN film f
ON fa.film_id = f.film_id 
WHERE f.title = 'Alice Fantasia'

SELECT * FROM film
SELECT * FROM film_category fc 

SELECT title
FROM film f
JOIN film_category fc 
ON f.film_id = fc.film_id
JOIN category c 
ON fc.category_id = c.category_id 
WHERE c.name = 'Animation'


--name all customers who live in Clarksville
SELECT first_name, last_name, city
FROM city c
JOIN address a
ON c.city_id = a.city_id
JOIN customer c2
ON c2.address_id = a.address_id 
WHERE city = 'Clarksville'

--How many movies has Tamara Nguyen rented?
SELECT CONCAT(first_name, ' ', last_name) AS full_name, COUNT(rental_id) AS rentals
FROM customer c 
JOIN rental r 
ON r.customer_id = c.customer_id
WHERE first_name = 'Tamara' AND last_name = 'Nguyen'
GROUP BY full_name;


--How many movies Nick Wahlberg star in? 
SELECT COUNT(a.actor_id), CONCAT(first_name, ' ', last_name) AS full_name
FROM actor a
JOIN film_actor fa 
ON a.actor_id = fa.actor_id 
WHERE first_name = 'Nick' AND last_name ='Wahlberg'
GROUP BY 2;

SELECT a.actor_id,fa.film_id, CONCAT(first_name, ' ', last_name) AS full_name
FROM actor a
JOIN film_actor fa 
ON a.actor_id = fa.actor_id
JOIN film f
ON f.film_id = fa.film_id 
WHERE first_name = 'Nick' AND last_name ='Wahlberg'

--what language are movies Judy Gray renting?
SELECT CONCAT(first_name, ' ', last_name) AS full_name, title, "language",rental_id, i.inventory_id
FROM customer c 
JOIN rental r
ON c.customer_id = r.customer_id
JOIN inventory i 
ON i.inventory_id = r.inventory_id
JOIN film f
ON f.film_id = i.film_id 
JOIN "language"
ON f.language_id = "language".language_id 
WHERE first_name = 'Judy' AND last_name = 'Gray';

-- Find all staff that live in Canada
SELECT first_name, last_name, country
FROM staff s 
JOIN address a 
ON s.address_id = a.address_id 
JOIN city c 
ON c.city_id = a.city_id
JOIN country c2 
ON c2.country_id = c.country_id
WHERE country = 'Canada'



