title=Reticulum
tags=distribution, cryptography
summary=A cryptography-based networking stack for building local and wide-area networks with readily available hardware.
~~~~~~

[Website](https://reticulum.network/) | [Source](https://github.com/markqvist/reticulum) | [Docs](https://reticulum.network/manual/index.html)

The vision of Reticulum is to allow anyone to operate their own sovereign communication networks, and to make it cheap and easy to cover vast areas with a myriad of independent, interconnectable and autonomous networks. Reticulum is Unstoppable Networks for The People.

Reticulum is not one network. It is a tool for building thousands of networks. Networks without kill-switches, surveillance, censorship and control. Networks that can freely interoperate, associate and disassociate with each other. Reticulum is Networks for Human Beings.

From a users perspective, Reticulum allows the creation of applications that respect and empower the autonomy and sovereignty of communities and individuals. Reticulum provides secure digital communication that cannot be subjected to outside control, manipulation or censorship.

Reticulum enables the construction of both small and potentially planetary-scale networks, without any need for hierarchical or beaureucratic structures to control or manage them, while ensuring individuals and communities full sovereignty over their own network segments.

**Notable Characteristics**
While Reticulum solves the same problem that any network stack does, namely to get data reliably from one point to another over a number of intermediaries, it does so in a way that is very different from other networking technologies.

* Reticulum does not use source addresses. No packets transmitted include information about the address, place, machine or person they originated from.
* There is no central control over the address space in Reticulum. Anyone can allocate as many addresses as they need, when they need them.
* Reticulum ensures end-to-end connectivity. Newly generated addresses become globally reachable in a matter of seconds to a few minutes.
* Addresses are self-sovereign and portable. Once an address has been created, it can be moved physically to another place in the network, and continue to be reachable.
* All communication is secured with strong, modern encryption by default.
* All encryption keys are ephemeral, and communication offers forward secrecy by default.
* It is not possible to establish unencrypted links in Reticulum networks.
* It is not possible to send unencrypted packets to any destinations in the network.
* Destinations receiving unencrypted packets will drop them as invalid.

## Getting Started

To install Reticulum and related utilities on your system, the easiest way is via pip:

    pip install rns

You can then start any program that uses Reticulum, or start Reticulum as a system service with the `rnsd` utility.

When first started, Reticulum will create a default configuration file, providing basic connectivity to other Reticulum peers that might be locally reachable. If any of those local peers are Transport Instances, these might connect you to wider networks. The default config file contains a few examples, and references for creating a more complex configuration.

For more detailed examples on how to expand communication over many mediums such as packet radio or LoRa, serial ports, or over fast IP links and the Internet using the UDP and TCP interfaces, take a look at the Supported Interfaces section of the Reticulum Manual.

Reticulum includes a range of useful utilities for managing your networks, viewing status and information, and other tasks. You can read more about these programs in the Included Utility Programs section of the Reticulum Manual.

* The system daemon `rnsd` for running Reticulum as an always-available service
* An interface status utility called `rnstatus`, that displays information about interfaces
* The path lookup and management tool `rnpath` letting you view and modify path tables
* A diagnostics tool called `rnprobe` for checking connectivity to destinations
* A simple file transfer program called `rncp` making it easy to copy files to remote systems
* The remote command execution program `rnx` that let's you run commands and programs and retrieve output from remote systems

All tools, including `rnx` and `rncp`, work reliably and well even over very low-bandwidth links like LoRa or Packet Radio.

