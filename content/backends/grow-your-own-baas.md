title="Grow Your Own BaaS"
tags=backend, reading, architecture
summary=In this paper, the concepts of growing your own Backend-as-a-Service (BaaS) platform using vendor agnostic concepts are explored. The proposal is to define, architect, and design a heterogeneous micro-applications based platform.
~~~~~~
(November 2016)

"In this paper, the concepts of growing your own Backend-as-a-Service (BaaS) platform using vendor agnostic concepts are explored. The proposal is to define, architect, and design a heterogeneous micro-applications based platform. The BaaS platform is a critical business resource and growing your own is required to avoid vendor lock-in, platform shutdown/sunsetting/retirement, or any adverse changes.

"An introduction is given on the concepts of BaaS. A short overview about the current state of research and existing solutions is provided. To set the scope, application requirements are documented. The micro-application BaaS architecture and design is given at the conceptual level to allow for implementations using current or future tooling. Details are discussed on how to implement the platform. We conclude with the future state for BaaS platforms."

[Paper](https://www.researchgate.net/publication/315497432_Grow_your_own_Backend-as-a-Service_BaaS_platform)

### Notes
(All emphasis mine; direct quotes from the paper are quoted.)

**I. Introduction**

These are exciting times; low entry into software dev; if you want to focus on your logic and not scaling, Backend-as-a-Service is something to use. Pro-cloud arguments here. "The goal of the BaaS platform is to help businesses solve their backend dilemmas." As developers realize the value, more apps built on Backends will emerge. *(True)* "With all the service offerings provide by the BaaS platform to all your apps, it quickly becomes a mission critical business resource. ***Ownership is key.***"

"Our argument in this paper is for you to grow your own BaaS. We will explore what is required, how the architecture and design is constructed, and how you would build it. Many advantages, you have (ideally own) the source code, you build what you need at the time, and you grow your platform for your needs."

**II. Research**

"BaaS sits near the middle of the spectrum of 'aaS' offerings. At its core, BaaS platforms enable you to store your data without the headaches and cost of developing and maintaining unique services for each application. ***A BaaS couples a basic data store with expressive user provisioning and authentication tools.*** As an app developer, think of it like a NoSQL database someone else manages for you off in the cloud, except that access is via a REST API. Cloud-based storage is just the beginning of a BaaS offering. 

* **Storage**: Every BaaS provider will offer some kind of data storage. Some will offer schema-less and others more structured abilities. Storage of any type of data will be managed using APIs. The ability to query, sort, page, and filter is required. More advanced features might include data connectors to sync cloud-based data to other on premise data stores.
* **Dashboard**: The ability to manage your data and users through some sort of portal is important. While all the services can be performed via APIs, having a UI is often time saving and informative. The option to manage data, services, users, authorization, and to view reports is a nice feature. 
* **User Administration**: User provisioning and authentication: important in most apps since apps need to limit who can access what data and services are available. A common example is a doctor should only have access to his or her patients, not every patient in the application. A BaaS allows you to configure "groups" of users and then determine what data they should be able to access through Access Control Lists (ACLs). Platforms need role-based user permissions and granular claims-based permissions. Also, 3rd party authentication with sites like Facebook, Twitter, Goggle, and others is helpful.
* **Analytics**: The ability to track API calls is important. This gives you a view on who, when, and how often someone is using your BaaS. Having the ability to track performance, errors, events, and storage usage is important. Personalization for your users will deliver a better user experience.
* Additional features: Push notifications; Social integration; Personalization; File, photos, & assets management; Geolocation; Multiple Mobile Platform SDKs; Custom code Integration; Background Jobs; Configuration

**III. Requirements***

Basic buy-vs-build tradeoffs. Important questions: "Do you have the time, skills, and resources necessary to pull this option off? Do you need to have more control over code, reliability, performance, features, and costs?"

"For this paper, the goal is to introduce BaaS and show how you would grow your own. To keep things simple and clear, the first release will be constrained to include just the storage offering discussed in the previous section. For our first release, v1, we will include:

1. Name
2. The ability to create new databases and collections
3. An API to perform Create, Read, Update, and Delete (CRUD) operations on the data.
4. The ability to query, sort, filter, and page the data.

"As you can see from the v1 release, this is the core of the data service for storage. Building our release roadmap, we will work through the service offerings listed in the previous section as needed for apps we are building." Claims to be opensource, but Github repo linked from the paper is empty except for a README.

**IV. Architecture**

"... the architecture and methodology focuses on:

* Simplicity: A consistent and modular architecture
* Flexibility: Change and add service offerings quickly
* Extensibility: Easy to add new service offerings without impacts to other offerings and the platform.

"The foundation for the architecture is based on the concepts of growing heterogeneous Micro-Applications by incremental development [9] as shown in Fig. 1. This fits well with our requirements for the BaaS will be grown in increments based on the need. This keeps the architecture and budget lean. With this strategy, each service offering will be a micro-application. This will allow each application to adapt to new and changing business needs independent of vendor. This also positions for the use of and inclusion of other micro-applications that extend or replace platform offerings. For example, the dashboard offering (micro-app) will change at a faster rate than others due to the rapid changing user interface designs and technologies. The platform acts as the gateway and can support multiple dashboard offerings. The platform has the ability to phase in such offerings. Together, this allows for a better adaption and transition when there is change.

"To accomplish the above goals, the platform is built around a layered, modular architecture. But, what does that really mean you might ask? It means that individual pieces of functionality are self-contained: the storage offering and its components should just be built for storage, not a sprawling monolith of other functionality, and should be portable between other BaaS solutions with a minimum of dependencies. When you're developing micro-apps that you would like exposed across multiple areas of the platform it'll need to be added to the platform layer. The platform will proxy and route the request to the new offering. This provides a layer of protection so future changes can be transparent to the calling application.

"The architecture for our BaaS Platform is an API first design following the beyond [twelve-factor application principles](https://pivotal.io/beyond-the-twelve-factor-app). The platform is the API gateway for all requests and can have one or more service offerings. Each service offering is built following the micro-application principles [9]. Each app is built on a software development stack chosen by the product team (the team building the app). There is an Object Data Manager (ODM) to communicate to the data store. As with any application, the micro-applications can leverage the service offerings of other micro-applications. This dependency is done in a hierarchy pattern to avoid circular coupling and dependencies. For example, the storage offering will be used by other offerings, so it is at the bottom of the dependency tree."

**V. Implementation Details**

"The goal of the framework is to abstract the details of implementation from the consumers. The consuming application only need to know the APIs and what resources are available. An API represents a contract between the service and those who consume the service. Building an API is one of the most important tasks. By having a simple API, the BaaS has the potential to become a platform from which other services will grow and other applications will use.

"This starts with the implementation of the platform. The platform is an API gateway that coordinates the requests to the micro-applications and the returning responses. The gateway is very light weight and its main responsibility is to route traffic. If features are required, the platform should use micro-apps, for such things as access control, rate limits, usage policies, analytics, monitoring, logging, and management. In Pondwater, we grow our own platform API gateway to include some of the key most basic features often needed for API management [11].

"The implementation of the micro-apps follows a RESTful API design. The consumer, a client application capable of making HTTP requests, interact with platform via APIs. The HTTP protocol is used for communication over a network. The platform defines endpoints, API URLs on the server that represents the services provided and what resources are available. The platforms API gateway calls the corresponding micro-application.

Standard Verbs are used for request. The URI for the API is based on the service offering. The verb GET retrieves a specific resource from the server. The POST verb creates a new resource on the server while the PUT verb updates the resource. DELETE removes a resource. The pattern for verbs and URI stems is shown in Table 1 along with examples for the storage offering. The pattern includes the service offering, the version, and the requested resource. 

```
Pattern  : /:service-offering/:version/:resource
POST     : /store/:db/:collection {JSON data in body}
GET (set): /store/:db/:collection?query,fields,sort,skip,limit
GET (1)  : /store/:db/:collection/:_id
PUT      : /store/:db/:collection/:_id {JSON updates in body}
DELETE   : /store/:db/:collection/:_id 
```

"As shown in the API pattern, versioning is an important implementation detail. The URI is formed by api/:serviceoffering/:version/:service-specifics. If you are simply adding new features to your API, such as a new attribute on a resource or new endpoints, you do not need to increment your API version number since the changes do not break backwards compatibility. Over time, the need to break a contract will be required. The API design allows for and tracks multiple versions of the service offering by placing the version in a URL segment. This will allow consumers to consume the newer version when they are ready. Older versions will be depreciated. The version is by service offering. This allows for each offering to be added or updated based on its schedule. It also minimizes impacts and coupling, by only impacting the consumer based on a specific offering and not the entire platform. This gives the consumer more options, to consume some updates quicker and others based on need and schedule.

The response is a critical implementation detail. Each resource returned by an API must have resource attributes defined. The exact metadata for the attributes depends on the platform and service offering. For the developer, knowing the details about the data return is critical. 

**VI. Future State**

"When growing a platform, it should be a rule that it will be heterogeneous. Heterogeneous by default should be a design and development practice. The computational fields are growing at a rapid rate and heterogeneous aspects must be embraced and supported. The rule for growing a platform is the fact that it will be composed of applications on different platforms, written in different languages, using different stores, and running in different processes. This is the future for BaaS platforms."

