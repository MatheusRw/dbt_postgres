{% test has_sales(model, column_name) %}

    with cliente_sem_vendas as (
        select {{ column_name }} as id_cliente
        from {{ model }} as C
        left join vendas as V on c.{{column_name}} = v.id_cliente
        where v.id_cliente is null
    )
    select count(*)
    from cliente_sem_vendas

{% endtest %}