with dates as (
    select distinct extract(year from ordered_at) as year from {{ ref('fct_sales') }}
),
activity as (
    select
        customer,
        extract(year from ordered_at) as year
    from {{ ref('fct_sales') }}
    group by customer, year
),
new_customers as (
    select year, count(customer) as new_customers
    from (
        select customer, min(year) as year from activity group by customer
    ) sub
    group by year
),
lost_customers as (
    select a.year, count(a.customer) as lost_customers
    from activity a
    left join activity b on a.customer = b.customer and a.year = b.year - 1
    where b.customer is null
    group by a.year
)
select n.year, n.new_customers, l.lost_customers
from new_customers n
left join lost_customers l on n.year = l.year






