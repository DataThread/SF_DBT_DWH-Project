--- dm_customer_segmentation.sql

{{ config(materialized='view', schema='DM') }}

SELECT

    c.customer_id,
    c.name,
    c.email,
    COUNT(s.sale_id) AS number_of_purchases,
    SUM(s.total_amount) AS total_spent,
    CASE
        WHEN SUM(s.total_amount) > 50000 THEN 'Premium'
        WHEN SUM(s.total_amount) > 10000 THEN 'Gold'
        ELSE 'Silver'
    END AS customer_segment,
    MAX(s.last_updated) AS last_updated
FROM {{ ref('stg_customers') }} c
JOIN {{ ref('stg_sales') }} s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.name, c.email


