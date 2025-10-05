
with valid_orders as (
    select
        o.order_id,
        o.customer_id,
        o.order_date,
        case
            when o.order_status in ('DELIVERED','PENDING','CANCELLED') then o.order_status
            else 'Unknown'
        end as order_status,
        o.payment_method
    from {{ ref('stg_orders') }} o
    join {{ ref('dim_customers') }} c on o.customer_id = c.customer_id
    where o.order_id is not null
      and o.order_date <= current_date
),
valid_order_items as (
    select
        oi.order_id,
        oi.product_id,
        case when quantity > 0 then quantity else 1 end as quantity,
        case when price > 0 then price else null end as price,
        coalesce(discount, 0) as discount
    from {{ ref('stg_order_items') }} oi
    join {{ ref('dim_products') }} p on oi.product_id = p.product_id
)
select
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_status,
    o.payment_method,
    oi.product_id,
    oi.quantity,
    oi.price,
    oi.discount,
    (oi.quantity * oi.price * (1 - oi.discount)) as total_amount
from valid_orders o
join valid_order_items oi on o.order_id = oi.order_id