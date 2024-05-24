title=Circle
tags=language, native, metaobject
summary=Metaprogram C++ in C++. It encourages a seamless mixing of compile-time and runtime capabilities that upends decades of language design.
~~~~~~

[Website](https://www.circle-lang.org/) | [Source](https://github.com/seanbaxter/circle)

Circle is the richest C++ compiler yet. Circle describes a path for evolving C++ to meet the needs of institutional users. The versioning mechanism that accommodated the development of the features above will also accommodate research into critically important areas like memory safety. Rather than insisting on a one-size-fit's-all approach to language development, project leads can opt into collections of features that best target their projects' needs. Features:

    - choice types;
    - pattern matching;
    - interfaces and impls;
    - language type erasure;
    - as-expressions for safer conversions;
    - a modern declaration syntax with fn and var keywords to make clearer, less ambiguous declarations;
    - a simpler syntax for binary expressions, greatly reducing the likelihood of bugs caused by confusing operator precedences;
    - a forward keyword to take the complexity and bugginess out of forwarding references;
    - safer initializer lists, which address ambiguities when calling `std::initializer_list` constructors and non-`std::initializer_list` constructors;
    - lifting lambdas to pass overload sets as function arguments;
    - nine kinds of template parameters to make templates far more comprehensive;
    - reflection traits to access packs of information about class types, enum types, function types, class specializations, and so on;
    - pack traits for pack-transforming algorithms, like sort, unique, count, erase, difference, intersection, and so on.
