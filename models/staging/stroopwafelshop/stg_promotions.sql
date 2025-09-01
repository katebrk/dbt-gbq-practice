with
    raw_source as (select * from {{ source("stroopwafelshop", "promotions") }}),

    promotions as (
        select
            -- ids 
            id as promotion_id,
            product_id,

            -- strings 
            name as promotion_name,
            description,

            -- numerics
            cast(discount_rate as numeric) as discount_rate,

            -- booleans
            is_holiday,

            -- dates
            date(start_date) as promotion_start_date,
            date(end_date) as promotion_end_date,

            -- meta 
            _airbyte_extracted_at,
            _airbyte_meta,
            _airbyte_raw_id

        from raw_source

    )

select *
from promotions