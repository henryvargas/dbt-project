select
    CUSTOMER_ID as customer_id,
    NAME,
    {{ validate_email('EMAIL') }} as email,
    ADDRESS ,
    {{ standardize_date('REGISTRATION_DATE') }} as registration_date,
    SEGMENT 
from {{ ref('customers') }}