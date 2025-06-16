-- models/marts/dimensions/dim_dates.sql

/*with dates as (
    select
        date_day::date as date,
        extract(year from date_day) as year,
        extract(month from date_day) as month,
        extract(day from date_day) as day,
        to_char(date_day, 'Day') as weekday_name
    from generate_series('2020-01-01'::date, '2030-12-31'::date, interval '1 day') as date_day
)

select * from dates*/



{{
    config(
        materialized = "view"
    )
}}

{{ dbt_date.get_date_dimension("2010-01-01", "2030-12-31") }}


