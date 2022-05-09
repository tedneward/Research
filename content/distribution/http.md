title=HyperText Transmission Protocol
tags=distribution, protocol
summary=Backbone protocol for the World Wide Web.
~~~~~~

List of RFCs affecting and around HTTP:

* [RFC 2616](https://www.w3.org/Protocols/rfc2616/rfc2616.html): Hypertext Transfer Protocol -- HTTP/1.1
* [RFC 2817](https://datatracker.ietf.org/doc/html/rfc2817): Upgrading to TLS Within HTTP/1.1
* [RFC 2818](https://datatracker.ietf.org/doc/html/rfc2818): HTTP Over TLS
* [RFC 7230](https://datatracker.ietf.org/doc/html/rfc7230): Hypertext Transfer Protocol (HTTP/1.1): Message Syntax and Routing
* [RFC 7540](https://datatracker.ietf.org/doc/html/rfc7540): Hypertext Transfer Protocol Version 2 (HTTP/2)
* [RFC 8740](https://datatracker.ietf.org/doc/html/rfc8740): Using TLS 1.3 with HTTP/2
* [RFC 8615](https://datatracker.ietf.org/doc/html/rfc8615): Well-Known Uniform Resource Identifiers (URIs)

[1.0 Standard](https://www.w3.org/Protocols/HTTP/1.0/spec.html) 

---

[HTTP Toolkit](https://httptoolkit.tech/) ([Sources](https://github.com/httptoolkit)): a beautiful & open-source tool for debugging, testing and building with HTTP(S) on Windows, Linux & Mac. [Docs](https://httptoolkit.tech/docs/)

---

* [How HTTPS Works](https://howhttps.works) - DNSimple
* [HTTP Succinctly, Syncfusion](https://www.syncfusion.com/resources/techportal/ebooks/http) (PDF, Kindle) (email address *requested*, not required)
* [HTTP2 Explained](http://daniel.haxx.se/http2/) - Daniel Stenberg
* [Introduction to HTTP](https://launchschool.com/books/http) - Launch School

---

## Articles

["How to Design Better APIs"](https://r.bluethl.net/how-to-design-better-apis):

1. Be consistent

    * Use the same casing for fields, resources, and parameters (I prefer snake_case)
    * Use either plural or singular resource names (I prefer plural) `/users/{id}`, `/orders/{id}` or `/user/{id}`, `/order/{id}`
    * Use the same authentication and authorization methods for all endpoints
    * Use the same HTTP headers across the API; for example `Api-Key` for passing an API key
    * Use the same HTTP status codes based on the type of response; for example 404 when a resource can not be found
    * Use the same HTTP methods for the same kind of actions; for example DELETE when deleting a resource
2. Use ISO 8601 UTC dates

3. Make an exception for public endpoints: Every endpoint should require authorization by default. Most endpoints require an authenticated user to be called, so making this the default makes sense. If an endpoint needs to be called publicly, explicitly set this endpoint to allow unauthorized requests.

4. Provide a health check endpoint: Provide an endpoint (for example GET /health) that determines whether or not a service is healthy. This endpoint can be called by other applications such as load balancers to act in case of a service outage.

5. Version the API: Make sure you version your API and pass the version on each request so that consumers aren't affected by any changes to another version. API versions can be passed using HTTP headers or query/path parameters. Even the first version of the API (1.0) should be explicitly versioned.

    * `https://api.averagecompany.com/v1/health`
    * `https://api.averagecompany.com/health?api_version=1.0`

6. Accept API key authentication: If an API needs to be called by a third party, it makes sense to allow authentication via API keys. API keys should be passed using a custom HTTP header (such as Api-Key). They should have an expiration date, and it must be possible to revoke active keys so that they can be invalidated in case they get compromised. Avoid checking API keys into source control (use environment variables instead).

7. Use reasonable HTTP status codes: Use conventional HTTP status codes to indicate the success or failure of a request. Don't use too many, and use the same status codes for the same outcomes across the API. Some examples:

    * 200 for general success
    * 201 for successful creation
    * 400 for bad requests from the client
    * 401 for unauthorized requests
    * 403 for missing permissions
    * 404 for missing resources
    * 429 for too many requests

8. Use reasonable HTTP methods

9. Use self-explanatory, simple names

10. Use standardized error responses

11. Return created resources upon POST

12. Prefer PATCH over PUT: As mentioned earlier, PATCH requests should apply partial updates to a resource, whereas PUT replaces an existing resource entirely. It's usually a good idea to design updates around PATCH requests, because:

    * When using PUT to update only a subset of fields for a resource, the entire resource still needs to be passed, which makes it more network-intensive and error-prone
    * It's also quite dangerous to allow any field to be updated without any restrictions
    * From my experience, there barely exist any use cases in practice where a full update on a resource would make sense
    * Imagine an order resource that has an id and a state
    * It would be very dangerous to allow consumers to update the state of an order
    * A state change would much more likely be triggered by another endpoint (such as /orders/{id}/fulfill)

13. Be as specific as possible

14. Use pagination

15. Allow expanding resources: Allow consumers to load related data using a query parameter called expand (or similar). This is especially useful to avoid round-trips and load all data that is necessary for a specific action in one go.
