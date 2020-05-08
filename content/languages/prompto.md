title=Prompto
tags=language, platform
summary=Platform and differing-syntax languages for cloud development.
~~~~~~

[Website](http://prompto.org/)

"To facilitate the conversation between all breeds of developers, Prompto comes with not one "language" but three. Prompto calls these dialects, as they are not independant languages, but rather 3 syntactic variations of the same language concepts."

### Objy dialect ("O")
Objy uses a syntax that tries to follow as much as possible the syntax of OOP languages such as C++, Java or C#. Since Prompto introduces new concepts, the Objy syntax sometimes differs from these languages. But structuring elements are very similar: semi-colons to end statements, curly braces to group multiple statements, etc...
Here is an example:
```
method main() {
    print("15 + 3.5");
    print("= 28.5");
}
```

### Monty dialect ("M")
Monty uses a syntax that tries to follow as much as possible the syntax of the Python 3 language. Since Prompto introduces new concepts, the Monty syntax sometimes differs from the Python 3 syntax. But structuring elements are very similar: one statement per line, colon and indentation to group multiple statements, etc...
Here is an example:
```
def main(options:Text<:>):
    print("15 + 3.5")
    print("= 28.5")
```

### Engly dialect ("E")
Engly is a syntax that mimics English as much as possible. The intent is that developers with little or no coding background should be able to read code without having to learn the formalism of other dialects. The structure is very similar to Monty. Additionaly, it removes parenthesis, and many keywords are replaced by plain English words.
Here is an example:
```
define main as method doing:
    print "15 + 3.5"
    print "= 28.5"
```

