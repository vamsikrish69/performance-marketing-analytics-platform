SELECT
    user_id AS customer_id,
    signup_date,
    UPPER(TRIM(country)) AS country,
    LOWER(TRIM(device_type)) AS device_type
FROM {{ ref('customers') }}
