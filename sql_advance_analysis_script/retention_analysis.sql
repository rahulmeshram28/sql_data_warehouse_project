-- Monthly Customer Retention Rate

WITH monthly_customers AS (
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        customer_key
    FROM gold.fact_sales
    GROUP BY month, customer_key
),
retention AS (
    SELECT
        current.month,
        COUNT(DISTINCT current.customer_key) AS current_customers,
        COUNT(DISTINCT previous.customer_key) AS retained_customers
    FROM monthly_customers current
    LEFT JOIN monthly_customers previous
        ON current.customer_key = previous.customer_key
        AND previous.month = current.month - INTERVAL '1 month'
    GROUP BY current.month
)

SELECT
    month,
    current_customers,
    retained_customers,
    ROUND(retained_customers * 100.0 / current_customers, 2) AS retention_rate
FROM retention
ORDER BY month;
