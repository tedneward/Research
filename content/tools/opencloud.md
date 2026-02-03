title=OpenCloud
tags=tool, cloud, storage, file management
summary=Self-hosted file sharing.
~~~~~~

[Website](https://opencloud.eu/en) | [Source](https://github.com/opencloud-eu) | Documentation: [User](https://docs.opencloud.eu/docs/user/), [Admin](https://docs.opencloud.eu/docs/admin/), [Developer](https://docs.opencloud.eu/docs/dev/)

## Getting Started

### [Docker](https://docs.opencloud.eu/docs/admin/getting-started/container/docker)

Create Required Directories for Bind Mounts

        mkdir -p $HOME/opencloud/opencloud-config
        mkdir -p $HOME/opencloud/opencloud-data

Pull OpenCloud Image

        docker pull opencloudeu/opencloud-rolling:latest

Initialize OpenCloud (First-time Setup) - You can set your own password using `IDM_ADMIN_PASSWORD=your_password`. If not set, a password will be auto-generated

        docker run --rm -it \
            -v $HOME/opencloud/opencloud-config:/etc/opencloud \
            -v $HOME/opencloud/opencloud-data:/var/lib/opencloud \
            -e IDM_ADMIN_PASSWORD=admin \
            opencloudeu/opencloud-rolling:latest init

Start OpenCloud

        docker run \
            --name opencloud \
            --rm \
            -d \
            -p 9200:9200 \
            -v $HOME/opencloud/opencloud-config:/etc/opencloud \
            -v $HOME/opencloud/opencloud-data:/var/lib/opencloud \
            -e OC_INSECURE=true \
            -e PROXY_HTTP_ADDR=0.0.0.0:9200 \
            -e OC_URL=https://localhost:9200 \
            opencloudeu/opencloud-rolling:latest

Login with your browser:

        https://localhost:9200
        user: admin
        password: admin


### [Docker Compose](https://docs.opencloud.eu/docs/admin/getting-started/container/docker-compose/docker-compose-base/)

Goal: Install a internet facing OpenCloud with SSL certification with Docker Compose. This installation documentation is for Ubuntu and Debian systems. The software can also be installed on other Linux distributions, but the commands and package managers may differ.

#### Prerequisites
Four domains pointing to your server:

* cloud.YOUR.DOMAIN → OpenCloud frontend
* collabora.YOUR.DOMAIN → Collabora Online Server
* wopiserver.YOUR.DOMAIN → WOPI server for document editing
* traefik.YOUR.DOMAIN → Traefik dashboard

Alternatively, you can use a wildcard domain (*.YOUR.DOMAIN)

A hosted server (e.g., Hetzner, AWS, or your own VPS) with Linux and SSH access

Log into your server via SSH: `ssh root@YOUR.SERVER.IP`

First, perform an update and upgrade: `apt update && apt upgrade -y`

Install Docker following the official Docker guide. Once Docker is installed, enable and start the service: `systemctl enable docker && systemctl start docker`

Download the necessary configuration files: `git clone https://github.com/opencloud-eu/opencloud-compose.git`

#### Configure the .env File for Staging Certificates
Before requesting real SSL certificates, test the setup with Let's Encrypt’s staging environment.

Navigate to the OpenCloud configuration folder: `cd opencloud-compose`

Create environment file: `cp .env.example .env`

NOTE: The repository includes .env.example as a template with default settings and documentation. Your actual .env file is excluded from version control (via .gitignore) to prevent accidentally committing sensitive information like passwords and domain-specific settings.

Edit the .env file with the editor of your choice.

* Disable insecure mode

        # INSECURE=true

* Set your domain names

        TRAEFIK_DOMAIN=traefik.YOUR.DOMAIN
        OC_DOMAIN=cloud.YOUR.DOMAIN
        COLLABORA_DOMAIN=collabora.YOUR.DOMAIN
        WOPISERVER_DOMAIN=wopiserver.YOUR.DOMAIN

* Set your admin password

        INITIAL_ADMIN_PASSWORD=YourSecurePassword

* Set your email for SSL certification

        TRAEFIK_ACME_MAIL=your@email.com

* Use Let's Encrypt staging certificates (for testing)

        TRAEFIK_ACME_CASERVER=https://acme-staging-v02.api.letsencrypt.org/directory

* Set your deployment options. For Example without Collabora:

        COMPOSE_FILE=docker-compose.yml:traefik/opencloud.yml

Save and exit.

#### Production Setup Consideration

Production Setup Recommended: By default, OpenCloud stores configuration and data inside internal Docker volumes. This works fine for local development or quick evaluations — but is not suitable for production environments.

In production, you should mount persistent local directories for configuration and data to ensure:

* Data durability
* Easier backups and recovery
* Full control over storage location and permissions

Update your .env file with custom paths:

        OC_CONFIG_DIR=/your/local/path/opencloud/config
        OC_DATA_DIR=/your/local/path/opencloud/data

Folder Permissions: Ensure these folders exist and are owned by user and group 1000:1000, which the Docker containers use by default:

        sudo mkdir -p /your/local/path/opencloud/{config,data}
        sudo chown -R 1000:1000 /your/local/path/opencloud

If these variables are left unset, Docker will use internal volumes, which do not persist if the containers are removed — not recommended for real-world use.

> Security Warning: The user with UID 1000 on your host system will have full access to these mounted directories. This means that any local user account with this ID can read, modify, or delete OpenCloud config and data files. This can pose a security risk in shared or multi-user environments. Make sure to implement proper user and permission management and consider isolating access to these directories.

Use production release container: To avoid accidentally updating to a version with breaking changes, you should specify the production container version to be used in your .env file:

        OC_DOCKER_IMAGE=opencloudeu/opencloud
        OC_DOCKER_TAG=2

#### Start OpenCloud
Launch OpenCloud using Docker Compose: `docker compose up -d` This will start all required services in the background.

#### Verify SSL Certification
In your web browser, visit:

https://cloud.YOUR.DOMAIN

You should see a security warning because the staging certificate is not fully trusted. Same should appear with the other domains you are using.

Certificate Details: Check the certificate details to confirm it’s from Let's Encrypt Staging.

#### Apply a Real SSL Certificate
Once the staging certificate works, switch to a production certificate.

Stop Docker Compose: `docker compose down`

Remove old staging certificates: `rm -r certs`

Disable staging mode in .env: Edit .env

Comment the staging server:

        # TRAEFIK_ACME_CASERVER=https://acme-staging-v02.api.letsencrypt.org/directory

Restart OpenCloud with a real SSL certificate

        docker compose up -d

Now, visiting https://cloud.YOUR.DOMAIN should show a secure connection with a valid SSL certificate.

#### Log into OpenCloud
Open a browser and visit:

        https://cloud.YOUR.DOMAIN

Login with:

        Username: admin
        Password: (your password)

