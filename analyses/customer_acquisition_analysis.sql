SELECT
    customer_value_segment,
    customer_conversion_status,
    country,
    device_type,

    COUNT(DISTINCT customer_id) AS total_customers,

    SUM(total_conversions) AS total_conversions,

    ROUND(
        SUM(total_customer_revenue),
        2
    ) AS total_customer_revenue,

    ROUND(
        AVG(total_customer_revenue),
        2
    ) AS avg_customer_revenue

FROM {{ ref('fct_customer_acquisition') }}

GROUP BY
    customer_value_segment,
    customer_conversion_status,
    country,
    device_type

ORDER BY
    total_customer_revenue DESC
