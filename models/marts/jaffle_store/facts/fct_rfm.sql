with sales as (
    select * from {{ ref('fct_sales') }}
),
last_order as (
    select
        customer,
        max(ordered_at) as last_order_date
    from sales
    group by customer
),
rfm as (
    select
        s.customer,
        current_date - CAST(l.last_order_date AS DATE) as recency,
        count(distinct s.order_id) as frequency,
        sum(order_total) as monetary
    from sales s
    join last_order l on s.customer = l.customer
    group by s.customer, l.last_order_date
)
select * from rfm

--CAST(l.last_order_date AS DATE)