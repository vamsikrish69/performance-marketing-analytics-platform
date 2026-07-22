WITH customers AS (

    SELECT
        customer_id,
        signup_date,
        country,
        device_type
    FROM {{ ref('stg_customers') }}

),

customer_conversions AS (

    SELECT
        customer_id,

        COUNT(DISTINCT conversion_id) AS total_conversions,

        SUM(revenue) AS total_customer_revenue,

        MIN(conversion_date) AS first_conversion_date,

        MAX(conversion_date) AS latest_conversion_date

    FROM {{ ref('stg_conversions') }}

    GROUP BY
        customer_id

)

SELECT
    c.customer_id,
    c.signup_date,
    c.country,
    c.device_type,

    COALESCE(cc.total_conversions, 0) AS total_conversions,

    COALESCE(cc.total_customer_revenue, 0) AS total_customer_revenue,

    cc.first_conversion_date,

    cc.latest_conversion_date,

    CASE
        WHEN cc.total_conversions IS NULL THEN 'not_converted'
        ELSE 'converted'
    END AS customer_conversion_status

FROM customers c

LEFT JOIN customer_conversions cc
    ON c.customer_id = cc.customer_id
