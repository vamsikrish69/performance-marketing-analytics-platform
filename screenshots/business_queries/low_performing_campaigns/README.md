# Low Performing Campaigns

## Business Question

Which campaigns are underperforming based on advertising efficiency and conversion performance?

## Objective

Identify campaigns generating poor results so that marketing teams can investigate, optimize, pause, or reallocate advertising budgets.

## SQL Logic

This analysis evaluates campaign performance using the final reporting mart:

```text
fct_campaign_performance
```

The query identifies campaigns meeting any of the following conditions:

- ROAS less than 1
- ROI less than 0
- Zero conversions

## Metrics Used

- Campaign ID
- Campaign Name
- Channel
- Total Spend
- Total Revenue
- Total Conversions
- ROAS
- CAC
- ROI
- Conversion Rate

## SQL File

```text
analyses/low_performing_campaigns.sql
```

## Query

```sql
SELECT
    campaign_id,
    campaign_name,
    channel,
    total_spend,
    total_revenue,
    total_conversions,
    roas,
    cac,
    roi,
    conversion_rate
FROM `marketingdataplatform-500711.dbt_vamsikrish69.fct_campaign_performance`
WHERE roas < 1
   OR roi < 0
   OR total_conversions = 0
ORDER BY
    total_spend DESC,
    roas ASC;
```

## Business Value

This analysis helps marketing stakeholders:

- Detect inefficient campaigns
- Identify wasted advertising spend
- Improve campaign optimization efforts
- Prioritize campaign reviews
- Increase overall marketing efficiency

## Expected Output

The query returns campaigns that are considered underperforming according to predefined performance thresholds.

Typical indicators include:

- Low Return on Advertising Spend (ROAS)
- Negative Return on Investment (ROI)
- No recorded conversions

## Interpretation

Campaigns returned by this analysis should be reviewed to determine whether:

- Budget should be reduced
- Targeting should be refined
- Creative assets should be updated
- Campaigns should be paused
- Additional optimization is required

## Note

In the current project dataset, this query may return no rows if all campaigns are performing above the defined performance thresholds.

An alternative analysis (`updt_low_prfmnc_campaign.sql`) was created to rank the weakest campaigns even when no campaign is technically failing.
