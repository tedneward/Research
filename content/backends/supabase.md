title=Supabase
tags=backend, storage, platform
summary=Backend server with REST APIs to manage core backend needs.
~~~~~~

[Website](https://supabase.io/) | [Github](https://github.com/supabase/supabase)

Connects to an existing [PostgresQL](/storage/postgresql) database.

Features

* Dashboard/UI for spinning up and managing your database in less than one minute.
* User authentication to sign up users and edit access rules on your database.
* Real-time database listeners.
* JavaScript library and APIs.
* Functions

[Supabase](https://supabase.com/) is the Postgres development platform. We're building the features of Firebase using enterprise-grade open source tools.

-    Hosted Postgres Database. [Docs](https://supabase.com/docs/guides/database)
-    Authentication and Authorization. [Docs](https://supabase.com/docs/guides/auth)
-    Auto-generated APIs.
    -    REST. [Docs](https://supabase.com/docs/guides/api)
    -    GraphQL. [Docs](https://supabase.com/docs/guides/graphql)
    -    Realtime subscriptions. [Docs](https://supabase.com/docs/guides/realtime)
-    Functions.
    -    Database Functions. [Docs](https://supabase.com/docs/guides/database/functions)
    -    Edge Functions [Docs](https://supabase.com/docs/guides/functions)
-    File Storage. [Docs](https://supabase.com/docs/guides/storage)
-    AI + Vector/Embeddings Toolkit. [Docs](https://supabase.com/docs/guides/ai)
-    Dashboard

## How it works

Supabase is a combination of open source tools. We’re building the features of Firebase using enterprise-grade, open source products. If the tools and communities exist, with an MIT, Apache 2, or equivalent open license, we will use and support that tool. If the tool doesn't exist, we build and open source it ourselves. Supabase is not a 1-to-1 mapping of Firebase. Our aim is to give developers a Firebase-like developer experience using open source tools.

**Architecture**

Supabase is a [hosted platform](https://supabase.com/dashboard). You can sign up and start using Supabase without installing anything. You can also [self-host](https://supabase.com/docs/guides/hosting/overview) and [develop locally](https://supabase.com/docs/guides/local-development).

[![Architecture](https://github.com/supabase/supabase/raw/master/apps/docs/public/img/supabase-architecture.svg)](https://github.com/supabase/supabase/blob/master/apps/docs/public/img/supabase-architecture.svg)

-   [Postgres](https://www.postgresql.org/) is an object-relational database system with over 30 years of active development that has earned it a strong reputation for reliability, feature robustness, and performance.
-   [Realtime](https://github.com/supabase/realtime) is an Elixir server that allows you to listen to PostgreSQL inserts, updates, and deletes using websockets. Realtime polls Postgres' built-in replication functionality for database changes, converts changes to JSON, then broadcasts the JSON over websockets to authorized clients.
-   [PostgREST](http://postgrest.org/) is a web server that turns your PostgreSQL database directly into a RESTful API.
-   [GoTrue](https://github.com/supabase/gotrue) is a JWT-based authentication API that simplifies user sign-ups, logins, and session management in your applications.
-   [Storage](https://github.com/supabase/storage-api) a RESTful API for managing files in S3, with Postgres handling permissions.
-   [pg\_graphql](http://github.com/supabase/pg_graphql/) a PostgreSQL extension that exposes a GraphQL API.
-   [postgres-meta](https://github.com/supabase/postgres-meta) is a RESTful API for managing your Postgres, allowing you to fetch tables, add roles, and run queries, etc.
-   [Envoy](https://github.com/envoyproxy/envoy) is a cloud-native, high-performance edge and service proxy.

#### Client libraries

Our approach for client libraries is modular. Each sub-library is a standalone implementation for a single external system. This is one of the ways we support existing tools.

| Language | Client | Feature-Clients (bundled in Supabase client) |   |   |   |   |
| --- | --- | --- | --- | --- | --- | --- |
|     | Supabase | [PostgREST](https://github.com/postgrest/postgrest) | [GoTrue](https://github.com/supabase/gotrue) | [Realtime](https://github.com/supabase/realtime) | [Storage](https://github.com/supabase/storage-api) | Functions |
| ⚡️ Official ⚡️ |   |   |   |   |   |   |
| JavaScript (TypeScript) | [supabase-js](https://github.com/supabase/supabase-js) | [postgrest-js](https://github.com/supabase/supabase-js/tree/master/packages/core/postgrest-js) | [auth-js](https://github.com/supabase/supabase-js/tree/master/packages/core/auth-js) | [realtime-js](https://github.com/supabase/supabase-js/tree/master/packages/core/realtime-js) | [storage-js](https://github.com/supabase/supabase-js/tree/master/packages/core/storage-js) | [functions-js](https://github.com/supabase/supabase-js/tree/master/packages/core/functions-js) |
| Flutter | [supabase-flutter](https://github.com/supabase/supabase-flutter) | [postgrest-dart](https://github.com/supabase/postgrest-dart) | [gotrue-dart](https://github.com/supabase/gotrue-dart) | [realtime-dart](https://github.com/supabase/realtime-dart) | [storage-dart](https://github.com/supabase/storage-dart) | [functions-dart](https://github.com/supabase/functions-dart) |
| Swift | [supabase-swift](https://github.com/supabase/supabase-swift) | [postgrest-swift](https://github.com/supabase/supabase-swift/tree/main/Sources/PostgREST) | [auth-swift](https://github.com/supabase/supabase-swift/tree/main/Sources/Auth) | [realtime-swift](https://github.com/supabase/supabase-swift/tree/main/Sources/Realtime) | [storage-swift](https://github.com/supabase/supabase-swift/tree/main/Sources/Storage) | [functions-swift](https://github.com/supabase/supabase-swift/tree/main/Sources/Functions) |
| Python | [supabase-py](https://github.com/supabase/supabase-py) | [postgrest-py](https://github.com/supabase/postgrest-py) | [gotrue-py](https://github.com/supabase/gotrue-py) | [realtime-py](https://github.com/supabase/realtime-py) | [storage-py](https://github.com/supabase/storage-py) | [functions-py](https://github.com/supabase/functions-py) |
| 💚 Community 💚 |   |   |   |   |   |   |
| C#  | [supabase-csharp](https://github.com/supabase-community/supabase-csharp) | [postgrest-csharp](https://github.com/supabase-community/postgrest-csharp) | [gotrue-csharp](https://github.com/supabase-community/gotrue-csharp) | [realtime-csharp](https://github.com/supabase-community/realtime-csharp) | [storage-csharp](https://github.com/supabase-community/storage-csharp) | [functions-csharp](https://github.com/supabase-community/functions-csharp) |
| Go  | \\- | [postgrest-go](https://github.com/supabase-community/postgrest-go) | [gotrue-go](https://github.com/supabase-community/gotrue-go) | \\- | [storage-go](https://github.com/supabase-community/storage-go) | [functions-go](https://github.com/supabase-community/functions-go) |
| Java | \\- | \\- | [gotrue-java](https://github.com/supabase-community/gotrue-java) | \\- | [storage-java](https://github.com/supabase-community/storage-java) | \\- |
| Kotlin | [supabase-kt](https://github.com/supabase-community/supabase-kt) | [postgrest-kt](https://github.com/supabase-community/supabase-kt/tree/master/Postgrest) | [auth-kt](https://github.com/supabase-community/supabase-kt/tree/master/Auth) | [realtime-kt](https://github.com/supabase-community/supabase-kt/tree/master/Realtime) | [storage-kt](https://github.com/supabase-community/supabase-kt/tree/master/Storage) | [functions-kt](https://github.com/supabase-community/supabase-kt/tree/master/Functions) |
| Ruby | [supabase-rb](https://github.com/supabase-community/supabase-rb) | [postgrest-rb](https://github.com/supabase-community/postgrest-rb) | \\- | \\- | \\- | \\- |
| Rust | \\- | [postgrest-rs](https://github.com/supabase-community/postgrest-rs) | \\- | \\- | \\- | \\- |
| Godot Engine (GDScript) | [supabase-gdscript](https://github.com/supabase-community/godot-engine.supabase) | \\- | \\- | \\- | \\- | \\- |

## Articles

["Build a Realtime Chat App with Remix and Supabase"](https://egghead.io/courses/build-a-realtime-chat-app-with-remix-and-supabase-d36e2618)
