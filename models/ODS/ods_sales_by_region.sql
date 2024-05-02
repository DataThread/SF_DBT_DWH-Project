-- models/ODS/ods_sales_by_region.sql
{{ config(materialized='table', schema='ODS') }}

SELECT
    r.Region_Name,
    s.Store_ID,
    SUM(s.Total_Amount) AS Total_Sales,
    COUNT(*) AS Number_of_Transactions
FROM {{ ref('stg_sales') }} s
JOIN {{ ref('regions') }} r ON s.Store_ID = r.Region_ID  -- Assuming Store_ID maps to Region_ID for simplicity
GROUP BY r.Region_Name, s.Store_ID
