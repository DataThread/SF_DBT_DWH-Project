{{ config(materialized='view', schema='STG') }}

SELECT
    Employee_ID,
    Sale_ID,
    is_current,
    valid_from,
    valid_to,
    last_updated
FROM {{ source('BusinessOperations', 'Employee_Sales') }}
