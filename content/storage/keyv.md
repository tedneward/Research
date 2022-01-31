title=Keyv
tags=storage, key-value
summary=A consistent interface for key-value storage across multiple backends via storage adapters. It supports TTL based expiry, making it suitable as a cache or a persistent key-value store.
~~~~~~

[Source](https://github.com/jaredwray/keyv)

Install Keyv: `npm install --save keyv`

By default everything is stored in memory, you can optionally also install a storage adapter.

```
npm install --save @keyv/redis
npm install --save @keyv/mongo
npm install --save @keyv/sqlite
npm install --save @keyv/postgres
npm install --save @keyv/mysql
```

Create a new Keyv instance, passing your connection string if applicable. Keyv will automatically load the correct storage adapter.

```
const Keyv = require('keyv');

// One of the following
const keyv = new Keyv();
const keyv = new Keyv('redis://user:pass@localhost:6379');
const keyv = new Keyv('mongodb://user:pass@localhost:27017/dbname');
const keyv = new Keyv('sqlite://path/to/database.sqlite');
const keyv = new Keyv('postgresql://user:pass@localhost:5432/dbname');
const keyv = new Keyv('mysql://user:pass@localhost:3306/dbname');

// Handle DB connection errors
keyv.on('error', err => console.log('Connection Error', err));

await keyv.set('foo', 'expires in 1 second', 1000); // true
await keyv.set('foo', 'never expires'); // true
await keyv.get('foo'); // 'never expires'
await keyv.delete('foo'); // true
await keyv.clear(); // undefined
```

You can namespace your Keyv instance to avoid key collisions and allow you to clear only a certain namespace while using the same database.

```
const users = new Keyv('redis://user:pass@localhost:6379', { namespace: 'users' });
const cache = new Keyv('redis://user:pass@localhost:6379', { namespace: 'cache' });

await users.set('foo', 'users'); // true
await cache.set('foo', 'cache'); // true
await users.get('foo'); // 'users'
await cache.get('foo'); // 'cache'
await users.clear(); // undefined
await users.get('foo'); // undefined
await cache.get('foo'); // 'cache'
```

You can also use third-party storage adapters or build your own. Keyv will wrap these storage adapters in TTL functionality and handle complex types internally.

```
const Keyv = require('keyv');
const myAdapter = require('./my-storage-adapter');

const keyv = new Keyv({ store: myAdapter });
```

Any store that follows the Map api will work.

```
new Keyv({ store: new Map() });
```

For example, quick-lru is a completely unrelated module that implements the Map API.

```
const Keyv = require('keyv');
const QuickLRU = require('quick-lru');

const lru = new QuickLRU({ maxSize: 1000 });
const keyv = new Keyv({ store: lru });
```

