title=Joy
tags=language, jvm
summary=A purely functional programming language based on composition of functions rather than lambda calculus.
~~~~~~

[Wikipedia](https://en.wikipedia.org/wiki/Joy_(programming_language)) | [Website](http://www.latrobe.edu.au/humanities/research/research-projects/past-projects/joy-programming-language)

Work appears to be shut down--it's listed there as a "past project", but source is available for [download](https://www.latrobe.edu.au/__data/assets/file/0007/240298/Joy-Programming.zip).

In Joy the square function is defined:

```
DEFINE square == dup * .
```

In Joy, everything is a function that takes a stack as an argument and returns a stack as a result. For instance, the numeral '5' does not represent an integer constant, but instead a short program that pushes the number 5 onto the stack.

The dup operator simply duplicates the top element of the stack by pushing a copy of it.
The * operator pops two numbers off the stack and pushes their product.
So the square function makes a copy of the top element, and then multiplies the two top elements of the stack, leaving the square of the original top element at the top of the stack, with no need for a formal parameter. This makes Joy concise, as illustrated by this definition of quicksort:

```
 DEFINE qsort ==
   [small]
   []
   [uncons [>] split]
   [enconcat]
   binrec.
```

"binrec" is one of Joy's many recursive combinators, implementing binary recursion. It expects four quoted programs on top of the stack which represent:
* the termination condition (if a list is "small" (1 or 0 elements) it is already sorted),
* what to do if the termination condition is met (in this case nothing),
* what to do by default (split the list into two halves by comparing each element with the pivot), and finally
* what to do at the end (insert the pivot between the two sorted halves).


https://hypercubed.github.io/joy/joy.html
The language Joy is a purely functional programming language. Whereas all other functional programming languages are based on the application of functions to arguments, Joy is based on the composition of functions. All such functions take a stack as argument and produce a stack as value. Consequently much of Joy looks like ordinary postfix notation. However, in Joy a function can consume any number of parameters from the stack and leave any number of results on the stack. The concatenation of appropriate programs denotes the composition of the functions which the programs denote. One of the datatypes of Joy is that of quoted programs, of which lists are a special case. Some functions expect quoted programs on top of the stack and execute them in many different ways, effectively by dequoting.
