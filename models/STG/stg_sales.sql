{{ config(materialized='view', schema='STG') }}

SELECT
    Sale_ID,
    Product_ID,
    Customer_ID,
    Store_ID,
    Sale_Date,
    Quantity,
    Total_Amount,
    is_current,
    valid_from,
    valid_to,
    last_updated
FROM {{ source('BusinessOperations', 'Sales') }}
