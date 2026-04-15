title=Paperless-ngx
tags=tool, documents, knowledge base, ai
summary=A community-supported open-source document management system that transforms your physical documents into a searchable online archive so you can keep, well, less paper.
~~~~~~

[Website](https://docs.paperless-ngx.com/) | [Source](https://github.com/paperless-ngx/paperless-ngx)

## Get Started

`bash -c "$(curl --location --silent --show-error https://raw.githubusercontent.com/paperless-ngx/paperless-ngx/main/install-paperless-ngx.sh)"`

#### Docker Compose Installation

1.  Go to the [/docker/compose directory on the project page](https://github.com/paperless-ngx/paperless-ngx/tree/main/docker/compose) and download one `docker-compose.*.yml` file for your preferred database backend. Save it in a local directory as `docker-compose.yml`. Also download `docker-compose.env` and `.env` into that same directory.
    
    If you want to enable optional support for Office and other documents, download a file with `-tika` in the file name.
    
    Tip: For new installations, it is recommended to use PostgreSQL as the database backend.
    
2.  Modify `docker-compose.yml` as needed. For example, you may want to change the paths for `consume`, `media`, and other directories to use bind mounts. Find the line that specifies where to mount the directory, e.g.:
    
    ```
    - ./consume:/usr/src/paperless/consume
    ```
    
    Replace the part _before_ the colon with your local directory:
    
    ```
    - /home/jonaswinkler/paperless-inbox:/usr/src/paperless/consume
    ```
    
    You may also want to change the default port that the webserver will use from the default (8000) to something else, e.g. for port 8010:
    
    ```
    ports:
        - 8010:8000
    ```
    
3.  Modify `docker-compose.env` with any configuration options you need. See the [configuration documentation](https://docs.paperless-ngx.com/configuration/) for all options.
    
    You may also need to set `USERMAP_UID` and `USERMAP_GID` to the UID and GID of your user on the host system. Use `id -u` and `id -g` to get these values. This ensures both the container and the host user can write to the consumption directory. If your UID and GID are `1000` (the default for the first normal user on many systems), this usually works out of the box without modifications. Run `id "username"` to check.
    
    Note
    
    You can utilize Docker secrets for configuration settings by appending `_FILE` to configuration values. For example [`PAPERLESS_DBUSER`](https://docs.paperless-ngx.com/configuration/#PAPERLESS_DBUSER) can be set using `PAPERLESS_DBUSER_FILE=/var/run/secrets/password.txt`.
    
4.  Run `docker compose pull`. This pulls the image from the GitHub container registry by default, but you can pull from Docker Hub by changing the `image` line to `image: paperlessngx/paperless-ngx:latest`.
5.  Run `docker compose up -d`. This will create and start the necessary containers.

#### After installation

Your Paperless-ngx instance should now be accessible at `http://127.0.0.1:8000` (or similar, depending on your configuration). When you first access the web interface, you will be prompted to create a [superuser](https://docs.paperless-ngx.com/usage/#superusers) account.

