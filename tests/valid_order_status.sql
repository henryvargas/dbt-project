select *
from {{ ref('fact_orders') }}
where quantity <= 0