-- models/DM/dm_avg_daily_sales_per_store.sql
{{ config(materialized='table', schema='DM') }}

SELECT
    Store_ID,
    AVG(Total_Sales) AS Avg_Daily_Sales
FROM {{ ref('ods_daily_store_sales') }}
GROUP BY Store_ID
