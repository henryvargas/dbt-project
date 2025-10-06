-- Verifica que el estado de las órdenes sea uno de los valores aceptados
select *
from {{ ref('fact_orders') }}
where order_status not in ('pending','completed','canceled','shipped')
