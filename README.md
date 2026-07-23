# Performance Marketing Analytics Platform

## Overview

The Performance Marketing Analytics Platform is an end-to-end analytics engineering project built using BigQuery, dbt Cloud, SQL, and GitHub.

The platform transforms raw advertising, customer, and conversion datasets into business-ready analytical models that enable campaign performance reporting, customer acquisition analysis, channel comparison, and marketing KPI measurement.

The project follows modern Analytics Engineering best practices using a layered dbt architecture consisting of staging, intermediate, marts, and business analysis layers.

---

## Business Problem

Marketing teams invest heavily across channels such as Google Ads and Meta Ads but often struggle to answer critical business questions:

- Which campaigns generate the highest ROAS?
- Which marketing channels perform best?
- Which campaigns should be optimized?
- Which customer segments generate the most revenue?
- How efficiently is marketing spend being converted into business results?

This platform centralizes marketing data and provides trusted analytical datasets to support data-driven decision making.

---

## Technology Stack

### Cloud & Warehouse

- Google BigQuery

### Analytics Engineering

- dbt Cloud
- SQL
- Data Modeling

### Development & Version Control

- GitHub

---

## Architecture

```text
Raw Seed Data
      │
      ▼
Staging Layer
      │
      ▼
Intermediate Layer
      │
      ▼
Marts Layer
      │
      ▼
Business Analysis Layer
```

---

## Source Datasets

The project uses four marketing-related source datasets:

```text
google_ads.csv
meta_ads.csv
customers.csv
conversions.csv
```

These datasets are loaded into BigQuery using dbt Seeds.

---

## Project Structure

```text
performance-marketing-analytics-platform/

├── analyses/
├── business_queries/
├── data/
│   └── seeds/
├── docs/
├── models/
│   ├── staging/
│   ├── intermediate/
│   └── marts/
├── screenshots/
├── packages.yml
├── dbt_project.yml
└── README.md
```

---

# Data Model Layers

## Staging Layer

The staging layer standardizes and cleans raw source data.

Models:

```text
stg_google_ads
stg_meta_ads
stg_customers
stg_conversions
```

Responsibilities:

- Standardize field names
- Cast data types
- Parse dates
- Clean text fields
- Prepare source data for transformation

---

## Intermediate Layer

The intermediate layer applies business transformation logic.

Models:

```text
int_campaign_spend
int_campaign_conversions
int_customer_acquisition
```

Responsibilities:

- Campaign spend aggregation
- Conversion aggregation
- Revenue aggregation
- Customer acquisition preparation

---

## Marts Layer

The marts layer provides business-ready reporting tables.

Models:

```text
fct_campaign_performance
fct_channel_performance
fct_customer_acquisition
```

Responsibilities:

- Campaign reporting
- Channel reporting
- Customer reporting
- KPI calculation

---

# Marketing KPIs Calculated

The platform calculates:

- Total Spend
- Total Revenue
- Total Conversions
- Converted Customers
- Impressions
- Clicks
- CTR
- ROAS
- CAC
- ROI
- Conversion Rate
- Customer Value Segments

---

# Business Analysis Queries

The project contains business-focused analytical queries.

## Top Campaigns by ROAS

Answers:

```text
Which campaigns generate the highest Return on Advertising Spend?
```

---

## Channel Performance Summary

Answers:

```text
Which marketing channel performs best?
```

---

## Customer Acquisition Analysis

Answers:

```text
Which customer segments generate the highest value?
```

---

## Low Performing Campaigns

Answers:

```text
Which campaigns require optimization?
```

---

## Updated Low Performing Campaigns

Answers:

```text
Which campaigns are the weakest relative performers even when all campaigns remain profitable?
```

---

# Documentation

Detailed project documentation is available under:

```text
docs/
```

Included documentation:

```text
project_overview.md
architecture.md
data_model.md
business_logic.md
```

---

# Business Queries Documentation

Business-focused query explanations are available under:

```text
business_queries/
```

Included documents:

```text
top_campaigns_by_roas.md
channel_performance_summary.md
customer_acquisition_analysis.md
low_performing_campaigns.md
updt_low_prfmnc_campaign.md
```

---

# Screenshots

Project screenshots are available under:

```text
screenshots/
```

Including:

- dbt Project Structure
- dbt Lineage Graph
- BigQuery Tables
- Campaign Performance Outputs
- dbt Test Results
- Business Query Outputs

