SELECT
    campaign_id,

    COUNT(DISTINCT conversion_id) AS total_conversions,

    COUNT(DISTINCT customer_id) AS converted_customers,

    SUM(revenue) AS total_revenue,

    AVG(revenue) AS avg_revenue,

    MIN(conversion_date) AS first_conversion_date,

    MAX(conversion_date) AS latest_conversion_date

FROM {{ ref('stg_conversions') }}

GROUP BY
    campaign_id
