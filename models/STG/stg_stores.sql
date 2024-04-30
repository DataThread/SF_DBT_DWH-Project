{{ config(materialized='view', schema='STG') }}

SELECT
    Store_ID,
    Store_Name,
    Location,
    Manager,
    is_current,
    valid_from,
    valid_to,
    last_updated
FROM {{ source('BusinessOperations', 'Stores') }}
