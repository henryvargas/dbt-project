with order_details as (
    select
        oi.order_id,
        oi.customer_id,
        oi.product_id,
        oi.quantity,
        oi.price,
        p.category
    from {{ ref('fact_orders') }} oi
    join {{ ref('dim_products') }} p
        on oi.product_id = p.product_id
    join {{ ref('dim_customers') }} c
        on oi.customer_id = c.customer_id
)

select
    category,
    sum(quantity * price) as total_sales,
    count(distinct order_id) as total_orders,
    count(distinct product_id) as total_products_sold
from order_details
group by category
order by total_sales desc