--CONFIG
{{ config(materialized='table') }}

--QUERY
SELECT 
'PUBLIC_1' AS source, 
b.customer_id, 
b.customer_name, 
b.age,
case
    when age < 12 then 'Alpha'
    when age >= 12 and age <= 24 then 'Gen-Z'
    when age >= 25 and age <= 40 then 'Millenial'
    when age > 40 then 'Boomer'
    end as generation,
case
    when gender <> 'Male' and gender <> 'Female' then 'Unknown'
    else gender
    end as gender,
b.city,
month(a.order_date) AS month_order,
yearofweekiso(a.order_date) AS year_order,
case 
    when delivery_date is not null then 'DELIVERED' else 'IN PROGRESS' 
    end as delivery_status,
a.payment
FROM orders a
LEFT JOIN customer b ON a.customer_id = b.customer_id