title=Lightwhale (Linux)
tags=platform, linux
summary=A Linux distro built around the idea that the OS isn't what you maintain but something you boot.
~~~~~~

[Website](https://lightwhale.asklandd.dk/)

It's quite simple: download the ISO, write it to a USB using Rufus, and boot it. The design eliminates an installer, package selection screen, timezone configuration, or any of the other processes involved in installing a traditional Linux distro. It feels kind of like a video game cartridge; you plug in the USB, and Lightwhale boots live into a working Docker Engine. Once you boot the system, both the kernel and root filesystem load into memory, and that's where your system starts. In fact, after booting, you no longer need the boot media.

Once I'd booted into Lightwhale, I logged in, then connected to the internet via my Ethernet cable, ran the command below, and noted my IP address:

        ip addr

I then switched to my main PC and connected via SSH using the command below:

        ssh op@

It's much more comfortable to manage the server over SSH than directly from the local console. This is especially the case if you're editing config files. The next thing I needed was to create a directory where I could drop my server configuration.

        mkdir homeserver
        cd homeserver

Finally, I got to the heart of the entire setup: my single compose.yaml file. This file has to include the services you love to work with and the setup for each one. It could be something as simple as this:

        services:
            dockge:
                image: louislam/dockge:1
                container_name: dockge
                restart: unless-stopped
                ports:
                - "5001:5001"
                environment:
                - DOCKGE_STACKS_DIR=/opt/stacks
                volumes:
                - /var/run/docker.sock:/var/run/docker.sock
                - ./dockge:/app/data
                - ./stacks:/opt/stacks

            uptime-kuma:
                image: louislam/uptime-kuma:1
                container_name: uptime-kuma
                restart: unless-stopped
                ports:
                - "3001:3001"
                volumes:
                - uptime-kuma:/app/data

            dozzle:
                image: amir20/dozzle:latest
                container_name: dozzle
                restart: unless-stopped
                ports:
                - "8080:8080"
                volumes:
                - /var/run/docker.sock:/var/run/docker.sock:ro
                volumes:
                    uptime-kuma:


With this in place, my entire server goes online with a single command: `docker compose up -d .` It's a single command that allows Docker to download any missing images, create the required networks and volumes, and start the services. It works whether there's just one service or several.

Comment: You can use mDNS to discover your Lightwhale servers and their IP-address on the network, e.g. with avahi-browse: `avahi-browse _lightwhale._tcp --resolve --parsable --terminate` That way you omit the first login and ip addr.

