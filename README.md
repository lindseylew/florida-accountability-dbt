# Florida School Accountability Risk Analysis
**A dbt & DuckDB case study in analytical modeling limits and responsible ML decision-making**

## Project Overview
This project builds a standardized, test-driven analytics pipelinefor Florida state school accountability data and evaluates the feasibility of predicting graduation-rate risk using structured performance signals.

While the original goal included developing a predictive model, analysis revealed that downstream accountability metrics (e.g., letter grades and year-over-year grade changes) largely saturate predictive signal. Rather than forcing model complexity, the project documents where and why modeling stops being useful, and what conditions would be required to justify escalation to machine learning.

---

## Core Objectives
1. Build a reproducible analytics pipeline
    - Ingest raw accountability data
    - Standardize and validate fields
    - Produce analysis-ready tables at a defined grain

2. Define and validate a graduation-rate risk signal
    - Explicit, interpretable risk definition
    - Clear handling of missing and duplicated records

3. Evaluate modeling feasibility
    - Majority-class and rule-based baselines
    - Diagnostic logistic regression
    - Decision framework for stopping escalation

---

## Data Grain & Scope
All analytical models are built a the the grain: 
`school_number x accountability_year`

Later stages explicitly address one-row-per-school aggregation to support modeling and evaluation.

---

## Tech Stack
- **dbt** - tranformation logic, testing and documentation
- **DuckDB** - analytical execution engine
- **SQL** - feature engineering
- **Python** - notebook-based exploration and validation
- **Git** - version control and reproducibility

---

## Pipeline Architecture

Raw Accountability Data → Seed Ingestion → Staging Models (feature engineering, risk signals) → Mart Tables (model-ready analytical views) → Validation & Evaluation


## Key Metrics & Features

### Outcome
- Graduation Rate (2023-24)
- Binary risk label: `is_grad_rate_risk` (graduation rate <80%)

### Engineered Signals
- Letter Grades (2024, 2025)
- Grade deltas (year-over-year change)
- Economic disadvantage percentage
- Categorical bands for interpretability

---

## Data Quality & Validation
The pipeline reinforces explicit assumptions using dbt tests:
- Non-null entity identifiers
- Accepted values for binary risk flags
- Controlled casting of numeric fields
- One-row-per-school validation

These checks ensure that downstream modeling decisions are grounded in reliable structure, not incidental data artifacts.

---

## Modeling Approach

### Baselines First
Before applying machine learning, several baselines were evaluated:
- Majority-class baseline
- Rule-based heuristics
- Logistic regression (diagnositc baseline)

Evaluation focused on:
- Precision
- Recall
- Lift over base rate
- Confusion matrix intepretation

---

## Decision to Stop Escalation
Rather than introducing more complex models, the project intentionally stops a the baseline stage.

**Why?**
- The target is defined using accountability outcomes already present in features.
- Additional model complexity would not add meaningful decision value.
- This rpresents a *problem-formulation limitation*, not a modeling failure.

This decision reflects responsible ML practice: **knowing when not to model**.

---

## What Would Make ML Necessary (Future Work)
A justified V2 would require **upstream predictors**, such as:
- Attendance trends
- Course completion
- Assessment subscores
- Multi-year longitudinal features *prior* to grade assignment

The current pipeline is designed to support this future extension without rework.

---

## Project Takeaways
- Feature engineering ofter matters more than model choice.
- Baselines are diagnostic tools, not formalities.
- High accuracy can coexist with zero usefulness.
- Stopping early is sometimes the correct technical outcome.
- Well-structured analytics pipelines enable beter modeling decisions, including the decision not to model.

---

## Status
**Version 1 Complete**
Modeling intentionally contstrained based on empirical findings.
Future iterations will explore upstream risk prediction where ML is warranted.
