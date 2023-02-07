--CONFIG
{{ config(
    schema='PUBLIC_ALL',
    materialized='view') }}

--QUERY
SELECT * FROM {{ ref('aggregate_1') }} UNION ALL
SELECT * FROM {{ ref('aggregate_2') }} 