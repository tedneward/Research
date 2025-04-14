title=SNOBOL ("StriNg Oriented and symBOlic Language")
tags=language
summary=A string-processing language developed in the 60s.
~~~~~~

[Wikipedia](https://en.wikipedia.org/wiki/SNOBOL) | [Website](http://www.snobol4.com/) 

From Wikipedia:

"SNOBOL4 stands apart from most programming languages of its era by having patterns as a first-class data type, a data type whose values can be manipulated in all ways permitted to any other data type in the programming language, and by providing operators for pattern concatenation and alternation. SNOBOL4 patterns are a type of object and admit various manipulations, much like later object-oriented languages such as JavaScript whose patterns are known as regular expressions. In addition SNOBOL4 strings generated during execution can be treated as programs and either interpreted or compiled and executed (as in the eval function of other languages).

"SNOBOL4 was quite widely taught in larger U.S. universities in the late 1960s and early 1970s and was widely used in the 1970s and 1980s as a text manipulation language in the humanities.

"In the 1980s and 1990s, its use faded as newer languages such as AWK and Perl made string manipulation by means of regular expressions fashionable. SNOBOL4 patterns include a way to express BNF grammars, which are equivalent to context-free grammars and more powerful than regular expressions. The "regular expressions" in current versions of AWK and Perl are in fact extensions of regular expressions in the traditional sense, but regular expressions, unlike SNOBOL4 patterns, are not recursive, which gives a distinct computational advantage to SNOBOL4 patterns. (Recursive expressions did appear in Perl 5.10, though, released in December 2007.)

"The later SL5 (1977)[6] and Icon (1978) languages were designed by Griswold to combine the backtracking of SNOBOL4 pattern matching with more standard ALGOL-like structuring."

History:

* **SNOBOL1:** The initial SNOBOL language was created as a tool to be used by its authors to work with the symbolic manipulation of polynomials. It was written in assembly language for the IBM 7090. It had a simple syntax, only one datatype, the string, no functions, and no declarations and very little error control. However, despite its simplicity and its "personal" nature its use began to spread to other groups. As a result, the authors decided to extend it and tidy it up.

* **SNOBOL2:** SNOBOL2 did exist but it was a short-lived intermediate development version without user-defined functions and was never released.

* **SNOBOL3: ** SNOBOL was rewritten to add functions, both standard and user-defined, and the result was released as SNOBOL3. SNOBOL3 became quite popular and was rewritten for other computers than the IBM 7090 by other programmers. As a result, several incompatible dialects arose.

* **SNOBOL4:** As SNOBOL3 became more popular, the authors received more and more requests for extensions to the language. They also began to receive complaints about incompatibility and bugs in versions that they hadn't written. To address this and to take advantage of the new computers being introduced in the late 1960s, the decision was taken to develop SNOBOL4 with many extra datatypes and features but based on a virtual machine to allow improved portability across computers.[7] The SNOBOL4 language translator was still written in assembly language. However the macro features of the assembler were used to define the virtual machine instructions of the SNOBOL Implementation Language, the SIL. This very much improved the portability of the language by making it relatively easy to port the virtual machine which hosted the translator by recreating its virtual instructions on any machine which included a macro assembler or indeed a high level language.[8]

The machine-independent language SIL arose as a generalization of string manipulation macros by Douglas McIlroy, which were used extensively in the initial SNOBOL implementation. In 1969, McIlroy influenced the language again by insisting on addition of the table type to SNOBOL4.[9][10]

