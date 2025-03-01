title=Backstage
tags=backend, platform, developer experience
summary=An open source framework for building developer portals.
~~~~~~

[Website](https://backstage.io/) | [Source](https://github.com/backstage/backstage#getting-started)

* Software Catalog: "It’s not just services; services, websites, libraries, data pipelines, and more can be discoverable there. Each team that owns one of these things owns the configuration of their Backstage presence. They make changes when the API is updated, owners change, or dependencies are added. Once you have this information centralized with the services, you might as well start adding more."
* Software Templates
* TechDocs
* Search Platform
* Kubernetes
* Customization w/plugins

Backstage is constructed out of three parts. We separate Backstage in this way because we see three groups of contributors that work with Backstage in three different ways.

* Core - Base functionality built by core developers in the open source project.
* App - The app is an instance of a Backstage app that is deployed and tweaked. The app ties together core functionality with additional plugins. The app is built and maintained by app developers, usually a productivity team within a company.
* Plugins - Additional functionality to make your Backstage app useful for your company. Plugins can be specific to a company or open sourced and reusable. At Spotify we have over 100 plugins built by over 50 different teams. It has been very powerful to get contributions from various infrastructure teams added into a single unified developer experience.

An **internal user** is an authenticated user that generally belongs to the organization of a particular Backstage deployment. These users are trusted to the extent that they are not expected to compromise the availability of Backstage, but they are not trusted to not compromise data confidentiality or integrity.

An **operator** is a user responsible for configuring and maintaining an instance of Backstage. Operators are fully trusted, since they operate the system and database and therefore have root access to the host system. Additional measures can be taken by adopters of Backstage in order to restrict or observe the access of this group, but that falls outside of the current scope of Backstage.

A **builder** is an internal or external code contributor and end up having a similar level of access as operators. When installing Backstage plugins you should vet them just like any other package from an external source. While it’s possible to limit the impact of for example a supply chain attack by splitting the deployment into separate services with different plugins, the Backstage project itself does not aim to prevent these kinds of attacks or in any other way sandbox or limit the access of plugins.

An **external user** is a user that does not belong to the other two groups, for example a malicious actor outside of the organization. The security model of Backstage currently assumes that this group does not have any direct access to Backstage, and it is the responsibility of each adopter of Backstage to make sure this is the case.

Backstage relies heavily on NPM packages, both for distribution of libraries, and structuring of code within projects.

There are many common facilities that are configured centrally and available to all Backstage backend plugins. For example there is a DatabaseService that provides access to a SQL database, SchedulerService for scheduling long-running tasks, LoggerService as a general logging facility, and UrlReaderService for reading content from external sources. These are all configured either directly in code, or within the backend block of the static configuration. The appropriate care needs to be taken to ensure that any secrets remain confidential and no malicious configuration is injected.



