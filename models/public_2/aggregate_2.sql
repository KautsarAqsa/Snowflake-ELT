--CONFIG
{{ config(
    schema = 'PUBLIC_2',
    materialized='view') }}

--QUERY
SELECT 
source, customer_id, customer_name, city, SUM(payment) AS total_payment
FROM {{ ref('transform_2') }}
GROUP BY source, customer_id, customer_name, city