-- dm_product_revenue_growth.sql
{{ config(materialized='view', schema='DM') }}

WITH annual_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        EXTRACT(YEAR FROM s.sale_date) AS year,
        SUM(s.total_amount) AS annual_revenue
    FROM {{ ref('stg_sales') }} s
    JOIN {{ ref('stg_products') }} p ON s.product_id = p.product_id
    GROUP BY p.product_id, p.product_name, EXTRACT(YEAR FROM s.sale_date)
)

, revenue_growth AS (
    SELECT
        a.product_id,
        a.product_name,
        a.year,
        a.annual_revenue AS current_revenue,
        LAG(a.annual_revenue, 1) OVER (PARTITION BY a.product_id ORDER BY a.year) AS previous_revenue
    FROM annual_sales a
)

SELECT
    product_id,
    product_name,
    year,
    current_revenue,
    previous_revenue,
    {{ calculate_growth('current_revenue', 'previous_revenue') }} AS revenue_growth_percentage
FROM revenue_growth
