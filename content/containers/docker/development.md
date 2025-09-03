title=Using Docker containers for development
tags=container, development
summary=Links and notes
~~~~~~

Dev container Dockerfile

```

```

## Reading

* [Docker-first local development](https://brandon-hoffman.is-a.dev/posts/docker-first-local-development/)

    1. Create a personalized base image with your preferred tools, shell configurations, and dotfiles.
    2. Build project-specific containers that extend your base image with only the tools needed for that project.
    3. Mount your source code so changes sync instantly between container and host.
    4. Use helper scripts to automate the build and run process for one-command setup.
    5. Enjoy consistent environments across all projects, team members, and machines.


### VSCode: 

* [Attach to a running container](https://code.visualstudio.com/docs/devcontainers/attach-container)
* [Developing inside a Container](https://code.visualstudio.com/docs/devcontainers/containers)
* [Create a dev container](https://code.visualstudio.com/docs/devcontainers/create-dev-container)
* [Developing inside a Docker container in VSCode](https://francescopochetti.com/developing-inside-a-docker-container-in-visual-studio-code/)

The Dev Containers extension uses the files in the `.devcontainer` folder, namely `devcontainer.json`, and an optional `Dockerfile` or `docker-compose.yml`, to create your dev containers.

First, your image is built from the supplied Dockerfile or image name, which would be mcr.microsoft.com/devcontainers/javascript-node:0-18 in this example. Then a container is created and started using some of the settings in the devcontainer.json. Finally your Visual Studio Code environment is installed and configured again according to settings in the devcontainer.json. For example, the dev container in this example installs the streetsidesoftware.code-spell-checker extension.

**Note**: Additional configuration will already be added to the container based on what's in the base image. For example, we see the streetsidesoftware.code-spell-checker extension above, and the container will also include "dbaeumer.vscode-eslint" as that's part of mcr.microsoft.com/devcontainers/typescript-node. This happens automatically when pre-building using devcontainer.json, which you may read more about in the pre-build section.

Once all of this is done, your local copy of Visual Studio Code connects to the Visual Studio Code Server running inside of your new dev container.

The devcontainer.json is basically a config file ([full list of options](https://containers.dev/implementors/json_reference)):

    //devcontainer.json
    {
        "name": "Node.js",

        // Or use a Dockerfile or Docker Compose file. More info: https://containers.dev/guide/dockerfile
        "image": "mcr.microsoft.com/devcontainers/javascript-node:0-18",

        // Features to add to the dev container. More info: https://containers.dev/features.
        // "features": {},

        "customizations": {
            "vscode": {
            "settings": {},
            "extensions": ["streetsidesoftware.code-spell-checker"]
            }
        },

        // "forwardPorts": [3000],

        "portsAttributes": {
            "3000": {
            "label": "Hello Remote World",
            "onAutoForward": "notify"
            }
        },

        "postCreateCommand": "yarn install"

        // "remoteUser": "root"
    }

## Dev-Base container

Dockerfile:
```
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    zsh \
    nano \
    build-essential \
    unzip \
    ca-certificates \
    sudo \
    htop \
    tree \
    jq \
    openssh-client \
    gnupg2 \
    less \
    netcat-openbsd \
    dnsutils \
    ripgrep \
    fd-find \
    && rm -rf /var/lib/apt/lists/*

ARG USERNAME=devuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD: /usr/bin/apt-get, /usr/bin/apt" > /etc/sudoers.d/$USERNAME

USER $USERNAME
WORKDIR /home/$USERNAME

COPY --chown=$USERNAME:$USERNAME dotfiles/.zshrc /home/$USERNAME/.zshrc

RUN mkdir -p /home/$USERNAME/workspace

WORKDIR /home/$USERNAME/workspace

CMD ["/bin/zsh"]
```

build.sh script:
```
#!/bin/bash

set -euo pipefail

# Check if DOTFILES_DIR env variable is set, if not prompt user
if [[ -z "${DOTFILES_DIR:-}" ]]; then
    read -p "Enter dotfiles directory path: " -r DOTFILES_DIR
    DOTFILES_DIR="${DOTFILES_DIR/#\~/$HOME}"
    export DOTFILES_DIR
fi

if [[ ! -d "$DOTFILES_DIR" ]]; then
    echo "Error: Dotfiles directory not found: $DOTFILES_DIR" >&2
    exit 1
fi

echo "Using dotfiles from: $DOTFILES_DIR"

trap "rm -rf ./dotfiles" EXIT

cp -rT "$DOTFILES_DIR" "./dotfiles"

# Build the image, passing DOTFILES_DIR as build argument
BUILD_DATE=$(date +%Y%m%d)
docker build -f Dockerfile.base \
  -t dev-base:latest \
  -t dev-base:$BUILD_DATE .

echo "✅ Built dev-base:latest and dev-base:$BUILD_DATE"

echo "cleaning up temp dotfiles directory"
```

* [Developing inside a Docker container in VSCode](https://francescopochetti.com/developing-inside-a-docker-container-in-visual-studio-code/)