---

# Data Quality Testing

dbt tests implemented include:

- Not Null Tests
- Unique Tests
- Accepted Values Tests

The project validates:

- Campaign IDs
- Customer IDs
- Revenue Fields
- Marketing Channels
- Device Types
- Customer Segments

---

# dbt Build Result

The platform was successfully validated using:

```bash
dbt build
```

Final Result:

```text
83 Passed
0 Warnings
0 Errors
0 Skips
```

This confirms the entire pipeline executes successfully end-to-end.

---

# Business Value

This platform enables marketing teams to:

- Measure campaign performance
- Compare marketing channels
- Identify optimization opportunities
- Understand customer behavior
- Improve budget allocation
- Increase advertising efficiency
- Monitor marketing ROI

---

# Key Skills Demonstrated

- Analytics Engineering
- BigQuery
- dbt Cloud
- SQL Development
- Data Modeling
- Marketing Analytics
- Campaign Measurement
- Customer Acquisition Analytics
- Data Quality Testing
- GitHub Project Management

# Setup Instructions

Follow the steps below to reproduce the project in your own environment.

## Prerequisites

Ensure you have access to:

- Google Cloud Platform (GCP)
- BigQuery
- GitHub
- dbt Cloud

---

## Step 1: Clone the Repository

```bash
git clone https://github.com/vamsikrish69/performance-marketing-analytics-platform.git
```

---

## Step 2: Create a BigQuery Project

Create a Google Cloud project and enable BigQuery.

Create a development dataset:

```text
dbt_vamsikrish69
```

---

## Step 3: Configure dbt Cloud

1. Create a dbt Cloud account.
2. Connect GitHub.
3. Connect BigQuery.
4. Import this repository.
5. Create a development environment.

---

## Step 4: Seed Source Data

Source files are located in:

```text
data/seeds/
```

Included datasets:

```text
google_ads.csv
meta_ads.csv
customers.csv
conversions.csv
```

Run:

```bash
dbt seed --full-refresh
```

Expected outcome:

```text
google_ads
meta_ads
customers
conversions
```

tables are created in BigQuery.

---

## Step 5: Build Staging Layer

Run:

```bash
dbt run --select staging
```

Validate:

```bash
dbt test --select staging
```

Models created:

```text
stg_google_ads
stg_meta_ads
stg_customers
stg_conversions
```

---

## Step 6: Build Intermediate Layer

Run:

```bash
dbt run --select intermediate
```

Validate:

```bash
dbt test --select intermediate
```

Models created:

```text
int_campaign_spend
int_campaign_conversions
int_customer_acquisition
```

---

## Step 7: Build Marts Layer

Run:

```bash
dbt run --select marts
```

Validate:

```bash
dbt test --select marts
```

Models created:

```text
fct_campaign_performance
fct_channel_performance
fct_customer_acquisition
```

---

## Step 8: Execute Full Project Build

Run the complete pipeline:

```bash
dbt build
```

Expected outcome:

```text
All models built successfully
All tests passed
No errors
No skipped models
```

---

## Step 9: Run Business Analysis Queries

Business queries are available in:

```text
analyses/
```

Included analyses:

```text
top_campaigns_by_roas.sql
channel_performance_summary.sql
customer_acquisition_analysis.sql
low_performing_campaigns.sql
updt_low_prfmnc_campaign.sql
```

These queries answer key marketing questions regarding campaign performance, customer acquisition, channel effectiveness, and optimization opportunities.

---

## Verification

A successful implementation should produce:

```text
Seed Layer
✔ Google Ads Data
✔ Meta Ads Data
✔ Customers Data
✔ Conversions Data

Staging Layer
✔ 4 Models

Intermediate Layer
✔ 3 Models

Marts Layer
✔ 3 Models

Business Queries
✔ 5 Analyses

dbt Tests
✔ All Tests Passed
```

---

## Expected Final Outputs

The platform produces:

```text
Campaign Performance Reporting
Channel Performance Reporting
Customer Acquisition Analytics
ROAS Analysis
ROI Analysis
CAC Analysis
Conversion Analysis
Customer Value Segmentation
Business Query Outputs
```

---

# Project Outcome

This project demonstrates how modern analytics engineering practices can transform raw marketing data into reliable business intelligence assets that support campaign optimization, customer acquisition analysis, and executive reporting.
