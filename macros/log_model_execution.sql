-- macros/log_model_execution.sql

{% macro log_model_execution() %}

INSERT INTO SF_DBT_DWH_DB.DEV.model_execution_logs
(model_name, row_count)
SELECT
    '{{ this.name }}',
    COUNT(*)
FROM {{ this }}

{% endmacro %}
