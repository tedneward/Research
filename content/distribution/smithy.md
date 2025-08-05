title=Smithy
tags=distribution, dsl, language
summary=An extensible, typesafe, protocol agnostic, tool for defining services, resources, and operations, and powers services at AWS.
~~~~~~

[Website](https://smithy.io/) | [Source](https://github.com/smithy-lang/smithy) | [Docs (2.0)](https://smithy.io/2.0/index.html) | [Examples](https://github.com/smithy-lang/smithy-examples)

# Quick Start

## Shapes and traits
Smithy models consist of shapes and traits. Shapes are instances of types. Traits are used to add more information to shapes that might be useful for clients, servers, or documentation.

Smithy supports the following types:

Type | Description
---- | -----------
blob | Uninterpreted binary data
boolean | Boolean value type
string | UTF-8 encoded string
byte | 8-bit signed integer ranging from -128 to 127 (inclusive)
short | 16-bit signed integer ranging from -32,768 to 32,767 (inclusive)
integer | 32-bit signed integer ranging from -2^31 to (2^31)-1 (inclusive)
long | 64-bit signed integer ranging from -2^63 to (2^63)-1 (inclusive)
float | Single precision IEEE-754 floating point number
double | Double precision IEEE-754 floating point number
bigInteger | Arbitrarily large signed integer
bigDecimal | Arbitrary precision signed decimal number
timestamp | An instant in time with no UTC offset or timezone.
document | An untyped JSON-like value.
List | Homogeneous collection of values
Map | Map data structure that maps string keys to homogeneous values
Structure | Fixed set of named heterogeneous members
Union | Tagged union data structure that can take on several different, but fixed, types
Service | Entry point of an API that aggregates resources and operations together
Operation | Represents the input, output and possible errors of an API operation
Resource | An entity with an identity, set of operations, and child resources

## Defining resources
A resource is contained within a service or another resource. Resources have identifiers, operations, and any number of child resources.

model/weather.smithy
```
$version: "2"
namespace example.weather

/// Provides weather forecasts.
service Weather {
    version: "2006-03-01"
    resources: [
        City
    ]
}

resource City {
    identifiers: { cityId: CityId }
    read: GetCity
    list: ListCities
}

// "pattern" is a trait.
@pattern("^[A-Za-z0-9 ]+$")
string CityId
```

Because the Weather service contains many cities, the City resource defines an identifier. Identifiers are used to refer to a specific resource within a service. The "identifiers" property is a mapping of identifier names to the shape to use for that identifier. If the input structure of an operation uses the same names and targeted shapes as the identifiers property of the resource, the structure is automatically configured to work with the resource so that input members of the operation are used to provide the identity of the resource.

Each City has a single Forecast. This can be defined by adding the Forecast resource to the resources property of the City resource.

```
resource City {
    identifiers: { cityId: CityId }
    read: GetCity
    list: ListCities
    resources: [
        Forecast
    ]
}

resource Forecast {
    identifiers: { cityId: CityId }
    read: GetForecast
}
```

Child resources must define the exact same identifiers property of their parent, but they are allowed to add any number of additional identifiers if needed. Because there is only one forecast per city, no additional identifiers were added to the identifiers property that isn't present on the City resource.

The state of a resource is represented through its properties. City contains coordinates, and Forecast has a chance of rain represented as a float. Input and output members of resource operations map to resource properties or identifiers to perform updates on or examine the state of a resource.

model/weather.smithy
```
resource City {
    identifiers: { cityId: CityId }
    properties: { coordinates: CityCoordinates }
    read: GetCity
    list: ListCities
    resources: [
        Forecast
    ]
}

structure CityCoordinates {
    @required
    latitude: Float

    @required
    longitude: Float
}


structure GetCityOutput for City {
    $coordinates
}

resource Forecast {
    identifiers: { cityId: CityId }
    properties: { chanceOfRain: Float }
    read: GetForecast
}

structure GetForecastOutput for Forecast {
    $chanceOfRain
}
```

## Defining operations
The put, create, read, update, delete, and list properties of a resource are used to define the lifecycle operations of a resource. Lifecycle operations are the canonical methods used to read and transition the state of a resource using well-defined semantics. Defining lifecycle operations helps automated tooling reason about your API.

Let's define the operation used to "read" a City.

model/weather.smithy
```
@readonly
operation GetCity {
    input := for City {
        // "cityId" provides the identifier for the resource and
        // has to be marked as required.
        @required
        $cityId
    }

    output := for City {
        // "required" is used on output to indicate if the service
        // will always provide a value for the member.
        // "notProperty" indicates that top-level input member "name"
        // is not bound to any resource property.
        @required
        @notProperty
        name: String

        @required
        $coordinates
    }

    errors: [
        NoSuchResource
    ]
}

// "error" is a trait that is used to specialize
// a structure as an error.
@error("client")
structure NoSuchResource {
    @required
    resourceType: String
}
```

And define the operation used to "read" a Forecast.

model/weather.smithy
```
@readonly
operation GetForecast {
    // "cityId" provides the only identifier for the resource since
    // a Forecast doesn't have its own.
    input := for Forecast {
        @required
        $cityId
    }

    output := for Forecast {
        $chanceOfRain
    }
}
```

Review

* Operations accept and return structured messages.
* Operations are bound to service shapes and resource shapes.
* Operations marked as readonly trait indicate the operation has no side effects.
* Operations should define the errors it can return.


Modeling a service should be easy, no matter the interface.

### Model
Build APIs your customers will love using the Smithy Interface Definition Language (IDL).

The Smithy IDL provides an intuitive syntax that codifies best practices learned from years of experience building services and SDKs in over a dozen programming languages.

Use Smithy's extensible model validation tools to ensure the quality and consistency of your APIs. Customizable linting, validation, and backwards-compatibility checks integrate with your IDE and CI/CD pipelines so you catch API quality issues before your customers do.

### Build
Smithy's build tool integrations and plugin system make it easy to get started generating code from a Smithy model. Use one of the many open-source plugins for Smithy or create your own to make everything from model diagrams to SDKs.

Write your API model once and generate clients, servers, and documentation for multiple programming languages with Smithy's CLI.

## Example: Full-Stack Application

### Models
main.smithy
```
$version: "2.0"

namespace com.example

use aws.protocols#restJson1
use smithy.framework#ValidationException

/// Allows users to retrieve a menu, create a coffee order, and
/// and to view the status of their orders
@title("Coffee Shop Service")
@restJson1
service CoffeeShop {
    version: "2024-08-23"
    operations: [
        GetMenu
    ]
    resources: [
        Order
    ]
    errors: [
        ValidationException
    ]
}

/// Retrieve the menu
@http(method: "GET", uri: "/menu")
@readonly
operation GetMenu {
    output := {
        items: CoffeeItems
    }
}
```
coffee.smithy
```
$version: "2.0"

namespace com.example

/// An enum describing the types of coffees available
enum CoffeeType {
    DRIP
    POUR_OVER
    LATTE
    ESPRESSO
    COLD_BREW
}

/// A structure which defines a coffee item which can be ordered
structure CoffeeItem {
    @required
    type: CoffeeType

    @required
    description: String
}

/// A list of coffee items
list CoffeeItems {
    member: CoffeeItem
}
```
order.smithy
```
$version: "2.0"

namespace com.example

/// An Order resource, which has an id and descibes an order by the type of coffee
/// and the order's status
resource Order {
    identifiers: {
        id: Uuid
    }
    properties: {
        coffeeType: CoffeeType
        status: OrderStatus
    }
    read: GetOrder
    create: CreateOrder
}

/// Create an order
@idempotent
@http(method: "PUT", uri: "/order")
operation CreateOrder {
    input := for Order {
        @required
        $coffeeType
    }

    output := for Order {
        @required
        $id

        @required
        $coffeeType

        @required
        $status
    }
}

/// Retrieve an order
@readonly
@http(method: "GET", uri: "/order/{id}")
operation GetOrder {
    input := for Order {
        @httpLabel
        @required
        $id
    }

    output := for Order {
        @required
        $id

        @required
        $coffeeType

        @required
        $status
    }

    errors: [
        OrderNotFound
    ]
}

/// An error indicating an order could not be found
@httpError(404)
@error("client")
structure OrderNotFound {
    message: String
    orderId: Uuid
}

/// An identifier to describe a unique order
@length(min: 1, max: 128)
@pattern("^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$")
string Uuid

/// An enum describing the status of an order
enum OrderStatus {
    IN_PROGRESS
    COMPLETED
}
```

### Server implementation
index.ts
```
import { getCoffeeShopServiceHandler } from "@com.example/coffee-shop-server";
import { IncomingMessage, ServerResponse, createServer } from "http";
import { convertRequest, writeResponse } from "@aws-smithy/server-node";
import { CoffeeShop } from "./CoffeeShop";


// Instantiate our coffee service implementation
const coffeeService = new CoffeeShop();
// Create a service handler using our coffee service
const serviceHandler = getCoffeeShopServiceHandler(coffeeService);
// The coffee shop context object
const ctx = { orders: new Map(), queue: [] };

// Create the node server with the service handler
const server = createServer(async function (
  req: IncomingMessage,
  res: ServerResponse<IncomingMessage> & { req: IncomingMessage }
) {
  // Convert NodeJS's http request to an HttpRequest.
  const httpRequest = convertRequest(req);

  // Call the service handler, which will route the request to the GreetingService
  // implementation and then serialize the response to an HttpResponse.
  const httpResponse = await serviceHandler.handle(httpRequest, ctx);

  // Write the HttpResponse to NodeJS http's response expected format.
  return writeResponse(httpResponse, res);
});

const port = 3001
server.listen(port);
console.log(`Started server on port ${port}...`);

// Asynchronously handle orders as they come in
coffeeService.handleOrders(ctx)
```
CoffeeShop.ts
```
import { CoffeeShopService, CoffeeType, CreateOrderServerInput, CreateOrderServerOutput, GetMenuServerInput, GetMenuServerOutput, GetOrderServerInput, GetOrderServerOutput, OrderNotFound, OrderStatus } from "@com.example/coffee-shop-server";
import { randomUUID } from "crypto";

// A context object for holding state in our service
export interface CoffeeShopContext {
    // A map for storing order information
    orders: Map<string, OrderData>;
    // An order queue for handling orders
    queue: OrderData[];
}

// An implementation of the service from the SSDK
export class CoffeeShop implements CoffeeShopService<CoffeeShopContext> {

    async CreateOrder(input: CreateOrderServerInput, context: CoffeeShopContext): Promise<CreateOrderServerOutput> {
        console.log("received an order request...")
        const order = {
            orderId: randomUUID(),
            coffeeType: input.coffeeType,
            status: OrderStatus.IN_PROGRESS
        }

        context.orders.set(order.orderId, order)
        context.queue.push(order)

        console.log(`created order: ${JSON.stringify(order)}`)
        return {
            id: order.orderId,
            coffeeType: order.coffeeType,
            status: order.status
        }
    }

    async GetMenu(input: GetMenuServerInput, context: CoffeeShopContext): Promise<GetMenuServerOutput> {
        console.log("getting menu...")
        return {
            items: [
                {
                    type: CoffeeType.DRIP,
                    description: "A clean-bodied, rounder, and more simplistic flavour profile.\n" +
                        "Often praised for mellow and less intense notes.\n" +
                        "Far less concentrated than espresso."
                },
                {
                    type: CoffeeType.POUR_OVER,
                    description: "Similar to drip coffee, but with a process that brings out more subtle nuances in flavor.\n" +
                        "More concentrated than drip, but less than espresso."
                },
                {
                    type: CoffeeType.LATTE,
                    description: "A creamier, milk-based drink made with espresso.\n" +
                        "A subtle coffee taste, with smooth texture.\n" +
                        "High milk-to-coffee ratio."
                },
                {
                    type: CoffeeType.ESPRESSO,
                    description: "A highly concentrated form of coffee, brewed under high pressure.\n" +
                        "Syrupy, thick liquid in a small serving size.\n" +
                        "Full bodied and intensely aromatic."
                },
                {
                    type: CoffeeType.COLD_BREW,
                    description: "A high-extraction and chilled form of coffee that has been cold-pressed..\n" +
                        "Different flavor profile than other hot methods of brewing.\n" +
                        "Smooth and slightly more caffeinated as a result of its concentration."
                }
            ]
        }
    }

    async GetOrder(input: GetOrderServerInput, context: CoffeeShopContext): Promise<GetOrderServerOutput> {
        console.log(`getting an order (${input.id})...`)
        if (context.orders.has(input.id)) {
            const order = context.orders.get(input.id)
            return {
                id: order.orderId,
                coffeeType: order.coffeeType,
                status: order.status
            }
        } else {
            console.log(`order (${input.id}) does not exist.`)
            throw new OrderNotFound({
                message: `order ${input.id} not found.`,
                orderId: input.id
            })
        }
    }

    // Handle orders as they come in (FIFO), marking them completed based on some random
    // timing (to simulate a delay)
    async handleOrders(context: CoffeeShopContext) {
        console.log("handling orders...")
        while (true) {
            await new Promise(resolve => setTimeout(resolve, Math.random() * 1000 + 1000));
            let order = context.queue.shift()
            if (order != null) {
                order.status = OrderStatus.COMPLETED
                console.log(`order ${order.orderId} is completed.`)  
            }
        }
    }
}

// A data object to hold order data
interface OrderData {
    orderId: string
    coffeeType: CoffeeType;
    status: OrderStatus;
}
```

---

## Build tools
* [Smithy CLI](https://github.com/smithy-lang/smithy/tree/main/smithy-cli) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> - Smithy CLI is used to build, validate, diff, and transform Smithy models.
* [Gradle Plugin](https://github.com/smithy-lang/smithy-gradle-plugin) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> - Integrates Smithy with the Gradle build system.
* [Mill Plugin](https://disneystreaming.github.io/smithy4s/docs/overview/installation/#mill) - Community supported plugin that integrates smithy with the [Mill build tool](https://github.com/com-lihaoyi/mill).
* [SBT Plugin](https://disneystreaming.github.io/smithy4s/docs/overview/installation/#sbt) - Community supported plugin that integrates smithy with the SBT build system for Scala.

## Code Generators

### Client Code Generators
* [TypeScript](https://github.com/awslabs/smithy-typescript) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> 🚧 - Client code generation for Typescript.
* [Java](https://github.com/smithy-lang/smithy-java) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> 🚧 - Client code generation for Java.
* [Golang](https://github.com/aws/smithy-go) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> 🚧 - Client code generation for Golang.
* [Rust](https://github.com/awslabs/smithy-rs) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> 🚧 - Client code generation for Rust.
* [Ruby](https://github.com/awslabs/smithy-ruby) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> 🚧 - Client code generation for Ruby.
* [Kotlin](https://github.com/awslabs/smithy-kotlin) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> 🚧 - Client code generation for Kotlin.
* [Swift](https://github.com/awslabs/smithy-swift) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> 🚧 - Client code generation for Swift.
* [Scala](https://github.com/disneystreaming/smithy4s) - Community plugin for generation of clients/servers in Scala.
* [Dafny](https://github.com/awslabs/smithy-dafny) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> 🚧 - Code generation tools for the [Dafny](https://dafny.org/) verification-aware programming language.
* [Python](https://github.com/smithy-lang/smithy-python) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> 🚧 - Client code generation for Python.

### Server Code Generators
* [TypeScript](https://github.com/awslabs/smithy-typescript) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> 🚧 - Server generator for TypeScript.
* [Java](https://github.com/smithy-lang/smithy-java) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> 🚧 - Server code generation for Java.
* [Rust](https://github.com/awslabs/smithy-rs) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> 🚧 - Server generator for Rust.
* [Scala](https://github.com/disneystreaming/smithy4s) - Community plugin for generation of clients/servers in Scala.


## Learning resources
* [Smithy Examples](https://github.com/smithy-lang/smithy-examples) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> - A collection of examples to help you get up and running with Smithy.
* [aws-samples: Typescript Example service](https://github.com/aws-samples/smithy-server-generator-typescript-sample) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> - Shows how to write a Typescript lambda service using Smithy and call the service using a generated client (see: [blog post](https://aws.amazon.com/blogs/devops/smithy-server-and-client-generator-for-typescript/)).
* [Rust server SDK examples](https://github.com/awslabs/smithy-rs/tree/main/examples) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> - a collection of examples using Smithy to generate a Rust server SDK.
* [kubukoz/smithy4s-course](https://github.com/kubukoz/smithy4s-course) - Smithy/Smithy4s course.

## IDE Support
* [Smithy LSP](https://github.com/awslabs/smithy-language-server) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> 🚧 - A Language Server Protocol implementation for the Smithy IDL.
* [Visual Studio Code Plugin](https://github.com/awslabs/smithy-vscode) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> 🚧 - Visual Studio Code extension providing a Language Server Protocol implementation for the Smithy IDL.
* [Intellij plugin](https://github.com/awslabs/smithy-intellij) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> 🚧 - Provides IDE integration for the Smithy IDL within IntelliJ IDEA.
* [iancaffey/smithy-intellij-plugin](https://github.com/iancaffey/smithy-intellij-plugin) - Community plugin for IDE integration for the Smithy IDL in Intellij IDEA.
* [Tree Sitter Grammar for Smithy](https://github.com/indoorvivants/tree-sitter-smithy) - Tree-sitter grammar for Smithy. Included in [Neovim](https://github.com/nvim-treesitter/nvim-treesitter) and [Helix](https://docs.helix-editor.com/) by default.
* [Zed extension](https://github.com/joshrutkowski/zed-smithy) - [Zed](https://zed.dev/) extension using [Tree-sitter grammar for Smithy](https://github.com/indoorvivants/tree-sitter-smithy).

## Implementations
* [Smithy Reference Implementation](https://github.com/awslabs/smithy) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> - Smithy reference implementation in Java
* [Atelier](https://github.com/johnstonskj/rust-atelier) 🚧 - Community implementation of Smithy in Rust

## Model Converters
* [Smithy to OpenAPI](https://smithy.io/2.0/guides/converting-to-openapi.html#smithy-to-openapi) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> - Converts Smithy models to [OpenAPI](https://www.openapis.org/).
* [Smithy to JSONSchema](https://github.com/awslabs/smithy/tree/main/smithy-jsonschema) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> - Converts Smithy models to [JSONSchema](https://json-schema.org/).
* [Cloud Formation Resource Schemas](https://smithy.io/2.0/guides/generating-cloudformation-resources.html#smithy-to-cloudformation) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> - Generating Cloudformation resource schemas from Smithy models.
* [Openapi/JSONSchema to Smithy](https://github.com/disneystreaming/smithy-translate) - smithy-translate : a community-provided CLI tool for best-effort Openapi/JSONSchema to Smithy conversions
* [Smithy to Protobuf](https://github.com/disneystreaming/smithy-translate) - smithy-translate (see above)

## CICD Support

### GitHub Actions
* [setup-smithy](https://github.com/marketplace/actions/setup-smithy) - Install Smithy CLI to your GitHub Workflow.
* [format-smithy](https://github.com/marketplace/actions/format-smithy) - Checks if Smithy Models are formatted.

## Videos
* [Scaling APIs with Smithy](https://www.youtube.com/watch?v=3GpZzu4guTE) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> - Overview of Smithy's background and features.
* [Abstraction: Creating the Best developer experience / Model-First Design](https://youtu.be/gX2sHQafadA?t=1558) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> - An introduction to model first design with Smithy.
* [Building with the new AWS SDKs for Rust, Kotlin, and Swift](https://www.youtube.com/watch?v=Nhk1K1AjYvg) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> - Explores how these SDKs were built in parallel with Smithy, the commonalities they share, and how to build an app with each one.
* [Simplify building applications with AWS SDKs](https://www.youtube.com/watch?v=7J0UMAGgAdw) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> - Discusses how Smithy and model-first API design are used at AWS, how the AWS SDKs model client-side primitives such as paginators in Smithy, and how the AWS SDKs are evolving to use a standardized architecture.
* [Introduction to Smithy/Smithy4s](https://www.youtube.com/watch?v=CA8qGXMQ3cE) - Scala Conference talk introducing the Smithy IDL and the Smithy4s library
* [Generating Kotlin SDKs with Smithy](https://www.youtube.com/watch?v=Wsra04prG-E) - KotlinConf talk that provides an overview of Smithy and discusses how `smithy-kotlin` can be used to generate Kotlin SDKs
* [Elevating API Design With Smithy](https://www.youtube.com/watch?v=tufEEuPn6Lk) - Functional Scala talk - Intro to Smithy IDL with JVM Tooling and Smithy4s 

## Blog Posts
* [Introducing Smithy IDL 2.0](https://aws.amazon.com/blogs/developer/introducing-smithy-idl-2-0/) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> - Launch announcement for the Smithy IDL 2.0.
* [Introducing the Smithy CLI](https://aws.amazon.com/blogs/developer/introducing-the-smithy-cli/) <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> - Launch announcement for the Smithy CLI along with examples of how to use the CLI.
* [Developer Preview: Ruby SDK code generation using Smithy](https://aws.amazon.com/blogs/developer/developer-preview-smithy-code-generated-ruby-sdk/)  <img src="/assets/smithy-anvil.svg" alt="(official)" title="Smithy Official" height="10px"> - Launch announcement for and overview of the AWS Ruby SDK built with Smithy.
* [Smithy4s-full stack](https://blog.indoorvivants.com/2022-06-10-smithy4s-fullstack-part-1) - A series of posts describing an application built with Smithy4s in both front-end and back-end.
* [Introducing AWS API models and publicly available resources for AWS API definitions](https://aws.amazon.com/blogs/aws/introducing-aws-api-models-and-publicly-available-resources-for-aws-api-definitions/) - Launch announcement for AWS's API models being published as Smithy specs in Maven Central.

## Others
* [Smithy Playground](https://github.com/kubukoz/smithy-playground/) 🚧 - A language server and VS Code client for interactive experimentation with Smithy services.
* [Build Server Protocol](https://github.com/build-server-protocol/build-server-protocol) - an extension to the Language Server Protocol using Smithy as a definition language.
* [Alloy](https://github.com/disneystreaming/alloy/) - a library of Smithy traits providing additional semantics and constraints, used in particular by smithy-translate and smithy4s.
* [smaws](https://github.com/chris-armstrong/smaws/) - a Smithy generator and AWS SDK built in OCaml
* [Smithy Selector Playground](http://github.com/kubukoz/smithy-selector-playground/) - a web tool for experimenting with Smithy selectors
* [Smithy Transcoder](https://github.com/kubukoz/smithy-transcoder) - a web tool for previewing the serialized form of Smithy models
