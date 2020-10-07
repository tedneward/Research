title=Curl
tags=language, platform
summary=Richer Internet Applications: the Curl language, development environment, runtime engine, and development libraries.
~~~~~~

[Website](https://www.curl.com)

[Curl Language](https://www.curl.com/products/prod/language/):

A document formatting language, a layout markup language, a data-processing, expressive, procedural language, a highly-modular object-oriented language - Curl is all of these. While many other interfaces require deploying a combination of different languages, Curl blends together the capabilities of several. When the developer can work back-to-front in a single language, the results are easier development, maintenance, and upgrading.

Some of Curl’s key advantages:

* Text Markup and Layout Design (Like HTML)
* Object-Oriented Programming Language (Like Java)
* Event-Driven Execution (Like Visual Basic)

### Text Markup and Layout Design (Like HTML)
Like HTML, Curl can layout graphics and text with markup directly in source code.

```
[curl 6.0 applet]
[curl-file-attributes character-encoding = "shift-jis"]

Hello,world!

[Frame
  width = 100pt,
  height = 100pt,
  background = "red"
]

[text font-size = 24pt,color = "green", This is Curl!]
```

### Object-Oriented Programming Language (Like Java)
```
[curl 6.0 applet]
[curl-file-attributes character-encoding = "shift-jis"]

[define-class public Foo
  [method public [hello]:void
    [popup-message "Hello!"]
  ]
]

[define-class public Bar [inherits Foo]
  [method public [hello]:void
    [popup-message "Hello World!"]
  ]
]

[do
  let foo:Foo = [Bar]
  [foo.hello]
]
```

### Event-Driven Execution (like Visual Basic)
```
[curl 6.0 applet]
[curl-file-attributes character-encoding = "shift-jis"]

[CommandButton
  label = "Push me!",
  [on Action do
    [popup-message
      "You pushed my button!!"
    ]
  ]
]
```
