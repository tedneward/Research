title=Virt-Manager
tags=container, virtualization
summary=A GUI front end for KVM (Kernel-Based Virtual Machine) that manages virtual machines through libvirt.
~~~~~~

## Getting Started

Ubuntu/Debian: `sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager -y`

After the installation, make sure to start and enable libvirt with:

    sudo systemctl enable --now libvirtd

You might also need to add your user to the libvirt group with the command:

    sudo usermod -aG libvirt $USER

After that, log out and log back in so the changes take effect.

## Reading

### Articles

- https://www.zdnet.com/article/virt-manager-better-more-reliable-vm-manager-than-virtualbox/

