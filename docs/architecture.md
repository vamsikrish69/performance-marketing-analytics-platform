# Architecture

## Overview

This project follows a layered dbt architecture using seeds, staging models, intermediate models, marts, and analysis queries.

The architecture makes the pipeline easier to understand, test, maintain, and extend.

---

## High-Level Flow

```text
Seed Data
   ↓
Staging Layer
   ↓
Intermediate Layer
   ↓
Marts Layer
   ↓
Business Queries
