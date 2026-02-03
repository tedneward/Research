title=BookLore
tags=tool, cloud, container, docker
summary=A self-hosted web app for organizing and managing your personal book collection.
~~~~~~

[Source](https://github.com/adityachandelgit/BookLore) | [Docker Hub](https://hub.docker.com/r/booklore/booklore)

Provides an intuitive interface to browse, read, and track your progress across PDFs and eBooks. With robust metadata management, multi-user support, and a sleek, modern UI, BookLore makes it easy to build and explore your personal library. 

    ```
    services:
        booklore:
            # Official Docker Hub image:
            image: booklore/booklore:latest
            # Or the GHCR image:
            # image: ghcr.io/booklore-app/booklore:latest
            container_name: booklore
            environment:
                - PUID=1000
                - PGID=1000
                - TZ=Etc/UTC
                - DATABASE_URL=jdbc:mariadb://mariadb:3306/booklore   # Only modify this if you're familiar with JDBC and your database setup
                - DATABASE_USERNAME=booklore                          # Must match MYSQL_USER defined in the mariadb container
                - DATABASE_PASSWORD=your_secure_password              # Use a strong password; must match MYSQL_PASSWORD defined in the mariadb container 
                - SWAGGER_ENABLED=false                               # Enable or disable Swagger UI (API docs). Set to 'true' to allow access; 'false' to block access (recommended for production).
            depends_on:
                mariadb:
                    condition: service_healthy
            ports:
                - "6060:6060"
            volumes:
                - /your/local/path/to/booklore/data:/app/data       # Internal app data (settings, metadata, cache)
                - /your/local/path/to/booklore/books1:/books1       # Book library folder — point to one of your collections
                - /your/local/path/to/booklore/books2:/books2       # Another book library — you can mount multiple library folders this way
                - /your/local/path/to/booklore/bookdrop:/bookdrop   # Bookdrop folder — drop new files here for automatic import into libraries
            restart: unless-stopped

        mariadb:
            image: lscr.io/linuxserver/mariadb:11.4.5
            container_name: mariadb
            environment:
                - PUID=1000
                - PGID=1000
                - TZ=Etc/UTC
                - MYSQL_ROOT_PASSWORD=super_secure_password  # Use a strong password for the database's root user, should be different from MYSQL_PASSWORD
                - MYSQL_DATABASE=booklore
                - MYSQL_USER=booklore                        # Must match DATABASE_USERNAME defined in the booklore container
                - MYSQL_PASSWORD=your_secure_password        # Use a strong password; must match DATABASE_PASSWORD defined in the booklore container
            volumes:
                - /your/local/path/to/mariadb/config:/config
            restart: unless-stopped
            healthcheck:
                test: ["CMD", "mariadb-admin", "ping", "-h", "localhost"]
                interval: 5s
                timeout: 5s
                retries: 10
    ```
