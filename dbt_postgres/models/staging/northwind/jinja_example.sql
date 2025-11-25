-- query comum

SELECT *
FROM vendas
WHERE data_venda >= '2023-09-01' --Primeiro dia do mês atual

-- query com jinja

SELECT *
FROM vendas
WHERE data_venda >= '{{ var("data_venda") }}' -- Primeiro dia do mês atual com variável

-- query com jinja 2 

SELECT *
FROM vendas
WHERE data_venda >= '{{ (execute_at | as_timestamp).strftime("%Y-%m-01") }}' -- Primeiro dia do mês atual com variável

-- loop com jinja

Select 
    cliente_id,
    {%for mes in range(1,13) %}
        SUM(CASE WHEN EXTRACT(MONTH FROM data_venda) = {{mes}} THEN valor_venda ELSE 0 END) AS vendas_mes_{{mes}}{%if not loop.last %},{% endif %}
    {% endfor %}
from vendas
group by cliente_id


-- condição com jinja

select * 
from vendas
where 
    {% if flag_ativo == true %}
        data_venda == current_date - interval '30 days'
    {% else %}
        data_venda is not null
    {% endif %}

-- o jinja combina código python com sql para criar consultas dinâmicas