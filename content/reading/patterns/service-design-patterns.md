title=Service Design Patterns
tags=reading, books, patterns, distribution, architecture
summary=Collection of patterns specific to services.
~~~~~~
*(by Robert Daigneau, Addison-Wesley (ISBN-13 978-0-321-54420-9) )*


### Web Service API Styles

* **RPC API** (18): How can clients execute remote procedures over HTTP?
* **Message API** (27): How can clients send commands, notifications, or other information to remote systems over HTTP while avoiding direct coupling to remote procedures?
* **Resource API** (38): How can a client manipulate data managed by a remote system, avoid direct coupling to remote procedures, and minimize the need for domain-specific APIs?


### Client-Service Interaction Styles

* **Request/Response** (54): What's the simplest way for a web service to process a request and provide a result?
* **Request/Acknowledge** (59): How can a web service safeguard systems from spikes in request load and ensure that requests are processed even when the underlying systems are unavailable?
* **Media Type Negotiation** (70): How can a web service provide multiple representations of the same logical resource while minimizing the number of distinct URIs for that resource?
* **Linked Service** (77): Once a service has processed a request, how can a client discover the related services that may be called, and also be insulated from changing service locations and URI patterns?


### Request and Response Management

* **Service Controller** (85): How can the correct web service be executed without having to write complex parsing and routing logic?
* **Data Transfer Object** (94): How can one simplify manipulation of request and response data, enable domain layer entities, requests, and responses to vary independently, and insulate services from wire-level message formats?
* **Request Mapper** (109): How can a service process data form requests that are structurally different yet semantically equivalent?
* **Response Mapper** (122): How can the logic required to construct a response be reused by multiple services?


### Web Service Implementation Styles

* **Transaction Script** (134): How can developers quickly implement web service logic?
* **Datasource Adapter** (137): How can a web service provide access to internal resources like database tables, stored procedures, domain objects or files with a minimum amount of custom code?
* **Operation Script** (144): How can web services reuse common domain logic without duplicating code?
* **Command Invoker** (149): How can web services with different APIs reuse common domain logic while enabling both synchronous and asynchronous request processing?
* **Workflow Connector** (156): How can web services be used to support complex and long-running business processes?


### Web Service Infrastructures

* **Service Connector** (168): How can clients avoid duplicating the code required to use a specific service and also be insulated from the intricacies of communication logic?
* **Service Descriptor** (175): How can development tools acquire the information necessary to use a web service, and how can the code for Service Connectors be generated?
* **Async Response Handler** (184): How can a client avoid blocking when sending a request?
* **Service Interceptor** (195): How can common behaviors like authentication, caching, logging, exception handling, and validation be executed without having to modify the client or service code?
* **Idempotent Retry** (206): How can a client ensure that requests are delivered to a web service despite temporary network or server failures?
* **Service Registry** (220): 
* **Enterprise Service Bus** (221): 
* **Orchestration Engine** (224): 


### Web Service Evolution

* **Single-Message Argument** (234): How can a web service with an RPC API (18) become less brittle and easily accommodate new parameters over time without breaking clients?
* **Dataset Amendment** (237): How can a service augment the information it sends or receives while minimizing the probability of breaking changes?
* **Tolerant Reader** (243): How can clients or services function properly when some of the content in the messages or media types they receive is unknown or when the data structures vary?
* **Consumer-Driven Contracts** (250): How can a web service API reflect its clients' needs while enabling evolution and avoiding breaking clients?
