title=FreeBSD
tags=platform, os, bsd
summary=An operating system used to power modern servers, desktops, and embedded platforms.
~~~~~~

[Website](https://www.freebsd.org/) | [Download](https://www.freebsd.org/where/) | [Source](https://cgit.freebsd.org/)

## Implementations
FreeBSD is widely used as a building block for other commercial and open-source operating systems. The projects below are of particular interest.

* [TrueNAS](https://www.truenas.com/) is network attached storage (NAS) software that shares and protects data from modern-day threats like ransomware and malware. TrueNAS makes it easy for users and client devices to access shared data through virtually any sharing protocol.
* [GhostBSD](https://www.ghostbsd.org/) is derived from FreeBSD, and uses the GTK environment to provide a beautiful look and a comfortable experience on a modern BSD platform offering a natural and native UNIX®-like work environment.

    - https://www.xda-developers.com/i-tried-using-a-freebsd-distro-as-my-daily-driver-in-2025/

* [MidnightBSD](https://www.midnightbsd.org/) was forked from FreeBSD 6.1 beta, and continues to use parts of more recent FreeBSD code bases. Developed with desktop users in mind, MidnightBSD includes everything that you would expect for your daily tasks: mail, web browsing, word processing, gaming, and much more.
* [NomadBSD](https://www.nomadbsd.org/) is a persistent live system for USB flash drives, based on FreeBSD. Together with automatic hardware detection and setup, it is configured to be used as a desktop system that works out of the box, but can also be used for data recovery, for educational purposes, or to test FreeBSD hardware compatibility.
* [pfSense](https://www.pfsense.org/) is a FreeBSD-based customized distribution tailored for use as a firewall and router.

## Articles

[Three Ways to Try FreeBSD In Under Five Minutes](https://freebsdfoundation.org/blog/three-ways-to-try-freebsd-in-under-five-minutes/):

    1. on an ARM MacBook under QEMU (`brew install qemu`, then [Download the FreeBSD VM image](https://download.freebsd.org/releases/VM-IMAGES/14.2-RELEASE/aarch64/Latest/FreeBSD-14.2-RELEASE-arm64-aarch64-zfs.raw.xz), then expand the image (`xz -dk FreeBSD-14.2-RELEASE-arm64-aarch64-zfs.raw.xz; qemu-img resize -f raw FreeBSD-14.2-RELEASE-arm64-aarch64-zfs.raw +10G`)); run the image with the following script:

        ```
        !/bin/sh -x

        default_disk="FreeBSD-14.2-RELEASE-arm64-aarch64-zfs.raw"
        disk="${1:-$default_disk}"

        qemu-system-aarch64 \
        -m 4096M -M virt,accel=hvf \
        -cpu cortex-a72 \
        -bios edk2-aarch64-code.fd \
        -rtc base=localtime,clock=rt \
        -nographic \
        -serial mon:stdio \
        -device qemu-xhci \
        -device usb-kbd \
        -device usb-tablet \
        -device virtio-net,netdev=net0 \
        -netdev user,id=net0,hostfwd=tcp::2222-:22,hostfwd=tcp::3389-:3389 \
        -drive if=virtio,file=${disk},format=raw,cache=writethrough
        ```

    2. using [Amazon Lightsail](https://lightsail.aws.amazon.com/)

    3. using Amazon EC2

    All three suggest using [this Ansible playbook](https://github.com/FreeBSDFoundation/blog/blob/main/three-ways-to-try-freebsd-in-under-five-minutes/configure.yml) to get some stuff bootstrapped.

