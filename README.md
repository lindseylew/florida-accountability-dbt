## Project Overview
Build a standardized accountability data pipeline using dbt and Duckdb to prepare school performance data for reporting and analysis

---

## Objective
Transform raw state accountability datasets into structured, validated analytical tables at the grain:

`school_id` and `school_year`

---

## Tech Stack
- dbt
- DuckDB
- SQL
- Python
- Git

---

## Data Flow

1. Raw CSV (state accountability data)
2. Seed ingestion
3. Staging model (clean & standardize)
4. Intermediate model (normalize metrics)
5. Fact table (reporting grain)
6. Data quality tests

---

## Initial Metrics
- Graduation rate
- ELA proficiency
- Math proficiency
