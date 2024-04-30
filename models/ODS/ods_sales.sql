-- ods_sales.sql

{{ config(materialized='view', schema='ODS') }}

SELECT
    sale_date,
    product_id,
    store_id,
    SUM(total_quantity) AS total_quantity,
    SUM(total_sales) AS total_sales,
    MAX(is_current) AS is_current,
    MIN(valid_from) AS valid_from,
    MAX(valid_to) AS valid_to,
    MAX(last_updated) AS last_updated
FROM (
    SELECT
        sale_id,
        product_id,
        store_id,
        sale_date,
        quantity AS total_quantity,
        total_amount AS total_sales,
        is_current,
        valid_from,
        valid_to,
        last_updated
    FROM {{ ref('stg_sales') }}
) sales_data
GROUP BY sale_date, product_id, store_id
