with typed as (

    select
        district_number,
        district_name,
        school_number,
        school_name,

        try_cast(school_type as integer) as school_type,
        title_i,

        try_cast(graduation_rate_2023_24 as double) as graduation_rate_2023_24,
        try_cast(pct_econ_disadvantaged as double) as pct_econ_disadvantaged,

        grade_2025,
        grade_2024

    from {{ ref('stg_fl_school_grades') }}
),

features as (

    select
        district_number,
        district_name,
        school_number,
        school_name,

        school_type,
        title_i,

        graduation_rate_2023_24,
        pct_econ_disadvantaged,

        grade_2025,
        grade_2024,

        case
            when graduation_rate_2023_24 is not null and graduation_rate_2023_24 < 80 then 1
            else 0
        end as is_grad_rate_risk,

        case
            when graduation_rate_2023_24 is null then null
            when graduation_rate_2023_24 < 70 then 'lt_70'
            when graduation_rate_2023_24 < 80 then '70_79'
            when graduation_rate_2023_24 < 90 then '80_89'
            else '90_plus'
        end as grad_rate_band,

        case
            when pct_econ_disadvantaged is null then null
            when pct_econ_disadvantaged >= 90 then '90_plus'
            when pct_econ_disadvantaged >= 75 then '75_89'
            when pct_econ_disadvantaged >= 50 then '50_74'
            else 'lt_50'
        end as econ_band,

        case grade_2025
            when 'A' then 4
            when 'B' then 3
            when 'C' then 2
            when 'D' then 1
            when 'F' then 0
            else null
        end as grade_2025_score,

        case grade_2024
            when 'A' then 4
            when 'B' then 3
            when 'C' then 2
            when 'D' then 1
            when 'F' then 0
            else null
        end as grade_2024_score,

        (
            case grade_2025
                when 'A' then 4 when 'B' then 3 when 'C' then 2 when 'D' then 1 when 'F' then 0 else null end
            -
            case grade_2024
                when 'A' then 4 when 'B' then 3 when 'C' then 2 when 'D' then 1 when 'F' then 0 else null end
        ) as grade_delta_2025_vs_2024
    
from typed
)

select *
from features