title=Forsp
tags=language
summary=A Forth+Lisp Hybrid Lambda Calculus Language
~~~~~~

[Website](https://xorvoid.com/forsp.html) | [Source](https://github.com/xorvoid/forsp/tree/main)

Forsp has:

* An S-Expression syntax like Lisp
* Function abstraction like Lisp
* Function application like Forth
* An environment structure like Lisp
* Lexically-scoped closures like Lisp (Scheme)
* Cons-cells / lists / atoms like Lisp
* A value/operand stack like Forth
* An ability to express the Lambda Calculus
* A Call-By-Push-Value evaluation order
* Only 3 syntax special forms: ' ^ $
* Only 1 eval-time special form: quote
* Only 10 primitive functions need to self-implement
* Ability to self-implement in very little code

It's evaluator is very simple. I suspect simpler than a McCarthy Lisp eval() function, but I haven't defined a "simplicity function", so you can be the judge.

In contrast to Lisp, apply() is trivial in Forsp, and instead we have a core function called compute()
