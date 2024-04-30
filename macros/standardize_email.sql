{% macro standardize_email(email) %} lower(trim({{ email }})) {% endmacro %}
