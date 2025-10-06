with product_sales as (
    select
        f.product_id,
        p.product_name,
        sum(f.quantity) as total_quantity_sold,
        sum(f.quantity * f.price) as total_sales
    from {{ ref('fact_orders') }} f
    join {{ ref('dim_products') }} p
        on f.product_id = p.product_id
    group by f.product_id, p.product_name
)
select *
from product_sales
order by total_quantity_sold desc
limit 10