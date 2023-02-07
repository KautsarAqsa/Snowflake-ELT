--CONFIG
{{ config(
    schema = 'public_2',
    materialized='view') }}

--QUERY
SELECT 
source, customer_id, customer_name, city, SUM(payment) AS total_payment
FROM {{ ref('public_2','transform') }}
GROUP BY source, customer_id, customer_name, city