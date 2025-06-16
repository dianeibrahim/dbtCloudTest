select
    sku,
    sum(order_total) as total_revenue
from {{ ref('fct_sales') }}
group by sku
order by total_revenue desc
--limit 10