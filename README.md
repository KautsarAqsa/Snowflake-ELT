# Snowflake ELT

Welcome to my Snowflake ELT project!
This project is a data pipeline project that transfer data from PostgreSQL database to Snowflake data warehouse then transforms the data using DBT. 

## Prerequisites
You will need to have the following things:

- Airbyte
- Apache Airflow
- DBT (data build tools)
- PostgreSQL Database
- Snowflake Account

Here are the important files/directories you can use:

Notebook | Description 
------------- | -------------
`airflow-dags` | Contains Airflow DAG script that specifies the ELT pipeline workflow  
`models` | Contains DBT models, data-transformation flow & logic
`dbt_run.sh` | Shell script to trigger DBT from Airflow

![image](architecture-images.png)



