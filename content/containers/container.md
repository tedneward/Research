title=Container (Apple)
tags=container, host
summary=A tool for creating and running Linux containers using lightweight virtual machines on a Mac. It is written in Swift, and optimized for Apple silicon.
~~~~~~

[Source](https://github.com/apple/container) | [Docs](https://apple.github.io/container/documentation/)

container is a tool that you can use to create and run Linux containers as lightweight virtual machines on your Mac. It's written in Swift, and optimized for Apple silicon.

The tool consumes and produces OCI-compatible container images, so you can pull and run images from any standard container registry. You can push images that you build to those registries as well, and run the images in any other OCI-compatible application.

container uses the Containerization Swift package for low level container, image, and process management.

# Tutorial

Take a guided tour of `container` by building, running, and publishing a simple web server image.

## Try out the `container` CLI

Start the application, and try out some basic commands to familiarize yourself with the command line interface (CLI) tool.

### Start the container service

Start the services that `container` uses:

```bash
container system start
```

If you have not installed a Linux kernel yet, the command will prompt you to install one:

<pre>
% container system start

Verifying apiserver is running...
Installing base container filesystem...
No default kernel configured.
Install the recommended default kernel from [https://github.com/kata-containers/kata-containers/releases/download/3.17.0/kata-static-3.17.0-arm64.tar.xz]? [Y/n]: y
Installing kernel...
%
</pre>

Then, verify that the application is working by running a command to list all containers:

```bash
container list --all
```

If you haven't created any containers yet, the command outputs an empty list:

<pre>
% container list --all
ID  IMAGE  OS  ARCH  STATE  ADDR
%
</pre>

### Get CLI help

You can get help for any `container` CLI command by appending the `--help` option:

<pre>
% container --help
OVERVIEW: A container platform for macOS

USAGE: container [--debug] <subcommand>

OPTIONS:
  --debug                 Enable debug output [environment: CONTAINER_DEBUG]
  --version               Show the version.
  -h, --help              Show help information.

CONTAINER SUBCOMMANDS:
  create                  Create a new container
  delete, rm              Delete one or more containers
  exec                    Run a new command in a running container
  inspect                 Display information about one or more containers
  kill                    Kill one or more running containers
  list, ls                List containers
  logs                    Fetch container stdio or boot logs
  run                     Run a container
  start                   Start a container
  stop                    Stop one or more running containers

IMAGE SUBCOMMANDS:
  build                   Build an image from a Dockerfile
  images, image, i        Manage images
  registry, r             Manage registry configurations

SYSTEM SUBCOMMANDS:
  builder                 Manage an image builder instance
  system, s               Manage system components

%
</pre>

### Abbreviations

You can save keystrokes by abbreviating commands and options. For example, abbreviate the `container list` command to `container ls`, and the `--all` option to `-a`:

<pre>
% container ls -a
ID  IMAGE  OS  ARCH  STATE  ADDR
%
</pre>

Use the `--help` flag to see which abbreviations exist.

### Set up a local DNS domain (optional)

`container` includes an embedded DNS service that simplifies access to your containerized applications. If you want to configure a local DNS domain named `test` for this tutorial, run:

```bash
sudo container system dns create test
container system dns default set test
```

Enter your administrator password when prompted. The first command requires administrator privileges to create a file containing the domain configuration under the `/etc/resolver` directory, and to tell the macOS DNS resolver to reload its configuration files.

The second command makes `test` the default domain to use when running a container with an unqualified name. For example, if the default domain is `test` and you use `--name my-web-server` to start a container, queries to `my-web-server.test` will respond with that container's IP address.

## Build an image

Set up a `Dockerfile` for a basic Python web server, and use it to build a container image named `web-test`.

### Set up a simple project

Start a terminal, create a directory named `web-test` for the files needed to create the container image:

```bash
mkdir web-test
cd web-test
```

In the `web-test` directory, create a file named `Dockerfile` with this content:

```dockerfile
FROM docker.io/python:alpine
WORKDIR /content
RUN apk add curl
RUN echo '<!DOCTYPE html><html><head><title>Hello</title></head><body><h1>Hello, world!</h1></body></html>' > index.html
CMD ["python3", "-m", "http.server", "80", "--bind", "0.0.0.0"]
```

The `FROM` line instructs the `container` builder to start with a base image containing the latest production version of Python 3.

The `WORKDIR` line creates a directory `/content` in the image, and makes it the current directory.

The first `RUN` line adds the `curl` command to your image, and the second `RUN` line creates a simple HTML landing page named `/content/index.html`.

The `CMD` line configures the container to run a simple web server in Python on port 80. Since the working directory is `/content`, the web server runs in that directory and delivers the content of the file `/content/index.html` when a user requests the index page URL.

The server listens on the wildcard address `0.0.0.0` to allow connections from the host and other containers. You can safely use the listen address `0.0.0.0` inside the container, because external systems have no access to the virtual network to which the container attaches.

### Build the web server image

Run the `container build` command to create an image with the name `web-test` from your `Dockerfile`:

```bash
container build --tag web-test --file Dockerfile .
```

The last argument `.` tells the builder to use the current directory (`web-test`) as the root of the build context. You can copy files within the build context into your image using the `COPY` command in your Dockerfile.

After the build completes, list the images. You should see both the base image and the image that you built in the results:

<pre>
% container images list
NAME      TAG     DIGEST
python    alpine  b4d299311845147e7e47c970...
web-test  latest  25b99501f174803e21c58f9c...
%
</pre>

## Run containers

Using your container image, run a web server and try out different ways of interacting with it.

### Start the webserver

Use `container run` to start a container named `my-web-server` that runs your webserver:

```bash
container run --name my-web-server --detach --rm web-test
```

The `--detach` flag runs the container in the background, so that you can continue running commands in the same terminal. The `--rm` flag causes the container to be removed automatically after it stops.

When you list containers now, `my-web-server` is present, along with the container that `container` started to build your image. Note that its IP address, shown in the `ADDR` column, is `192.168.64.3`:

<pre>
% container ls
ID             IMAGE                                               OS     ARCH   STATE    ADDR
buildkit       ghcr.io/apple/container-builder-shim/builder:0.0.3  linux  arm64  running  192.168.64.2
my-web-server  web-test:latest                                     linux  arm64  running  192.168.64.3
%
</pre>

Open the website, using the container's IP address in the URL:

```bash
open http://192.168.64.3
```

If you configured the local domain `test` earlier in the tutorial, you can also open the page with the full hostname for the container:

```bash
open http://my-web-server.test
```

### Run other commands in the container

You can run other commands in `my-web-server` by using the `container exec` command. To list the files under the content directory, run an `ls` command:

<pre>
% container exec my-web-server ls /content
index.html
%
</pre>

If you want to poke around in the container, run a shell and issue one or more commands:

<pre>
% container exec --tty --interactive my-web-server sh
/content # ls
index.html
/content # uname -a
Linux my-web-server 6.12.28 #1 SMP Tue May 20 15:19:05 UTC 2025 aarch64 Linux
/content # exit
%
</pre>

The `--tty` and `--interactive` flag allow you to interact with the shell from your host terminal. The `--tty` flag tells the shell in the container that its input is a terminal device, and the `--interactive` flag connects what you input in your host terminal to the input of the shell in the container.

You will often see these two options abbreviated and specified together as `-ti` or `-it`.

### Access the web server from another container

Your web server is accessible from other containers as well as from your host. Launch a second container using your `web-test` image, and this time, specify a `curl` command to retrieve the `index.html` content from the first container.

> [!NOTE]
> Container relies on the new features and enhancements present in the macOS 26 beta.
> As a result, the functionality of accessing the web server from another container will not work on macOS 15.
> See https://github.com/apple/container/blob/main/docs/technical-overview.md#macos-15-limitations for more details.

```bash
container run -it --rm web-test curl http://192.168.64.3
```

The output should appear as:

<pre>
% container run -it --rm web-test curl http://192.168.64.3
&lt;!DOCTYPE html>&lt;html>&lt;head>&lt;title>Hello&lt;/title>&lt;/head>&lt;body>&lt;h1>Hello, world!&lt;/h1>&lt;/body>&lt;/html>
%
</pre>

If you set up the `test` domain earlier, you can achieve the same result with:

```bash
container run -it --rm web-test curl http://my-web-server.test
```

## Run a published image

Push your image to a container registry, publishing it so that you and others can use it.

### Publish the web server image

To publish your image, you need push images to a registry service that stores the image for future use. Typically, you need to authenticate with a registry to push an image. This example assumes that you have an account at a hypothetical registry named `registry.example.com` with username `fido` and a password or token `my-secret`, and that your personal repository name is the same as your username.

> [!NOTE]
> By default `container` is configured to use Docker Hub.
> You can change the default registry used by running `container registry default set <registry url>`.
> See the other sub commands under `container registry` for more options.

To sign into a secure registry with your login credentials, enter your username and password at the prompts after running:

```bash
container registry login {registry.example.com}
```

Create another name for your image that includes the registry name, your repository name, and the image name, with the tag `latest`:

```bash
container images tag web-test {registry.example.com/fido}/web-test:latest
```

Then, push the image:

```bash
container images push {registry.example.com/fido}/web-test:latest
```

### Pull and run your image

To validate your published image, stop your current web server container, remove the image that you built, and then run using the remote image:

```bash
container stop my-web-server
container images delete web-test {registry.example.com/fido}/web-test:latest
container run --name my-web-server --detach --rm {registry.example.com/fido}/web-test:latest
```

## Clean up

Stop your container and shut down the application.

### Shut down the web server

Stop your web server container with:

```bash
container stop my-web-server
```

If you list all running and stopped containers, you will see that the `--rm` flag you supplied with the `container run` command caused the container to be removed:

<pre>
% container list --all
ID        IMAGE                                               OS     ARCH   STATE    ADDR
buildkit  ghcr.io/apple/container-builder-shim/builder:0.0.3  linux  arm64  running  192.168.64.2
%
</pre>

### Stop the container service

When you want to stop `container` completely, run:

```bash
container system stop
```

# How-to

How to use the features of `container`.

## Configure memory and CPUs for your containers

Since the containers created by `container` are lightweight virtual machines, consider the needs of your containerized application when you use `container run`.  The `--memory` and `--cpus` options allow you to override the default memory and CPU limits for the virtual machine. The default values are 1 gigabyte of RAM and 4 CPUs. You can use abbreviations for memory units; for example, to run a container for image `big` with 8 CPUs and 32 gigabytes of memory, use:

```bash
container run --rm --cpus 8 --memory 32g big
```

## Configure memory and CPUs for large builds

When you first run `container build`, `container` starts a *builder*, which is a utility container that builds images from your `Dockerfile`s. As with anything you run with `container run`, the builder runs in a lightweight virtual machine, so for resource-intensive builds, you may need to increase the memory and CPU limits for the builder VM.

By default, the builder VM receives 2 gigabytes of RAM and 2 CPUs. You can change these limits by starting the builder container before running `container build`:

```bash
container builder start --cpus 8 --memory 32g
```

If your builder is already running and you need to modify the limits, just stop, delete, and restart the builder:

```bash
container builder stop
container builder delete
container builder start --cpus 8 --memory 32g
```

## Share host files with your container

With the `--volume` option of `container run`, you can share data between the host system and one or more containers, and you can persist data across multiple container runs. The volume option allows you to mount a folder on your host to a filesystem path in the container.

This example mounts a folder named `assets` on your Desktop to the directory `/content/assets` in a container:

<pre>
% ls -l ~/Desktop/assets
total 8
-rw-r--r--@ 1 fido  staff  2410 May 13 18:36 link.svg
% container run --volume ${HOME}/Desktop/assets:/content/assets docker.io/python:alpine ls -l /content/assets
total 4
-rw-r--r-- 1 root root 2410 May 14 01:36 link.svg
%
</pre>

The argument to `--volume` in the example consists of the full pathname for the host folder and the full pathname for the mount point in the container, separated by a colon.

The `--mount` option uses a comma-separated `key=value` syntax to achieve the same result:

<pre>
% container run --mount source=${HOME}/Desktop/assets,target=/content/assets docker.io/python:alpine ls -l /content/assets
total 4
-rw-r--r-- 1 root root 2410 May 14 01:36 link.svg
%
</pre>

## Build and run a multiplatform image

Using the [project from the tutorial example](tutorial.md#set-up-a-simple-project), you can create an image to use both on Apple silicon Macs and on x86-64 servers.

When building the image, just add `--arch` options that direct the builder to create an image supporting both the `arm64` and `amd64` architectures:

```bash
container build --arch arm64 --arch amd64 --tag registry.example.com/fido/web-test:latest --file Dockerfile .
```

Try running the command `uname -a` with the `arm64` variant of the image to see the system information that the virtual machine reports:

<pre>
% container run --arch arm64 --rm registry.example.com/fido/web-test:latest uname -a
Linux 7932ce5f-ec10-4fbe-a2dc-f29129a86b64 6.1.68 #1 SMP Mon Mar 31 18:27:51 UTC 2025 aarch64 GNU/Linux
%
</pre>

When you run the command with the `amd64` architecture, the x86-64 version of `uname` runs under Rosetta translation, so that you will see information for an x86-64 system:

<pre>
% container run --arch amd64 --rm registry.example.com/fido/web-test:latest uname -a
Linux c0376e0a-0bfd-4eea-9e9e-9f9a2c327051 6.1.68 #1 SMP Mon Mar 31 18:27:51 UTC 2025 x86_64 GNU/Linux
%
</pre>

The command to push your multiplatform image to a registry is no different than that for a single-platform image:

```bash
container images push registry.example.com/fido/web-test:latest
```

## Get container or image details

`container images list` and `container list` provide basic information for all of your images and containers. You can also use `list` and `inspect` commands to print detailed JSON output for one or more resources.

Use the `inspect` command and send the result to the `jq` command to get pretty-printed JSON for the images or containers that you specify:

<pre>
% container images inspect web-test | jq
[
  {
    "name": "web-test:latest",
    "variants": [
      {
        "platform": {
          "os": "linux",
          "architecture": "arm64"
        },
        "config": {
          "created": "2025-05-08T22:27:23Z",
          "architecture": "arm64",
...
% container inspect my-web-server | jq
[
  {
    "status": "running",
    "networks": [
      {
        "address": "192.168.64.3/24",
        "gateway": "192.168.64.1",
        "hostname": "my-web-server.test.",
        "network": "default"
      }
    ],
    "configuration": {
      "mounts": [],
      "hostname": "my-web-server",
      "id": "my-web-server",
      "resources": {
        "cpus": 4,
        "memoryInBytes": 1073741824,
      },
...
</pre>

Use the `list` command with the `--format` option to display information for all images or containers. In this example, the `--all` option shows stopped as well as running containers, and `jq` selects the IP address for each running container:

<pre>
% container ls --format json --all | jq '.[] | select ( .status == "running" ) | [ .configuration.id, .networks[0].address ]'
[
  "my-web-server",
  "192.168.64.3/24"
]
[
  "buildkit",
  "192.168.64.2/24"
]
</pre>

## Forward traffic from `localhost` to your container

Use the `--publish` option to forward TCP or UDP traffic from your loopback IP to the container you run. The option value has the form `[host-ip:]host-port:container-port[/protocol]`, where protocol may be `tcp` or `udp`, case insensitive.

If your container attaches to multiple networks, the ports you publish forward to the IP address of the interface attached to the first network.

To forward requests from `localhost:8080` to a Python webserver on container port 8000, run:

```bash
container run -d --rm -p 127.0.0.1:8080:8000 python:slim python3 -m http.server --bind 0.0.0.0 8000
```

A `curl` to `localhost:8000` outputs:

```console
% curl http://localhost:8080                                                                                    
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Directory listing for /</title>
</head>
<body>
<h1>Directory listing for /</h1>
<hr>
<ul>
<li><a href="bin/">bin@</a></li>
<li><a href="boot/">boot/</a></li>
<li><a href="dev/">dev/</a></li>
<li><a href="etc/">etc/</a></li>
<li><a href="home/">home/</a></li>
<li><a href="lib/">lib@</a></li>
<li><a href="lost%2Bfound/">lost+found/</a></li>
<li><a href="media/">media/</a></li>
<li><a href="mnt/">mnt/</a></li>
<li><a href="opt/">opt/</a></li>
<li><a href="proc/">proc/</a></li>
<li><a href="root/">root/</a></li>
<li><a href="run/">run/</a></li>
<li><a href="sbin/">sbin@</a></li>
<li><a href="srv/">srv/</a></li>
<li><a href="sys/">sys/</a></li>
<li><a href="tmp/">tmp/</a></li>
<li><a href="usr/">usr/</a></li>
<li><a href="var/">var/</a></li>
</ul>
<hr>
</body>
</html>
```

## Create and use a separate isolated network

> [!NOTE]
> This feature is available on macOS 26 and later.

Running `container system start` creates a vmnet network named `default` to which your containers will attach unless you specify otherwise.

You can create a separate isolated network using `container network create`.

This command creates a network named `foo`:

```bash
container network create foo
```

The `foo` network, the default network, and any other networks you create are isolated from one another. A container on one network has no connectivity to containers on other networks.

Run `container network list` to see the networks that exist:

```console
% container network list
NETWORK  STATE    SUBNET
default  running  192.168.64.0/24
foo      running  192.168.65.0/24
%
```

Run a container that is attached to that network using the `--network` flag:

```console
container run -d --name my-web-server --network foo --rm web-test
```

Use `container ls` to see that the container is on the `foo` subnet:

```console
 % container ls
ID             IMAGE            OS     ARCH   STATE    ADDR
my-web-server  web-test:latest  linux  arm64  running  192.168.65.2
```

You can delete networks that you create once no containers are attached:

```bash
container stop my-web-server
container network delete foo
```

## View container logs

The `container logs` command displays the output from your containerized application:

<pre>
% container run -d --name my-web-server --rm registry.example.com/fido/web-test:latest
my-web-server
% curl http://my-web-server.test
&lt;!DOCTYPE html>&lt;html>&lt;head>&lt;title>Hello&lt;/title>&lt;/head>&lt;body>&lt;h1>Hello, world!&lt;/h1>&lt;/body>&lt;/html>
% container logs my-web-server
192.168.64.1 - - [15/May/2025 03:00:03] "GET / HTTP/1.1" 200 -
%
</pre>

Use the `--boot` option to see the logs for the virtual machine boot and init process:

<pre>
% container logs --boot my-web-server
[    0.098284] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    0.098466] random: crng init done
[    0.099657] brd: module loaded
[    0.100707] loop: module loaded
[    0.100838] virtio_blk virtio2: 1/0/0 default/read/poll queues
[    0.101051] virtio_blk virtio2: [vda] 1073741824 512-byte logical blocks (550 GB/512 GiB)
...
[    0.127467] EXT4-fs (vda): mounted filesystem without journal. Quota mode: disabled.
[    0.127525] VFS: Mounted root (ext4 filesystem) readonly on device 254:0.
[    0.127635] devtmpfs: mounted
[    0.127773] Freeing unused kernel memory: 2816K
[    0.143252] Run /sbin/vminitd as init process
2025-05-15T02:24:08+0000 info vminitd : [vminitd] vminitd booting...
2025-05-15T02:24:08+0000 info vminitd : [vminitd] serve vminitd api
2025-05-15T02:24:08+0000 debug vminitd : [vminitd] starting process supervisor
2025-05-15T02:24:08+0000 debug vminitd : port=1024 [vminitd] booting grpc server on vsock
...
2025-05-15T02:24:08+0000 debug vminitd : exits=[362: 0] pid=363 [vminitd] checking for exit of managed process
2025-05-15T02:24:08+0000 debug vminitd : [vminitd] waiting on process my-web-server
[    1.122742] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
2025-05-15T02:24:39+0000 debug vminitd : sec=1747275879 usec=478412 [vminitd] setTime
%
</pre>

## Expose virtualization capabilities to a container

> [!NOTE]
> This feature requires a M3 or newer Apple silicon machine and a Linux kernel that supports virtualization. For a kernel configuration that has all of the right features enabled, see https://github.com/apple/containerization/blob/0.5.0/kernel/config-arm64#L602.

You can enable virtualization capabilities in containers by using the `--virtualization` option of `container run` and `container create`.

If your machine does not have support for nested virtualization, you will see the following:

```console
container run --name nested-virtualization --virtualization --kernel /path/to/a/kernel/with/virtualization/support --rm ubuntu:latest sh -c "dmesg | grep kvm"
Error: unsupported: "nested virtualization is not supported on the platform"
```

When nested virtualization is enabled successfully, `dmesg` will show output like the following:

```console
container run --name nested-virtualization --virtualization --kernel /path/to/a/kernel/with/virtualization/support --rm ubuntu:latest sh -c "dmesg | grep kvm"
[    0.017245] kvm [1]: IPA Size Limit: 40 bits
[    0.017499] kvm [1]: GICv3: no GICV resource entry
[    0.017501] kvm [1]: disabling GICv2 emulation
[    0.017506] kvm [1]: GIC system register CPU interface enabled
[    0.017685] kvm [1]: vgic interrupt IRQ9
[    0.017893] kvm [1]: Hyp mode initialized successfully
```

## Configure container defaults

`container` uses macOS user defaults to store configuration settings that persist between sessions. You can customize various aspects of container behavior, including build settings, default images, and network configuration.

For a complete list of available configuration options and detailed usage instructions, see the [user defaults documentation](user-defaults.md).

### Example: Disable Rosetta for builds

If you want to prevent the use of Rosetta translation during container builds on Apple Silicon Macs:

```bash
defaults write com.apple.container.defaults build.rosetta -bool false
```

This is useful when you want to ensure builds only produce native arm64 images and avoid any x86_64 emulation.

## View system logs

The `container system logs` command allows you to look at the log messages that `container` writes:

<pre>
% container system logs | tail -8
2025-06-02 16:46:11.560780-0700 0xf6dc5    Info        0x0                  61684  0    container-apiserver: [com.apple.container:APIServer] Registering plugin [id=com.apple.container.container-runtime-linux.my-web-server]
2025-06-02 16:46:11.699095-0700 0xf6ea8    Info        0x0                  61733  0    container-runtime-linux: [com.apple.container:RuntimeLinuxHelper] starting container-runtime-linux [uuid=my-web-server]
2025-06-02 16:46:11.699125-0700 0xf6ea8    Info        0x0                  61733  0    container-runtime-linux: [com.apple.container:RuntimeLinuxHelper] configuring XPC server [uuid=my-web-server]
2025-06-02 16:46:11.700908-0700 0xf6ea8    Info        0x0                  61733  0    container-runtime-linux: [com.apple.container:RuntimeLinuxHelper] starting XPC server [uuid=my-web-server]
2025-06-02 16:46:11.703028-0700 0xf6ea8    Info        0x0                  61733  0    container-runtime-linux: [com.apple.container:RuntimeLinuxHelper] `bootstrap` xpc handler [uuid=my-web-server]
2025-06-02 16:46:11.720836-0700 0xf6dc3    Info        0x0                  61689  0    container-network-vmnet: [com.apple.container:NetworkVmnetHelper] allocated attachment [hostname=my-web-server.test.] [address=192.168.64.2/24] [gateway=192.168.64.1] [id=default]
2025-06-02 16:46:12.293193-0700 0xf6eaa    Info        0x0                  61733  0    container-runtime-linux: [com.apple.container:RuntimeLinuxHelper] `start` xpc handler [uuid=my-web-server]
2025-06-02 16:46:12.368723-0700 0xf6e93    Info        0x0                  61684  0    container-apiserver: [com.apple.container:APIServer] Handling container my-web-server Start.
%
</pre>

## Setup shell completion

The `container --generate-completion-script [zsh|bash|fish]` command generates completion scripts for the provided shell. 

A detailed guide on how to install the completion scripts can be found [here](https://swiftpackageindex.com/apple/swift-argument-parser/1.5.1/documentation/argumentparser/installingcompletionscripts)

