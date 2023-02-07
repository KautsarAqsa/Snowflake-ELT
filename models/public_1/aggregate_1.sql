--CONFIG
{{ config(
    schema='public_1',
    materialized='view') }}

--QUERY
SELECT 
source, customer_id, customer_name, city, SUM(payment) AS total_payment
FROM {{ ref('public_1','transform') }}
GROUP BY source, customer_id, customer_name, city