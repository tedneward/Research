title=GraphQL Mesh
tags=distribution, storage
summary=Allows use of GraphQL query language to access data in remote APIs that don't run GraphQL (and also ones that do run GraphQL); can be used as a gateway to other services, or run as a local GraphQL schema that aggregates data from remote APIs.
~~~~~~

From the website:
> The goal of GraphQL Mesh is to let developers easily access services that are written in other APIs specs (such as gRPC, OpenAPI/Swagger, OData, SOAP/WSDL, Apache Thrift, Mongoose, PostgreSQL, Neo4j, and also GraphQL) with GraphQL queries and mutations.

> GraphQL Mesh gives the developer the ability to modify the output schemas, link types across schemas and merge schema types. You can even add custom GraphQL types and resolvers that fit your needs.

> It allows developers to control the way they fetch data, and overcome issues related to backend implementation, legacy API services, chosen schema specification and non-typed APIs.

> GraphQL Mesh is acting as a proxy to your data, and uses common libraries to wrap your existing API services. You can use this proxy locally in your service or application by running the GraphQL schema locally (with GraphQL execute), or you can deploy this as a gateway layer to your internal service.

> Note: GraphQL Mesh doesn’t aim to magically create your utopic public GraphQL schema - it’s just an easy-to-use proxy to your data, and you should consider implementing another layer that exposes your public data the way you need it to be.

[Source](https://github.com/Urigo/graphql-mesh) | [Announcement](https://medium.com/the-guild/graphql-mesh-query-anything-run-anywhere-433c173863b5)

