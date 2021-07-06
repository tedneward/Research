title=Apache Usergrid
tags=backend, jvm
summary=an open-source Backend-as-a-Service (“BaaS” or “mBaaS”) composed of an integrated distributed NoSQL database, application layer and client tier with SDKs for developers looking to rapidly build web and/or mobile applications.
~~~~~~

[Website](http://usergrid.apache.org/) | [Source](http://github.com/apache/usergrid)

It provides elementary services (user registration & management, data storage, file storage, queues) and retrieval features (full text search, geolocation search, joins) to power common app features.

It is a multi-tenant system designed for deployment to public cloud environments (such as Amazon Web Services, Rackspace, etc.) or to run on traditional server infrastructures so that anyone can run their own private BaaS deployment.

For architects and back-end teams, it aims to provide a distributed, easily extendable, operationally predictable and highly scalable solution. For front-end developers, it aims to simplify the development process by enabling them to rapidly build and operate mobile and web applications without requiring backend expertise.

* Users: Sign up users, log in, reset passwords and more, in just one API call. You can put users in groups, assign roles or permissions, let users follow each other and access everything via OAuth 2.0, without writing a single line of server code.

* Data: If you can express it in JSON, we can store it! Underneath everything is stored in a standard Cassandra instance, but we’ve added the ability to retrieve data via an SQL-like syntax, manage collections and connections between entities.

* Files: Our asset storage can handle anything from text files to videos of several terrabytes, with automatic content-detection and full URL access control. In the back, everything goes Amazon S3 or other preferred cloud file store.

