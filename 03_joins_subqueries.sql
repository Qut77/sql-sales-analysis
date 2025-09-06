SELECT c.customer_id, COUNT(r.rental_id) AS count_rental
FROM customer as c
LEFT JOIN rental as r ON c.customer_id = r.customer_id
GROUP BY 1
ORDER BY 1;

SELECT s.staff_id, COUNT(r.rental_id) AS count_rental
FROM staff as s
LEFT JOIN rental r ON s.staff_id = r.staff_id
GROUP BY 1
ORDER BY 2 DESC;

SELECT f.film_id
FROM film as f
LEFT JOIN inventory as i ON f.film_id = i.film_id
LEFT JOIN rental as r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;






