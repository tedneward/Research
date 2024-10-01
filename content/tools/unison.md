title=Unison
tags=tool, file
summary=A file-synchronization tool for POSIX-compliant systems (e.g. *BSD, GNU/Linux, macOS) and Windows.
~~~~~~

[Source](https://github.com/bcpierce00/unison)

It allows two replicas of a collection of files and directories to be stored on different hosts (or different disks on the same host), modified separately, and then brought up to date by propagating the changes in each replica to the other.

Unison has been in use for over 20 years and many people use it to synchronize data they care about.

Features:

* Unison works across platforms, allowing you to synchronize a Windows laptop with a Unix server, for example.

* Unlike simple mirroring or backup utilities, Unison can deal with updates to both replicas of a distributed directory structure. Updates that do not conflict can be propagated automatically. Conflicting updates are detected and displayed.

* Unlike many network filesystems, Unison copies data so that already-synchronized data can be read and written while offline.

* Unlike most distributed filesystems, Unison is a user-level program that simply uses normal systems calls: there is no need to modify the kernel, to have superuser privileges on either host, or to have a FUSE implementation.

* Unison works between any pair of machines connected to the internet, typically communicating over ssh, but also directly over TCP. It is careful with network bandwidth, and runs well over slow links. Transfers of small updates to large files are optimized using a compression protocol similar to rsync.

* Unison is resilient to failure. It is careful to leave the replicas and its own private structures in a sensible state at all times, even in case of abnormal termination or communication failures.

* Unison can run in "repeat" mode with a filesystem monitor, so that changes are synchronized soon after they happen.

* Unison has a clear and precise specification.

