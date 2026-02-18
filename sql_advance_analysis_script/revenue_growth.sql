-- Month-over-Month Revenue Growth

WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        SUM(sales_amount) AS revenue
    FROM gold.fact_sales
    GROUP BY month
)

SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue,
    revenue - LAG(revenue) OVER (ORDER BY month) AS growth_amount,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY month))
        * 100.0 / LAG(revenue) OVER (ORDER BY month),
        2
    ) AS growth_percentage
FROM monthly_sales
ORDER BY month;
