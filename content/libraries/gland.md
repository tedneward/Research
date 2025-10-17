title=Gland
tags=library, framework, nodejs, distribution, event-driven
summary=A lightweight, modular framework for event-driven applications.
~~~~~~

[Website](https://glandjs.github.io/) | [Source](https://github.com/glandjs/gland)

```
import { EventBroker } from '@glandjs/events';

const gland = new EventBroker({ name:"Glandjs" });

gland.on("great", (text) => {
  console.log("Hello", text);
});

gland.emit("great", 'world');
```

