-- Yearly Product Performance

WITH yearly_product_sales AS (
    SELECT
        p.product_name,
        EXTRACT(YEAR FROM f.order_date) AS year,
        SUM(f.sales_amount) AS current_sales
    FROM gold.fact_sales f
    JOIN gold.dim_products p
        ON f.product_key = p.product_key
    GROUP BY p.product_name, year
)

SELECT
    product_name,
    year,
    current_sales,
    LAG(current_sales) OVER (PARTITION BY product_name ORDER BY year) AS previous_year_sales,
    current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY year) AS yoy_difference
FROM yearly_product_sales
ORDER BY product_name, year;
