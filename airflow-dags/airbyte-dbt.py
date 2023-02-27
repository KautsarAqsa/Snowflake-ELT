from airflow import DAG
from airflow.utils.dates import days_ago
from airflow.providers.airbyte.operators.airbyte import AirbyteTriggerSyncOperator
from airflow.operators.bash import BashOperator

with DAG(dag_id='airbyte-dbt-kautsar',
         default_args={'owner': 'Kautsar'},
         schedule='@daily',
         start_date=days_ago(1)
    ) as dag:

    airbyte_1 = AirbyteTriggerSyncOperator(
        task_id='airbyte-sync-1',
        airbyte_conn_id='airbyte_conn',
        connection_id='e6b5ee02-1542-49e4-8c19-615723c58358',
        asynchronous=False,
        timeout=3600,
        wait_seconds=3
    )

    airbyte_2 = AirbyteTriggerSyncOperator(
        task_id='airbyte-sync-2',
        airbyte_conn_id='airbyte_conn',
        connection_id='9b313897-de7e-4e3a-a952-d88d796dda77',
        asynchronous=False,
        timeout=3600,
        wait_seconds=3
    )

    dbt = BashOperator(
        task_id='dbt-transform',
        bash_command = "/home/ubuntu/dbt/dbt-snowflake/dbt_run.sh "
    )
    
    [airbyte_1, airbyte_2] >> dbt