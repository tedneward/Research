title=Noweb
tags=language, literate, native
summary=A simple, extensible tool for literate programming.
~~~~~~

[Website](https://www.cs.tufts.edu/~nr/noweb/) | [Source](https://github.com/nrnrnr/noweb)

noweb is designed to meet the needs of literate programmers while remaining as simple as possible. Its primary advantages are simplicity, extensibility, and language-independence—especially noticeable when compared with other literate-programming tools. noweb uses 5 control sequences to WEB's 27. The noweb manual is only 4 pages; an additional page explains how to customize its LaTeX output. noweb works ``out of the box'' with any programming language, and supports TeX, latex, HTML, and troff back ends. A back end to support full hypertext or indexing takes about 250 lines; a simpler one can be written in 40 lines of awk. The primary sacrifice relative to WEB is that code is seldom prettyprinted.

I am using Noweb 3 every day, but I think the rationale for Noweb 3 has come and gone, and I doubt I will ever take it out of ``alpha'' stage or port it to Lua version 5.x, which it richly deserves.

Newcomers should know that versions numbered 2.x are mature and may be preferred to version 3. As of 28 June 2018, the current supported version is version 2.12.
