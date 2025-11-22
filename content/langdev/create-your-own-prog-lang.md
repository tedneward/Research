title=Create Your Own Programming Language
tags=reading, language, antlr, ruby, python, language development
summary=Notes on the book "Create Your Own Programming Language"
~~~~~~

[PDF](/langdev/CYOPL.pdf)

Builds out Awesome:

```
class Awesome:
    def name:
        "I'm Awesome"

    def awesomeness:
        100

awesome = Awesome.new
print(awesome.name)
print(awesome.awesomeness)
```

... a mix of Ruby and Python, as an interpreter. 

"A couple of rules for our language:

* "As in Python, blocks of code are delimited by their indentation.
* "Classes are declared with the class keyword.
* "Methods can be defined anywhere using the def keyword.
* "Identifiers starting with a capital letter are constants which are globally accessible.
* "Lower-case identifiers are local variables or method names.
* "If a method takes no arguments, parenthesis can be skipped, much like in Ruby.
* "The last value evaluated in a method is its return value.
* "Everything is an object."

Book moves pretty fast; at 78 pages, with multi-page listings, it really doesn't dive too deep into details. Feels like a pretty decent starting-off point for further self-exploration.

### Lexing
Demonstrates the use of lex (with links to [Rex](http://github.com/tenderlove/rex/) and [JFlex](http://jflex.de/)) to build out lexer. Uses [rexical](https://github.com/tenderlove/rexical) to actually build out the lexer. Uses [Ragel](http://www.complang.org/ragel/) to build out the scanner. "It’s described as a State Machine Compiler: lexers, like regular expressions, are state machines." Goes into building a lexer by hand (in Ruby), using regular expressions to help with the parsing. Also demonstrates how to lex/parse significant indentation, which I haven't seen before.

### Parsing
Then goes into parsing, discussing [Bison](/tools/bison)/yacc, [Lemon](/tools/lemon), [ANTLR](/tools/antlr), and PEGs.

### Runtime Model
Discusses briefly a prototype-based runtime, with a link to [this paper](http://piumarta.com/software/cola/objmodel2.pdf) on the subject.

### Interpreter

### Compilation
LLVM from Ruby

### Virtual Machine
Bytecode, VM types, prototyping a VM in Ruby.

### Conclusion
Homoiconicity. Self-hosting. Resources. Solutions to the self-homework posed along the way.

