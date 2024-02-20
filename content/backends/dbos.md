title=DBOS
tags=storage, backend, 
summary=A Typescript framework built on the database that helps you develop transactional backend applications.
~~~~~~

[Website](https://www.dbos.dev/) | [Github](https://github.com/dbos-inc/dbos-ts)

### Quickstart
Init the project

```
npx @dbos-inc/dbos-sdk init -n <project name>
```

Get Postgres going in a Docker image.

```
export PGPASSWORD=dbos
./start_postgres_docker.sh
```

Create some database tables.

```
npx knex migrate:latest
```

Build and run

```
npm run build
npx dbos-sdk start
```

Use curl to ping the backend.

```
curl http://localhost:3000/greeting/dbos
```

### Hello Database
Scaffolded code in `src/operations.ts`:

```
import { TransactionContext, Transaction, GetApi, ArgSource, ArgSources } from '@dbos-inc/dbos-sdk'
import { Knex } from 'knex';

// The schema of the database table used in this example.
export interface dbos_hello {
  name: string;
  greet_count: number;
}

export class Hello {

  @GetApi('/greeting/:user') // Map GET requests to the "/greeting" w/ 'user' as a path parameter
  @Transaction()  // Run this function as a database transaction
  static async helloTransaction(ctxt: TransactionContext<Knex>, @ArgSource(ArgSources.URL) user: string) {
    // Retrieve and increment the number of times this user has been greeted.
    const query = "INSERT INTO dbos_hello (name, greet_count) VALUES (?, 1) ON CONFLICT (name) DO UPDATE SET greet_count = dbos_hello.greet_count + 1 RETURNING greet_count;"
    const { rows } = await ctxt.client.raw(query, [user]) as { rows: dbos_hello[] };
    const greet_count = rows[0].greet_count;
    return `Hello, ${user}! You have been greeted ${greet_count} times.\n`;
  }
}
```

Questions:

* Is the name of `Hello` (the class) relevant or referenced anywhere?
* How wide is the transaction scope? From start to finish in `helloTransaction`?
* 
