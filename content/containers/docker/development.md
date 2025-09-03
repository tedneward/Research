title=Using Docker containers for development
tags=container, development
summary=Links and notes
~~~~~~

Goal is to create consistent development environments with all the tools and dependencies all cooked into a ready-to-use shell.

- for my own projects, assume an off-the-root `docker` directory will contain the Dockerfile and any dependencies, along with a `build.sh` and `run.sh` scripts to make it easy.
- these are dev-only environments, not production/deploy environments. Deploy environments would live elsewhere and get built as part of a build process.

    - can a Docker image use Docker to build Docker images on the host?

- assume CLI-only for now; I know we can run GUIs out of Docker using xrdp, if necessary, but focus on CLI builds for now
- To be tested: classic n-layer applications (web/api/database), probably using docker-compose?

--- 

## Dockerfile(s)

### Base/starting
```
FROM debian:trixie-slim
LABEL MAINTAINER="Ted Neward"

# The last line is to keep the image size down by removing the apt cache. It means
# that if you want to install more packages later, you'll need to run `apt-get update`
# again first.
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    curl wget \
    nano \
    build-essential \
    zip unzip \
    ca-certificates \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user to do our work
# (This is a best practice for Docker containers, and also necessary to run SDKMAN)
ARG USERNAME=devuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD: /usr/bin/apt-get, /usr/bin/apt" > /etc/sudoers.d/$USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME

# Create a workspace directory for our work
RUN mkdir -p /home/$USERNAME/workspace
WORKDIR /home/$USERNAME/workspace

# Set up host current directory as workspace
VOLUME /home/$USERNAME/workspace

# Bring in our dotfiles for bash customization/standardization
COPY --chown=$USERNAME:$USERNAME docker/dotfiles/.bashrc /home/$USERNAME/.bashrc
COPY --chown=$USERNAME:$USERNAME docker/dotfiles/.dircolors /home/$USERNAME/.dircolors
```

> **NOTE** "dotfiles" used above are listed as part of [bash](/tools/bash) page.

### Java build environment
Use SDKMAN to manage the JVM dependencies. Remember that Gradle's `gradlew` top-level script will download Gradle on demand. All other JVM dependencies should either be pulled through SDKMAN or from within the Gradle script.
```
# Get SDKMAN set up
RUN curl -s "https://get.sdkman.io" | bash \
    && bash -c "source /home/$USERNAME/.sdkman/bin/sdkman-init.sh && sdk update"
ENV SDKMAN_DIR="/home/$USERNAME/.sdkman"
ENV PATH="$SDKMAN_DIR/bin:$PATH"

# Install OpenJDK 17
RUN bash -c "source /home/$USERNAME/.sdkman/bin/sdkman-init.sh && sdk install java 17-open"
ENV JAVA_HOME="/home/$USERNAME/.sdkman/candidates/java/current"
ENV PATH="$JAVA_HOME/bin:$PATH"

CMD ["/bin/bash"]
```

### Python environment
Use `uv`.

```
```

### Node environment
Use `nvm`

```
```

### Ruby environment
Use `rv` (is this ARM64-only? Brew thinks so....)
```
```

### C++ environment
CMake, g++/gcc, LLVM?, what else?

```
```

### Usage
If DOCKER_IMAGE = base-antlr:dev then:

Build with `docker build -t $DOCKER_IMAGE .` (or specify Dockerfile location using `-f `*dir(s)*`/Dockerfile`)

Run with `docker run -it --rm -v "$(pwd)":/home/devuser/workspace $DOCKER_IMAGE

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

## Examples

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
