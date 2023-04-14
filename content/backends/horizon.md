title=Horizon
tags=backend
summary=A realtime, open-source backend for JavaScript apps built on top of RethinkDB.
~~~~~~

[Source](https://github.com/rethinkdb/horizon)

Consists of four components:

* Horizon server -- a middleware server that connects to/is built on top of RethinkDB, and exposes a simple API/protocol to front-end applications.
* Horizon client library -- a JavaScript client library that wraps Horizon server's protocol in a convenient API for front-end developers.
* Horizon CLI - hz -- a command-line tool aiding in scaffolding, development, and deployment
* GraphQL support -- the server will have a GraphQL adapter so anyone can get started building React/Relay apps without writing any backend code at the beginning. This will not ship in v1, but we'll follow up with a GraphQL adapter quickly after launch.

Horizon currently has all the following services available to developers:

* ✅ Subscribe -- a streaming API for building realtime apps directly from the browser without writing any backend code.
* ✅ Auth -- an authentication API that connects to common auth providers (e.g. Facebook, Google, GitHub).
* ✅ Identity -- an API for listing and manipulating user accounts.
* ✅ Permissions -- a security model that allows the developer to protect data from unauthorized access.

