-- models/ODS/ods_daily_store_sales.sql
{{ config(materialized='ephemeral', schema='ODS') }}

SELECT
    Store_ID,
    Sale_Date,
    SUM(Total_Amount) AS Total_Sales,
    COUNT(*) AS Transactions
FROM {{ ref('stg_sales') }}
GROUP BY Store_ID, Sale_Date
