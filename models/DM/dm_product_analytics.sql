--- dm_product_analytics.sql

{{ config(materialized='view', secure=True, schema='DM') }}

SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(s.quantity) AS units_sold,
    SUM(s.total_amount) AS total_revenue,
    AVG(p.price) AS average_price,
    MAX(s.last_updated) AS last_updated
FROM {{ ref('stg_products') }} p
JOIN {{ ref('stg_sales') }} s ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name, p.category
