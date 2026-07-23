SELECT
    campaign_id,
    campaign_name,
    channel,
    total_spend,
    total_revenue,
    total_conversions,
    converted_customers,
    roas,
    cac,
    roi,
    conversion_rate
FROM {{ ref('fct_campaign_performance') }}
ORDER BY roas DESC
LIMIT 10
