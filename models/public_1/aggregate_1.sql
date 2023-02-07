--CONFIG
{{ config(
    schema='PUBLIC_1',
    materialized='view') }}

--QUERY
SELECT 
source, customer_id, customer_name, city, SUM(payment) AS total_payment
FROM {{ ref('transform_1') }}
GROUP BY source, customer_id, customer_name, city