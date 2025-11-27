{% set first_day_current_month = run_started_at.strftime("%Y-%m-01") %}

-- Exemplo com Jinja simples
SELECT *
FROM vendas
WHERE data_venda >= '{{ first_day_current_month }}'  -- Primeiro dia do mês atual gerado via Jinja

UNION ALL

-- Exemplo usando variável do dbt
SELECT *
FROM vendas
WHERE data_venda >= '{{ var("data_venda", first_day_current_month) }}'

UNION ALL

-- Loop com Jinja
SELECT 
    cliente_id,
    {% for mes in range(1, 13) %}
        SUM(
            CASE WHEN EXTRACT(MONTH FROM data_venda) = {{ mes }} 
            THEN valor END
        ) AS valor_mes_{{ mes }}
        {% if not loop.last %},{% endif %}
    {% endfor %}
FROM vendas
GROUP BY cliente_id

UNION ALL

-- Condição com Jinja
SELECT *
FROM vendas
WHERE 
    {% if var("flag_ativo", true) %}
        data_venda >= CURRENT_DATE - INTERVAL '30 days'
    {% else %}
        data_venda IS NOT NULL
    {% endif %}
;
