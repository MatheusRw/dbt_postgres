{{ config(
    materialized='incremental'
) }}

SELECT 
    id_pedido,
    data_criacao,
    data_entrega,
    valor
FROM pedidos
{% if is_incremental() %}
    WHERE data_criacao >= (SELECT MAX(data_criacao) FROM {{ this }})
{% endif %}

-- o this é para referenciar a tabela/modelo atual
-- is_incremental() verifica se o modelo está sendo executado em modo incremental