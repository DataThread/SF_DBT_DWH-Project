-- snapshot_sales.sql

{% snapshot snapshot_sales %}

{{ config(
    target_schema='snapshots',
    unique_key='Sale_ID', 
    strategy='timestamp',
    updated_at='last_updated'
) }}

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

{% endsnapshot %}
