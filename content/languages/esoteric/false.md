title=False
tags=language, esolang
summary=A language designedin ‘93 with two particular objectives: confusing everyone with an obfuscated syntax, and designing an as powerful language as possible with a tiny implementation: in this case a compiler executable of just 1024 bytes (!), written in pure 68000 assembler.
~~~~~~

[Website](https://strlen.com/false-language/) | [Distribution](https://strlen.com/files/lang/false/False12b.zip) | [Docs](https://strlen.com/files/lang/false/false.txt)

Here’s a couple of example programs to give a taste of what False looks like:

Copy Files

```
{ copy.f: copy file. usage: copy < infile > outfile  }

ß[^$1_=~][,]#
```

Factorial
```
{ factorial program in false! }

[$1=~[$1-f;!*]?]f:          { fac() in false }

"calculate the factorial of [1..8]: "
ß^ß'0-$$0>~\8>|$
"result: "
~[\f;!.]?
["illegal input!"]?"
"
```
Prime Numbers

```
{ writes all prime numbers between 0 and 100 }

99 9[1-$][$@$@$@$@/*=[1-$$[%1-$@]?0[$.' ,]?]?]#
```

Not just toy programs have been written in False, the list of programs in the distribution includes various useful convertion utilities, a compression program, Life, an expression evaluator, a module ripper, queens, tic-tac-toe, a html-table generator, and, probably the biggest False program ever, a complete working BreakOut clone.

