with cleaned_customers as (
    select
        "CUSTOMER_ID",
        INITCAP("NAME") as NAME,
        case
            when "EMAIL" like '%@%.%' then "EMAIL"
            else null
        end as EMAIL,
        coalesce("ADDRESS", 'Unknown') as ADDRESS,
        "REGISTRATION_DATE",
        case
            when "SEGMENT" in ('A', 'B', 'C') then "SEGMENT"
            else 'Unknown'
        end as SEGMENT
    from {{ ref('stg_customers') }}
    where "CUSTOMER_ID" is not null
)
select distinct *
from cleaned_customers