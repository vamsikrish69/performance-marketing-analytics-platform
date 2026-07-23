# Performance Marketing Analytics Platform

## Overview

This project is an end-to-end Performance Marketing Analytics Platform built using BigQuery, dbt Cloud, SQL, and GitHub.

The platform integrates Google Ads, Meta Ads, customer, and conversion datasets to create clean staging models, intermediate transformation models, and final business-facing analytics marts.

The final marts support campaign performance reporting, channel performance analysis, customer acquisition analytics, and marketing KPI measurement.

---

## Business Problem

Performance marketing teams need reliable and business-ready datasets to evaluate campaign effectiveness, optimize marketing spend, and measure customer acquisition performance.

Raw advertising and conversion data is often spread across multiple sources such as:

- Google Ads
- Meta Ads
- Customer acquisition data
- Conversion and revenue data

This project solves that problem by transforming raw marketing data into trusted analytical datasets for business reporting.

---

## Tech Stack

- BigQuery
- dbt Cloud
- SQL
- GitHub
- Data Modeling
- Analytics Engineering

---

## Project Architecture

```text
Seeds
  ↓
Staging Models
  ↓
Intermediate Models
  ↓
Marts
  ↓
Business Queries
