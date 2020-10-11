title=Cat
tags=language, static, functional
summary=A statically typed functional stack-based programming language inspired by Joy.
~~~~~~

Cat has no variables, only instructions which manipulate a stack (e.g. `dup`, `pop`, `swap`), and a special expression form called a quotation (e.g. `[1 add]`) which pushes an expression onto the stack which can be executed at a later time (e.g. using `apply` or `dip`).

For example: `6 7 dup mul sub` results in a stack with the value 43 on top.

[Source](https://github.com/cdiggins/cat-language)

