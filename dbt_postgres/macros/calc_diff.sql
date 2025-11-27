{% macro calc_diff(data_inicial, data_final) %}
    DATE_PART('day', {{ data_final }} - {{ data_inicial }})
{% endmacro %}
