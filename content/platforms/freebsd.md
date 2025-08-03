title=FreeBSD
tags=platform, os
summary=An operating system used to power modern servers, desktops, and embedded platforms.
~~~~~~

[Website](https://www.freebsd.org/) | [Download](https://www.freebsd.org/where/) | [Source](https://cgit.freebsd.org/)

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

