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
        ctr,

        -- share of this row's spend within its campaign_id.
        -- conversions carry no channel/name, so campaign-level
        -- conversions are split across spend rows by spend share
        -- (prevents the fan-out that duplicated revenue)
        total_spend / NULLIF(
            SUM(total_spend) OVER (PARTITION BY campaign_id),
            0
        ) AS spend_share

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

),

allocated AS (

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

        COALESCE(c.total_conversions, 0)    * COALESCE(s.spend_share, 0) AS total_conversions,
        COALESCE(c.converted_customers, 0)  * COALESCE(s.spend_share, 0) AS converted_customers,
        COALESCE(c.total_revenue, 0)        * COALESCE(s.spend_share, 0) AS total_revenue,
        COALESCE(c.avg_revenue, 0)                                       AS avg_revenue

    FROM campaign_spend s

    LEFT JOIN campaign_conversions c
        ON s.campaign_id = c.campaign_id

)

SELECT
    campaign_id,
    campaign_name,
    channel,

    first_campaign_date,
    latest_campaign_date,

    first_conversion_date,
    latest_conversion_date,

    total_spend,
    total_impressions,
    total_clicks,
    ctr,

    ROUND(total_conversions, 2)   AS total_conversions,
    ROUND(converted_customers, 2) AS converted_customers,
    ROUND(total_revenue, 2)       AS total_revenue,
    avg_revenue,

    ROUND(total_revenue / NULLIF(total_spend, 0), 2) AS roas,

    ROUND(total_spend / NULLIF(converted_customers, 0), 2) AS cac,

    ROUND((total_revenue - total_spend) / NULLIF(total_spend, 0), 2) AS roi,

    ROUND(total_conversions / NULLIF(total_clicks, 0), 4) AS conversion_rate

FROM allocated
