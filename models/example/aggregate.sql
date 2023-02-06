--CONFIG
{{ config(materialized='view') }}

--QUERY
SELECT 
source, customer_id, customer_name, city, SUM(payment) AS total_payment
FROM {{ ref('transform') }}
GROUP BY source, customer_id, customer_name, city