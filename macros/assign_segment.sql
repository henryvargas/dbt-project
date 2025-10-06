{% macro assign_segment(column_total) %}
    case
        when {{ column_total }} >= 1000 then 'A'
        when {{ column_total }} >= 500 then 'B'
        else 'C'
    end
{% endmacro %}