--- dm_monthly_sales_performance.sql
{{ config(
    materialized='incremental',
    schema='DM',
    unique_key='month_year',
    incremental_strategy='delete+insert'
) }}

SELECT
    TO_CHAR(s.sale_date, 'YYYY-MM') AS month_year,
    SUM(s.quantity) AS total_quantity,
    SUM(s.total_amount) AS total_sales,
    COUNT(DISTINCT s.store_id) AS number_of_stores,
    MAX(s.last_updated) AS last_updated
FROM {{ ref('stg_sales') }} s
GROUP BY TO_CHAR(s.sale_date, 'YYYY-MM')

{% if is_incremental() %}
    -- This filter will only apply in incremental runs
    WHERE s.sale_date >= (SELECT MAX(sale_date) FROM {{ this }})
{% endif %}



