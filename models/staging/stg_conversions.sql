SELECT
    conversion_id,
    customer_id,
    campaign_id,
    PARSE_DATE('%m/%d/%Y', conversion_date) AS conversion_date,
    LOWER(TRIM(conversion_type)) AS conversion_type,
    CAST(revenue AS NUMERIC) AS revenue
FROM {{ ref('conversions') }}
