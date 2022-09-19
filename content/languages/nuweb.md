title=nuweb
tags=language, literate
summary=A Simple Literate Programming Tool.
~~~~~~

[Website](http://nuweb.sourceforge.net/) | [Source](https://sourceforge.net/projects/nuweb/)

In 1984, Knuth introduced the idea of literate programming and described a pair of tools to support the practise. His approach was to combine Pascal code with TEX documentation to produce a new language, WEB, that offered programmers a superior approach to programming. He wrote several programs in WEB, including weave and tangle, the programs used to support literate programming. The idea was that a programmer wrote one document, the web file, that combined documentation (written in TEX) with code (written in Pascal).

Running tangle on the web file would produce a complete Pascal program, ready for compilation by an ordinary Pascal compiler. The primary function of tangle is to allow the programmer to present elements of the program in any desired order, regardless of the restrictions imposed by the programming language. Thus, the programmer is free to present his program in a top-down fashion, bottom-up fashion, or whatever seems best in terms of promoting understanding and maintenance.

Running weave on the web file would produce a TEX file, ready to be processed by TEX. The resulting document included a variety of automatically generated indices and cross-references that made it much easier to navigate the code. Additionally, all of the code sections were automatically prettyprinted, resulting in a quite impressive document.

Knuth also wrote the programs for TEX and METAFONT entirely in WEB, eventually publishing them in book form. These are probably the largest programs ever published in a readable form. Inspired by Knuth’s example, many people have experimented with WEB. Some people have even built web-like tools for their own favorite combinations of programming language and typesetting language. For example, CWEB, Knuth’s current system of choice, works with a combination of C (or C++) and TEX. Another system, FunnelWeb, is independent of any programming language and only mildly dependent on TEX. Inspired by the versatility of FunnelWeb and by the daunting size of its documentation, I decided to write my own, very simple, tool for literate programming.

Nuweb works with any programming language and LATEX [8]. I wanted to use LATEX because it supports a multi-level sectioning scheme and has facilities for drawing figures. I wanted to be able to work with arbitrary programming languages because my friends and I write programs in many languages (and sometimes combinations of several languages), e.g., C, Fortran, C++, yacc, lex, Scheme, assembly, Postscript, and so forth.

