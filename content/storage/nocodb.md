title=NocoDB
tags=storage, presentation, low-code, nodejs
summary=The Open Source Airtable alternative.
~~~~~~

[Website](https://www.nocodb.com/) | [Source](https://github.com/nocodb)

Offers a "signup"--maybe cloud-hosted service?

Feature list:

* Connects to any existing SQL database (MySQL, Postgres, MS SQL)
* Spreadsheet UI
* Views: Grid, Gallery, Kanban, Calendar, Custom
* Send Notifications (Slack)
* APIs: REST, GraphQL

Docker setup/run:

* SQLite: `docker run -d --name nocodb -v "$(pwd)"/nocodb:/usr/app/data/ -p 8080:8080 nocodb/nocodb/latest`
* MySQL: `docker run -d --name nocodb-mysql -v "$(pwd)"/nocodb:/usr/app/data/ -p 8080:8080 \
-e NC_DB="mysql2://host.docker.internal:3306?u=root&p=password&d=d1" \
-e NC_AUTH_JWT_SECRET="569a1821-0a93-45e8-87ab-eb857f20a010" \
nocodb/nocodb:latest`
* PostgreSQL: `docker run -d --name nocodb-postgres -v "$(pwd)"/nocodb:/usr/app/data/ -p 8080:8080 \
-e NC_DB="pg://host.docker.internal:5432?u=root&p=password&d=d1" \
-e NC_AUTH_JWT_SECRET="569a1821-0a93-45e8-87ab-eb857f20a010" \
nocodb/nocodb:latest`
* MSSQL: `docker run -d --name nocodb-mssql -v "$(pwd)"/nocodb:/usr/app/data/ -p 8080:8080 \
-e NC_DB="mssql://host.docker.internal:1433?u=root&p=password&d=d1" \
-e NC_AUTH_JWT_SECRET="569a1821-0a93-45e8-87ab-eb857f20a010" \
nocodb/nocodb:latest`

... or use docker-compose: 

    git clone https://github.com/nocodb/nocodb
    # for MySQL
    cd nocodb/docker-compose/mysql
    # for PostgreSQL
    cd nocodb/docker-compose/pg
    # for MSSQL
    cd nocodb/docker-compose/mssql
    docker-compose up -d

## Articles

* ["I replaced Airtable with NocoDb; here's how"](https://www.xda-developers.com/nocodb-guide/)

