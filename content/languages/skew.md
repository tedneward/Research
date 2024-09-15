title=Skew
tags=language, archived
summary=Web-first, cross-platform programming language with an optimizing compiler.
~~~~~~

[Website](https://evanw.github.io/skew-lang.org/) | [Source](https://github.com/evanw/skew)

Archived Feb 2024

```
# Execution starts at the entry point
@entry
def fizzBuzz {
  for i in 1..101 {
    var text = mod(i, 3, "Fizz") + mod(i, 5, "Buzz")
    document.write((text == "" ? i.toString : text) + "\n")
  }
}

# The compiler inlines this function in release mode
def mod(i int, n int, text string) string {
  return i % n == 0 ? text : ""
}

# Imported declarations are just for type checking
@import
namespace document {
  def write(text string)
}
```

### Why use it?
The intent is to use this language for the platform-independent stuff in an application and to use the language native to the target platform for the platform-specific stuff. When done properly, the vast majority of the code is completely platform-independent and new platforms can be targeted easily with a small platform-specific shim.

Pros:

* Advanced optimizations: The optimizations in the compiler combined with certain language features (integers, explicit exports, wrapped types, etc.) makes writing compact, efficient JavaScript code easy and pleasant.
* Fast compile times: Code compiles at the speed of a browser refresh. Web development still feels like web development despite using an optimizing compiler with static typing. This is in contrast to many other comparable compile-to-JavaScript languages.
* Natural debugging experience: Debugging is done in a single language using the platform-native debugger. No need to try to debug a multi-language app with a debugger that only understands one language.
* Easy integration: Generated code is very readable and closely corresponds with the original. Language features allow for the easy import and export of code to and from the target language.
* Fast iteration time: In addition to a fast compiler and a good debugging experience, garbage collection is used instead of manual memory management. This eliminates a whole class of time-consuming bugs that get in the way of the important stuff.
* Native code emission: For native targets, application logic is compiled directly to native code and is not interpreted in a virtual machine. Native apps don't have to pay for JIT warmup time and native app performance is not at the whim of heuristics. The generated code can be compiled using industry-standard compilers that leverage decades of optimization work.

Cons:

* Lack of IDE support: IDE support is planned but is a significant undertaking and will not materialize for a while. Developers who normally lean heavily on IDEs will be less efficient than usual.
* Immaturity: This is a new programming language and hasn't stood the test of time. There will likely be many rough edges both in the language design and in the tools. Many planned features are not yet implemented.
* Lack of community: New programming languages don't have the wealth of searchable Q&A data that established programming languages have. Solutions to random issues are likely not available online.
* No cross-platform multithreading: Multithreading is not a language feature and needs to be done in the target language. This limits multithreading opportunities to cleanly separable tasks like image decoding.
* Lack of low-level features: Features such as memory layout, move semantics, destructors, and vector instructions are intentionally omitted. These features don't map well to all language targets and their emulation is expensive. Use of these features is limited to imported library routines implemented in the target language.
