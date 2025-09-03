title=Multipass
tags=container, virtualization, macos, windows, linux
summary=Ubuntu VMs on demand for any workstation.
~~~~~~

[Website](https://canonical.com/multipass)

## Reading

### Articles

* [How To Develop on a Linux Desktop With an Easy-To-Use VM](https://thenewstack.io/how-to-develop-on-a-linux-desktop-with-an-easy-to-use-vm/)

    To install Multipass on Linux, you’ll need a distribution that supports Snap. If you don’t already have Snap installed, it can be done with a command like:

            sudo apt-get install snapd -y

    If you’re using a Fedora-based distribution, the command is:

            sudo dnf install snapd -y

    If you use an Arch-based distribution, the process requires an AUR helper, which can be installed like so:

            git clone https://aur.archlinux.org/yay.git
            cd yay
            makepkg -si

    Install Snapd with:

            yay -Sy snapd

    Start and enable the service with the command:

            sudo systemctl enable –now snapd.socket

    If you’re using macOS, the installation requires Homebrew, which can be installed with:

            /bin/bash -c “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)”

    Once Homebrew is installed, add Multipass with:

            brew install –cask multipass

    Installing Multipass on Windows requires that you download the proper installer from the Multipass website. Once you’ve downloaded the installer, run it and walk through the wizard.

    Next, we’re going to launch a new virtual machine with Multipass. First, find the version of Ubuntu you want to use with:

            multipass find

    The above command will list all the available releases, of which we’ll use version 24.04 LTS. To launch the virtual machine, issue the command:

            multipass launch 24.04

    One the VM is launched, verify it with:

            multipass list

    With the VM running, access its shell with:

            multipass shell NAME

    Where NAME is the randomly generated name for the VM. You will immediately be taken to the bash prompt of the running VM.

    The VM will be text-based only, so we need to install the desktop. Before we can do that, update apt with:

            sudo apt-get update

    Next, we’ll install the Cinnamon desktop and an RDP client (hint, hint) with the command:

            sudo apt-get install cinnamon xrdp xorgxrdp -y

    The installation of the desktop will take anywhere from two to 10 minutes (depending on the power of your hosting machine).

    With the desktop installed, you’ll want to add a new user (so you can access the desktop via RDP). To do that, issue the command:

            sudo adduser USER

    Where USER is the name of the user.

    Give that new user sudo privileges by adding them to the sudo group with:

            sudo usermod -aG sudo USER

    Where USER is the name of the new user.

    You’re all set and ready to access the desktop.

    Note: If you run into an issue where there’s not enough disk space, you’ll need to stop the VM with:

            multipass stop NAME

    Where NAME is the name of the virtual machine.

    Resize the disk with:

            multipass set local.NAME.disk=SIZE

    Where NAME is the name of the VM and SIZE is the desired size (in GB).

    For example:

            multipass set local.worthwhile-cusk.disk=32G

    Before you attempt to access the desktop, you need to find the VM’s IP address, which can be done with the command:

            ip a

    The IP address will be in the form of 10.235.112.241

    Now that you’ve done that, make sure to reconfigure the Xsession-manager with the command:

            sudo update-alternatives –config x-session-manager

    Make sure to select the option for the Cinnamon desktop.

    Once you know the IP address, you’ll need to open an RDP client, such as Remmina. Point that client to the IP address of the virtual machine and then, when prompted, log in.
