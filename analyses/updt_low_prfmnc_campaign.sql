

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
FROM {{ ref('fct_campaign_performance') }}
ORDER BY
    roas ASC,
    roi ASC,
    total_spend DESC
LIMIT 10
