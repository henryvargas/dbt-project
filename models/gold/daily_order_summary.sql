select
    date_trunc('day', oi.order_date) as order_day,
    count(distinct oi.order_id) as total_orders,
    sum(oi.quantity * oi.price) as total_sales,
    count(distinct oi.customer_id) as total_customers
from {{ ref('fact_orders') }} oi
join {{ ref('dim_customers') }} c
    on oi.customer_id = c.customer_id
group by order_day
order by order_day
