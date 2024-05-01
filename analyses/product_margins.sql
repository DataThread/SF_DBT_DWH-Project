-- product_margins.sql

SELECT
    p.product_id,
    p.product_name,
    SUM(s.total_amount) - SUM(p.cost) AS margin
FROM {{ ref('stg_products') }} p
JOIN {{ ref('stg_sales') }} s ON p.product_id = s.product_id
GROUP BY 1, 2;
