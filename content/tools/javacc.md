title=JavaCC
tags=tool, language development
summary=A parser generator.
~~~~~~

[Website](https://javacc.github.io/javacc/) | [Source](https://github.com/javacc/javacc)

Features:

* JavaCC generates top-down (recursive descent) parsers as opposed to bottom-up parsers generated by YACC-like tools. This allows the use of more general grammars, although left-recursion is disallowed. Top-down parsers have a number of other advantages (besides more general grammars) such as being easier to debug, having the ability to parse to any non-terminal in the grammar, and also having the ability to pass values (attributes) both up and down the parse tree during parsing.

* By default, JavaCC generates an LL(1) parser. However, there may be portions of grammar that are not LL(1). JavaCC offers the capabilities of syntactic and semantic lookahead to resolve shift-shift ambiguities locally at these points. For example, the parser is LL(k) only at such points, but remains LL(1) everywhere else for better performance. Shift-reduce and reduce-reduce conflicts are not an issue for top-down parsers.

* JavaCC generates parsers that are 100% pure Java, so there is no runtime dependency on JavaCC and no special porting effort required to run on different machine platforms.

* JavaCC allows extended BNF specifications - such as (A)*, (A)+ etc - within the lexical and the grammar specifications. Extended BNF relieves the need for left-recursion to some extent. In fact, extended BNF is often easier to read as in A ::= y(x)* versus A ::= Ax|y.

* The lexical specifications (such as regular expressions, strings) and the grammar specifications (the BNF) are both written together in the same file. It makes grammars easier to read since it is possible to use regular expressions inline in the grammar specification, and also easier to maintain.

* The lexical analyzer of JavaCC can handle full Unicode input, and lexical specifications may also include any Unicode character. This facilitates descriptions of language elements such as Java identifiers that allow certain Unicode characters (that are not ASCII), but not others.

* JavaCC offers Lex-like lexical state and lexical action capabilities. Specific aspects in JavaCC that are superior to other tools are the first class status it offers concepts such as TOKEN, MORE, SKIP and state changes. This allows cleaner specifications as well as better error and warning messages from JavaCC.

* Tokens that are defined as special tokens in the lexical specification are ignored during parsing, but these tokens are available for processing by the tools. A useful application of this is in the processing of comments.

* Lexical specifications can define tokens not to be case-sensitive either at the global level for the entire lexical specification, or on an individual lexical specification basis.

* JavaCC comes with JJTree, an extremely powerful tree building pre-processor.

* JavaCC also includes JJDoc, a tool that converts grammar files to documentation files, optionally in HTML.

* JavaCC offers many options to customize its behavior and the behavior of the generated parsers. Examples of such options are the kinds of Unicode processing to perform on the input stream, the number of tokens of ambiguity checking to perform etc.

* JavaCC error reporting is among the best in parser generators. JavaCC generated parsers are able to clearly point out the location of parse errors with complete diagnostic information.

* Using options DEBUG_PARSER, DEBUG_LOOKAHEAD, and DEBUG_TOKEN_MANAGER, users can get in-depth analysis of the parsing and the token processing steps.

* The JavaCC release includes a wide range of examples including Java and HTML grammars. The examples, along with their documentation, are a great way to get acquainted with JavaCC.
