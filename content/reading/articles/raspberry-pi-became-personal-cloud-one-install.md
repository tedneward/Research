title=My dusty Raspberry Pi became a personal cloud after one install
tags=reading, article, cloud, raspberry pi
summary=Why an older Pi makes a surprisingly capable Nextcloud server for personal use
~~~~~~

[Reading](https://www.makeuseof.com/raspberry-pi-became-personal-cloud-one-install/)

With Bookworm running, the entire Nextcloudpi installation comes down to a single command. SSH into your pi and run:

        curl -sSL https://raw.githubusercontent.com/nextcloud/nextcloudpi/master/install.sh | sudo bash

Before it does anything, the installer will warn you that it's going to disable SSH login for the root user, reset the root password, and give you a 30-second countdown to abort the installation. If you're logged in as a regular user (as you should be), this won't affect your access. The script then handles Apache, PHP, MariaDB, and the Nextcloud application's installation.

The entire process can take around 15 to 20 minutes on the Pi 3B+, and even longer if you've got a slow internet connection. When it finishes, open a browser, head to your Pi's local IP address, and you'll see a Nextcloudpi page prompting you to begin activation.

Once you're in the ncp-web interface, one of the first things to do is to move the data directory off the SD card and onto an external USB drive. SD cards are slow and wear out fast under constant read/write cycles as they're simply not built for this kind of workload. A USB drive gives you far more reliable and longer-lasting storage.

When external storage is sorted, enable APCu for local memory caching and Redis for file locking. Both are available directly through ncp-web's configuration panel. These two changes alone make the web interface significantly less sluggish. If you want to go a step further, disabling Nextcloud apps like Activity, Talk, and others can free up extra memory and speed up page loads.

You can also set up remote access to reach your server from outside your home network. There are several ways to do this, but the easiest solution is Tailscale — a WireGuard-based mesh VPN that only takes two commands to set up. Install it on the Pi and on your phone or laptop, and both devices appear on the same private network without any port forwarding hassles required. The Nextcloud mobile app would connect to your Pi just like it would to any other Nextcloud server.

