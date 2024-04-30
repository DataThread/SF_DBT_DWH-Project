{{ config(materialized='view', schema='STG') }}

SELECT
    Time_ID,
    Date,
    Weekday,
    Month,
    Year,
    Is_Holiday,
    is_current,
    valid_from,
    valid_to,
    last_updated
FROM {{ source('BusinessOperations', 'Time') }}
