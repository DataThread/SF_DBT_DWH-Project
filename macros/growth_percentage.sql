{% macro calculate_growth(current, previous) %}
    case
        when {{ previous }} = 0
        then null
        else ({{ current }} - {{ previous }}) / {{ previous }} * 100
    end
{% endmacro %}
