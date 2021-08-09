title=Gosu
tags=language, jvm, interpreter
summary=A scripting language capable of loading XML schema definition files and XML documents as native types.
~~~~~~

[Website](http://gosu-lang.org/) | [Github](https://github.com/gosu-lang/gosu-lang) | [Wikipedia](https://en.wikipedia.org/wiki/Gosu_(programming_language))

Gosu follows a syntax resembling a combination of other languages. For instance, declarations follow more along the lines of Pascal with name-first grammar. Gosu classes can have functions, fields, properties, and inner classes as members. Nominal inheritance and composition via delegation are built into the type system as well as structural typing similar to the Go programming language.

Gosu supports several file types:

* Class (.gs files)
* Program (.gsp files)
* Enhancement (*.gsx files)
* Template (*.gst files)

In addition to standard class types Gosu supports enums, interfaces, structures, and annotations.

Program files facilitate Gosu as a scripting language. Gosu programs can embed a classpath in their source, obviating the need for users to pass in a correct classpath externally. Set the superclass for a program using the `extends` keyword.

### Examples

Hello world:
```
print("Hello, World!")
```

Gosu classes are also executable a la Java:

```
class Main {
  static function main(args: String[]) {
    print("Hello, World!")
  }
}
```

A unique feature of Gosu is its Open Type System, which allows the language to be easily extended to provide compile-time checking and IDE awareness of information that is typically checked only at runtime in most other languages. Enhancements let you add additional functions and properties to other types, including built-in Java types such as String, List, etc. This example demonstrates adding a print() function to java.lang.String.

```
enhancement MyStringEnhancement : String {
  function print() {
    print(this)
  }
}
```

Now you can tell a String to print itself:

```
"Echo".print()
```

Coding with Collections:

```
var list = {1, 2, 3}
var result = list.where(\ elem -> elem >= 2)
print(result)
```

