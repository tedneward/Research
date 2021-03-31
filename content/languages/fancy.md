title=Fancy
tags=language
summary=A pure dynamic object-oriented, self-hosted programming language for the Rubinius VM.
~~~~~~

[Website](http://www.fancy-lang.org/) | [Source](https://github.com/bakkdoor/fancy) | [Reference](http://api.fancy-lang.org/)

Fancy is a new general-purpose programming language inspired by Smalltalk, Ruby, Io and Erlang that runs on the Rubinius VM. It has first-class integration support with Ruby and any Ruby libraries supported by Rubinius, including most C-extensions. Fancy is a dynamic, pure object-oriented, class-based programming language with built-in support for futures and actors. The syntax is easy to learn, consistent and is mostly inspired by Ruby and Smalltalk.

Hello World
```
"Hello, World!" println 
```

Fibonacci
```
class Fixnum {
  def fib {
    match self {
      case 0 -> 0
      case 1 -> 1
      case _ -> self - 1 fib + (self - 2 fib)
    }
  }
}

15 times: |x| {
  x fib println
}
```
Class example
```
class Greeter {
  def initialize: @name
  def greet {
    "Hello, #{@name}" println
  }
}

g = Greeter new: "World!"
g greet # => "Hello, World!"
```

Write web apps with Sinatra.fy
```
require: "sinatra.fy"

configure: 'production with: {
  disable: 'show_errors
  enable: 'logging
}

set: 'port to: 3000

before: {
  "incoming request: #{request inspect}" println
}

def page: text {
  """
  <html>
    <body>
      <h1>#{text}</h1>
    </body>
  </html>
  """
}

get: "/:p" do: |param| {
  page: "Fancy web page: #{param}"
}

not_found: {
  page: "Invalid request URL."
}
```

Actors
```
class Ring {
  class Node {
    def initialize: @next ring: @ring

    def count: count {
      match @next {
        case nil ->
          "DONE: " ++ count println
          @ring finish!
        case _ ->
          "." print
          @next @@ count: (count + 1)
      }
      die! # let this actor die to free resources
    }
  }

  def initialize: amount {
    node = nil
    amount times: {
      node = Node new: node ring: self
    }
    @start = node
  }

  def start: @parent {
    @start count: 1
  }

  def finish! {
    @parent run
  }
}

# create ring and run through it
ring = Ring new: 4000
ring start: $ Thread current
Thread stop # wait until finished
```
