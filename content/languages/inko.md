title=Inko
tags=language
summary=A statically-typed, safe, object-oriented programming language for writing concurrent programs. Thanks to the use of lightweight processes, concurrency is easily achieved and data races are impossible.
~~~~~~

[Website](https://inko-lang.org/) | [Docs](https://inko-lang.org/documentation) | [Source](https://gitlab.com/inko-lang)

Inko consists of two parts: the virtual machine, and the compiler. The virtual machine is written in Rust, while the compiler is written in Ruby.

Inko is an object-oriented programming language, focusing on making it fun and easy to write concurrent programs, without the headaches. It tries to achieve this by combining various features, such as its error handling model, a high performance garbage collector, making concurrency easy, and much more.

Inko draws inspiration from several other languages, such as: Smalltalk, Self, Ruby, Erlang, and Rust. Some of Inko's features are borrowed from these languages. For example, the concurrency model is heavily inspired by Erlang, and the use of message passing for `if` and the likes is taken from Smalltalk.

## Features

Inko has a variety of features that make it stand out compared to other programming languages.

Writing concurrent tasks is done using lightweight processes. Each process has its own heap, and processes communicate via message passing.

```inko
import std::process
import std::stdio::stdout

let proc = process.spawn {
  # This will print "Hello world!" to STDOUT.
  match(let message = process.receive) {
    as String -> { stdout.print(message) }
    else -> {}
  }
}

proc.send('Hello world!')
```

The virtual machine uses preemptive multitasking, ensuring every process is given a fair and equal amount of time to do its work. This prevents a single process from blocking an OS thread indefinitely.

```inko
import std::process

let mut remaining = 100

# This will spawn 100 processes, all spinning forever, without blocking OS
# threads indefinitely.
while({ remaining > 0 }) {
  process.spawn { loop {} }
  remaining -= 1
}
```

Inko's error handling model prevents unexpected runtime errors from occurring, forcing you to handle errors directly at the call site. Blocks (methods, closures, and lambdas) can only throw an error of a single type. This drastically simplifies error handling, as you no longer need to catch potentially dozens of radically different errors. Sending a message that might throw requires you to start the expression with the `try` keyword.

```inko
import std::fs::file
import std::stdio::stdout

def read_file(path: String) -> String {
  # If file.read_only() throws, we simply return an empty String.
  let handle = try file.read_only(path) else return ''

  # handle.read_string might fail, in which case we will again return an empty
  # String.
  try handle.read_string else ''
}

stdout.print(read_file('README.md'))
```

Inko also lets you stop the program upon encountering an error, this is known as a "panic". Panics can be useful if there is no proper way of responding to an error during runtime, such as a division by zero error. This is done using the `try!` keyword.

```inko
import std::fs::file
import std::stdio::stdout

let handle = try! file.read_only(path)

stdout.print(try! handle.read_string)
```

Class-like objects can be defined, and traits are used to define reusable behaviour that can be composed together. Inheritance is not supported:

```inko
trait Greet {
  # This method is required, and must be implemented by objects that implement
  # this trait.
  def name -> String

  # This method comes with a default implementation. Objects are free to
  # redefine it, as long as the signature is still compatible.
  def greet -> String {
    'Hello ' + name
  }
}

object Person {
  # This is an attribute, called an "instance variable" in languages
  # such as Ruby and Smalltalk. These variables are available to instances of
  # the object that defines them (a Person instance in this case).
  #
  # Instance attributes can't be accessed outside of an object. Instead, you
  # have to define a method that returns an instance attribute.
  @name: String

  static def new(name: String) -> String {
    Self { @name = name }
  }
}

impl Greet for Person {
  def name -> String {
    @name
  }
}

let alice = Person.new('Alice')

alice.greet # => 'Hello Alice'
```

Instead of using statements, Inko uses message passing for (almost) everything. This means there are no `if` or `while` statements, instead you send messages to objects. This allows objects to determine how these messages should behave, making it easy and natural to implement patterns such as the [Null Object pattern](https://en.wikipedia.org/wiki/Null_object_pattern).

```inko
import std::stdio::stdout

object NullUser {
  def truthy? -> Boolean {
    False
  }
}

let user = NullUser.new

# This would print "nay" to STDOUT.
user.if(true: { stdout.print('yay') }, false: { stdout.print('nay') })
```

Most of Inko is written in Inko itself. For example, this is the implementation of `String.starts_with?`:

```inko
def starts_with?(prefix: String) -> Boolean {
  (prefix.length > length).if_true {
    return False
  }

  slice(0, prefix.length) == prefix
}
```

This makes it easier to contribute changes, debug problems, optimise code, and test the capabilities of Inko as a language. We believe this leads to a better programming language, compared to implementing most of it in a different language (e.g. Rust, the language the virtual machine is written in).


## Examples
**Type-safe file operations**
```inko
import std::fs::file

let readme =
  try! file.read_only('README.md')

# This will produce a type error, since
# the file is opened in read-only mode.
readme.write_string('oops')

# This also won't work, because we can
# not remove a read-only file.
readme.remove
```

**Generic types**
```inko
object List!(T) {
  @values: Array!(T)

  static def new -> Self {
    Self { @values = Array.new }
  }

  def push(value: T) -> T {
    @values.push(value)
  }
}

let list = List.new

# This is OK:
list.push(10)

# This will produce a type error:
list.push('oops')
```







https://gitlab.com/inko-lang/inko
Inko is a statically-typed, safe, object-oriented programming language for writing concurrent programs.
