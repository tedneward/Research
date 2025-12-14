title=Rocks (Ubuntu)
tags=container, cloud, format
summary=Ubuntu-based container images that meet the security, stability, and reliability requirements of cloud-native software.
~~~~~~

[Website](https://documentation.ubuntu.com/rockcraft/latest/explanation/rocks/) | 

Rocks comply with the Open Container Initiative’s (OCI) image format specification, and can be stored in any OCI-compliant container registry (e.g. DockerHub, ECR, ACR, ...) and used by any OCI-compliant tool (e.g. Docker, Podman, Kubernetes, ...).

Interoperability between rocks and other containers also extends to how container images are built, allowing rocks to be used as bases for existing build instructions, such as Dockerfiles, for further customisation and development.

A rock is:

* secure and stable: based on the latest and greatest Ubuntu releases;
* OCI-compliant: compatible with all the popular container management tools (Docker, Kubernetes, etc.);
* dependable: built on top of Ubuntu, with a predictable release cadence and timely security updates;
* production-grade: tested and secured by default.

---

# Rockcraft

[Website](https://documentation.ubuntu.com/rockcraft/latest/explanation/rockcraft/) | [Source](https://github.com/canonical/rockcraft) | [Manual (1.3.2)](https://documentation.ubuntu.com/_/downloads/rockcraft/en/1.3.2/pdf/)

---

# Chisel

Chisel is a software tool for extracting well-defined portions (aka slices) of Debian packages into a filesystem.

Using the analogy of a tool to carve and cut stone, Chisel is used in Rockcraft to sculpt minimal collections of files that only include what is needed for the rock to function properly.

See Cut existing slices for information about using the tool.

