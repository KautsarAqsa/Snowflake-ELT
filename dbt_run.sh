#!/bin/bash  -l

# Activate environment 
source /home/ubuntu/dbt/env/snowflake-env/bin/activate

# Go to DBT project dir
cd /home/ubuntu/dbt/dbt-snowflake

# Run DBT
dbt run
