select
    school_number,

    max(school_name) as school_name,
    max(district_number) as district_number,
    max(district_name) as district_name,
    max(school_type) as school_type,
    max(title_i) as title_i,

    avg(pct_econ_disadvantaged) as avg_pct_econ_disadvantaged,

    max(grade_2025) as grade_2025,
    max(grade_2024) as grade_2024,
    max(grade_2025_score) as grade_2025_score,
    max(grade_2024_score) as grade_2024_score,
    max(grade_delta_2025_vs_2024) as grade_delta_2025_vs_2024,

    max(is_grad_rate_risk) is is_grad_rate_risk

from {{ ref('int_school_features') }}
group by school_number