title=Snowball
tags=language
summary=A small string processing language for creating stemming algorithms for use in Information Retrieval, plus a collection of stemming algorithms implemented using it.
~~~~~~

[Website](https://snowballstem.org/) | [Source](https://github.com/snowballstem/snowball) | [Wikipedia](https://en.wikipedia.org/wiki/Snowball_(programming_language))

The Snowball compiler translates a Snowball program into source code in another language - currently Ada, ISO C, C#, Go, Java, Javascript, Object Pascal, Python and Rust are supported.

#### What is Stemming?
Stemming maps different forms of the same word to a common "stem" - for example, the English stemmer maps connection, connections, connective, connected, and connecting to connect. So a searching for connected would also find documents which only have the other forms.

This stem form is often a word itself, but this is not always the case as this is not a requirement for text search systems, which are the intended field of use. We also aim to conflate words with the same meaning, rather than all words with a common linguistic root (so awe and awful don't have the same stem), and over-stemming is more problematic than under-stemming so we tend not to stem in cases that are hard to resolve. If you want to always reduce words to a root form and/or get a root form which is itself a word then Snowball's stemming algorithms likely aren't the right answer.

