title=Smithy
tags=distribution
summary=An extensible, typesafe, protocol agnostic, tool for defining services, resources, and operations, and powers services at AWS.
~~~~~~

[Website](https://smithy.io/) | [Source](https://github.com/smithy-lang/smithy) | [Docs (2.0)](https://smithy.io/2.0/index.html)

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


