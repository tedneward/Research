title=Ohm
tags=language, library, tool, ecmascript, language development
summary=A library and language for building parsers, interpreters, compilers, etc.
~~~~~~

[Source](https://github.com/ohmjs/ohm) | [Docs](https://github.com/ohmjs/ohm/blob/main/doc/README.md)

Ohm is a parsing toolkit consisting of a library and a domain-specific language. You can use it to parse custom file formats or quickly build parsers, interpreters, and compilers for programming languages.

The Ohm language is based on parsing expression grammars (PEGs), which are a formal way of describing syntax, similar to regular expressions and context-free grammars. The Ohm library provides a JavaScript interface for creating parsers, interpreters, and more from the grammars you write.

* Full support for left-recursive rules means that you can define left-associative operators in a natural way.
* Object-oriented grammar extension makes it easy to extend an existing language with new syntax.
* Modular semantic actions. Unlike many similar tools, Ohm completely separates grammars from semantic actions. This separation improves modularity and extensibility, and makes both grammars and semantic actions easier to read and understand.
* Online editor and visualizer. The Ohm Editor provides instant feedback and an interactive visualization that makes the entire execution of the parser visible and tangible.

Some awesome things people have built using Ohm:

* Seymour, a live programming environment for the classroom.
* Shadama, a particle simulation language designed for high-school science.
* turtle.audio, an audio environment where simple text commands generate lines that can play music.
* A browser-based tool that turns written Konnakkol (a South Indian vocal percussion art) into audio.
* Wildcard, a browser extension that empowers anyone to modify websites to meet their own specific needs, uses Ohm for its spreadsheet formulas.

