select 
   ORDER_ID,
   PRODUCT_ID,
   QUANTITY,
   UNIT_PRICE,
   DISCOUNT,
   QUANTITY * UNIT_PRICE as total_amount,
   {{ assign_segment('QUANTITY * UNIT_PRICE') }} as segment
 from {{ ref('order_items') }}