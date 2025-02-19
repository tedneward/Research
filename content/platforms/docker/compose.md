title=Docker-Compose
tags=tool, platform, containers
summary=Running multiple Docker images collectively.
~~~~~~

[Docs](https://docs.docker.com/compose/) | [GitHub](https://github.com/docker/compose)


---

FusionAuth docker-compose.yml:
```
version: '3'

services:
  db:
    image: postgres:12.9
    environment:
      PGDATA: /var/lib/postgresql/data/pgdata
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
    # Un-comment to access the db service directly
#   ports:
#     - 5432:5432
    networks:
      - db
    restart: unless-stopped
    volumes:
      - db_data:/var/lib/postgresql/data

  fusionauth:
    image: fusionauth/fusionauth-app:latest
    depends_on:
      - db
    environment:
      DATABASE_URL: jdbc:postgresql://db:5432/fusionauth
      # Prior to version 1.19.0, use this deprecated name
      # DATABASE_ROOT_USER: ${POSTGRES_USER}
      DATABASE_ROOT_USERNAME: ${POSTGRES_USER}
      DATABASE_ROOT_PASSWORD: ${POSTGRES_PASSWORD}
      # Prior to version 1.19.0, use this deprecated name
      # DATABASE_USER: ${DATABASE_USER}
      DATABASE_USERNAME: ${DATABASE_USERNAME}
      DATABASE_PASSWORD: ${DATABASE_PASSWORD}
      # Prior to version 1.19.0, use this deprecated names
      # FUSIONAUTH_MEMORY: ${FUSIONAUTH_MEMORY}
      # FUSIONAUTH_SEARCH_ENGINE_TYPE: database
      # FUSIONAUTH_URL: http://fusionauth:9011
      # FUSIONAUTH_RUNTIME_MODE: development
      FUSIONAUTH_APP_MEMORY: ${FUSIONAUTH_APP_MEMORY}
      FUSIONAUTH_APP_RUNTIME_MODE: development
      FUSIONAUTH_APP_URL: http://fusionauth:9011
      SEARCH_TYPE: database


    networks:
     - db
    restart: unless-stopped
    ports:
      - 9011:9011
    volumes:
      - fa_config:/usr/local/fusionauth/config

networks:
  db:
    driver: bridge

volumes:
  db_data:
  fa_config:
```

coupled with a .env file:
```
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
# Prior to version 1.19.0, using DATABASE_USER
DATABASE_USER=fusionauth
# >= 1.19.0, using DATABASE_USERNAME
DATABASE_USERNAME=fusionauth
DATABASE_PASSWORD=hkaLBM3RVnyYeYeqE3WI1w2e4Avpy0Wd5O3s3

ES_JAVA_OPTS="-Xms512m -Xmx512m"

# Prior to version 1.19.0, using FUSIONAUTH_MEMORY
FUSIONAUTH_MEMORY=512M
# >= 1.19.0, using FUSIONAUTH_APP_MEMORY
FUSIONAUTH_APP_MEMORY=512M
```
