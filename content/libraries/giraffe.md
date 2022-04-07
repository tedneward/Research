title=Giraffe
tags=library, clr, functional, distribution
summary=A functional ASP.NET Core micro web framework for building rich web applications.
~~~~~~

[Website](https://giraffe.wiki/) | [Source](https://github.com/giraffe-fsharp/Giraffe)


"Giraffe is an F# micro web framework for building rich web applications. It has been heavily inspired and is similar to Suave, but has been specifically designed with ASP.NET Core in mind and can be plugged into the ASP.NET Core pipeline via middleware. Giraffe applications are composed of so called HttpHandler functions which can be thought of a mixture of Suave's WebParts and ASP.NET Core's middleware.

"You can think of Giraffe as the functional counter part of the ASP.NET Core MVC framework."

## Getting Started

`dotnet new -i "giraffe-template::*"` installs the template.

`dotnet new giraffe` creates a new application.

## Hello, Giraffe

```fsharp
open System
open Microsoft.AspNetCore.Builder
open Microsoft.AspNetCore.Hosting
open Microsoft.Extensions.Hosting
open Microsoft.Extensions.Logging
open Microsoft.Extensions.DependencyInjection
open Giraffe

let webApp =
    choose [
        route "/ping"   >=> text "pong"
        route "/"       >=> htmlFile "/pages/index.html" ]

type Startup() =
    member __.ConfigureServices (services : IServiceCollection) =
        // Register default Giraffe dependencies
        services.AddGiraffe() |> ignore

    member __.Configure (app : IApplicationBuilder)
                        (env : IHostEnvironment)
                        (loggerFactory : ILoggerFactory) =
        // Add Giraffe to the ASP.NET Core pipeline
        app.UseGiraffe webApp

[<EntryPoint>]
let main _ =
    Host.CreateDefaultBuilder()
        .ConfigureWebHostDefaults(
            fun webHostBuilder ->
                webHostBuilder
                    .UseStartup<Startup>()
                    |> ignore)
        .Build()
        .Run()
    0
```

... or more functional:

```
open System
open Microsoft.AspNetCore.Builder
open Microsoft.AspNetCore.Hosting
open Microsoft.Extensions.Hosting
open Microsoft.Extensions.DependencyInjection
open Giraffe

let webApp =
    choose [
        route "/ping"   >=> text "pong"
        route "/"       >=> htmlFile "/pages/index.html" ]

let configureApp (app : IApplicationBuilder) =
    // Add Giraffe to the ASP.NET Core pipeline
    app.UseGiraffe webApp

let configureServices (services : IServiceCollection) =
    // Add Giraffe dependencies
    services.AddGiraffe() |> ignore

[<EntryPoint>]
let main _ =
    Host.CreateDefaultBuilder()
        .ConfigureWebHostDefaults(
            fun webHostBuilder ->
                webHostBuilder
                    .Configure(configureApp)
                    .ConfigureServices(configureServices)
                    |> ignore)
        .Build()
        .Run()
    0
```
