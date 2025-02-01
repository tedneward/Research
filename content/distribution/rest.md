title=Representational State Transfer (REST)
tags=distribution, architecture
summary=Collection of links and reading and notes on Fielding's dissertation.
~~~~~~

[Fielding's dissertation](https://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm) ([PDF](https://www.ics.uci.edu/~fielding/pubs/dissertation/fielding_dissertation.pdf))

[RESTful Web Services](http://restfulwebapis.org/RESTful_Web_Services.pdf) (PDF)

[Richardson Maturity Model](https://martinfowler.com/articles/richardsonMaturityModel.html): a model of restful maturity that was developed by Leonard Richardson and explained at a QCon talk.

* Level 0
* Level 1 - Resources
* Level 2 - HTTP Verbs
* Level 3 - Hypermedia Controls

[RESTful API guidelines](https://opensource.zalando.com/restful-api-guidelines/):

1. Introduction
    - Conventions used in these guidelines
    - Zalando specific information
2. Principles
    - API design principles
    - API as a product
    - API first
3. General guidelines
    - MUST follow API first principle
    - MUST provide API specification using OpenAPI
    - SHOULD provide API user manual
    - MUST write APIs using U.S. English
    - MUST only use durable and immutable remote references
4. REST Basics - Meta information
    - MUST contain API meta information
    - MUST use semantic versioning
    - MUST provide API identifiers
    - MUST provide API audience
    - MUST/SHOULD/MAY use functional naming schema
    - MUST follow naming convention for hostnames
5. REST Basics - Security
    - MUST secure endpoints
    - MUST define and assign permissions (scopes)
    - MUST follow the naming convention for permissions (scopes)
6. REST Basics - Data formats
    - MUST use standard data formats
    - MUST define a format for number and integer types
    - MUST use standard formats for date and time properties
    - SHOULD select appropriate one of date or date-time format
    - SHOULD use standard formats for time duration and interval properties
    - MUST use standard formats for country, language and currency properties
    - SHOULD use content negotiation, if clients may choose from different resource representations
    - SHOULD only use UUIDs if necessary
7. REST Basics - URLs
    - SHOULD not use /api as base path
    - MUST pluralize resource names
    - MUST use URL-friendly resource identifiers
    - MUST use kebab-case for path segments
    - MUST use normalized paths without empty path segments and trailing slashes
    - MUST keep URLs verb-free
    - MUST avoid actions — think about resources
    - SHOULD define useful resources
    - MUST use domain-specific resource names
    - SHOULD model complete business processes
    - MUST identify resources and sub-resources via path segments
    - MAY expose compound keys as resource identifiers
    - MAY consider using (non-) nested URLs
    - SHOULD limit number of resource types
    - SHOULD limit number of sub-resource levels
    - MUST use snake_case (never camelCase) for query parameters
    - MUST stick to conventional query parameters
8. REST Basics - JSON payload
    - MUST use JSON as payload data interchange format
    - SHOULD design single resource schema for reading and writing
    - SHOULD be aware of services not fully supporting JSON/unicode
    - MAY pass non-JSON media types using data specific standard formats
    - SHOULD use standard media types
    - SHOULD pluralize array names
    - MUST property names must be snake_case (and never camelCase)
    - SHOULD declare enum values using UPPER_SNAKE_CASE string
    - SHOULD use naming convention for date/time properties
    - SHOULD define maps using additionalProperties
    - MUST use same semantics for null and absent properties
    - MUST not use null for boolean properties
    - SHOULD not use null for empty arrays
    - MUST use common field names and semantics
    - MUST use the common address fields
    - MUST use the common money object
9. REST Basics - HTTP requests
    - MUST use HTTP methods correctly
    - MUST fulfill common method properties
    - SHOULD consider to design POST and PATCH idempotent
    - SHOULD use secondary key for idempotent POST design
    - MAY support asynchronous request processing
    - MUST define collection format of header and query parameters
    - SHOULD design simple query languages using query parameters
    - SHOULD design complex query languages using JSON
    - MUST document implicit response filtering
10. REST Basics - HTTP status codes
    - MUST use official HTTP status codes
    - MUST specify success and error responses
    - SHOULD only use most common HTTP status codes
    - MUST use most specific HTTP status codes
    - MUST use code 207 for batch or bulk requests
    - MUST use code 429 with headers for rate limits
    - MUST support problem JSON
    - MUST not expose stack traces
    - SHOULD not use redirection codes
11. REST Basics - HTTP headers
    - Using Standard Header definitions
    - MAY use standard headers
    - SHOULD use kebab-case with uppercase separate words for HTTP headers
    - MUST use Content-* headers correctly
    - SHOULD use Location header instead of Content-Location header
    - MAY use Content-Location header
    - MAY consider to support Prefer header to handle processing preferences
    - MAY consider to support ETag together with If-Match/If-None-Match header
    - MAY consider to support Idempotency-Key header
    - SHOULD use only the specified proprietary Zalando headers
    - MUST propagate proprietary headers
    - MUST support X-Flow-ID
12. REST Design - Hypermedia
    - MUST use REST maturity level 2
    - MAY use REST maturity level 3 - HATEOAS
    - MUST use common hypertext controls
    - SHOULD use simple hypertext controls for pagination and self-references
    - MUST use full, absolute URI for resource identification
    - MUST not use link headers with JSON entities
13. REST Design - Performance
    - SHOULD reduce bandwidth needs and improve responsiveness
    - SHOULD use gzip compression
    - SHOULD support partial responses via filtering
    - SHOULD allow optional embedding of sub-resources
    - MUST document cacheable GET, HEAD, and POST endpoints
14. REST Design - Pagination
    - MUST support pagination
    - SHOULD prefer cursor-based pagination, avoid offset-based pagination
    - SHOULD use pagination response page object
    - SHOULD use pagination links
    - SHOULD avoid a total result count
15. REST Design - Compatibility
    - MUST not break backward compatibility
    - SHOULD prefer compatible extensions
    - SHOULD design APIs conservatively
    - MUST prepare clients to accept compatible API extensions
    - MUST treat OpenAPI specification as open for extension by default
    - SHOULD avoid versioning
    - MUST use media type versioning
    - MUST not use URL versioning
    - MUST always return JSON objects as top-level data structures
    - SHOULD use open-ended list of values (x-extensible-enum) for enumeration types
16. REST Design - Deprecation
    - MUST reflect deprecation in API specifications
    - MUST obtain approval of clients before API shut down
    - MUST collect external partner consent on deprecation time span
    - MUST monitor usage of deprecated API scheduled for sunset
    - SHOULD add Deprecation and Sunset header to responses
    - SHOULD add monitoring for Deprecation and Sunset header
    - MUST not start using deprecated APIs
17. REST Operation
    - MUST publish OpenAPI specification for non-component-internal APIs
    - SHOULD monitor API usage
18. EVENT Basics - Event Types
    - MUST define events compliant with overall API guidelines
    - MUST treat events as part of the service interface
    - MUST make event schema available for review
    - MUST specify and register events as event types
    - MUST follow naming convention for event type names
    - MUST indicate ownership of event types
    - MUST carefully define the compatibility mode
    - MUST ensure event schema conforms to OpenAPI schema object
    - SHOULD avoid additionalProperties in event type schemas
    - MUST use semantic versioning of event type schemas
19. EVENT Basics - Event Categories
    - MUST ensure that events conform to an event category
    - MUST provide mandatory event metadata
    - MUST provide unique event identifiers
    - MUST use general events to signal steps in business processes
    - SHOULD provide explicit event ordering for general events
    - MUST use data change events to signal mutations
    - MUST provide explicit event ordering for data change events
    - SHOULD use the hash partition strategy for data change events
20. EVENT Design
    - SHOULD avoid writing sensitive data to events
    - MUST be robust against duplicates when consuming events
    - SHOULD design for idempotent out-of-order processing
    - MUST ensure that events define useful business resources
    - SHOULD ensure that data change events match the APIs resources
    - MUST maintain backwards compatibility for events
