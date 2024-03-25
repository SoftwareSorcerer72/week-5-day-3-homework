-- Question 1
SELECT c.first_name, c.last_name, a.address, a.district, a.postal_code 
FROM customer c 
JOIN address a 
ON c.address_id = a.address_id 
WHERE a.district ILIKE 'Texas';


-- Question 2
SELECT C.first_name || ' ' || C.last_name AS full_name, p.amount AS payments_over_threshhold
FROM customer c 
JOIN payment p 
ON c.customer_id = p.customer_id 
WHERE p.amount > 7;



-- Question 3
SELECT full_name, total_payments
FROM (
    SELECT C.first_name || ' ' || C.last_name AS full_name, SUM(p.amount) AS total_payments
    FROM customer c 
    JOIN payment p 
    ON c.customer_id = p.customer_id 
    GROUP BY C.first_name, C.last_name
) subquery
WHERE total_payments > 175;



-- Question 4
SELECT cust.first_name, cust.last_name, cust.district, city.city, country.country 
FROM (
    SELECT c.first_name, c.last_name, a.district, a.city_id 
    FROM customer c 
    JOIN address a 
    ON c.address_id = a.address_id
) AS cust
JOIN city ON cust.city_id = city.city_id 
JOIN country ON city.country_id = country.country_id 
WHERE country.country = 'Argentina';

-- Question 5
SELECT c.name, COUNT(c.category_id) AS movie_categories 
FROM film_category fc 
JOIN category c 
ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY movie_categories  DESC;



-- Question 6
SELECT fa.film_id, f.title, f.description, f.release_year, count(fa.film_id)
FROM film f 
JOIN film_actor fa
ON f.film_id = fa.film_id 
GROUP BY fa.film_id, f.title, f.description, f.release_year 
ORDER BY count(fa.film_id) DESC
LIMIT 1;





-- Question 7
SELECT a.actor_id, a.first_name || ' ' || a.last_name AS full_name, COUNT(*) AS films_stared_in
FROM actor a 
JOIN film_actor fa ON a.actor_id = fa.actor_id 
GROUP BY a.actor_id 
ORDER BY films_stared_in
LIMIT 1;



-- Question 8
SELECT co.country_id, co.country, COUNT(*) AS total_cities
FROM city ci 
JOIN country co 
ON ci.country_id = co.country_id 
GROUP BY co.country_id 
ORDER BY total_cities DESC
LIMIT 1;



-- Question 9
SELECT a.actor_id, a.first_name || ' ' || a.last_name AS full_name, COUNT(fa.actor_id) AS film_appearances
FROM film_actor fa 
JOIN actor a 
ON a.actor_id = fa.actor_id 
GROUP BY a.actor_id 
HAVING COUNT(fa.actor_id) BETWEEN 20 AND 25
ORDER BY count(fa.actor_id) DESC;

