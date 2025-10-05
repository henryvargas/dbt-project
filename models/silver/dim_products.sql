with cleaned_products as (
    select
        product_id,
        initcap("NAME") as product_name,
        coalesce(description, 'No description') as description,
        case
            when category is not null then category
            else 'Unknown'
        end as category,
        case
            when price > 0 then price
            else null
        end as price,
        sku
    from {{ ref('stg_products') }}
    where product_id is not null
)
select distinct *
from cleaned_products