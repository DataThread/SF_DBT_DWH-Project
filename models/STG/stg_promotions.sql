{{ config(materialized='view', schema='STG') }}

SELECT
    Promotion_ID,
    Promotion_Name,
    Start_Date,
    End_Date,
    is_current,
    valid_from,
    valid_to,
    last_updated
FROM {{ source('BusinessOperations', 'Promotions') }}
