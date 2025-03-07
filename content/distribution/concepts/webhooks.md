title=Webhooks
tags=distribution, concept, rpc
summary=Servers-calling-client callbacks across the Web.
~~~~~~

[The Webhook Standard](https://www.standardwebhooks.com/)

Webhooks are a common name for HTTP callbacks, and are how services notify each other of events. Webhooks are part of a service's API, though you can think of them as a sort of a reverse API. When a client wants to make a request to a service they make an API call, and when the service wants to notify the client of an event the service triggers a webhook (“a user has paid”, “task has finished”, etc.).

Webhooks are server-to-server, in the sense that both the customer and the service in the above description, should be operating HTTP servers, one to receive the API calls and one to receive the webhooks. It's important to note that while webhooks usually co-exist with a traditional API, this is not a requirement, and some services send webhooks without offering a traditional API.

