-- Customer Lifetime Value (CLV)

SELECT
    customer_key,
    COUNT(DISTINCT order_number) AS total_orders,
    SUM(sales_amount) AS lifetime_value,
    ROUND(SUM(sales_amount) / COUNT(DISTINCT order_number), 2) AS avg_order_value
FROM gold.fact_sales
GROUP BY customer_key
ORDER BY lifetime_value DESC;
