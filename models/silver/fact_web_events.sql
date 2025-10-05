-- models/silver/fact_web_events.sql
select
    session_id,
    customer_id,
    case
        when try_to_timestamp("TIMESTAMP") is not null then "TIMESTAMP"
        else current_timestamp
    end as event_timestamp,
    case
        when event_type in ('page_view','add_to_cart','purchase','product_view','click') then event_type
        else 'unknown'
    end as event_type,
    coalesce(url,'Unknown') as url
from {{ ref('stg_web_events') }}
where session_id is not null
