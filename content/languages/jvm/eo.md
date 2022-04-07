title=EO (Elegant Objects)
tags=language, object, jvm
summary=An object-oriented language, to prove to ourselves that true object-oriented programming is practically possible. Not just in books and abstract examples, but in real code that works. That's why EO is being created—to put all that "crazy" pure object-oriented ideas into practice and see whether they can work.
~~~~~~

[Website](http://www.eolang.org/) | [Source](https://github.com/yegor256/eo) | Based on the [phi-calculus](/reading/languages/phi-calculus.pdf)

Example: Hello world:
```
import org.eolang.cli
import org.eolang.printed
import org.eolang.string
cli:
  printed:
    string:
      "Hello, world!"
```

## Quick Start

Here is a simple program that gets a year from command line and tells you whether it's leap or not:

```
+alias org.eolang.io.stdout

[args...] > main
  [y] > leap
    or. > @
      and.
        eq. (mod. y 4) 0
        not. (eq. (mod. y 100) 0)
      eq. (mod. y 400) 0
  stdout > @
    sprintf
      "%d is %sa leap year!"
      (args.get 0).nextInt > year!
      if (leap year:y) "" "not "
```

In order to compile this program, put it into `src/main/eo/main.eo` and then create a file `pom.xml`... [Redacted]

Then, you just run `mvn clean test` (you will need [Maven 3.3+](https://maven.apache.org/)) and the `.eo` file will be parsed to `.xml` files, transformed to `.java` files, and then compiled to `.class` files. You can see them all in the `target` directory. You will need Java 8+.

More examples are [here](https://github.com/cqfn/eo/tree/master/eo-maven-plugin/src/it).

## Tutorial

Let's start with a simple EO program:

```
+alias stdout org.eolang.io.stdout

[] > app
  stdout > @
    "Hello, world!"
```

Here we create a new [abstract object](https://www.yegor256.com/2020/12/01/abstract-objects.html) named `app`, which has got a single attribute named `@`. The object attached to the attribute `@` is a copy of the object `stdout` with a single argument `"Hello, world!"`. The object `stdout` is also [abstract](https://www.yegor256.com/2020/12/01/abstract-objects.html). It can't be used directly, a copy of it has to be created, with a few requirement arguments provided. This is how a copy of the object `stdout` is made:

```
stdout
  "Hello, world!"
```

The indentation in EO is important, just like in Python. There have to be two spaces in front of the line in order to go to the deeper level of nesting. This code can also be written in a "horizontal" notation:

```
stdout "Hello, world!"
```

Moreover, it's possible to use brackets in order to group arguments and avoid ambiguity. For example, instead of using a plain string `"Hello, world!"` we may want to create a copy of the object `stdout` with a more complex argument: a copy of the object `sprintf`:

```
+alias stdout org.eolang.io.stdout
+alias sprintf org.eolang.txt.sprintf

[] > app
  stdout > @
    sprintf
      "Hello, %s!"
      "Jeffrey"
```

Here, the object `sprintf` is also [abstract](https://www.yegor256.com/2020/12/01/abstract-objects.html). It is being copied with two arguments: `"Hello, %s!"` and `"Jeffrey"`. This program can be written using horizontal notation:

```
+alias stdout org.eolang.io.stdout
+alias sprintf org.eolang.txt.sprintf

[] > app
  (stdout (sprintf "Hello, %s!" "Jeffrey")) > @
```

The special attribute `@` denotes an object that is being [decorated](https://www.yegor256.com/2015/02/26/composable-decorators.html). In this example, the object `app` decorates the copy of the object `stdout` and through this starts to behave like
the object `stdout`: all attributes of `stdout` become the attributes of the `app`. The object `app` may have its own attributes. For example, it's possible to define a new abstract object inside `app` and use it to build the output string:

```
+alias stdout org.eolang.io.stdout
+alias sprintf org.eolang.txt.sprintf

[] > app
  stdout (msg "Jeffrey") > @
  [name] > msg
    sprintf "Hello, %s!" name > @
```

Now, the object `app` has two "bound" attributes: `@` and `msg`. The attribute `msg` has an abstract object attached to it, with a single "free" attribute `name`.

This is how you iterate:

```
+package sandbox
+alias stdout org.eolang.io.stdout
+alias sprintf org.eolang.txt.sprintf

[args...] > app
  memory > x
  seq > @
    x.write 2
    while.
      x.less 6
      [i]
        seq > @
          stdout
            sprintf "%dx%d = %d\n" x x (x.pow 2)
          x.write (x.add 1)

```

This code will print this:

```
2 x 2 = 4
3 x 3 = 9
4 x 4 = 16
5 x 5 = 25
```
