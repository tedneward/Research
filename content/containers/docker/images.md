title=Docker images
tags=container, docker, tool
summary=A collection of interesting Docker containers/images.
~~~~~~

[Actual Budget](https://actualbudget.org/): Actual Budget focuses on privacy and user control and works on an envelope budgeting method, a proven technique for managing finances effectively. Actual budget interface is quite straightforward. Unlike many popular budgeting apps that rely on cloud storage, Actual Budget prioritizes local data storage and offers optional end-to-end encryption. The list of features includes detailed reports, schedules to manage your future expenses, bank sync (in the US, UK, and Canada), rules, and more.

[Docmost](https://docmost.com/docs/): Collaborative wiki and documentation

[Dozzle](https://dozzle.dev/):

    ```
    version: '3'

    services:
    dozzle:
        image: amir20/dozzle:latest
        container_name: dozzle
        ports:
        - "8888:8080"
        volumes:
        - /var/run/docker.sock:/var/run/docker.sock
        restart: always
    ```

[Excalidraw](https://excalidraw.com/): Excalidraw is a free, open-source, and highly flexible virtual whiteboard tool to create diagrams, sketches, and wireframes. Whether you want to brainstorm complex ideas, simplify research, or simply map out team strategy on a giant canvas, you can’t go wrong with Excalidraw. It offers one of the best toolbars to create an engaging diagram. The interface is clean and straightforward, making it easy for users of all skill levels to get started. You can change the canvas background, tweak the theme, explore different shapes, use text editing tools, play with frame tools, and more. It also supports real-time collaboration for remote meetings and collaborative design work. You can head to the Docker hub, search for Excalidraw, pull an image, and start designing a diagram.

The [File Browser](https://github.com/gtsteffaniak/filebrowser) Docker container provides a user-friendly, web-based interface for managing files on my server. Instead of a command-line interface or a complex FTP client, I can use and manage a clean and modern browser-based file manager from anywhere.

[FusionAuth]():

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


[Gitea](https://gitea.com/): Lightweight, near-clone of GitHub.

    ```
    version: '3'

    services:
    gitea:
        image: gitea/gitea:latest
        container_name: gitea
        environment:
        - USER_UID=1000
        - USER_GID=1000
        volumes:
        - ./gitea:/data
        ports:
        - "3000:3000"
        - "222:22"
        restart: always
    ```

[Grocy](https://grocy.info/): Home management tool [Source](https://github.com/grocy/grocy)

[Homarr](https://homarr.dev/): Dashboard for self-hosted services

[Home Assistant](https://www.home-assistant.io/):

    ```
    version: '3.8'
    services:
    homeassistant:
        image: ghcr.io/home-assistant/home-assistant:stable
        container_name: homeassistant
        user: "1001:1001"
        restart: unless-stopped
        network_mode: "service:proxy" # attach to Traefik sidecar for SSL
        depends_on:
        - mosquitto
        volumes:
        - /srv/homeassistant/config:/config:rw
        - homeassistant_db:/config/home-assistant_v2.db
        environment:
        - TZ=America/Chicago
        secrets:
        - api_key
        healthcheck:
        test: ["CMD-SHELL", "curl -f http://localhost:8123/api/health || exit 1"]
        interval: 1m
        timeout: 10s
        retries: 3
        cap_drop:
        - ALL
        cap_add:
        - CHOWN
        - SETUID
        - SETGID

    mosquitto:
        image: eclipse-mosquitto:latest
        container_name: mosquitto
        restart: unless-stopped
        networks:
        homenet:
        volumes:
        - /srv/mosquitto/config:/mosquitto/config:ro
        - /srv/mosquitto/data:/mosquitto/data
        - /srv/mosquitto/log:/mosquitto/log
        ports:
        - "1883:1883"

    influxdb:
        image: influxdb:2.6
        container_name: influxdb
        restart: unless-stopped
        networks:
        homenet:
        volumes:
        - influxdb_data:/var/lib/influxdb2
        environment:
        - INFLUXDB_ADMIN_USER=admin
        - INFLUXDB_ADMIN_PASSWORD_FILE=/run/secrets/influxdb_admin_password
        secrets:
        - influxdb_admin_password
        ports:
        - "8086:8086"

    grafana:
        image: grafana/grafana:9.5
        container_name: grafana
        restart: unless-stopped
        networks:
        homenet:
        volumes:
        - grafana_data:/var/lib/grafana
        environment:
        - GF_SECURITY_ADMIN_PASSWORD_FILE=/run/secrets/grafana_admin_password
        secrets:
        - grafana_admin_password
        ports:
        - "3000:3000"


    networks:
    homenet:
        driver: macvlan
        driver_opts:
        parent: eth0
        ipam:
        config:
            - subnet: 192.168.1.0/24
            gateway: 192.168.1.1

    volumes:
    homeassistant_db:
    influxdb_data:
    grafana_data:
    ```

[HomeBox](https://homebox.software/en/): As the name suggests, you can think of HomeBox as a digital catalog for everything you own, from small tools and electronics to seasonal decorations. Its primary goal is to help you keep track of your belongings, know where they are, and remember every important detail about them. With HomeBox, you can basically eliminate the frustration of disorganization and create a centralized, searchable, and customizable record of your household possessions.

[Jellyfin](https://jellyfin.org/docs/general/installation/container/): Centralized hub for movies, TV shows, music, and photos.

[Kavita](): Private book library

[LinkWarden](https://linkwarden.app/): a powerful, self-hosted bookmark and web archiving solution. While your browser’s built-in bookmark manager is fine for a few dozen links, Linkwarden takes the entire experience to the next level. [Source](https://github.com/linkwarden/linkwarden)

[Mealie](https://www.xda-developers.com/five-reasons-i-self-host-my-recipe-tracker/): 

[Netdata](https://netdata.cloud/):

    ```
    docker run -d --name=netdata \
    --pid=host \
    --network=host \
    -v netdataconfig:/etc/netdata \
    -v netdatalib:/var/lib/netdata \
    -v netdatacache:/var/cache/netdata \
    -v /:/host/root:ro,rslave \
    -v /etc/passwd:/host/etc/passwd:ro \
    -v /etc/group:/host/etc/group:ro \
    -v /etc/localtime:/etc/localtime:ro \
    -v /proc:/host/proc:ro \
    -v /sys:/host/sys:ro \
    -v /etc/os-release:/host/etc/os-release:ro \
    -v /var/log:/host/var/log:ro \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    -v /run/dbus:/run/dbus:ro \
    --restart unless-stopped \
    --cap-add SYS_PTRACE \
    --cap-add SYS_ADMIN \
    --security-opt apparmor=unconfined \
    -e NETDATA_CLAIM_TOKEN=<your claim token \
    -e NETDATA_CLAIM_URL=https://app.netdata.cloud \
    -e NETDATA_CLAIM_ROOMS=<your claim room> \
    netdata/netdata:stable
    ```

[Nginx Proxy Manager](https://nginxproxymanager.com/):

    ```
    version: '3'

    services:
    npm:
        image: jc21/nginx-proxy-manager:latest
        container_name: npm
        ports:
        - "80:80"
        - "81:81"
        - "443:443"
        volumes:
        - ./data:/data
        - ./letsencrypt:/etc/letsencrypt
        restart: always
    ```

[N8N](https://n8n.io/):

    ```
    version: '3'

    services:
    n8n:
        image: n8nio/n8n:latest
        container_name: n8n
        ports:
        - "5678:5678"
        environment:
        - N8N_BASIC_AUTH_ACTIVE=true
        - N8N_BASIC_AUTH_USER=admin
        - N8N_BASIC_AUTH_PASSWORD=changeme
        - TZ=America/New_York
        volumes:
        - ./n8n-data:/home/node/.n8n
        restart: always
    ```

[OpenWebUI](https://github.com/open-webui/open-webui) plus [Ollama](/ai/ollama): This is a pair of solutions I have been playing around with the past few months and I have to say that self-hosting your own AI server is totally awesome. You don’t have to worry about API costs to the major cloud AI providers, and you keep control of your own data.

    ```
    version: '3.8'

    services:
    ollama:
        image: ollama/ollama
        container_name: ollama
        volumes:
        - ollama:/root/.ollama
        ports:
        - "11434:11434"
        restart: unless-stopped

    openwebui:
        image: ghcr.io/open-webui/open-webui:main
        container_name: openwebui
        depends_on:
        - ollama
        environment:
        - OLLAMA_BASE_URL=http://ollama:11434
        ports:
        - "3000:3000"
        volumes:
        - openwebui:/app/backend/data
        restart: unless-stopped

    volumes:
    ollama:
    openwebui:
    ```

[Outline](https://www.getoutline.com/): Notes management (compare to Blinko) [Source](https://github.com/outline)

[ownCloud](https://owncloud.com/): Personal data storage

[PenPot](https://penpot.app/): Figma replacement

[Pi-hole](https://pi-hole.net/): Pi-hole acts as a network-wide guardian that silently filters out unwanted content before it even reaches your devices. When a device tries to connect to an ad server, Pi-hole intercepts the request and eliminates ads and tracking servers. This results in quicker website loading times, reduced data usage on advertisements, and an increase in online privacy. Overall, running Pi-hole in a Docker container simplifies everything. It's easy to set up, keeps your Pi-hole isolated from other applications, and makes it incredibly portable. Besides, managing it through the web interface is a breeze. Once configured, Pi-hole protects all devices on your network, including computers, smartphones, tablets, and smart home devices.

[Portainer](/containers/portainer)

[Prometheus](https://prometheus.io/): Robust monitoring

[Shiori](https://github.com/go-shiori/shiori): Shiori is an open-source bookmark manager that helps you save and organize your favorite web pages. Its lightweight nature and focus on essential features make it a strong contender for a productivity-boosting Docker container. Unlike some of its rivals, Shiori focuses on simplicity and offers an easy-to-use interface for managing bookmarks. You can import and export bookmarks from and to Netscape Bookmark files. There is even an option to import bookmarks from the Pocket service. By centralizing your bookmarks in a single, organized location, Shiori helps you avoid the clutter of scattered browser tabs and bookmarks. You can focus on information that truly matters.

[Vaultwarden](https://www.vaultwarden.net/):

    ```
    version: '3'

    services:
    vaultwarden:
        image: vaultwarden/server:latest
        container_name: vaultwarden
        volumes:
        - ./vw-data:/data
        ports:
        - "8080:80"
        restart: always
    ```

[Vikunja](https://vikunja.io/): Task management app

[VS Code Server](https://github.com/coder/code-server): Hosting VSCode in the browser.

[Wallos](https://wallosapp.com/): Subscription tracker

[Watchtower](https://containrrr.dev/watchtower/):

    ```
    version: '3'

    services:
    watchtower:
        image: containrrr/watchtower
        container_name: watchtower
        volumes:
        - /var/run/docker.sock:/var/run/docker.sock
        environment:
        - WATCHTOWER_CLEANUP=true
        - WATCHTOWER_POLL_INTERVAL=300
        restart: always
    ```

[YouTrack](https://www.jetbrains.com/youtrack/#): Self-hosted project management (JetBrains)

## Reading

### Articles

- [5 OSs that work perfectly in a Docker container](https://www.notebookcheck.net/5-complete-operating-systems-that-work-perfectly-in-a-docker-container-including-macOS-and-Steam-Headless.879397.0.html): [Steam Headless](https://github.com/Steam-Headless/docker-steam-headless), [Windows on Docker](https://github.com/dockur/windows?tab=readme-ov-file#how-do-i-select-the-windows-version), [Debian bookworm](https://hub.docker.com/r/ich777/debian-bookworm) (which comes with the Xfce4 Desktop environment with a noVNC webGUI and all the basic tools pre-installed), [Virtual DSM](https://github.com/vdsm/virtual-dsm) (which allows you to install Synology Disk Station Manager (DSM) in a container), [macOS in Docker](https://github.com/sickcodes/Docker-OSX) (which will let you run Apple's operating system with near native performance, even let you connect your iPhone via USB. You can run almost any version of MacOS, right up to the latest Sonoma release, although getting services such as iMessage and iCloud running could prove to be a challenge)

    macOS in Docker!!!

- https://www.virtualizationhowto.com/2025/08/10-docker-projects-you-can-build-in-a-weekend-and-actually-use/: Gitea, Netdata, Nginx Proxy Manager, Vaultwarden, Watchtower, Dozzle, Portainer, OpenWebUI + Ollama, Home Assistant, N8N
- https://www.xda-developers.com/docker-containers-i-wish-i-knew-earlier/: Actual Budget, Excalidraw, Shiori, Pi-hole, Wallos, Jellyfin, Penpot

