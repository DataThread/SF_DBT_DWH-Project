{{ config(materialized='view', schema='STG') }}

SELECT
    Product_ID,
    Store_ID,
    Snapshot_Date,
    Quantity_Available,
    is_current,
    valid_from,
    valid_to,
    last_updated
FROM {{ source('BusinessOperations', 'Inventory_Snapshot') }}
