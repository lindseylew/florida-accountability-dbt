select
    lpad(trim(cast("District Number" as varchar)), 2, '0') as district_number,
    trim("District Name") as district_name,
    lpad(trim(cast("School Number" as varchar)), 4, '0') as school_number,
    trim("School Name") as school_name,

    trim(cast("School Type" as varchar)) as school_type,
    trim(cast("Charter School" as varchar)) as charter_school,
    trim(cast("Title I" as varchar)) as title_i,

    nullif(trim(cast("Grade 2025" as varchar)), '') as grade_2025,
    nullif(trim(cast("Grade 2024" as varchar)), '') as grade_2024,

    try_cast("Graduation Rate 2023-24" as double) as graduation_rate_2023_24,
    try_cast("Percent of Economically Disadvantaged Students" as double) as pct_econ_disadvantaged

from {{ ref('fl_school_grades_2025') }}