select
    customer,
    count(distinct order_id) as order_count,
    sum(order_total) / count(distinct order_id) as avg_basket_value
from {{ ref('fct_sales') }}
group by customer