-- Monthly & Yearly Revenue Analysis

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY year, month
ORDER BY year, month;


-- Running Total Revenue

SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales_amount) AS monthly_sales,
    SUM(SUM(sales_amount)) OVER (ORDER BY DATE_TRUNC('month', order_date)) AS running_total
FROM gold.fact_sales
GROUP BY month
ORDER BY month;


-- Rolling 3-Month Average

SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales_amount) AS monthly_sales,
    AVG(SUM(sales_amount)) OVER (
        ORDER BY DATE_TRUNC('month', order_date)
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_3_month_avg
FROM gold.fact_sales
GROUP BY month
ORDER BY month;
