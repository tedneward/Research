title=Instaparse
tags=library, jvm, functional
summary=What if context-free grammars were as easy to use as regular expressions?
~~~~~~

[Source](https://github.com/Engelberg/instaparse)

### Features
Instaparse aims to be the simplest way to build parsers in Clojure.

* Turns standard EBNF or ABNF notation for context-free grammars into an executable parser that takes a string as an input and produces a parse tree for that string.
* No Grammar Left Behind: Works for any context-free grammar, including left-recursive, right-recursive, and ambiguous grammars.
* Extends the power of context-free grammars with PEG-like syntax for lookahead and negative lookahead.
* Supports both of Clojure's most popular tree formats (hiccup and enlive) as output targets.
* Detailed reporting of parse errors.
* Optionally produces lazy sequence of all parses (especially useful for diagnosing and debugging ambiguous grammars).
* "Total parsing" mode where leftover string is embedded in the parse tree.
* Optional combinator library for building grammars programmatically.
* Performant.


