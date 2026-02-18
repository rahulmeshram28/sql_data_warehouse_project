-- Customer Segmentation (VIP / Regular / New)

WITH customer_spending AS (
    SELECT
        c.customer_key,
        SUM(f.sales_amount) AS total_spent
    FROM gold.fact_sales f
    JOIN gold.dim_customers c
        ON f.customer_key = c.customer_key
    GROUP BY c.customer_key
)

SELECT
    customer_key,
    total_spent,
    CASE
        WHEN total_spent > 5000 THEN 'VIP'
        WHEN total_spent BETWEEN 1000 AND 5000 THEN 'Regular'
        ELSE 'New'
    END AS customer_segment
FROM customer_spending
ORDER BY total_spent DESC;
