# Docker image with PYTHON3 and DEPENDENCES for pyodbc with MS ODBC 17 DRIVER, Debian GNU/Linux 10 (buster)
# BY TADEO RUBIO
# Using the official Python image, Tag 3.8.3-buster
FROM python:3.9.13-bullseye

ENV DEBIAN_FRONTEND noninteractive
ENV ACCEPT_EULA Y

# UPDATE APT-GET
RUN apt-get update

# PYODBC DEPENDENCES
RUN apt-get install -y tdsodbc unixodbc-dev cron
RUN apt install unixodbc -y
RUN apt-get clean -y
ADD odbcinst.ini /etc/odbcinst.ini

# UPGRADE pip3
RUN pip3 install --upgrade pip

# DEPENDECES FOR DOWNLOAD ODBC DRIVER
RUN apt-get install apt-transport-https 
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update

# INSTALL ODBC DRIVER
RUN ACCEPT_EULA=Y apt-get install msodbcsql17 --assume-yes

COPY cron-restart /etc/cron.d/cron-restart
COPY requirements.txt /tmp/requirements.txt
RUN chmod 0644 /etc/cron.d/cron-restart
RUN crontab /etc/cron.d/cron-restart
RUN touch /var/log/cron.log

# CONFIGURE ENV FOR /bin/bash TO USE MSODBCSQL17
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile 
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc 

RUN pip install pip --upgrade
RUN pip install --user pyodbc
RUN pip install -r /tmp/requirements.txt --src /usr/local/src

EXPOSE 80 443
