{% snapshot stg_orders_snapshot %}

    {{
        config(
            target_schema='snapshots',
            target_database='postgres',
            unique_key='order_id',
            strategy='timestamp',
            updated_at='order_date'
        )
    }}

    SELECT
        order_id,
        customer_id,
        employee_id,
        order_date,
        required_date,
        shipped_date,
        ship_via,
        freight,
        ship_name,
        ship_address,
        ship_city,
        ship_region,
        ship_postal_code,
        ship_country
    FROM {{ source('northwind', 'orders') }}

{% endsnapshot %}
