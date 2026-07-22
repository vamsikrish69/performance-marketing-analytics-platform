WITH campaign_spend AS (

    SELECT
        campaign_id,
        campaign_name,
        channel,
        first_campaign_date,
        latest_campaign_date,
        total_spend,
        total_impressions,
        total_clicks,
        ctr
    FROM {{ ref('int_campaign_spend') }}

),

campaign_conversions AS (

    SELECT
        campaign_id,
        total_conversions,
        converted_customers,
        total_revenue,
        avg_revenue,
        first_conversion_date,
        latest_conversion_date
    FROM {{ ref('int_campaign_conversions') }}

)

SELECT
    s.campaign_id,
    s.campaign_name,
    s.channel,

    s.first_campaign_date,
    s.latest_campaign_date,

    c.first_conversion_date,
    c.latest_conversion_date,

    s.total_spend,
    s.total_impressions,
    s.total_clicks,
    s.ctr,

    COALESCE(c.total_conversions, 0) AS total_conversions,
    COALESCE(c.converted_customers, 0) AS converted_customers,
    COALESCE(c.total_revenue, 0) AS total_revenue,
    COALESCE(c.avg_revenue, 0) AS avg_revenue,

    ROUND(
        COALESCE(c.total_revenue, 0) / NULLIF(s.total_spend, 0),
        2
    ) AS roas,

    ROUND(
        s.total_spend / NULLIF(COALESCE(c.converted_customers, 0), 0),
        2
    ) AS cac,

    ROUND(
        (COALESCE(c.total_revenue, 0) - s.total_spend) / NULLIF(s.total_spend, 0),
        2
    ) AS roi,

    ROUND(
        COALESCE(c.total_conversions, 0) / NULLIF(s.total_clicks, 0),
        4
    ) AS conversion_rate

FROM campaign_spend s

LEFT JOIN campaign_conversions c
    ON s.campaign_id = c.campaign_id

