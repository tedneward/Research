title=parboiled
tags=library, jvm, langdev
summary=A mixed Java/Scala library providing for lightweight and easy-to-use, yet powerful and elegant parsing of arbitrary input text based on Parsing expression grammars (PEGs).
~~~~~~

[Website](http://parboiled.org/) | [Source](https://github.com/sirthias/parboiled)

To give you a feel for what grammar specification looks like with parboiled for Scala consider the following classic "calculator" example, with these rules in a simple pseudo notation:

```
Expression ← Term ((‘+’ / ‘-’) Term)*
Term ← Factor ((‘*’ / ‘/’) Factor)*
Factor ← Number / ‘(’ Expression ‘)’
Number ← [0-9]+
```

A parboiled parser definition, complete and in ready-to-compile Scala code would look like this:

```
import org.parboiled.scala._

class SimpleCalculator extends Parser {

  def Expression: Rule0 = rule { Term ~ zeroOrMore(anyOf("+-") ~ Term) }

  def Term = rule { Factor ~ zeroOrMore(anyOf("*/") ~ Factor) }

  def Factor = rule { Number | "(" ~ Expression ~ ")" }

  def Number = rule { oneOrMore("0" - "9") }
}
```

