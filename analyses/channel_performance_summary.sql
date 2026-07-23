SELECT
    channel,
    total_campaigns,
    total_spend,
    total_impressions,
    total_clicks,
    total_conversions,
    converted_customers,
    total_revenue,
    channel_ctr,
    channel_roas,
    channel_cac,
    channel_roi,
    channel_conversion_rate
FROM {{ ref('fct_channel_performance') }}
ORDER BY channel_roas DESC
