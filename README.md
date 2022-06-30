# pyodbc-msodbcsql17
Driver and Resources to Connect MSSQL 

## Dockerfile
docker build -t eneural/pyodbc-msodbcsql17 .
docker run -it --name teste eneural/pyodbc-msodbcsql17 bash
docker push eneural/eneural/pyodbc-msodbcsql17

## Overview

This is a Docker image to deploy apps on Python 3.9, using pyodbc and Driver 17 for SQL Server®.

## Elements

Uses official image [Python 3.9.13-bullseye](https://hub.docker.com/_/python/)

1. Debian 11 (bullseye)
2. Python 3.9.13
3. Dependences tested for [Pyodbc 4.0.30](https://pypi.org/project/pyodbc/4.0.30/)
4. Microsoft® ODBC SQL Server® 17 Driver installed

## Don't forget

This image has pyodbc too.

### License

See this [License](LICENSE)

### Trademark Notices

Microsoft® and SQL Server® are registered trademarks of Microsoft Corporation in the United States and/or other countries.

