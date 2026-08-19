title=Parse Platform
tags=backend, nodejs
summary=Open-souce backend platform running on NodeJS.
~~~~~~

"Build applications faster with object and file storage, user authentication, push notifications, dashboard and more out of the box."

[Website](https://parseplatform.org/) | [Github](https://github.com/parse-community)

The original. Open-sourced when Parse was bought by Facebook and then later shut down. Community version looks very active, and probably worth giving a spin at some point. Requires MongoDB or PostgreSQL as a data-storage unit, and optionally plugs in to Docker. Note that compared to the original Parse, Parse Jobs and Parse Analytics are not provided, but it's a NodeJS/Express-friendly tool, so that could/should be someting a NodeJS developer could implement on their own (or plug a third-party into) if needed. As a quick-stand-up backend, though, it should be more than adequate.

Parse Server is an open source backend that can be deployed to any infrastructure that can run Node.js. Parse Server works with the Express web application framework. It can be added to existing web applications, or run by itself.

The full documentation for Parse Server is available in the [wiki](https://github.com/parse-community/parse-server/wiki). The [Parse Server guide](http://docs.parseplatform.org/parse-server/guide/) is a good place to get started. An [API reference](http://parseplatform.org/parse-server/api/) and [Cloud Code guide](https://docs.parseplatform.org/cloudcode/guide/) are also available. If you're interested in developing for Parse Server, the [Development guide](http://docs.parseplatform.org/parse-server/guide/#development-guide) will help you get set up.

# Flavors & Branches

Parse Server is available in different flavors on different branches:

-   The main branches are [release](https://github.com/parse-community/parse-server/blob/release/changelogs/CHANGELOG_release.md) and [alpha](https://github.com/parse-community/parse-server/blob/alpha/changelogs/CHANGELOG_alpha.md). See the [changelog overview](https://github.com/parse-community/parse-server/blob/alpha/CHANGELOG.md) for details.
-   The long-term-support (LTS) branches are named `release-<version>.x.x`, for example `release-5.x.x`. LTS branches do not have pre-release branches.

# Getting Started

The fastest and easiest way to get started is to run MongoDB and Parse Server locally.

## Running Parse Server

Before you start make sure you have installed:

-   [NodeJS](https://www.npmjs.com/) that includes `npm`
-   [MongoDB](https://www.mongodb.com/) or [PostgreSQL](https://www.postgresql.org/)(with [PostGIS](https://postgis.net/) 2.2.0 or higher)
-   Optionally [Docker](https://www.docker.com/)

### Compatibility

#### Node.js

Parse Server is continuously tested with the most recent releases of Node.js to ensure compatibility. We follow the [Node.js Long Term Support plan](https://github.com/nodejs/Release) and only test against versions that are officially supported and have not reached their end-of-life date.

| Version | Minimum Version | End-of-Life | Parse Server Support |
| --- | --- | --- | --- |
| Node.js 18 | 18.20.4 | April 2025 | <= 8.x (2025) |
| Node.js 20 | 20.19.0 | April 2026 | <= 9.x (2026) |
| Node.js 22 | 22.12.0 | April 2027 | <= 10.x (2027) |
| Node.js 24 | 24.11.0 | April 2028 | <= 11.x (2028) |

#### MongoDB

Parse Server is continuously tested with the most recent releases of MongoDB to ensure compatibility. We follow the [MongoDB support schedule](https://www.mongodb.com/support-policy) and [MongoDB lifecycle schedule](https://www.mongodb.com/support-policy/lifecycles) and only test against versions that are officially supported and have not reached their end-of-life date. MongoDB "rapid releases" are ignored as these are considered pre-releases of the next major version.

| Version | Minimum Version | End-of-Life | Parse Server Support |
| --- | --- | --- | --- |
| MongoDB 6 | 6.0.19 | July 2025 | <= 8.x (2025) |
| MongoDB 7 | 7.0.16 | August 2026 | <= 9.x (2026) |
| MongoDB 8 | 8.0.4 | TDB | <= 10.x (2027) |

#### PostgreSQL

Parse Server is continuously tested with the most recent releases of PostgreSQL and PostGIS to ensure compatibility, using [PostGIS docker images](https://registry.hub.docker.com/r/postgis/postgis/tags?page=1&ordering=last_updated). We follow the [PostgreSQL support schedule](https://www.postgresql.org/support/versioning) and [PostGIS support schedule](https://www.postgis.net/eol_policy/) and only test against versions that are officially supported and have not reached their end-of-life date. Due to the extensive PostgreSQL support duration of 5 years, Parse Server drops support about 2 years before the official end-of-life date.

| Version | PostGIS Version | End-of-Life | Parse Server Support |
| --- | --- | --- | --- |
| Postgres 13 | 3.1, 3.2, 3.3, 3.4, 3.5 | November 2025 | <= 6.x (2023) |
| Postgres 14 | 3.5 | November 2026 | <= 7.x (2024) |
| Postgres 15 | 3.3, 3.4, 3.5 | November 2027 | <= 8.x (2025) |
| Postgres 16 | 3.5 | November 2028 | <= 9.x (2026) |
| Postgres 17 | 3.5 | November 2029 | <= 10.x (2027) |
| Postgres 18 | 3.6 | November 2030 | <= 11.x (2028) |

### Locally

$ npm install -g parse-server mongodb-runner
$ mongodb-runner start
$ parse-server --appId APPLICATION\_ID --masterKey MASTER\_KEY --databaseURI mongodb://localhost/test

**_Note:_** _If installation with_ `-g` _fails due to permission problems_ (`npm ERR! code 'EACCES'`), _please refer to [this link](https://docs.npmjs.com/getting-started/fixing-npm-permissions)._

### Docker Container

$ git clone https://github.com/parse-community/parse-server
$ cd parse-server
$ docker build --tag parse-server .
$ docker run --name my-mongo -d mongo

#### Running the Parse Server Image

$ docker run --name my-parse-server -v config-vol:/parse-server/config -p 1337:1337 --link my-mongo:mongo -d parse-server --appId APPLICATION\_ID --masterKey MASTER\_KEY --databaseURI mongodb://mongo/test

**_Note:_** _If you want to use [Cloud Code](https://docs.parseplatform.org/cloudcode/guide/), add `-v cloud-code-vol:/parse-server/cloud --cloud /parse-server/cloud/main.js` to the command above. Make sure `main.js` is in the `cloud-code-vol` directory before starting Parse Server._

You can use any arbitrary string as your application id and master key. These will be used by your clients to authenticate with the Parse Server.

That's it! You are now running a standalone version of Parse Server on your machine.

**Using a remote MongoDB?** Pass the `--databaseURI DATABASE_URI` parameter when starting `parse-server`. Learn more about configuring Parse Server [here](https://github.com/parse-community/parse-server#configuration). For a full list of available options, run `parse-server --help`.

### Saving and Querying Objects

Now that you're running Parse Server, it is time to save your first object. The easiest way is to use the [REST API](http://docs.parseplatform.org/rest/guide), but you can easily do the same using any of the [Parse SDKs](http://parseplatform.org/#sdks). To learn more check out the [documentation](http://docs.parseplatform.org/).

### Connect an SDK

Parse provides SDKs for all the major platforms. Refer to the Parse Server guide to [learn how to connect your app to Parse Server](https://docs.parseplatform.org/parse-server/guide/#using-parse-sdks-with-parse-server).

## Running Parse Server elsewhere

Once you have a better understanding of how the project works, please refer to the [Parse Server wiki](https://github.com/parse-community/parse-server/wiki) for in-depth guides to deploy Parse Server to major infrastructure providers. Read on to learn more about additional ways of running Parse Server.

### Sample Application

We have provided a basic [Node.js application](https://github.com/parse-community/parse-server-example) that uses the Parse Server module on Express and can be easily deployed to various infrastructure providers:

-   [Heroku and mLab](https://devcenter.heroku.com/articles/deploying-a-parse-server-to-heroku)
-   [AWS and Elastic Beanstalk](http://mobile.awsblog.com/post/TxCD57GZLM2JR/How-to-set-up-Parse-Server-on-AWS-using-AWS-Elastic-Beanstalk)
-   [Google App Engine](https://medium.com/@justinbeckwith/deploying-parse-server-to-google-app-engine-6bc0b7451d50)
-   [Microsoft Azure](https://azure.microsoft.com/en-us/blog/azure-welcomes-parse-developers/)
-   [SashiDo](https://blog.sashido.io/tag/migration/)
-   [Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-run-parse-server-on-ubuntu-14-04)
-   [Pivotal Web Services](https://github.com/cf-platform-eng/pws-parse-server)
-   [Back4app](https://www.back4app.com/docs/get-started/welcome)
-   [Glitch](https://glitch.com/edit/#!/parse-server)
-   [Flynn](https://flynn.io/blog/parse-apps-on-flynn)
-   [Elestio](https://elest.io/open-source/parse)

### Parse Server + Express

You can also create an instance of Parse Server, and mount it on a new or existing Express website:

const express \= require('express');
const ParseServer \= require('parse-server').ParseServer;
const app \= express();

const server \= new ParseServer({
  databaseURI: 'mongodb://localhost:27017/dev', // Connection string for your MongoDB database
  cloud: './cloud/main.js', // Path to your Cloud Code
  appId: 'myAppId',
  masterKey: 'myMasterKey', // Keep this key secret!
  fileKey: 'optionalFileKey',
  serverURL: 'http://localhost:1337/parse', // Don't forget to change to https if needed
});

// Start server
await server.start();

// Serve the Parse API on the /parse URL prefix
app.use('/parse', server.app);

app.listen(1337, function () {
  console.log('parse-server-example running on port 1337.');
});

For a full list of available options, run `parse-server --help` or take a look at \[Parse Server Configurations\]\[server-options\].

## Parse Server Health

Check the Parse Server health by sending a request to the `/parse/health` endpoint.

The response looks like this:

{
  "status": "ok"
}

### Status Values

| Value | Description |
| --- | --- |
| `initialized` | The server has been created but the `start` method has not been called yet. |
| `starting` | The server is starting up. |
| `ok` | The server started and is running. |
| `error` | There was a startup error, see the logs for details. |

