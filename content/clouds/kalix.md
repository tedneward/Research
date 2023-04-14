title=Kalix
tags=cloud
summary=Removes the hurdles of distributed data, distributed systems and all underlying architecture complexity.
~~~~~~

[Website](https://www.kalix.io/)

Install Kalix CLI: `$ brew install lightbend/brew/kalix`

Create an account: `$ kalix auth signup`

Create a project: `$ kalix projects new my-kalix-proj "My Kalix Project" --region=gcp-us-east1`

Deploy your first API: `kalix services deploy shopping-cart gcr.io/kalix-public/samples-java-value-entity-shopping-cart:0.0.2 && kalix services expose shopping-cart --enable-cors`

Interact with your API: `kalix services proxy shopping-cart --grpcui`

