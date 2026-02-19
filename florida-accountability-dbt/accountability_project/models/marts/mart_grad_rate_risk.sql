select
    district_number,
    district_name,
    school_number,
    school_name,
    school_type,
    title_i,
    pct_econ_disadvantaged,
    grade_2025,
    grade_2024,
    grade_2025_score,
    grade_2024_score,
    grade_delta_2025_vs_2024,
    grad_rate_band,
    econ_band,
    is_grad_rate_risk
from {{ ref('int_school_features') }}