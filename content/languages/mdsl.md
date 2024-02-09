title=Microservices DSL
tags=language, distribution, microservices
summary=A Domain-Specific Language (DSL) to specify (micro-)service contracts, their data representations and API endpoints.
~~~~~~

[Website](https://microservice-api-patterns.github.io/MDSL-Specification/index) | [Source](https://github.com/Microservice-API-Patterns/MDSL-Specification)

## Examples
A First Example: An API with a single endpoint HelloWorldEndpoint that exposes a single operation called sayHello can be modelled as this:

```
API description HelloMDSLWorld

data type SampleDTO {ID, D<string>} 

endpoint type HelloWorldEndpoint
exposes 
  operation sayHello 
    expecting payload "in": D<int>  
    delivering payload SampleDTO

API provider HelloWorldAPIProvider
  offers HelloWorldEndpoint 
  at endpoint location "http://localhost:8000" 
  via protocol HTTP 
    binding resource HomeResource at "/"
      operation sayHello to POST 
  
API client HelloWorldAPIClient
  consumes HelloWorldEndpoint 
  from HelloWorldAPIProvider
  via protocol HTTP 
```

sayHello accepts a single scalar string value D<string> as input. This operation returns a Data Transfer Object (DTO) called SampleDTO as output, which is modeled explicitly so that its specification can be reused. This SampleDTO is specified incompletely as an identifier-data pair {ID, D}. Its two elements are an identifier ID and some data D. The names of these two “parameters” have not been specified yet. The data element D is a string; the type of the ID parameter is not unspecified. This is different from "in": D<int>, the data send in the request message of sayHello, which gives its single parameter a name, a role, and a type.

In addition to the endpoint type (a.k.a. service contract) HelloWorldEndpoint, an API client and an API provider working with this contract are defined (and bound to HTTP, a single home resource in this simple case).

Take a look at Hello World in Swagger/OpenAPI Specification in comparison. You can find such contract specification example here (note: this OpenAPI specification contains a few more details about the HTTP binding of the abstract contract).

