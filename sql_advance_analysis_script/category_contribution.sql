-- Category Revenue Contribution

WITH category_sales AS (
    SELECT
        p.category,
        SUM(f.sales_amount) AS total_sales
    FROM gold.fact_sales f
    JOIN gold.dim_products p
        ON f.product_key = p.product_key
    GROUP BY p.category
)

SELECT
    category,
    total_sales,
    ROUND(total_sales * 100.0 / SUM(total_sales) OVER (), 2) AS percentage_contribution
FROM category_sales
ORDER BY total_sales DESC;


-- Pareto 80/20 Analysis

WITH customer_revenue AS (
    SELECT
        customer_key,
        SUM(sales_amount) AS revenue
    FROM gold.fact_sales
    GROUP BY customer_key
),
ranked_customers AS (
    SELECT
        customer_key,
        revenue,
        SUM(revenue) OVER (ORDER BY revenue DESC) AS cumulative_revenue,
        SUM(revenue) OVER () AS total_revenue
    FROM customer_revenue
)

SELECT
    customer_key,
    revenue,
    ROUND(cumulative_revenue * 100.0 / total_revenue, 2) AS cumulative_percentage
FROM ranked_customers
ORDER BY revenue DESC;
