title=Containers
category=container
type=categorypage
summary=Collection of thoughts/essays/etc on software containers.
tags=container, virtualization
~~~~~~

A container is a software "shell" designed to run other software within it. This can include traditional virtualization a la VMWare or VirtualBox, or more modern container software like Docker or Podman.

## Reading

### Articles/Blogs/Essays

* ["How Container Filesystem Works: Building a Docker-like Container From Scratch"](https://labs.iximiuz.com/tutorials/container-filesystem-from-scratch): "In this post, we'll assemble a tiny but realistic, Docker-like container using only stock Linux tools: unshare, mount, and pivot_root. No runtime magic and (almost) no cut corners. Along the way, you'll see why the mount namespace is the bedrock of container isolation, while other namespaces, such as PID, cgroup, UTS, and even network, play rather complementary roles."
* ["How Container Networking Works: BUilding a Bridge Network From Scratch"](https://labs.iximiuz.com/tutorials/container-networking-from-scratch): "In this article, we are going to answer the following questions: How to virtualize network resources to make containers think they have individual network environments? How to turn containers into friendly neighbors and teach to communicate with each other? How to reach the outside world (e.g. the Internet) from the inside of a container? How to reach containers running on a Linux host from the outside world? How to implement Docker-like port publishing? While answering these questions, we'll set up a single-host container network from scratch using standard Linux tools. As a result, it'll become apparent that the magic of container networking emerges from a combination of much more basic Linux facilities: Network namespaces (netns); Virtual Ethernet devices (veth); Virtual network switches (bridge); IP routing and network address translation (NAT)."
* ["How to Develop on a Linux Desktop With an Easy-to-Use VM"](https://thenewstack.io/how-to-develop-on-a-linux-desktop-with-an-easy-to-use-vm/)
