SELECT c.name AS category, f.title
FROM film AS f
LEFT JOIN film_category AS fc ON f.film_id = fc.film_id
LEFT JOIN category AS c ON fc.category_id = c.category_id
ORDER BY category;

SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;

SELECT *
FROM customer
WHERE last_name LIKE 'S%';