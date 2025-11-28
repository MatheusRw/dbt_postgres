
select * from vendaswhere data_venda >= '{{ var("data_minima","2023-01-01") }}'


---
{{ config(

    schema= var ("schema_nome","desenvolvimento_schema")
) }}
select * from vendas

--comando dbt parar rodar com variaveis:
--dbt run --vars '{schema_nome: "producao_schema"}'
-- esse comando pode sobreescrever o valor default da variavel no arquivo dbt_project.yml