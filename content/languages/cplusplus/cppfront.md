title=Cppfront (Cpp2)
tags=language, native
summary=Cppfront is a compiler from an experimental C++ 'syntax 2' (Cpp2) to today's 'syntax 1' (Cpp1), to prove out some concepts, share some ideas, and prototype features that can also be proposed for evolving today's C++.
~~~~~~

[Website](https://hsutter.github.io/cppfront/) | [Github](https://github.com/hsutter/cppfront)

# What's different about this project?
In short, it aims to help evolve C++ itself, not to be a "C++ successor."

**What it isn't.** Cpp2 is not a successor or alternate language with its own divergent or incompatible ecosystem. For example, it does not have its own nonstandard incompatible modules/concepts/etc. that compete with the Standard C++ features; it does not replace your Standard C++ compiler or other tools; and it does not require any changes to your Standard C++ compiler or standard library or other libraries or tools to keep fully using all of them.

**What it is.** Cpp2 aims to be another "skin" for C++ itself, just a simpler and safer way to write ordinary C++ types/functions/objects, and a faster way to experiment with proposals for future new Standard C++ features in a simpler compiler and syntax flavor. It seamlessly uses Standard C++ modules and concepts requirements and other features, and it works with all existing C++20 or higher compilers and libraries and tools right out of the box with no changes required to use them all seamlessly and directly with zero overhead.

One-line HelloWorld (`hello.cpp2`):
```
main: () = std::cout << "Hello, world!\n";
```

More interesting version:
```
main: () = {
    words: std::vector = ( "Alice", "Bob" );
    hello( words[0] );
    hello( words[1] );
}

hello: (msg: std::string_view) = {
    std::cout << "Hello, (msg)$!\n";
}
```
This transpiles to:
```
#define CPP2_IMPORT_STD          Yes

#include "cpp2util.h"

auto main() -> int;

auto hello(cpp2::in<std::string_view> msg) -> void;
auto main() -> int{
    std::vector words {"Alice", "Bob"};
    hello(CPP2_ASSERT_IN_BOUNDS_LITERAL(words, 0));
    hello(CPP2_ASSERT_IN_BOUNDS_LITERAL(std::move(words), 1));
}

auto hello(cpp2::in<std::string_view> msg) -> void {
    std::cout << ("Hello, " + cpp2::to_string(msg) + "!\n");  }
```

