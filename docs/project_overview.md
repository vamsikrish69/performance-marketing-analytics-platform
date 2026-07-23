# Project Overview

## Performance Marketing Analytics Platform

This project builds a BigQuery and dbt-based Performance Marketing Analytics Platform for campaign measurement, channel analysis, and customer acquisition reporting.

The platform transforms raw marketing datasets into trusted analytical models that support marketing decision-making.

---

## Business Context

Performance marketing teams run campaigns across paid channels such as Google Ads and Meta Ads.

They need to understand:

- Which campaigns generate the highest ROAS?
- Which channels produce the strongest returns?
- How much revenue is generated from conversions?
- Which customer segments are most valuable?
- Which campaigns should be optimized?

---

## Project Goals

The goals of this project are:

- Load marketing source data into BigQuery using dbt seeds.
- Standardize raw source data in staging models.
- Build intermediate business logic for spend, conversions, and customer acquisition.
- Create final marts for campaign, channel, and customer analysis.
- Add dbt tests to validate data quality.
- Provide business analysis queries for marketing stakeholders.

---

## Source Datasets

The project uses four seed datasets:

```text
google_ads.csv
meta_ads.csv
customers.csv
conversions.csv

