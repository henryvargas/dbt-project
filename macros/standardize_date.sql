{% macro standardize_date(column) %}
    case
        when try_to_date({{ column }}) is not null then to_date({{ column }})
        else current_date
    end
{% endmacro %}