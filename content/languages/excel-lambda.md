title=Excel LAMBDA
tags=language, functional
summary=Define custom functions using Excel's formula language.
~~~~~~

[Blog announcement](https://www.microsoft.com/en-us/research/blog/lambda-the-ultimatae-excel-worksheet-function/)

> LAMBDA allows users to define their own custom functions using Excel’s formula language. Excel already allows users to define custom functions, but only by writing them in an entirely different language such as JavaScript. In contrast, LAMBDA allows users to define a custom function in Excel’s own formula language. Moreover, one function can call another, so there is no limit to the power they can deploy with a single function call. The introduction of LAMBDA makes the Excel formula language Turing Complete. ...  data types take Excel beyond text and numbers and allow cells to contain first-class records, including entities linked to external data, and dynamic arrays allow ordinary formulas to compute whole arrays that spill into adjacent cells."

> To illustrate the power of LAMBDA, here’s a function written using the notation to compute the length of the hypotenuse of a right-angled triangle:

```
=LAMBDA( X, Y, SQRT( X*X+Y*Y ) )
```

> LAMBDA complements the March 2020 release of LET, which allows us to structure the same example like this:

```
=LAMBDA( X, Y, LET( XS, X*X, YS, Y*Y, SQRT( XS+YS ) ) )
```

> The function takes two arguments named X and Y, binds the value of X*X to the name XS, binds the value of Y*Y to YS, and returns SQRT( XS+YS) as its result.

> The existing Name Manager in Excel allows any formula to be given a name. If we name our function PYTHAGORAS, then a formula such as PYTHAGORAS(3,4) evaluates to 5. Once named, you call the function by name, eliminating the need to repeat entire formulas when you want to use them.

