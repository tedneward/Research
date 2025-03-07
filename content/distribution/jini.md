title=Jini (Apache River)
tags=distribution, library, jvm, rpc
summary=A programming model to build adaptive network systems that are scalable, evolvable, and flexible.
~~~~~~

Jini first let me understand the power of dynamic lookup ("discovery") of services or clients in a distributed application. Of what's left of Jini in the world, I suspect that this convept of discovery alone is the only real interesting element left, unless somebody wants to think about Jini being WASM components that can then execute anywhere again. (One of the selling points of Jini was the class-server concept, below, allowing for dynamic distribution of new code into an already-executing network, which has some interesting nuggets of an idea, but also has to be secured beyond any reasonable doubt to avoid hosting malware.)

[Website](https://river.apache.org/index.html) | [Source](https://river.apache.org/dev-doc/source-code.html) (SVN) | [Specification](https://river.apache.org/release-doc/current/index.html) | [Old Jini Specifications](https://pfirmstone.github.io/JGDMS/old-static-site/doc/spec-index.html)

Communication: [JERI](https://river.apache.org/release-doc/current/api/net/jini/jeri/connection/doc-files/mux.html) with implementations for TCP, SSL, HTTP, HTTPS, Kerberos+TCP and JRMP (Java RMI Protocol)

Basic services: locking, distributed events, leasing, transactions. Extended services: [Tuple spaces](https://en.wikipedia.org/wiki/Tuple_space)

Multiple models of connection initiation:

* Service and client, no dynamic discovery

* Cmbination of service, client, and registry: allows for automatic discovery of any of them--the VM hosting the service registers it in the registry

* Service, client, registry, and class-server: on-demand distribution of compiled code (JVM class files downloaded via class-server)

[A nice summary of Jini](https://docs.gigaspaces.com/xap/12.2/overview/about-jini.html) from Gigaspaces | [Jan Newmarch's Guide to Jini](https://jan.newmarch.name/java/jini/tutorial/Jini.html) (circa 2006)



