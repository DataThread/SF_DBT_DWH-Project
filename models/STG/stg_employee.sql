{{ config(materialized='view', schema='STG') }}

SELECT
    Employee_ID,
    First_Name,
    Last_Name,
    Email,
    Department,
    is_current,
    valid_from,
    valid_to,
    last_updated
FROM {{ source('BusinessOperations', 'Employee') }}
