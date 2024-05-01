-- sales_trends.sql

SELECT
    EXTRACT(YEAR FROM sale_date) AS year,
    EXTRACT(MONTH FROM sale_date) AS month,
    SUM(total_amount) AS total_sales
FROM {{ ref('stg_sales') }}
GROUP BY 1, 2
ORDER BY 1, 2;
