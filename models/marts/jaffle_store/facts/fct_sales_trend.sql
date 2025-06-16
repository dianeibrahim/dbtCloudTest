select
    ordered_at,
    sum(order_total) as daily_revenue
from {{ ref('fct_sales') }}
group by ordered_at