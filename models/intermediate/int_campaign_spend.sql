WITH google_ads AS (

    SELECT
        campaign_id,
        campaign_name,
        channel,
        campaign_date,
        spend,
        impressions,
        clicks
    FROM {{ ref('stg_google_ads') }}

),

meta_ads AS (

    SELECT
        campaign_id,
        campaign_name,
        channel,
        campaign_date,
        spend,
        impressions,
        clicks
    FROM {{ ref('stg_meta_ads') }}

),

combined_ads AS (

    SELECT * FROM google_ads

    UNION ALL

    SELECT * FROM meta_ads

)

SELECT
    campaign_id,
    campaign_name,
    channel,

    MIN(campaign_date) AS first_campaign_date,
    MAX(campaign_date) AS latest_campaign_date,

    SUM(spend) AS total_spend,
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,

    ROUND(
        SUM(clicks) / NULLIF(SUM(impressions), 0),
        4
    ) AS ctr

FROM combined_ads

GROUP BY
    campaign_id,
    campaign_name,
    channel