title=Docker
tags=container, tool, platform, virtualization
summary=Virtualization tool for containerizing code, configuration, and sometimes data as part of a deployment.
~~~~~~

[Website](https://docker.com/) | [Docker Hub](https://hub.docker.com/) | [Getting Started](https://docs.docker.com/get-started/)

## Installation

### [Ubuntu](https://docs.docker.com/engine/install/ubuntu/) (incl. Pop!OS)

#### Option 1: Use apt-get

Set up `apt`:
```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

Run apt install:
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

#### Option 2: Use the convenience script

```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
```

Use `--dry-run` on the script if there's concerns.

#### Run Docker as non-privileged user

```
sudo sh -eux <<EOF
apt-get install -y uidmap
EOF
```

Then

```
dockerd-rootless-setuptool.sh install
```

#### Test docker

```
docker run hello-world
```

### [WinBoat](https://github.com/TibixDev/winboat/releases)
WinBoat is a lightweight, containerized tool that makes it easy to run Windows environments on Linux using Docker. It's like a portable Windows sandbox, but unlike traditional VMs, it doesn't bloat my system and, surprisingly, isn't resource-hungry. To put it simply, the Windows OS runs as a VM inside a Docker container, and it uses WinBoat Guest Server to fetch the necessary data from Windows. You can access it via FreeRDP (or a browser-based interface). This makes it flexible, efficient, and user-friendly.

- https://www.xda-developers.com/winboat-free-open-source-runs-windows-app-on-linux/

## Related Tools

- [dockcheck: A CLI Tool for Updating Container Images](https://selfh.st/post/dockcheck-cli-container-updates/)

## Reading

### Articles

* [CI/CD for Monorepos: Effectively building, testing, and deploying code with monorepos](https://github.com/semaphoreci/book-monorepo-cicd) - Pablo Tomas Fernandez Zavalia, Marko Anastasov, SemaphoreCI (PDF, EPUB, Kindle)
* [CI/CD with Docker and Kubernetes Book](https://github.com/semaphoreci/book-cicd-docker-kubernetes) - Marko Anastasov, Jérôme Petazzoni, Pablo Tom F. Zavalia, SemaphoreCI (PDF, EPUB, Kindle)
* [Docker Jumpstart](http://odewahn.github.io/docker-jumpstart/) - Andrew Odewahn
* [build-image](https://github.com/tmds/build-image): Containerize .NET apps without writing Dockerfiles.
* [I Run a Full Linux Desktop in Docker Just Because I Can](https://www.howtogeek.com/i-run-a-full-linux-desktop-in-docker-just-because-i-can/)

From @Nick_Craver (Twitter):
> `docker run --rm -it $(docker build -q .)`

> Using the -q output (just the hash) from a container build, run it, then discard it (--rm) on exit.
> Overall: one command to build, run, and delete...without a tag and local image created while testing your docker build scripts. Neat.

## [Learn X in Y minutes Quick Intro]():
```bat
:: download, install and run hello-world image
docker run hello-world

:: if this is the first time you should be able to see the message
:: Unable to find image 'hello-world:latest' locally
:: latest: Pulling from library/hello-world
:: 1b930d010525: Pull complete                                                                                          
::   Digest: sha256:4fe721ccc2e8dc7362278a29dc660d833570ec2682f4e4194f4ee23e415e1064
:: Status: Downloaded newer image for hello-world:latest
:: 
:: Hello from Docker!
:: This message shows that your installation appears to be working correctly.
:: 
:: To generate this message, Docker took the following steps:
:: 1. The Docker client contacted the Docker daemon.
:: 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
::     (amd64)
:: 3. The Docker daemon created a new container from that image which runs the
::     executable that produces the output you are currently reading.
:: 4. The Docker daemon streamed that output to the Docker client, which sent it
::     to your terminal.
:: 
:: To try something more ambitious, you can run an Ubuntu container with:
::  $ docker run -it ubuntu bash

:: now let's see currently running images
docker ps
:: CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS            
::   NAMES

:: let's see the images we have ran previously
docker ps -a

:: CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                     PORTS     
::          NAMES
:: 4a76281f9c53        hello-world         "/hello"            2 minutes ago       Exited (0) 2 minutes ago             
::          happy_poincare
:: the name part is generated automatically so it probably will be different for you

:: let's remove our previously generated image
docker rm happy_poincare

:: let's test if it was really deleted
docker ps -a
:: CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS            
::   NAMES

:: specify a custom name for the container
docker run --name test_container hello-world
:: Hello from Docker!
:: ...

docker ps -a
:: CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS                         PORTS
::               NAMES
:: d345fe1a4f41        hello-world         "/hello"            About a minute ago   Exited (0) About a minute ago       
::                test_container
:: as you can see the name is now what we have specified

:: retrieve logs from a named container
docker logs test_container
:: Hello from Docker!
:: ...

docker rm test_container

docker run ubuntu
::  Unable to find image 'ubuntu:latest' locally
::  latest: Pulling from library/ubuntu
::  2746a4a261c9: Pull complete                                                                                         
::                                                        4c1d20cdee96: Pull complete                                                                                                                                                 0d3160e1d0de: Pull complete                                                                                                                                                 c8e37668deea: Pull complete                                                                                                                                                 Digest: sha256:250cc6f3f3ffc5cdaa9d8f4946ac79821aafb4d3afc93928f0de9336eba21aa4
::  Status: Downloaded newer image for ubuntu:latest

docker ps -a
::  CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                     PORTS    
::           NAMES
::  c19e9e5b000a        ubuntu              "/bin/bash"         5 seconds ago       Exited (0) 4 seconds ago            
::           relaxed_nobel

::  running a container in an interactive mode
docker run -it ubuntu
::  root@e2cac48323d2:/# uname
::  Linux
::  root@e2cac48323d2:/# exit
::  exit

docker rm relaxed_nobel

docker ps -a
:: CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                          PORTS
::               NAMES
:: e2cac48323d2        ubuntu              "/bin/bash"         2 minutes ago       Exited (0) About a minute ago        
::               nifty_goldwasser

docker rm nifty_goldwasser
```

## Articles

["Run GUI Applications as Containers with x11docker"](https://thenewstack.io/run-gui-applications-as-containers-with-x11docker/): x11docker 