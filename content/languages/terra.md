title=Terra
tags=language, native
summary=A low-level system programming language that is embedded in and meta-programmed by the Lua programming language.
~~~~~~

Terra is a new low-level system programming language that is designed to interoperate seamlessly with the Lua programming language. It is also backwards compatible with (and embeddable in) existing C code. Like C, Terra is a monomorphic, statically-typed, compiled language with manual memory management. But unlike C, it is designed to make interaction with Lua easy. Terra code shares Lua's syntax and control-flow constructs. It is easy to call Lua functions from Terra (or Terra functions from Lua).

Furthermore, you can use Lua to meta-program Terra code. The Lua meta-program handles details like conditional compilation, namespaces, and templating in Terra code that are normally special constructs in low-level languages. This coupling additionally enables more powerful features like function specialization, lisp-style macros, and manually controlled JIT compilation. Since Terra's compiler is also available at runtime, it makes it easy for libraries or embedded languages to generate low-level code dynamically.

[Website](http://terralang.org/) [Source](https://github.com/terralang/terra)

Terra is a low-level system programming language that is embedded in and meta-programmed by the Lua programming language:

```
-- This top-level code is plain Lua code.
function printhello()
    -- This is a plain Lua function
    print("Hello, Lua!")
end
printhello()

-- Terra is backwards compatible with C, we'll use C's io library in our example.
C = terralib.includec("stdio.h")

-- The keyword 'terra' introduces a new Terra function.
terra hello(argc : int, argv : &rawstring)
    -- Here we call a C function from Terra
    C.printf("Hello, Terra!\n")
    return 0
end

-- You can call Terra functions directly from Lua, they are JIT compiled 
-- using LLVM to create machine code
hello(0,nil)

-- Terra functions are first-class values in Lua, and can be introspected 
-- and meta-programmed using it
hello:disas()
--[[ output:
    assembly for function at address 0x60e6010
    0x60e6010(+0):		push	rax
    0x60e6011(+1):		movabs	rdi, 102129664
    0x60e601b(+11):		movabs	rax, 140735712154681
    0x60e6025(+21):		call	rax
    0x60e6027(+23):		xor	eax, eax
    0x60e6029(+25):		pop	rdx
    0x60e602a(+26):		ret
]]

-- You can save Terra code as executables, object files, or shared libraries 
-- and link them into existing programs
terralib.saveobj("helloterra",{ main = hello })
```

Try this example and others in your browser via Replit.

Like C/C++, Terra is a statically-typed, compiled language with manual memory management. But unlike C/C++, it is designed from the beginning to be meta-programmed from Lua.

The design of Terra comes from the realization that C/C++ is really composed of multiple “languages.” It has a core language of operators, control-flow, and functions calls, but surrounding this language is a meta-language composed of a mix of features such as the pre-processor, templating system, and struct definitions. Templates alone are Turing-complete and have been used to produce optimized libraries such as Eigen, but are horrible to use in practice.

In Terra, we just gave in to the trend of making the meta-language of C/C++ more powerful and replaced it with a real programming language, Lua.

The combination of a low-level language meta-programmed by a high-level scripting language allows many behaviors that are not possible in other systems. Unlike C/C++, Terra code can be JIT-compiled and run interleaved with Lua evaluation, making it easy to write software libraries that depend on runtime code generation.

You can use Terra and Lua as…

An embedded JIT-compiler for building languages. We use techniques from multi-stage programming2 to make it possible to meta-program Terra using Lua. Terra expressions, types, and functions are all first-class Lua values, making it possible to generate arbitrary programs at runtime. This allows you to compile domain-specific languages (DSLs) written in Lua into high-performance Terra code. Furthermore, since Terra is built on the Lua ecosystem, it is easy to embed Terra-Lua programs in other software as a library. This design allows you to add a JIT-compiler into your existing software. You can use it to add a JIT-compiled DSL to your application, or to auto-tune high-performance code dynamically.

A scripting-language with high-performance extensions. While the performance of Lua and other dynamic languages is always getting better, a low-level of abstraction gives you predictable control of performance when you need it. Terra programs use the same LLVM backend that Apple uses for its C compilers. This means that Terra code performs similarly to equivalent C code. For instance, our translations of the nbody and fannhakunen programs from the programming language benchmark game1 perform within 5% of the speed of their C equivalents when compiled with Clang, LLVM’s C frontend. Terra also includes built-in support for SIMD operations, and other low-level features like non-temporal writes and prefetches. You can use Lua to organize and configure your application, and then call into Terra code when you need controllable performance.

A stand-alone low-level language. Terra was designed so that it can run independently from Lua. In fact, if your final program doesn’t need Lua, you can save Terra code into a .o file or executable. In addition to ensuring a clean separation between high- and low-level code, this design lets you use Terra as a stand-alone low-level language. In this use-case, Lua serves as a powerful meta-programming language. Here it serves as a replacement for C++ template metaprogramming3 or C preprocessor X-Macros4 with better syntax and nicer properties such as hygiene5. Since Terra exists only as code embedded in a Lua meta-program, features that are normally built into low-level languages can be implemented as Lua libraries. This design keeps the core of Terra simple, while enabling powerful behavior such as conditional compilation, namespaces, templating, and even class systems implemented as libraries.

https://github.com/terralang/terra
Terra is a low-level system programming language that is embedded in and meta-programmed by the Lua programming language
