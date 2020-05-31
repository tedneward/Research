title=Terra
tags=language
summary=A low-level system programming language that is embedded in and meta-programmed by the Lua programming language.
~~~~~~

Terra is a new low-level system programming language that is designed to interoperate seamlessly with the Lua programming language. It is also backwards compatible with (and embeddable in) existing C code. Like C, Terra is a monomorphic, statically-typed, compiled language with manual memory management. But unlike C, it is designed to make interaction with Lua easy. Terra code shares Lua's syntax and control-flow constructs. It is easy to call Lua functions from Terra (or Terra functions from Lua).

Furthermore, you can use Lua to meta-program Terra code. The Lua meta-program handles details like conditional compilation, namespaces, and templating in Terra code that are normally special constructs in low-level languages. This coupling additionally enables more powerful features like function specialization, lisp-style macros, and manually controlled JIT compilation. Since Terra's compiler is also available at runtime, it makes it easy for libraries or embedded languages to generate low-level code dynamically.

[Website](http://terralang.org/) [Source](https://github.com/terralang/terra)

