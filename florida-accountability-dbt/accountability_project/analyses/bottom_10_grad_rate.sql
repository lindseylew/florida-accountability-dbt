select
    district_number,
    district_name,
    school_number,
    school_name,
    graduation_rate_2023_24
from {{ ref('stg_fl_school_grades') }}
where graduation_rate_2023_24 is not null
order by graduation_rate_2023_24 asc
limit 10