title=Coconut
tags=language, python
summary=Simple, elegant, Pythonic functional programming.
~~~~~~

All valid Python 3 is valid Coconut but Coconut builds on top of Python a suite of simple, elegant utilities for functional programming.

Specifically, Coconut adds to Python built-in, syntactical support for:

* pattern-matching
* algebraic data types
* destructuring assignment
* partial application
* lazy lists
* function composition
* prettier lambdas
* infix notation
* pipeline-style programming
* operator functions
* tail call optimization
* where statements
... and much more!

[Website](http://coconut-lang.org/) | [Source](https://github.com/evhub/coconut)

InstallL `pip install coconut`

## Case Study 1: factorial
In the first case study we will be defining a factorial function, that is, a function that computes n! where n is an integer >= 0. This is somewhat of a toy example, since Python can fairly easily do this, but it will serve as a good showcase of some of the basic features of Coconut and how they can be used to great effect.

The recursive approach is the first of the fundamentally functional approaches, in that it doesn’t involve the state change and loops of the imperative approach. Recursive approaches avoid the need to change variables by making that variable change implicit in the recursive function call. Here’s the recursive approach to the factorial problem in Coconut:

```
def factorial(n):
    """Compute n! where n is an integer >= 0."""
    case n:
        match 0:
            return 1
        match x is int if x > 0:
            return x * factorial(x-1)
    else:
        raise TypeError("the argument to factorial must be an integer >= 0")
```

or

```
def factorial(n):
    """Compute n! where n is an integer >= 0."""
    try:
        # The only value that can be assigned to 0 is 0, since 0 is an
        # immutable constant; thus, this assignment fails if n is not 0.
        0 = n
    except MatchError:
        pass
    else:
        return 1
    try:
        # This attempts to assign n to x, which has been declared to be
        # an int; since only an int can be assigned to an int, this
        # fails if n is not an int.
        x is int = n
    except MatchError:
        pass
    else: if x > 0:  # in Coconut, statements can be nested on the same line
        return x * factorial(x-1)
    raise TypeError("the argument to factorial must be an integer >= 0")
```

or

```
def factorial(n):
    """Compute n! where n is an integer >= 0."""
    case n:
        match 0:
            return 1
        match _ is int if n > 0:
            return n * factorial(n-1)
    else:
        raise TypeError("the argument to factorial must be an integer >= 0")
```

```
def factorial(0) = 1

addpattern def factorial(n is int if n > 0) =
    """Compute n! where n is an integer >= 0."""
    n * factorial(n - 1)
```

### Lazy Lists
Lazy lists are lazily-evaluated iterator literals, similar in their laziness to Coconut’s :: operator, in that any expressions put inside a lazy list won’t be evaluated until that element of the lazy list is needed. The syntax for lazy lists is exactly the same as the syntax for normal lists, but with “banana brackets” ((| and |)) instead of normal brackets, like so:

```
abc = (| a, b, c |)
Like all Python iterators, you can call next to retrieve the next object in the iterator. Using a lazy list, it is possible to define the values used in the expressions as needed without raising a NameError:

abcd = (| d(a), d(b), d(c) |)  # a, b, c, and d are not defined yet
def d(n) = n + 1

a = 1
next(abcd)  # 2
b = 2
next(abcd)  # 3
c = 3
next(abcd)  # 4
```

### Function Composition
Next is function composition. In Coconut, this is accomplished through the .. operator, which takes two functions and composes them, creating a new function equivalent to (*args, **kwargs) -> f1(f2(*args, **kwargs)). This can be useful in combination with partial application for piecing together multiple higher-order functions, like so:

```
zipsum = map$(sum)..zip
```

If the composed functions are wrapped in parentheses, arguments can be passed into them:

```
def plus1(x) = x + 1
def square(x) = x * x

(plus1..square)(3) == 10  # True
```

Functions of different arities can be composed together, as long as they are in the correct order. If they are in the incorrect order, a TypeError will be raised. In this example we will compose a unary function with a binary function:

```
def add(n, m) = n + m  # binary function
def square(n) = n * n  # unary function

(add..square)(3, 1)    # Raises TypeError: square() takes exactly 1 argument (2 given)
(square..add)(3, 1)    # 16
```

Another useful trick with function composition involves composing a function with a higher-order function:

```
def inc_or_dec(t):
    # Our higher-order function, which returns another function
    if t:
        return x -> x+1
    else:
        return x -> x-1

def square(n) = n * n

square_inc = square..inc_or_dec(True)
square_dec = square..inc_or_dec(False)
square_inc(4)  # 25
square_dec(4)  # 9
```

Note: Coconut also supports the function composition pipe operators ..>, <.., ..*>, and <*...

### Implicit Partials
Last is implicit partials. Coconut supports a number of different “incomplete” expressions that will evaluate to a function that takes in the part necessary to complete them, that is, an implicit partial application function. The different allowable expressions are:

```
.attr
.method(args)
obj.
func$
seq[]
iter$[]
.[slice]
.$[slice]
```

For a full explanation of what each implicit partial does, see Coconut’s documentation on implicit partials.

### Type Annotations
For many people, one of the big downsides of Python is the fact that it is dynamically-typed. In Python, this problem is addressed by MyPy, a static type analyzer for Python, which can check Python-3-style type annotations such as

```
def plus1(x: int) -> int:
    return x + 1
a: int = plus1(10)
```

Unfortunately, in Python, such type annotation syntax only exists in Python 3. Not to worry in Coconut, however, which compiles Python-3-style type annotations to universally compatible type comments. 

