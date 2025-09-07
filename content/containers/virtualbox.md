title=VirtualBox
tags=container, vm, virtualization, platform, tool
summary=Virtualization layer/UI for most platforms.
~~~~~~

[Website](https://www.virtualbox.org/) | Source: `svn co https://www.virtualbox.org/svn/vbox/trunk vbox` | [Download](https://www.virtualbox.org/wiki/Downloads) | [Docs](https://www.virtualbox.org/wiki/Documentation)

## Reading

### Articles

* [I set up a self-hosted remote desktop inside a VM, and it feels like it's running on bare metal](https://www.xda-developers.com/set-up-self-hosted-remote-desktop-inside-vm/): "XRDP is an open-source tool that enables remote desktop access to the VM using the Remote Desktop Protocol. Here's how to install it and host your VM on your local network.

        sudo apt update && sudo apt upgrade -y
        sudo apt install xrdp xfce4 xfce4-goodies -y
        echo xfce4-session > ~/.xsession

        sudo systemctl enable xrdp
        sudo systemctl start xrdp

    "With that out of the way, it's time to configure VirtualBox's networking parameters to access the VM remotely. Shut down the VM. In VirtualBox, select your VM and go to Settings > Network. Set Adapter 1 to NAT. Then, click on Port Forwarding. Next to Rule 1, set the Protocol to TCP, Host Port to 3389, and Guest Port to 3389. Leave the other fields blank and click on OK to save."
