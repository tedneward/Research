title=Rhombus
tags=language
summary=A general-purpose language that is easy to use and uniquely customizable.
~~~~~~

[Website](https://rhombus-lang.org/)

Built on Racket

Modern programming languages reflect a consensus on basic constructs, including functional abstraction, lexically scoped variables, closures, objects, and pattern matching. Why, then, are we creating yet another general-purpose programming language?

Beyond the basics, there are still more good ideas for programming constructs than can fit in any one language specification. Furthermore, specific domains benefit from language support that is tailored to the domain. Language extensibility helps to balance the competing goals of a manageable language size versus fit-to-purpose for a wide range of tasks.

Many newer languages include a macro system to enable extensibility, but few would argue that the new batch of macro systems have achieved the expressiveness and fluidity of macros as they exist within the Lisp tradition, which includes Racket. At the same time, that expressiveness has been difficult to detangle from Lisp’s minimalistic, parenthesis-oriented notation.

Rhombus is designed to be

* approachable and easy to use for everyday purposes (that do not need macros), which in part means a conventional syntax; and

* as extensible as Racket, while making Racket's state-of-the-art facilities more consistent and accessible to a wide audience.
