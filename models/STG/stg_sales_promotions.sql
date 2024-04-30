{{ config(materialized='view', schema='STG') }}

select sale_id, promotion_id, applied_date
from {{ source("BusinessOperations", "Sales_Promotions") }}
