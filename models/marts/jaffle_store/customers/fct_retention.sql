with customer_orders as (
    select customer, min(ordered_at) as first_order_date from {{ ref('fct_sales') }} group by customer
),
retention as (
    select
        extract(year from first_order_date) as cohort_year,
        count(*) as new_customers
    from customer_orders
    group by 1
)
select * from retention