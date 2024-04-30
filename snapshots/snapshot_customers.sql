-- snapshot_customers.sql

{% snapshot snapshot_customers %}

{{ config(
    target_schema='snapshots',
    unique_key='Customer_ID', 
    strategy='check',
    check_cols=['Email', 'Address']
) }}

SELECT
    Customer_ID,
    Customer_Code,
    Name,
    Email,
    Address,
    Date_Created,
    Date_Modified,
    Effective_Date,
    Expiry_Date,
    is_current,
    valid_from,
    valid_to,
    last_updated
FROM {{ source('BusinessOperations', 'Customers') }}

{% endsnapshot %}
