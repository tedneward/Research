title=WebSharper
tags=presentation, browser, clr
summary=Robust, full-stack, client-server/single-page/HTML applications in C# and F#.
~~~~~~

[Website](https://websharper.com/) | [Source](https://github.com/dotnet-websharper)

### From the Documentation/Basics:

#### Hello World!
With WebSharper you can develop pure JS/HTML, and single- and multi-page web applications with an optional server side, all in F#. Unless you are looking for low-level control, we recommend that you start by creating a sitelet.

The simplest sitelet serves text on a single endpoint at the root of the application:

```
module YourApp

open WebSharper
open WebSharper.Sitelets

[<Website>]
let Main = Application.Text (fun ctx -> "Hello World!")
```

![](http://i.imgur.com/fZgqeKjm.png)

#### Single Page Applications
While serving text is fun and often useful, going beyond isn’t any complicated. For instance, you can easily construct single-page applications:

```
module YourApp

open WebSharper
open WebSharper.Sitelets
open WebSharper.UI.Html
open WebSharper.UI.Server

[<Website>]
let Main =
    Application.SinglePage (fun ctx ->
        Content.Page(
            h1 [] [text "Hello World!"]
        )
    )
```

This code creates an empty HTML document and inserts a header node.

![](http://i.imgur.com/xYITvCqm.png)

#### HTML responses
Pages are a special type of content responses, and you can easily finetune them by specifying where you want content to be added, by using an optional Title, Head, Body, and Doctype.

```
    ...
    Application.SinglePage (fun ctx ->
        Content.Page(
            Title = "My Hello World app",
            Body = [
                h1 [text "Hello World!"]
            ],
            ...
        )
    )
```

You can construct HTML via the (soon legacy) WebSharper 3.x markup combinators in WebSharper.Html.Server and WebSharper.Html.Client (for client-side markup, see the section below), or using the next generation reactive HTML language from WebSharper UI (as above and in the examples on this page; formerly called UI.Next).

#### Custom responses
Content responses are asynchronous. Next to full HTML pages, you can return:

* Plain text with `Content.Text`:

```
Content.Text "Hello World!"
```

* JSON values with `Content.Json` (visit JSON documentation or JSON cheatsheet for more info):

```
type Person = { First: string; Last: string; Age: int}

Content.Json { First="John"; Last="Smith"; Age=30 }
```

* Files with `Content.File`:

```
Content.File("Main.fs", ContentType="text/plain")
```

* Various error codes:

```
Content.Unauthorized (401)
Content.Forbidden (403)
Content.NotFound (404)
Content.MethodNotAllowed (405)
Content.ServerError (500)
```

* You can also create your own custom error code response:

```
Content.Custom(Status=Http.Status.Custom 402 (Some "Payment Required"))
```

* Any other custom content with `Content.Custom`.


#### Multi-page applications
Multi-page applications have multiple endpoints: pairs of HTTP verbs and paths, and are represented as an annotated union type we typically call Endpoints (or Action in previous terminology). The endpoints, as defined by this union type - given the various annotations on each union case - are mapped to content to be served using Application.MultiPage. Links to endpoints in your site can be calculated from the serving context, so you will never have invalid URLs.

```
module YourApp

open WebSharper
open WebSharper.Sitelets
open WebSharper.UI
open WebSharper.UI.Html
open WebSharper.UI.Server

type Endpoints =
    | [<EndPoint "GET /">] Home
    | [<EndPoint "GET /about">] About

[<Website>]
let Main =
    Application.MultiPage (fun ctx endpoint ->
        let (=>) label endpoint = a [attr.href (ctx.Link endpoint)] [text label]
        match endpoint with
        | Endpoints.Home ->
            Content.Page(
                Body = [
                    h1 [] [text "Hello world!"]
                    "About" => Endpoints.About
                ]
            )
        | Endpoints.About ->
            Content.Page(
                Body = [
                    p [] [text "This is a simple app"]
                    "Home" => Endpoints.Home
                ]
            )
    )
```

![](http://i.imgur.com/WMnmzIPm.png)


#### Adding client-side functionality
WebSharper applications can easily incorporate client-side content, expressed in F#, giving an absolute edge over any web development library. Just mark your client-side functions or modules with [<JavaScript>] and embed them into server side markup using client. Server-side RPC functions are annotated with [<Rpc>].

The example below is reimplemented from the blog entry Deploying WebSharper apps to Azure via GitHub, also available in the main WebSharper templates, and although it omits the more advanced templating in that approach (which is straightforward to add to this implementation), it should give you an recipe for adding client-side functionality to your sitelets easily.

```
module YourApp

open WebSharper
open WebSharper.Sitelets
open WebSharper.UI
open WebSharper.UI.Html
open WebSharper.UI.Client

module Server =
    [<Rpc>]
    let DoWork (s: string) = 
        async {
            return System.String(List.ofSeq s |> List.rev |> Array.ofList)
        }

[<JavaScript>]
module Client =
    open WebSharper.JavaScript

    let Main () =
        let input = input [attr.value ""] []
        let output = h1 [] []
        div [
            input
            button [
                on.click (fun _ _ ->
                    async {
                        let! data = Server.DoWork input.Value
                        output.Text <- data
                    }
                    |> Async.Start
                )
            ] [text "Send"]
            hr [] []
            h4A [attr.``class`` "text-muted"] [text "The server responded:"]
            div [attr.``class`` "jumbotron"] [output]
        ]

open WebSharper.UI.Server

[<Website>]
let MySite =
    Application.SinglePage (fun ctx ->
        Content.Page(
            Body = [
                h1 [] [text "Say Hi to the server"]
                div [] [client <@ Client.Main() @>]
            ]
        )
    )
```

![](http://i.imgur.com/9sPa4lzm.png)

#### Using JavaScript libraries
WebSharper extensions bring JavaScript libraries to WebSharper. You can download extensions or develop your own using WIG, among others. Below is an example using WebSharper.Charting and chart.js underneath.

Note that these and any other dependencies you may be using will be automatically injected into a Content.Page or other sitelet HTML response, and you will never have to deal with them manually.

```
module YourApp

open WebSharper
open WebSharper.Sitelets
open WebSharper.UI
open WebSharper.UI.Html

[<JavaScript>]
module Client =
    open WebSharper.JavaScript
    open WebSharper.UI.Client
    open WebSharper.Charting

    let RadarChart () =
        let labels =    
            [| "Eating"; "Drinking"; "Sleeping";
               "Designing"; "Coding"; "Cycling"; "Running" |]
        let data1 = [|28.0; 48.0; 40.0; 19.0; 96.0; 27.0; 100.0|]
        let data2 = [|65.0; 59.0; 90.0; 81.0; 56.0; 55.0; 40.0|]

        let ch =
            Chart.Combine [
                Chart.Radar(Seq.zip labels data1)
                    .WithFillColor(Color.Rgba(151, 187, 205, 0.2))
                    .WithStrokeColor(Color.Rgba(151, 187, 205, 1.))
                    .WithPointColor(Color.Rgba(151, 187, 205, 1.))

                Chart.Radar(Seq.zip labels data2)
                    .WithFillColor(Color.Rgba(220, 220, 220, 0.2))
                    .WithStrokeColor(Color.Rgba(220, 220, 220, 1.))
                    .WithPointColor(Color.Rgba(220, 220, 220, 1.))
            ]
        Renderers.ChartJs.Render(ch, Size = Size(400, 400))

open WebSharper.UI.Server

[<Website>]
let MySite =
    Application.SinglePage (fun ctx ->
        Content.Page(
            Body = [
                h1 [] [text "Charts are easy with WebSharper Warp!"]
                div [] [client <@ Client.RadarChart() @>]
            ])
    )
```

![](http://i.imgur.com/9o7x2b1m.png)
