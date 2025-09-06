SELECT 
    DATE_TRUNC('month', p.payment_date) AS month,
    SUM(p.amount) AS total_revenue
FROM payment p
GROUP BY DATE_TRUNC('month', p.payment_date)
ORDER BY month;

SELECT 
    c.name AS category,
    SUM(p.amount) AS total_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY total_revenue DESC
LIMIT 5;

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 5;

SELECT 
    EXTRACT(YEAR FROM c.create_date) AS year,
    COUNT(c.customer_id) AS new_customers
FROM customer c
GROUP BY EXTRACT(YEAR FROM c.create_date)
ORDER BY year;
