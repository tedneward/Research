title=Cerbos
tags=library, authorization, cloud 
summary=Authorization as a service (or library), decoupled from actual code.
~~~~~~

[Website](https://cerbos.dev/) | [Source](https://github.com/cerbos)

"**What is Cerbos?** It's an access control decision engine for your software that is: Driven by simple API which makes every decision feel like a database call; Policy-driven and attribute based for maximum flexibility and scale; Decoupled, stateless and runs inside your stack."

"**Where and how does Cerbos run?** Self-hosted: Cerbos lives in your environment where-ever it is, cloud or on-premise: VM, Kubernetes, or serverless; Infinite scalability via serverless functions or a sidecar deployment model; GitOps enabled policy development and deployment via a full testing suite for CI/CD pipelines."

"**Runs anywhere.** Meets your infrastructure requirements and business compliance policies wherever they are: Public or private cloud, or on premise. Deploy and host based on your architecture.

* Container orchestration:

    * Service: Share Cerbos among many services
    * Sidecar: Run Cerbos right next to your application or anywhere a container can be run

* Serverless: let your cloud provider manage it

    * AWS lambda
    * Google Cloud Run

* Anywhere a binary can be run:

    * Bare metal
    * Virtual machine"

Implemented in Go. SDKs in ECMAScript, Python, PHP, JVM, CLR, Rust, Ruby, GraphQL(?), Prisma(?), SQLAlchemy(?), ExpressJS, NextJS, NestJS, Remix (React?), SvelteKit, FastAPI(?)

Remote calls (REST or gRPC) to service for centralized authorization control.

# SDKs

## [Java](https://github.com/cerbos/cerbos-sdk-java)

No Javadocs? No import directives?

Includes RPC clients for accessing the Cerbos PDP and test utilities for testing your code locally using [Testcontainers](https://www.testcontainers.org).

**Installation: Gradle (Kotlin DSL)**

```kotlin
dependencies {
    implementation("dev.cerbos:cerbos-sdk-java")
}

repositories {
    mavenCentral()
}
```

*NOTE: Think this needs a "v0.5.0" appended to the end of the implementation() declaration.*


### Creating a client without TLS

```java
CerbosBlockingClient client=new CerbosClientBuilder("localhost:3593").withPlaintext().buildBlockingClient();
```

### Check a single principal and resource

```java
CheckResult result=client.check(
    Principal.newInstance("john","employee")
        .withPolicyVersion("20210210")
        .withAttribute("department",stringValue("marketing"))
        .withAttribute("geography",stringValue("GB")),
    Resource.newInstance("leave_request","xx125")
        .withPolicyVersion("20210210")
        .withAttribute("department",stringValue("marketing"))
        .withAttribute("geography",stringValue("GB"))
        .withAttribute("owner",stringValue("john")),
    "view:public","approve");

if(result.isAllowed("approve")){ // returns true if `approve` action is allowed
    ...
}
```

### Check a batch

```java
CheckResourcesResult result=client.batch(
    Principal.newInstance("john","employee")
        .withPolicyVersion("20210210")
        .withAttribute("department",stringValue("marketing"))
        .withAttribute("geography",stringValue("GB"))
    )
    .addResources(
        ResourceAction.newInstance("leave_request","XX125")
            .withPolicyVersion("20210210")
            .withAttributes(
                Map.of(
                    "department", stringValue("marketing"),
                    "geography", stringValue("GB"),
                    "owner", stringValue("john")
                )
            )
            .withActions("view:public","approve","defer"),
        ResourceAction.newInstance("leave_request","XX225")
            .withPolicyVersion("20210210")
            .withAttributes(
                Map.of(
                    "department", stringValue("marketing"),
                    "geography", stringValue("GB"),
                    "owner", stringValue("martha")
                )
            )
            .withActions("view:public","approve"),
        ResourceAction.newInstance("leave_request","XX325")
            .withPolicyVersion("20210210")
            .withAttributes(
                Map.of(
                    "department", stringValue("marketing"),
                    "geography", stringValue("US"),
                    "owner", stringValue("peggy")
                )
            )
            .withActions("view:public","approve")
    )
    .check();

result.find("XX125").map(r->r.isAllowed("view:public")).orElse(false);
```

### Create a query plan

```java
PlanResourcesResult result = client.plan(
    Principal.newInstance("maggie","manager")
        .withAttribute("department",stringValue("marketing"))
        .withAttribute("geography",stringValue("GB"))
        .withAttribute("team",stringValue("design")),
    Resource.newInstance("leave_request").withPolicyVersion("20210210"),
    "approve"
);

if(result.isAlwaysAllowed()) {
    return true;
} else if(result.isAlwaysDenied()) {
    return false;
} else {
    return executeQuery(result.getCondition());
}
```

### Test with [Testcontainers](https://www.testcontainers.org)

```java
@Container
private static final CerbosContainer cerbosContainer=new CerbosContainer()
    .withClasspathResourceMapping("policies","/policies",BindMode.READ_ONLY)
    .withLogConsumer(new Slf4jLogConsumer(LOG));

@BeforeAll
private void initClient() throws CerbosClientBuilder.InvalidClientConfigurationException{
    String target=cerbosContainer.getTarget();
    this.client=new CerbosClientBuilder(target).withPlaintext().buildBlockingClient();
}
```

## .NET/CLR

Looks near-identical to Java version (which is reasonable and good).

- Add `Cerbos.Sdk` NuGet package as dependency to the project. See [here](https://www.nuget.org/packages/Cerbos.Sdk) for the published packages.

[![NuGeT](https://img.shields.io/nuget/v/Cerbos.Sdk?style=plastic)](https://www.nuget.org/packages/Cerbos.Sdk)
[![NuGeT Downloads](https://img.shields.io/nuget/dt/Cerbos.Sdk?style=plastic)](https://www.nuget.org/packages/Cerbos.Sdk)


### Creating a client without TLS

```csharp
var client = new CerbosClientBuilder("http://localhost:3593").WithPlaintext().BuildBlockingClient();
```

### Check a single principal and resource

```csharp
CheckResult result = client
    .CheckResources(
        Principal.NewInstance("john", "employee")
        .WithPolicyVersion("20210210")
        .WithAttribute("department", AttributeValue.StringValue("marketing"))
        .WithAttribute("geography", AttributeValue.StringValue("GB")),
        
        Resource.NewInstance("leave_request", "xx125")
            .WithPolicyVersion("20210210")
            .WithAttribute("department", AttributeValue.StringValue("marketing"))
            .WithAttribute("geography", AttributeValue.StringValue("GB"))
            .WithAttribute("owner", AttributeValue.StringValue("john")),
        
        "view:public", "approve"
    );

if(result.IsAllowed("approve")){ // returns true if `approve` action is allowed
    // ...
}
```

### Check a single principal and multiple resource & action pairs

```csharp
CheckResourcesResult result = client
    .CheckResources(
        Principal.NewInstance("john", "employee")
            .WithPolicyVersion("20210210")
            .WithAttribute("department", AttributeValue.StringValue("marketing"))
            .WithAttribute("geography", AttributeValue.StringValue("GB")),
        
        ResourceAction.NewInstance("leave_request", "XX125")
            .WithPolicyVersion("20210210")
            .WithAttribute("department", AttributeValue.StringValue("marketing"))
            .WithAttribute("geography", AttributeValue.StringValue("GB"))
            .WithAttribute("owner", AttributeValue.StringValue("john"))
            .WithActions("view:public", "approve", "defer"),
        
        ResourceAction.NewInstance("leave_request", "XX225")
            .WithPolicyVersion("20210210")
            .WithAttribute("department", AttributeValue.StringValue("marketing"))
            .WithAttribute("geography", AttributeValue.StringValue("GB"))
            .WithAttribute("owner", AttributeValue.StringValue("martha"))
            .WithActions("view:public", "approve"),
        
        ResourceAction.NewInstance("leave_request", "XX325")
            .WithPolicyVersion("20210210")
            .WithAttribute("department", AttributeValue.StringValue("marketing"))
            .WithAttribute("geography", AttributeValue.StringValue("US"))
            .WithAttribute("owner", AttributeValue.StringValue("peggy"))
            .WithActions("view:public", "approve")
    );

var resultXX125 = result.Find("XX125");
var resultXX225 = result.Find("XX225");
var resultXX325 = result.Find("XX325");

if(resultXX125.IsAllowed("defer")){ // returns true if `defer` action is allowed
    // ...
}

if(resultXX225.IsAllowed("approve")){ // returns true if `approve` action is allowed
    // ...
}

if(resultXX325.IsAllowed("view:public")){ // returns true if `view:public` action is allowed
    // ...
}
```

### Plan Resources API

```csharp
PlanResourcesResult result = client.
    .PlanResources(
        Principal.NewInstance("maggie","manager")
        .WithAttribute("department", AttributeValue.StringValue("marketing"))
        .WithAttribute("geography", AttributeValue.StringValue("GB"))
        .WithAttribute("team", AttributeValue.StringValue("design")),
        
        Resource.NewInstance("leave_request")
        .WithPolicyVersion("20210210"),
        
        "approve"
    );

if(result.IsAlwaysAllowed()) {
    // ...
}
else if (result.IsAlwaysDenied()) {
    // ...
}
else {
    // ...
}
```