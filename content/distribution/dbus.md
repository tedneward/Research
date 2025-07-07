title=D-Bus (Desktop Bus)
tags=distribution, messaging
summary=An Inter-Process Communication (IPC) and Remote Procedure Calling (RPC) mechanism specifically designed for efficient and easy-to-use communication between processes running on the same machine.
~~~~~~

[Website](https://www.freedesktop.org/wiki/Software/dbus/) | [Wikipedia](https://en.wikipedia.org/wiki/D-Bus) | [Source](https://gitlab.freedesktop.org/dbus/dbus) | [Protocol](http://dbus.freedesktop.org/doc/dbus-specification.html) | [Specification](http://dbus.freedesktop.org/doc/dbus-specification.html)

D-Bus is a message bus system, a simple way for applications to talk to one another. In addition to interprocess communication, D-Bus helps coordinate process lifecycle; it makes it simple and reliable to code a "single instance" application or daemon, and to launch applications and daemons on demand when their services are needed.

D-Bus supplies both a system daemon (for events such as "new hardware device added" or "printer queue changed") and a per-user-login-session daemon (for general IPC needs among user applications). Also, the message bus is built on top of a general one-to-one message passing framework, which can be used by any two apps to communicate directly (without going through the message bus daemon). Currently the communicating applications are on one computer, or through unencrypted TCP/IP suitable for use behind a firewall with shared NFS home directories. (Help wanted with better remote transports - the transport mechanism is well-abstracted and extensible.)

The dbus low-level API reference implementation and the D-Bus protocol have been heavily tested in the real world over several years, and are now "set in stone." Future changes will either be compatible or versioned appropriately.

The low-level libdbus reference library has no required dependencies; the reference bus daemon's only required dependency is an XML parser (expat). Higher-level bindings specific to particular frameworks (Qt, GLib, Java, C#, Python, etc.) add more dependencies, but can make more assumptions and are thus much simpler to use. The bindings evolve separately from the low-level libdbus, so some are more mature and ABI-stable than others; check the docs for the binding you plan to use.

