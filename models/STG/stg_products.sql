{{ config(materialized='view', schema='STG') }}

SELECT
    Product_ID,
    Product_Name,
    Category,
    Price,
    Date_Added,
    Date_Modified,
    is_current,
    valid_from,
    valid_to,
    last_updated
FROM {{ source('BusinessOperations', 'Products') }}
