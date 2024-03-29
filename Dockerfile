FROM python:3.7

ARG AIRFLOW_VERSION=1.10.14 
ARG AIRFLOW_USER_HOME=/usr/local/airflow
ENV AIRFLOW_HOME=${AIRFLOW_USER_HOME}

# Let's do everything in one layer - Vadim 
RUN pip install apache-airflow[postgres,password]==${AIRFLOW_VERSION} \
&& pip install SQLAlchemy==1.3.23 \
&& pip install markupsafe==2.0.1 \
&& pip install wtforms==2.3.3 \
&& pip install flask-bcrypt

RUN mkdir /project

COPY script/ /project/scripts/
COPY config/airflow.cfg ${AIRFLOW_HOME}/airflow.cfg

RUN chmod +x /project/scripts/init.sh

ENTRYPOINT ["/project/scripts/init.sh"]
