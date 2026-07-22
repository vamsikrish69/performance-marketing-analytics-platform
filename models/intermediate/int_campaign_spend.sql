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

combined AS (

    SELECT * FROM google_ads

    UNION ALL

    SELECT * FROM meta_ads

)

SELECT
    campaign_id,
    campaign_name,
    channel,

    SUM(spend) AS total_spend,
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks

FROM combined

GROUP BY
    campaign_id,
    campaign_name,
    channel
