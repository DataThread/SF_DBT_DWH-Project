-- ods_daily_product_sales.sql

{{ config(materialized='view', schema='ODS') }}

SELECT
    store_id,
    product_id,
    sale_date,
    SUM(quantity) AS total_quantity,
    SUM(total_amount) AS total_sales,
    MAX(is_current) AS is_current,
    MIN(valid_from) AS valid_from,
    MAX(valid_to) AS valid_to,
    MAX(last_updated) AS last_updated
FROM {{ ref('stg_sales') }}
GROUP BY store_id, product_id, sale_date
