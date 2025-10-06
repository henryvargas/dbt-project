select 
    PRODUCT_ID,
    NAME,
    DESCRIPTION,
    CATEGORY,
    PRICE,
    SKU
from {{ ref('products') }}