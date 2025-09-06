WITH customer_payments AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        ci.city,
        SUM(p.amount) AS total_amount
    FROM customer c
    JOIN address a ON c.address_id = a.address_id
    JOIN city ci ON a.city_id = ci.city_id
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name, ci.city
),
ranked_customers AS (
    SELECT 
        customer_id,
        first_name,
        last_name,
        city,
        total_amount,
        RANK() OVER (PARTITION BY city ORDER BY total_amount DESC) AS rnk
    FROM customer_payments
)
SELECT 
    customer_id,
    first_name,
    last_name,
    city,
    total_amount,
	rnk
FROM ranked_customers
WHERE rnk <= 3
ORDER BY city, total_amount DESC;

SELECT 
	DISTINCT
    c.customer_id,
    c.first_name,
    c.last_name,
    MIN(r.rental_date) OVER (PARTITION BY c.customer_id) AS first_rental,
    MAX(r.rental_date) OVER (PARTITION BY c.customer_id) AS last_rental
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
ORDER BY c.customer_id;

SELECT 
    DATE_TRUNC('month', p.payment_date) AS month,
    SUM(p.amount) AS monthly_revenue,
    SUM(SUM(p.amount)) OVER (ORDER BY DATE_TRUNC('month', p.payment_date)) AS cumulative_revenue
FROM payment p
GROUP BY DATE_TRUNC('month', p.payment_date)
ORDER BY month;
