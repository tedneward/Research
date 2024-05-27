title=F* (F-star)
tags=language, functional
summary=A general-purpose functional programming language with effects aimed at program verification.
~~~~~~

[Website](https://www.fstar-lang.org/) [Source](https://www.github.com/FStarLang/FStar/)

It puts together the automation of an SMT-backed deductive verification tool with the expressive power of a proof assistant based on dependent types. After verification, F* programs can be extracted to efficient OCaml, F#, C, WASM, or ASM code. This enables verifying the functional correctness and security of realistic applications. The main ongoing use case of F* is building a verified, drop-in replacement for the whole HTTPS stack in Project Everest. This includes verified implementations of TLS 1.2 and 1.3 and of the underlying cryptographic primitives.

---
### From the [tutorial](https://www.fstar-lang.org/tutorial/):

Let's get started by diving into a simple model of access control on files. Along the way, we'll see some basic concepts from functional programming in general and a couple of F*-specific features.

Let's say we want to model a simple access control discipline on files—certain files are readable or writable, whereas others may be unauthorized. We'd like to write a policy to describe the privileges on each file, and we'd like to write programs whose file accesses are checked against this policy, guaranteeing statically that an unauthorized file is never accessed mistakenly.

Our model of this scenario (which we'll make more realistic in later sections) proceeds in three easy steps.

* Define the policy using simple pure functions.
* Identify the security-sensitive primitives in the program and protect them with the policy.
* Write the rest of the program, resting assured that the F* type-checker will verify statically that the policy-protected primitives are never improperly accessed.

The syntax of F* is based closely on the syntax of OCaml and the non-light syntax of F#. Our F* program is made up of one module per file, and the body of the module contains a number of definitions, and optionally includes a ‘main’ expression.

Here are the first three definitions from the program:
```
type filename = string

(** [canWrite] is a function specifying whether a file [f] can be written *)
let canWrite (f:filename) = 
  match f with 
    | "demo/tempfile" -> true
    | _ -> false

(** [canRead] is also a function ... *)
let canRead (f:filename) = 
  canWrite f               (* writeable files are also readable *)
  || f="demo/README"       (* and so is demo/README *)
```
The first definition defines a type synonym: we'll use strings to model filenames.

After that, we define two boolean functions: canWrite and canRead: The canWrite function inspects its argument f using a pattern matching expression: it returns the boolean true when f equals "demo/tempfile" and false otherwise. The function canRead is similar—a file is readable if it is writable, or if it is the "demo/README" file.

