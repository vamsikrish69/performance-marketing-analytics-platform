SELECT
    CAST(campaign_id AS STRING) AS campaign_id,
    LOWER(TRIM(campaign_name)) AS campaign_name,
    SAFE_CAST(spend AS NUMERIC) AS spend,
    SAFE_CAST(impressions AS INT64) AS impressions,
    SAFE_CAST(clicks AS INT64) AS clicks,
    SAFE.PARSE_DATE('%m/%d/%Y', CAST(`date` AS STRING)) AS campaign_date,
    'google' AS channel
FROM {{ ref('google_ads') }}
