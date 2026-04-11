title=Affine
tags=tool, notes, workspace, ios, android, windows, macos, linux, cloud
summary=A workspace with fully merged docs, whiteboards and databases.
~~~~~~

[Website](https://affine.pro/) | [Source](https://github.com/toeverything/AFFiNE)

Obsidian/Notion competitor.

## Installation/Self-Hosting

[Docker Compose](https://docs.affine.pro/self-host-affine/install/docker-compose-recommend)

### 1\. Create folders to put persisted data

```
mkdir affine
cd affine
```

2\. Get latest docker-compose.yml

You can choose to download the latest compose file tagged together with AFFiNE releases.

```
wget -O docker-compose.yml https://github.com/toeverything/affine/releases/latest/download/docker-compose.yml
```

or go to [docker-compose.yml](https://docs.affine.pro/self-host-affine/references/docker-compose-yml) and copy the content, put it in manually created `docker-compose.yml` file in the folder created in [Step 1](https://docs.affine.pro/self-host-affine/install/docker-compose-recommend#step1).

3\. Get .env file

A `.env` file is required to configure docker volumes mapping to specific where the user data will be persisted at and other required environment variables.

```
wget -O .env https://github.com/toeverything/affine/releases/latest/download/default.env.example
```

or go to [.env](https://docs.affine.pro/self-host-affine/references/env) and copy the content, put it in manually created `.env` file in the folder created in [Step 1](https://docs.affine.pro/self-host-affine/install/docker-compose-recommend#step1).

Then, you need to update the `.env` file to correct the fields to your configurations.

.env

```
The folder for Postgres data, usually to be the one in step 1 with '/postgres' suffix
DB_DATA_LOCATION=./postgres
The folder for uploaded blobs, usually to be the one in step 1 with '/storage' suffix
UPLOAD_LOCATION=./storage
The folder for custom configurations, usually to be the one in step with '/config' suffix
CONFIG_LOCATION=./config

DATABASE credentials and names to initialize Postgres
DB_USERNAME=affine
DB_PASSWORD=
DB_DATABASE=affine
```

WARNING

Most of the values in `.env` file shouldn't be changed once your host initialized and start to have data written.

If you do want to, for example, change the location of the `affine` folder, please check out [Backup and Restore](https://docs.affine.pro/self-host-affine/administer/backup-and-restore) for help.

4\. Start the containers

```
docker compose up -d
```

5\. Validate the deploy in browser

If everything goes perfect, you will be able to visit your AFFiNE in browser with [http://localhost:3010](http://localhost:3010/). You might update the port to what you configured in `.env` file.
