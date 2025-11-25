select
    id_cliente,
    {{ to_snake_case('Nome Completo')}} as nome_snake_case
from clientes 
