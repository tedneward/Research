title=Ballerina
tags=language, distribution, services, jvm, concurrency
summary=A service-oriented programming language.
~~~~~~

[Website](https://ballerina.io/) | [Project Github](https://github.com/ballerina-platform): [Spec](https://github.com/ballerina-platform/ballerina-spec) [Language](https://github.com/ballerina-platform/ballerina-lang) | [Examples](https://ballerina.io/learn/by-example/introduction/) | [Language Walkthrough](https://ballerina.io/learn/language-walkthrough/) | [Reference Examples](https://ballerina.io/learn/by-example/)

### Articles
["GraphQL Made Easy With Ballerina"](https://dzone.com/articles/graphql-made-easy-with-ballerina)

["Securing Microservices with JWT"](https://medium.com/ballerina-techblog/securing-microservices-with-jwt-a16b738b110f)

["Connecting to and using Google's Cloud SQL with Ballerina"](https://medium.com/@kaneeldias/connecting-to-and-using-googles-cloud-sql-with-ballerina-13e2d6594686)

["How to Create a REST API--Sprint Boot and Ballerina"](https://medium.com/ballerina-techblog/how-to-create-a-rest-api-spring-boot-and-ballerina-cc85477e22c8)

## Examples
Hello, world. A Ballerina application can have:

* a main() function will run as a terminating process.
* a service, is hosted as a non-terminating process.

Both of these are considered as entry points for program execution. 

**Service**

```
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service /hello on new http:Listener(9090) {

    # A resource representing an invokable API method
    # accessible at `/hello/sayHello`.
    #
    # + return - A string payload which eventually becomes 
    #            the payload of the response
    resource function get sayHello() returns string {
        return "Hello Ballerina!";
    }
}
```

Run it:
```
$ bal run hello_service.bal
Compiling source
	hello_service.bal

Running executable

[ballerina/http] started HTTP/WS listener 0.0.0.0:9090
```

Or, build it into a JAR:
```
$ bal build -o my_first_service.jar hello_service.bal
Compiling source
	hello_service.bal

Generating executable
	my_first_service.jar

$ bal run my_first_service.jar
[ballerina/http] started HTTP/WS listener 0.0.0.0:9090
```

**Client**

Either approach, hit it from curl:
```
$ curl http://localhost:9090/hello/sayHello
Hello Ballerina!
```

... or build a Ballerina client:
```
import ballerina/http;
import ballerina/io;

public function main() returns @tainted error? {
    // Add the relevant endpoint URL to perform the invocation.
    http:Client helloClient = check new("http://localhost:9090/hello");

    // Perform a `GET` request to the `hello` service. If successful, 
    // the remote call would return an `http:Response` or the payload 
    // (if the `targetType` defaultable parameter is configured).
    // Otherwise an `error` on failure.
    http:Response helloResp = check helloClient->get("/sayHello");

    // Retrieve the payload as a `string` and print it if the 
    // response of the remote call is successful.
    io:println(check helloResp.getTextPayload());
}
```

```
$ bal run hello_client.bal
Hello Ballerina!
```

