title=Swarm
tags=distribution, storage, ecmascript, nodejs, browser
summary=JavaScript replicated model (M of MVC) library.
~~~~~~

[Website](http://swarmdb.net/) | [Source](https://github.com/gritzko/swarm)

Example:
```
import gql from 'graphql-tag';
import SwarmDB, { LocalStorage } from '@swarm/db';

const swarm = new SwarmDB({
  storage: new LocalStorage(),
  upstream: 'ws://0.0.0.0:31415',
  db: { name: 'default' }
});

// And then subscribe to live data.
const query = gql`
  subscription ChatsList($from: Int = 0, $to: Int = 100, $uid: UUID!) {
    chats @node(id: "chats") {
      version
      length
      list: id @slice(begin: $from, end: $to) {
        title
        picture
        private
      }
    }
    user @node(id: $uid) {
      id
      version
      username
      avatar
    }
  }
`

const variables = { from: 0, to: 20, uid: 'X8Kq%~github' }
swarm.execute({ query, variables }, ({ data, error, off }) => {
  // handle updates 
  // or stop receiving updates via call `off()`
})
```

