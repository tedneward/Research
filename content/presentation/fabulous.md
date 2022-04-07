title=Fabulous
tags=presentation, library, clr, functional
summary=F# Functional App Development, using declarative dynamic UI.
~~~~~~

[Website](https://fsprojects.github.io/Fabulous/) | [Source](https://github.com/fsprojects/Fabulous)

*F# Functional App Development, using declarative dynamic UI*

## Documentation

* [Getting started](https://fsprojects.github.io/Fabulous/Fabulous.XamarinForms/index.html#getting-started)

* [Fabulous documentation](https://fsprojects.github.io/Fabulous/)

## About Fabulous

Fabulous aims to provide all the tools to let you create your own mobile and desktop apps using only F# and the [Model-View-Update architecture](https://guide.elm-lang.org/architecture/) (shorten to MVU), with a great F# DSL for building dynamic UIs.  
The combination of F# and MVU makes for a great development experience.

Note that Fabulous itself does not provide UI controls, so you'll need to combine it with another framework like Xamarin.Forms.

### Fabulous for Xamarin.Forms

Fabulous for Xamarin.Forms combines both frameworks with a tailored DSL to let you take advantage of everything Xamarin.Forms has to offer while keeping all the benefits of Fabulous.

With Fabulous for Xamarin.Forms, you will be able to write complete applications in F# like this:
```fsharp
type Model = { Text: string }
type Msg = ButtonClicked

let init () = { Text = "Hello Fabulous!" }

let update msg model =
    match msg with
    | ButtonClicked -> { model with Text = "Thanks for using Fabulous!" }

let view model dispatch =
    View.ContentPage(
        View.StackLayout(
            children = [
                View.Image(source = Image.fromPath "fabulous.png")
                View.Label(text = model.Text)
                View.Button(text = "Click me", command = fun () -> dispatch ButtonClicked)
            ]
        )
    )
```

[Learn more about Fabulous for Xamarin.Forms](https://github.com/fsprojects/Fabulous/tree/master/Fabulous.XamarinForms)

### Can I use Fabulous with other UI frameworks?

Fabulous is not tied to Xamarin.Forms.  
If you want to use your favorite UI framework instead, it's possible.

To help you with that, Fabulous comes with its own code generator, called Fabulous.CodeGen, to automate the creation of a DSL specific to your UI framework.

[Learn more about Fabulous.CodeGen](Fabulous.CodeGen/README.md)
