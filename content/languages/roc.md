title=Roc
tags=language, functional, wasm, native
summary=A fast, friendly, functional language.
~~~~~~

[Website](https://www.roc-lang.org/) | [Source](https://github.com/roc-lang/roc) | [Try](https://www.roc-lang.org/#try-roc)

Roc is a direct descendant of the Elm programming language.

* [basic-cli](https://github.com/roc-lang/basic-cli) - a Roc [platform](https://github.com/roc-lang/roc/wiki/Roc-concepts-explained#platform) to work with files, commands, HTTP, TCP, command line arguments, etc.
* [basic-webserver](https://github.com/roc-lang/basic-webserver) - a basic Web Server for Roc.

### Building an application
Make a file named main.roc and put this in it:

```
app "hello"
    packages { pf: "https://github.com/roc-lang/basic-cli/releases/download/0.2.0/8tCohJeXMBUnjo_zdMq0jSaqdYoCWJkWazBd4wa8cQU.tar.br" }
    imports [pf.Stdout]
    provides [main] to pf

main =
    Stdout.line "I'm a Roc application!"
```

Try running this with `roc dev`

