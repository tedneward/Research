title=OpenZiti
tags=distribution, zero-trust
summary=The world’s most used and widely integrated open source secure networking platform, providing both zero trust security and overlay networking as pure open source software.
~~~~~~

[Website](https://openziti.io/) | [Source](https://github.com/openziti/ziti)

In OpenZiti You Will Find

* A zero trust overlay mesh network composed of a controller, edge routers and fabric routers
* Numerous SDKs making it easy to embed zero trust principles directly into your application
* Tunneling applications providing zero trust access to those applications you cannot embed zero trust into directly
* Zero trust principles such as authorize before connect, continual authorization, least-privilege access

OpenZiti makes it easy to embed zero trust, programmable networking directly into your app. With OpenZiti you can have zero trust, high performance networking on any Internet connection, without VPNs!

## Concepts

### Zero Trust/Application Segmentation
Many networking security solutions act like a wall around an internal network. Once you are through the wall, you have access to everything inside. Zero trust solutions enforce not just access to a network, but access to individual applications within that network.

Every client in a Ziti system must have an identity with provisioned certificates. The certificates are used to establish secure communications channels as well as for authentication and authorization of the associated identity. Whenever the client attempts to access a network application, Ziti will first ensure that the identity has access to the application. If access is revoked, open network connections will be closed.

This model enables Ziti systems to provide access to multiple applications while ensuring that clients only get access to those applications to which they have been granted access.

In addition to requiring cert based authentication for clients, Ziti uses certificates to authorize communication between Ziti components.

### Dark Services and Routers
There are various levels of accessibility a network application/service can have.

1. Many network services are available to the world. The service then relies on authentication and authorization policies to prevent unwanted access.

2. Firewalls can be used to limit access to specific IP or ranges. This increases security at the cost of flexibility. Adding users can be complicated and users may not be able to easily switch devices or access the service remotely.

3. Services can be put behind a VPN or made only accessible to an internal network, but there are some downsides to this approach.
    * If you can access the VPN or internal network for any reason, all services in that VPN become more vulnerable to you.
    * VPNs are not usually appropriate for external customers or users.
    * For end users, VPNs add an extra step that needs to be done each time they want to access the service.

4. Services can be made dark, meaning they do not have any ports open for anyone to even try and connect to.

Making something dark can be done in a few ways, but the way it's generally handled in Ziti is that services reach out and establish one or more connections to the Ziti network fabric. Clients coming into the fabric can then reach the service through these connections after being authenticated and authorized.

Ziti routers, which make up the fabric, can also be dark. Routers located in private networks will usually be made dark. These routers will reach out of the private network to talk to the controller and to make connections to join the network fabric mesh. This allows the services and routers in your private networks to make only outbound connections, so no holes have to be opened for inbound traffic.

Services can be completely dark if they are implemented with a Ziti SDK. If this is not possible a Ziti tunneler or proxy can be co-located with the service. The service then only needs to allow connections from the local machine or network, depending on how close you colocate the proxy to the service.

### End-to-End Encryption
Ziti makes sure that when you connect to a service using a Ziti network, your connection is encrypted from start to finish. Each connection is secured through public-private-key cryptography provided by libsodium. This means that even if your service data is not encrypted on its own, the connection between the SDKs will be encrypted and only readable by the intended parties. This feature is available in all applications that use Ziti's SDKs, including Ziti's tunneler, desktop, and mobile applications.

Read more about end-to-end encryption and security for other connections on the Connection Security page.

### Controller
The controller is the central function of the network. The controller provides the configuration plane. It is responsible for configuring services as well as being the central point for managing the identities used by users, devices and the nodes making up the network. Lastly but critically, the controller is responsible for authentication and authorization for every connection in the network.

The controller must be configured with public key infrastructure (PKI). The configured PKI is used to create secure, mutually- authenticated TLS (mTLS) network connections between any two pieces of the network. The controller does not provide its own PKI but for the controller to sign a certificate signing request (CSR) the controller will need to be configured with a key and certificate used for signing. The ziti pki command can generate a PKI.

The controller also supports using a third-party PKI should the operator of the network have an existing PKI they wish to reuse. Utilizing a third-party CA pushes the burden of obtaining and distributing properly signed certificates to the operator of the network but for sophisticated customers this might make overall management of the network easier.

The controller uses a local database based on bbolt to store the information needed to manage the network.

The controller's TLS server employs SNI to select the correct certificate for presentation when there are multiple certificates. Ziti clients use ALPN to negotiate a connection to the control plane (ziti-ctrl) or the REST APIs (h2, http/1.1).

### Router
Routers are the fundamental building blocks of the network. These routers are responsible for securely and reliably delivering traffic from one network node to the destination.

Ziti Routers are linked together to form a mesh network. This mesh is constantly being monitored for latency and the fastest paths are used when routing traffic to the destination. The monitoring also allows for active failover to ensure a reliable network connection even in the case of a node failure.

The router is the entry point to the network for client connections. The router in combination with the controller is responsible for authenticating and authorizing clients.

### Edge Clients
Connecting to the network requires an edge client. Edge Clients are designed to work with both brownfield and greenfield applications.

If the solution being developed includes developing new software, Ziti SDKs target various languages and runtimes to provide fast, reliable and secure connectivity. These SDKs provide the capabilities needed to securely connect to the network and are designed to be easily incorporated into the target application.

When adding secure connectivity to an already existing solution, OpenZiti offers specialized Edge Clients called tunnelers which provide seamless, secure connectivity and do not require changes to the target application.

### BrowZer
BrowZer is a set of optional components which facilitate the bootstrapping of trust in a web browser without the need for client-side installations. This means there is no need to install an extension in web browsers, nor is there a need to install one of the mobile or desktop clients (tunnelers)!

It enables automatic embedding of zero trust networking into a web application, thus transforming a web browser (e.g. Chrome, Brave, or Edge) into a full-fledged client. The only software users need is the ubiquitous browser they already use every day.

Also noteworthy, is that BrowZer places no burden upon web application developers to first instrument or otherwise make any modifications to the web application itself in order to enable secure remote access.

BrowZer enables operating a web app licensed from a 3rd party and protecting it without the need for making alterations to it. Similarly, if the web app can be modified, but it is not desirable to do so, BrowZer allows OpenZiti to protect those apps as well. The BrowZer Bootstrapper does the necessary instrumentation of the web application automatically, on the fly, as it is being loaded from the web server to the user's browser.

To enable BrowZer in a given network, it must be configured. For information on how to add BrowZer to a network, follow the BrowZer quickstart guide

## Logical Components
Once the network is established and deployed the next step is to configure the software-powered network. The three main concepts necessary to configure a network are: Identities, Services, and Policies.

### Services
A service encapsulates the definition of any resource that could be accessed by a client on a traditional network. An service is defined by a strong, extensible identity, rather than by an expression of an underlay concept. This means that services defined on a network have an almost limitless "namespace" available for identifying services. An service is defined by a name and/or a certificate, rather than by a DNS name or an IP address (underlay concepts). Services also declare a node where traffic that exits the network needs to be sent to before exiting. The node where traffic enters the network may be the same node where traffic exits. Alternatively, traffic may need to traverse the network Routers to reach the exit node. Simply specifying the node is all the end-user need do, the network handles the rest.

### Identities
Identities represent individual endpoints in the network which can establish connectivity. All connections made within the network are mutually authenticated using X509 Certificates. Every Identity is mapped to a given certificate’s signature. edge clients present this certificate when initiating connections to the network. The presented certificate is used by the network to authorize the client and enumerate the services the Identity is authorized to use.

### Policies
Policies control how Identities, Services and Edge Routers are allowed to interact. In order to use a service the identity must be granted access to the service. Also, since all access to a service goes through one more edge routers, both the service and the identity must be granted to access to the same edge router or edge routers.

### Role Attributes
Entities such as identities, services and edge routers can be added to policies explicitly, either by id or name. Entities can also be tagged with role attributes. Role attributes are simple strings like sales, Boston, us-employees or support. Their meaning is decided by the administrator. Policies can include entities by specifying a set of role attributes to match.

### Service Policies
Service Policies encapsulate the mapping between identities and services in a software-powered network. In the simplest terms, Service Policies are a group of services and a group of identities. The act of adding a service to a Service Policy will grant the identities in that Service Policy access to the given service. Similarly, adding an identity to a Service Policy will grant that identity access to the services mapped in that Service Policy.

Service policies controls both which identities may dial a service (use the service) and which identities may bind a service (provide or host the service). Each Service Policy may either grant dial or bind access, but not both.

### Edge Router Policies
Edge Router Policies manage the mapping between identities and edge routers. edge router policies are a group of edge routers and a group of identities. Adding a router to an Edge Router Policy will grant the identities in that Edge Router Policy access to the given edge router. Similarly, adding an identity to an edge router policy will grant that identity access to the edge routers mapped in that edge router policy.

### Service Edge Router Policies
Service edge router policies manage the mapping between services and edge routers. Service edge router policies are a group of edge routers and a group of services. Adding an edge router to a Service Edge Router Policy will grant the services in that Service Edge Router Policy access to the given edge router. Similarly, adding a service to a Service edge router policy will grant that service access to the edge routers mapped in that Service edge router policy.

