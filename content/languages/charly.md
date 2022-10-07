title=Charly
tags=language, vm, functional, concurrent
summary=Fully parallel dynamically typed programming language.
~~~~~~

[Source](https://github.com/KCreate/charly-vm) | [Original](https://github.com/charly-lang/charly) (no longer actively maintained)

Charly is a programming language with the following goals:

* Syntax similar to JavaScript (Compatibility is not a goal)
* Easy way to write C extensions
* Single-threaded work-queue for charly code
* Async IO, multithreadable C code
* Small and simple standard library

Charly was not created with the intention of it being used as a production level language for anything important. It's main purpose is to teach other programmers how to write the basic components of a programming language. This includes the various stages of producing an Abstract Syntax Tree, how to perform manipulations on that tree and finally how to generate bytecodes that can then be executed in a custom virtual machine.

Example: Channels
```
// Create a new channel
const c = new Channel()

// Writer loop
spawn(->{
  let i = 0
  loop {
    c.write(i)
    i += 1
  }
})

// Reader loop
spawn(->{
  loop {
    const msg = c.read()
    print("Message: " + msg)
  }
})
```

