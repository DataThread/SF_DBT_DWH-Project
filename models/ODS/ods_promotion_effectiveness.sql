-- ods_promotion_effectiveness.sql

{{ config(materialized='view', schema='ODS') }}

WITH promotion_sales AS (
    SELECT
        p.promotion_id,
        p.promotion_name,
        p.start_date,
        p.end_date,
        s.sale_id,
        s.sale_date,
        s.total_amount,
        s.is_current,
        s.valid_from,
        s.valid_to,
        s.last_updated
    FROM {{ ref('stg_promotions') }} p
    JOIN {{ ref('stg_sales_promotions') }} sp ON p.promotion_id = sp.promotion_id
    JOIN {{ ref('stg_sales') }} s ON sp.sale_id = s.sale_id
    WHERE s.is_current = TRUE
)
SELECT
    promotion_id,
    promotion_name,
    start_date,
    end_date,
    COUNT(sale_id) AS number_of_sales,
    SUM(total_amount) AS total_sales,
    MAX(is_current) AS is_current,
    MIN(valid_from) AS valid_from,
    MAX(valid_to) AS valid_to,
    MAX(last_updated) AS last_updated
    
FROM promotion_sales
GROUP BY promotion_id, promotion_name, start_date, end_date
