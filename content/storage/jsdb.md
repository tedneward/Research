title=JavaScript Database (JSDB)
tags=storage, nodejs, browser
Summary=A transparent, in-memory, streaming write-on-update JavaScript database for Small Web applications that persists to a JavaScript transaction log.
~~~~~~

[Source](https://github.com/small-tech/jsdb)

From the README:

#### Use case
A small and simple data layer for basic persistence and querying. Built for us in Small Web places and used in Site.js and Place.

#### Features
* Transparent: if you know how to work with arrays and objects and call methods in JavaScript, you already know how to use JSDB? It’s not called JavaScript Database for nothing.

* Automatic: it just works. No configuration.

* 100% code coverage: meticulously tested. Note that this does not mean it is bug free ;)

#### Limitations
* Small Data: this is for small data, not Big Data™.

* For Node.js: will not work in the browser. (Although data tables are plain ECMAScript Modules (ESM; es6 modules) and can be loaded in the browser.)

* Runs on untrusted nodes: this is for data kept on untrusted nodes (servers). Use it judiciously if you must for public data, configuration data, etc. If you want to store personal data or model human communication, consider end-to-end encrypted and peer-to-peer replicating data structures instead to protect privacy and freedom of speech. Keep an eye on the work taking place around the Hypercore Protocol.

* In-memory: all data is kept in memory and, without tweaks, cannot exceed 1.4GB in size. While JSDB will work with large datasets, that’s not its primary purpose and it’s definitely not here to help you farm people for their data, so please don’t use it for that. (If that’s what you want, quite literally every other database out there is for your use case so please use one of those instead.)

* Streaming writes on update: writes are streamed to disk to an append-only transaction log as JavaScript statements and are both quick (in the single-digit miliseconds region on a development laptop with an SSD drive) and as safe as we can make them (synchronous at the kernel level).

* No schema, no migrations: again, this is meant to be a very simple persistence, query, and observation layer for local server-side data. If you want schemas and migrations, take a look at nearly every other database out there.
