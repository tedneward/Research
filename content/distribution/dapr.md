title=Dapr
tags=distribution
summary=A portable, event-driven runtime that makes it easy for any developer to build resilient, stateless and stateful applications that run on the cloud and edge and embraces the diversity of languages and developer frameworks.
~~~~~~
[Website](https://dapr.io/) | [Source](https://github.com/dapr) | [Docs](https://docs.dapr.io/)

From the website:
> Today we are experiencing a wave of cloud adoption. Developers are comfortable with web + database application architectures (for example classic 3-tier designs) but not with microservice application architectures which are inherently distributed. It’s hard to become a distributed systems expert, nor should you have to. Developers want to focus on business logic, while leaning on the platforms to imbue their applications with scale, resiliency, maintainability, elasticity and the other attributes of cloud-native architectures.

> This is where Dapr comes in. Dapr codifies the best practices for building microservice applications into open, independent, building blocks that enable you to build portable applications with the language and framework of your choice. Each building block is completely independent and you can use one, some, or all of them in your application.

> In addition Dapr is platform agnostic meaning you can run your applications locally, on any Kubernetes cluster, and other hosting environments that Dapr integrates with. This enables you to build microservice applications that can run on the cloud and edge.

> Using Dapr you can easily build microservice applications using any language, any framework, and run them anywhere.

## Building Blocks
A building block is an HTTP or gRPC API that can be called from your code and uses one or more Dapr components.

Building blocks address common challenges in building resilient, microservices applications and codify best practices and patterns. Dapr consists of a set of building blocks, with extensibility to add new building blocks.

* **Service-to-service invocation** Resilient service-to-service invocation enables method calls, including retries, on remote services wherever they are located in the supported hosting environment.
* **State management** With state management for storing key/value pairs, long running, highly available, stateful services can be easily written alongside stateless services in your application. The state store is pluggable and can include Azure CosmosDB, Azure SQL Server, PostgreSQL, AWS DynamoDB or Redis among others.
* **Publish and subscribe** Publishing events and subscribing to topics
* **Resource bindings**	Resource bindings with triggers builds further on event-driven architectures for scale and resiliency by receiving and sending events to and from any external source such as databases, queues, file systems, etc.
* **Actors** A pattern for stateful and stateless objects that make concurrency simple with method and state encapsulation. Dapr provides many capabilities in its actor runtime including concurrency, state, life-cycle management for actor activation/deactivation and timers and reminders to wake-up actors.
* **Observability** Dapr emit metrics, logs, and traces to debug and monitor both Dapr and user applications. Dapr supports distributed tracing to easily diagnose and serve inter-service calls in production using the W3C Trace Context standard and Open Telemetry to send to different monitoring tools.
* **Secrets**	Dapr provides secrets management and integrates with public cloud and local secret stores to retrieve the secrets for use in application code.

### Components
Dapr uses a modular design where functionality is delivered as a component. Each component has an interface definition. All of the components are pluggable so that you can swap out one component with the same interface for another. The components contrib repo is where you can contribute implementations for the component interfaces and extends Dapr’s capabilities.

A building block can use any combination of components. For example the actors building block and the state management building block both use state components. As another example, the Pub/Sub building block uses Pub/Sub components.

You can get a list of current components available in the current hosting environment using the dapr components CLI command.

* **State stores** State store components are data stores (databases, files, memory) that store key-value pairs as part of the state management building block.
* **Service discovery** Service discovery components are used with the service invocation building block to integrate with the hosting environment to provide service-to-service discovery. For example, the Kubernetes service discovery component integrates with the Kubernetes DNS service and self hosted uses mDNS.
* **Middleware** Dapr allows custom middleware to be plugged into the request processing pipeline. Middleware can perform additional actions on a request, such as authentication, encryption and message transformation before the request is routed to the user code, or before the request is returned to the client. The middleware components are used with the service invocation building block.
* **Pub/sub brokers** Pub/sub broker components are message brokers that can pass messages to/from services as part of the publish & subscribe building block.
* **Bindings** External resources can connect to Dapr in order to trigger a service or be called from a service as part of the bindings building block.
* **Secret stores** In Dapr, a secret is any piece of private information that you want to guard against unwanted users. Secrets stores are used to store secrets that can be retrieved and used in services.

### Observability
When building an applications, understanding how the system is behaving is an important part of operating it - this includes having the ability to observe the internal calls of an application, gauging its performance and becoming aware of problems as soon as they occur. This is challenging for any system but even more so for a distributed system comprised of multiple microservices where a flow, made of several calls, may start in one microservices but continue in another. Observability is critical in production environments but also useful during development to understand bottlenecks, improve performance and perform basic debugging across the span of microservices.

While some data points about an application can be gathered from the underlying infrastructure (e.g. memory consumption, CPU usage), other meaningful information must be collected from an “application aware” layer - one that can show how an important series of calls is executed across microservices. This usually means a developer must add some code to instrument an application for this purpose. Often, instrumentation code is simply meant to send collected data such as traces and metrics to an external monitoring tool or service that can help store, visualize and analyze all this information.

Having to maintain this code, which is not part of the core logic of the application, is another burden on the developer, sometimes requiring understanding monitoring tools APIs, using additional SDKs etc. This instrumentation may also add to the portability challenges of an application which may require different instrumentation depending on where the application is deployed. For example, different cloud providers offer different monitoring solutions and an on-prem deployment might require an on-prem solution.

* **Logging** Dapr generates logs to provide visibility into sidecar operation and to help users identify issues and perform debugging. Log events contain warning, error, info, and debug messages produced by Dapr system services. Dapr can also be configured to send logs to collectors such as Fluentd and Azure Monitor so they can be easily searched, analyzed and provide insights.
* **Metrics** Metrics are the series of measured values and counts that are collected and stored over time. Dapr metrics provide monitoring capabilities to understand the behavior of the Dapr sidecar and system services. For example, the metrics between a Dapr sidecar and the user application show call latency, traffic failures, error rates of requests etc. Dapr system services metrics show sidecar injection failures, health of the system services including CPU usage, number of actor placements made etc.
* **Health checks** The Dapr sidecar exposes an HTTP endpoint for health checks. With this API, user code or hosting environments can probe the Dapr sidecar to determine its status and identify issues with sidecar readiness.

### Security
Several of the areas above are addressed through encryption of data in transit. One of the security mechanisms that Dapr employs for encrypting data in transit is mutual authentication TLS or mTLS. mTLS offers a few key features for network traffic inside your application:

Two way authentication - the client proving its identity to the server, and vice-versa
An encrypted channel for all in-flight communication, after two-way authentication is established
Mutual TLS is useful in almost all scenarios, but especially so for systems subject to regulations such as HIPAA and PCI.

Dapr enables mTLS and all the features described in this document in your application with little to no extra code or complex configuration inside your production systems

* **Sidecar-to-app communication** The Dapr sidecar runs close to the application through localhost, and is recommended to run under the same network boundary as the app. While many cloud-native systems today consider the pod level (on Kubernetes, for example) as a trusted security boundary, Dapr provides user with API level authentication using tokens. This feature guarantees that even on localhost, only an authenticated caller may call into Dapr.

* **Sidecar-to-sidecar communication** Dapr includes an “on by default”, automatic mutual TLS that provides in-transit encryption for traffic between Dapr sidecars. To achieve this, Dapr leverages a system service named Sentry which acts as a Certificate Authority (CA) and signs workload (app) certificate requests originating from the Dapr sidecar. Dapr also manages workload certificate rotation, and does so with zero downtime to the application. Sentry, the CA service, automatically creates and persists self signed root certificates valid for one year, unless existing root certs have been provided by the user. When root certs are replaced (secret in Kubernetes mode and filesystem for self hosted mode), the Sentry picks them up and re-builds the trust chain without needing to restart, with zero downtime to Sentry. When a new Dapr sidecar initializes, it first checks if mTLS is enabled. If it is, an ECDSA private key and certificate signing request are generated and sent to Sentry via a gRPC interface. The communication between the Dapr sidecar and Sentry is authenticated using the trust chain cert, which is injected into each Dapr instance by the Dapr Sidecar Injector system service. In a Kubernetes cluster, the secret that holds the root certificates is scoped to the namespace in which the Dapr components are deployed to and is only accessible by the Dapr system pods. Dapr also supports strong identities when deployed on Kubernetes, relying on a pod’s Service Account token which is sent as part of the certificate signing request (CSR) to Sentry. By default, a workload cert is valid for 24 hours and the clock skew is set to 15 minutes. Mutual TLS can be turned off/on by editing the default configuration that is deployed with Dapr via the spec.mtls.enabled field. This can be done for both Kubernetes and self hosted modes. Details for how to do this can be found here.

* **Sidecar to system services communication** In addition to automatic mTLS between Dapr sidecars, Dapr offers mandatory mTLS between the Dapr sidecar and the Dapr system services, namely the Sentry service (Certificate Authority), Placement service (actor placement) and the Kubernetes Operator. When mTLS is enabled, Sentry writes the root and issuer certificates to a Kubernetes secret that is scoped to the namespace where the control plane is installed. In self hosted mode, Sentry writes the certificates to a configurable filesystem path. In Kubernetes, when the Dapr system services start, they automatically mount the secret containing the root and issuer certs and use those to secure the gRPC server that is used by the Dapr sidecar. In self hosted mode, each system service can be mounted to a filesystem path to get the credentials. When the Dapr sidecar initializes, it authenticates with the system pods using the mounted leaf certificates and issuer private key. these are mounted as environment variables on the sidecar container.

### Dapr and service meshes
**How Dapr compares to, and works with service meshes** Dapr uses a sidecar architecture, running as a separate process alongside the application and includes features such as, service invocation, network security and distributed tracing. This often raises the question - how does Dapr compare to service mesh solutions such as Linkerd, Istio and Open Service Mesh (OSM)?

**How Dapr and service meshes compare** While Dapr and service meshes do offer some overlapping capabilities, Dapr is not a service mesh where a service mesh, is defined as a networking service mesh. Unlike a service mesh which is focused on networking concerns, Dapr is focused on providing building blocks that make it easier for developers to build applications as microservices. Dapr is developer-centric versus service meshes being infrastructure-centric.

In most cases, developers do not need to be aware that the application they are building will be deployed in an environment which includes a service mesh since a service mesh intercepts network traffic. Service meshes are mostly managed and deployed by system operators. However, Dapr building block APIs are intended to be used by developers explicitly in their code.

Some common capabilities that Dapr shares with service meshes include:

* Secure service-to-service communication with mTLS encryption
* Service-to-service metric collection
* Service-to-service distributed tracing
* Resiliency through retries

Importantly Dapr provides service discovery and invocation via names which is a developer centric concern. This means that through Dapr’s service invocation API, developers call a method on a service name, whereas service meshes deal with network concepts such as IPs and DNS addresses. However, Dapr does not provide capabilities for traffic behavior such as routing or traffic splitting. Traffic routing is often addressed with ingress proxies to an application and does not have to use a service mesh. In addition, Dapr does provides other application level building blocks for state management, pub/sub messaging, actors and more.

Another difference between Dapr and service meshes is with observability (tracing and metrics). Service meshes operate at the network level and trace the network calls between services. Dapr does this with service invocation, however Dapr also provides observability (tracing and metrics) over pub/sub calls using trace ids written into the Cloud Events envelope. This means that the metrics and tracing with Dapr is more extensive than with a service mesh for applications that use both service-to-service invocation and pub/sub to communicate.

**Using Dapr with a service mesh** Dapr does work with service meshes. In the case where both are deployed together, both Dapr and service mesh sidecars are running in the application environment. In this case, it is recommended to configure only Dapr or only the service mesh to perform mTLS encryption and distributed tracing.

**When to choose using Dapr, a service mesh or both** Should you be using Dapr, a service mesh or both? The answer depends on your requirements. If, for example, you are looking to use Dapr for one or more building blocks such as state management or pub/sub and considering using a service mesh just for network security or observability, you may find that Dapr is a good fit and a service mesh is not required.

Typically you would use a service mesh with Dapr where there is a corporate policy that traffic on the network needs to be encrypted regardless for all applications. For example, you may be using Dapr in only part of your application and other services and processes that are not using Dapr in your application also need encrypted traffic. In this scenario a service mesh is the better option and most likely you should use mTLS and distributed tracing on the service mesh and disable this on Dapr.

If you need traffic splitting for A/B testing scenarios you would benefit from using a service mesh, since Dapr does not provide these capabilities.

In some cases, where you require capabilities that are unique to both you will find it useful to leverage both Dapr and a service mesh - as mentioned above, there is no limitation for using them together.

### Dapr terminology and definitions
Term | Definition
-----+-----------
App/Application|A running service/binary, usually that you as the user create and run.	
Building block|An API that Dapr provides to users to help in the creation of microservices and applications.
Component|Modular types of functionality that are used either individually or with a collection of other components, by a Dapr building block.
Configuration|A YAML file declaring all of the settings for Dapr sidecars or the Dapr control plane. It is here where you can configure control plane mTLS settings, or the tracing, and middleware settings for an application instance.
Dapr|Distributed Application Runtime.
Dapr control plane|A collection of services that are part of a Dapr installation on a hosting platform such as a Kubernetes cluster. Allow Dapr enabled applications to run on that platform and handles Dapr capabilities such as actor placement, Dapr sidecar injection or certificate issuance/rollover.
Self-hosted|Windows/macOS/Linux machine(s) where you can run your applications with Dapr. Dapr provides capabilities to run on machines in “self-hosted” mode.
Service|A running application or binary. Can be used to refer to your application, or a Dapr application.	
Sidecar|A program that runs alongside your application as a separate process or container.




