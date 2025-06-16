with sales as (
    select * from {{ ref('fct_sales') }}
),
dates as (
    select * from {{ ref('dim_dates') }}
)
select
    d.YEAR_NUMBER,
    d.MONTH_OF_YEAR,
    s.ordered_at,
    s.customer,
    s.sku,
    sum(s.order_total) as revenue
from sales s
join dates d on CAST(s.ordered_at AS DATE) = d.date_day
group by d.YEAR_NUMBER, d.MONTH_OF_YEAR, s.ordered_at, s.customer, s.sku


