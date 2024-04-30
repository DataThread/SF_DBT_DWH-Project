-- ods_employee_sales_performance.sql

{{ config(materialized='view', schema='ODS') }}

WITH employee_sales AS (
    SELECT
        e.employee_id,
        e.first_name,
        e.last_name,
        s.sale_id,
        s.sale_date,
        s.total_amount,
        s.is_current,
        s.valid_from,
        s.valid_to,
        s.last_updated
    FROM {{ ref('stg_employee_sales') }} es
    JOIN {{ ref('stg_employee') }} e ON es.employee_id = e.employee_id
    JOIN {{ ref('stg_sales') }} s ON es.sale_id = s.sale_id
)
SELECT
    employee_id,
    first_name,
    last_name,
    COUNT(sale_id) AS number_of_sales,
    SUM(total_amount) AS total_sales,
    MIN(sale_date) AS first_sale_date,
    MAX(sale_date) AS last_sale_date,
    MAX(is_current) AS is_current,
    MIN(valid_from) AS valid_from,
    MAX(valid_to) AS valid_to,
    MAX(last_updated) AS last_updated
FROM employee_sales
GROUP BY employee_id, first_name, last_name
