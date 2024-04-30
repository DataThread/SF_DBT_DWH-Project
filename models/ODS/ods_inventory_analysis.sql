-- ods_inventory_analysis.sql

{{ config(materialized='view', schema='ODS') }}

SELECT
    product_id,
    store_id,
    snapshot_date,
    AVG(quantity_available) AS average_inventory,
    MAX(quantity_available) AS max_inventory,
    MIN(quantity_available) AS min_inventory,
    MAX(is_current) AS is_current,
    MIN(valid_from) AS valid_from,
    MAX(valid_to) AS valid_to,
    MAX(last_updated) AS last_updated
FROM {{ ref('stg_inventory_snapshot') }}
GROUP BY product_id, store_id, snapshot_date
