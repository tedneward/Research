title=Lioness
tags=language
summary=A high-level, dynamic, programming language designed for mathematical purposes.
~~~~~~

[Source](https://github.com/louisdh/lioness)

This project includes a lexer, parser, compiler and interpreter. All of these are 100% written in Swift without dependencies. The syntax of Lioness is inspired by Swift, and its feature set is akin to shader languages such as GLSL.

The standard library (abbreviated: stdlib) contains basic functions for number manipulation, including: max/min, ceil, floor, trigonometry, etc. However, more trivial functions, such as to calculate prime numbers, are not considered relevant for the standard library.

Example: Calculate factorials recursively:
```
func factorial(x) returns {
	
    if x > 1 {
        return x * factorial(x - 1)
    }
	
    return 1
}

a = factorial(5) // a = 120
```

