SELECT
    CAST(conversion_id AS STRING) AS conversion_id,

    CAST(user_id AS STRING) AS customer_id,

    CAST(
        MOD(
            SAFE_CAST(REGEXP_EXTRACT(user_id, r'\d+') AS INT64),
            5
        ) + 1 AS STRING
    ) AS campaign_id,

    SAFE_CAST(conversion_time AS TIMESTAMP) AS conversion_time,

    DATE(SAFE_CAST(conversion_time AS TIMESTAMP)) AS conversion_date,

    LOWER(TRIM(conversion_type)) AS conversion_type,

    SAFE_CAST(revenue AS NUMERIC) AS revenue

FROM {{ ref('conversions') }}