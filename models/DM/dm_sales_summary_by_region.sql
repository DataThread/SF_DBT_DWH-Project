-- models/DM/dm_sales_summary_by_region.sql
{{ config(materialized='table', schema='DM') }}

SELECT
    Region_Name,
    AVG(Total_Sales) AS Avg_Sales,
    SUM(Number_of_Transactions) AS Total_Transactions
FROM {{ ref('ods_sales_by_region') }}
GROUP BY Region_Name
