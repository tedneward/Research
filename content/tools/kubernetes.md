title=Kubernetes
tags=tool, platform, distribution, containers
summary=An open source container orchestration engine for automating deployment, scaling, and management of containerized applications.
~~~~~~

[Website](https://kubernetes.io/) | [Docs](https://kubernetes.io/docs/home/) | [Source](https://github.com/kubernetes/kubernetes)

Kubernetes is a portable, extensible, open-source platform for managing containerized workloads and services, that facilitates both declarative configuration and automation.

* [Kubernetes Deployment & Security Patterns](https://resources.linuxfoundation.org/LF+Projects/CNCF/TheNewStack_Book2_KubernetesDeploymentAndSecurityPatterns.pdf) - Alex Williams (PDF)
* [Kubernetes for Full-Stack Developers](https://www.digitalocean.com/community/curriculums/kubernetes-for-full-stack-developers) - Jamon Camisso, Hanif Jetha, Katherine Juell (PDF, EPUB)
* [Uncomplicating Kubernetes](https://livro.descomplicandokubernetes.com.br/en/) - Jeferson Fernando

Features:

* Automated rollouts and rollbacks: Kubernetes progressively rolls out changes to your application or its configuration, while monitoring application health to ensure it doesn't kill all your instances at the same time. If something goes wrong, Kubernetes will rollback the change for you. Take advantage of a growing ecosystem of deployment solutions.
* Service discovery and load balancing: No need to modify your application to use an unfamiliar service discovery mechanism. Kubernetes gives Pods their own IP addresses and a single DNS name for a set of Pods, and can load-balance across them.
* Storage orchestration: Automatically mount the storage system of your choice, whether from local storage, a public cloud provider such as GCP or AWS, or a network storage system such as NFS, iSCSI, Gluster, Ceph, Cinder, or Flocker.
* Secret and configuration management: Deploy and update secrets and application configuration without rebuilding your image and without exposing secrets in your stack configuration.
* Automatic bin packing: Automatically places containers based on their resource requirements and other constraints, while not sacrificing availability. Mix critical and best-effort workloads in order to drive up utilization and save even more resources.
* Batch execution: In addition to services, Kubernetes can manage your batch and CI workloads, replacing containers that fail, if desired.
* IPv4/IPv6 dual-stack: Allocation of IPv4 and IPv6 addresses to Pods and Services
* Horizontal scaling: Scale your application up and down with a simple command, with a UI, or automatically based on CPU usage.
* Self-healing: Restarts containers that fail, replaces and reschedules containers when nodes die, kills containers that don't respond to your user-defined health check, and doesn't advertise them to clients until they are ready to serve.
* Designed for extensibility: Add features to your Kubernetes cluster without changing upstream source code.

---

Kubernetes scope levels:

![](https://media-exp1.licdn.com/dms/image/C4D22AQFGGnID0n3O7w/feedshare-shrink_800/0/1646199387172?e=1649289600&v=beta&t=tOpWwoqDw4YOWpwnKN-OqSM_M53vSTPWdyQnyo1jlik)

Project (Strongest network/data/metadata isolation)
... contains Cluster(s) (Strongest control plane isolation, stronger network/data isolation, strong metadata isolation)
... contains Node(s) (stronger resource/network/data isolation)
... contains Pod(s) (Some network isolation, some more resource isolation)
... contains Container(s) (Some resource isolation, kernel security isolation)
... with Namespaces (Some control plane isolation, service account isolation) being inside Cluster and encircling Pods

---

## Articles

* [Kubernetes in-cluster traffic encryption using cert manager](https://medium.com/@mikhail_advani/kubernetes-in-cluster-traffic-encryption-using-cert-manager-b70c2101a12d)

---

## Related Projects

[kyverno](https://github.com/kyverno/kyverno): Kubernetes Native Policy Management

