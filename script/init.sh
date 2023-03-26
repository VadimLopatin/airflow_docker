#!/bin/bash

# Создание БД
sleep 10
airflow upgradedb
sleep 10

# Create user
airflow users create \
          --username admin \
          --firstname admin \
          --lastname admin \
          --role Admin \
          --email admin@example.org \
          -p 12345

# run scheduler and webserver
airflow scheduler & airflow webserver
