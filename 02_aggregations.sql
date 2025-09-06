SELECT c.name as category, COUNT(f.film_id)
FROM category as c
LEFT JOIN film_category as fc ON c.category_id = fc.category_id
LEFT JOIN film as f ON fc.film_id = f.film_id
GROUP BY c.name;

SELECT title, ROUND(AVG(EXTRACT(day FROM return_date - rental_date)), 2)AS avg_rental_duration
FROM film as f
JOIN inventory as i ON i.film_id = f.film_id
JOIN rental as r ON i.inventory_id = r.inventory_id
GROUP BY title;

SELECT EXTRACT(year from payment_date) AS Year, EXTRACT(month from payment_date) AS Month, SUM(amount) AS total
from payment
GROUP BY 1, 2
ORDER BY 1, 2;



