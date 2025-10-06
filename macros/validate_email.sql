{% macro validate_email(column) %}
    case
        when {{ column }} like '%_@_%._%' then {{ column }}
        else null
    end
{% endmacro %}