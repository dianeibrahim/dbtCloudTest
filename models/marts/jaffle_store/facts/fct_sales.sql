-- models/marts/sales/fct_sales.sql

with items as (
    select * from {{ ref('stg_items') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

products as (
    select * from {{ ref('stg_products') }}
)

select
    i.order_id,
    o.customer,
    o.id,
    i.sku,
    p.type,
    o.ordered_at,
    o.subtotal,
    o.tax_paid,
    o.order_total
from items i
join orders o on i.order_id = o.id
join products p on i.sku = p.sku
