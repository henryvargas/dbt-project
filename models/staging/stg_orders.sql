select 
    ORDER_ID,
    CUSTOMER_ID,
    {{ standardize_date('ORDER_DATE') }} as order_date,
    ORDER_STATUS,
    PAYMENT_METHOD
from {{ ref('orders') }}