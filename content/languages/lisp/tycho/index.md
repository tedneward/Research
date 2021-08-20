title=Tycho
tags=language, metaobject, clr, dynamic, object, lisp
summary=A dynamically-typed language for the CLR designed for language-oriented programming.
~~~~~~

[Googlecode Archive](https://code.google.com/archive/p/tycho/) 

Tycho is a new programming language designed for language oriented programming (LOP). Combined with a very dynamic runtime, Tycho programmers can define syntax and semantics that bring the code closer to the problem domain.

At its heart, it's a dynamically typed language that runs on the .Net Framework. It's object oriented but requires no classes. Aspect orientation is achieved with actors (see the example below for a laziness aspect.) Software transactional memory in tycho is, too, an aspect, and makes for a pretty good "free" concurrency. Program consistency is supported with schemas that check validity of objects at runtime, not to mention provide functional programming style pattern matching for just about anything. Macros can be used to augment the language's syntax, and whole new languages can be created too.


### Heritage
**Lisp**
Unsurprisingly, Tycho owes a lot to Lisp and its derivatives. All Lisps have some kind of syntax definition system, including even Dylan, which replaced parentheses with something quite readable. Syntax aside, The Art of the Metaobject Protocol showed that no object-oriented system is perfect so any good language would allow one to create one's own.

**Functional Programming**
From Lisp we also get functional programming, of which ML, Haskell, and F# are better examples. Haskell runs in an exclusively lazy environment that is interesting, though not always useful. The addition of Monads to Haskell implied that some form of imperative programming is necessary for anything but trivial applications. Nevertheless, purity and immutability are extremely valuable concepts in both language design and more generally in software design as well. The ML/Haskell family also popularised pattern matching, which allows one to deconstruct and verify an object's structure at the same time (hence Tycho's schemas).

**Alan Kay**
Object orientation is a no-brainer, although exactly how it's done is not. Alan Kay's talk at OOPSLA in '97, The Computer Revolution Hasn't Happened Yet, really makes you rethink what OO is all about. Prototype-based OO languages like Self give us interesting alternatives to the standard (and some would say broken) C++/Java/C# interpretation of OO concepts. Prototype-based OO provides some promising insights, but it still struggles to span the "object construction" (usually class-based) and "object derivation" (usually prototype-based) divide. There are no clear winners in the construction/derivation debate and it seems merely to be a case of using the best tool for the job. Having said that, Tycho sticks fairly closely to the "construction" side of things while still remaining refreshingly class-free.

**The Actors Model**
The actors model emerged from some research in the 70s by Carl Hewitt et al. Actors were an abstract model of computation in which actors were completely independent software components that interacted by sending asynchronous messages among each other. (Erlang users will be familiar with this concept.) Actors were completely independent in that they could not share memory with each other, and they even ran largely concurrently. Actors could communicate only by sending messages to each other, and so were (optimistically) the ultimate goal of any object-oriented system. Actors could encapsulate their inner working state; they were polymorphic in that the caller of an actor would not and could not know how that message would be interpreted. And because messages are asynchronous, actors could run in their own time, choosing when to reply to a message or to not even reply at all.

Actors in Tycho are very similar to this model except that all messages are synchronous. A method-caller in Tycho still has little to no idea what might be interpreting that method at the other end.

Asynchronous and concurrent message passing protocols could be established between caller and actor by calling methods with no return values and passing the caller as an argument to the method (for a response, if required.) There is also no reason why the object actually responding to the asynchronous message isn't running on a different thread or machine entirely. The method-call arguments would need to be marshalled between the actors, and would be restricted to serializable data types - generally not objects or functions.

**Type Systems**
Type systems are a very important area in programming language design, and there seem to be two primary schools of thought in this area: dynamically typed or statically typed. Most popular object oriented languages use a bit of both, Java and C# for instance allow the types of objects to be determined at runtime with their is and instanceof operators. Java and C# are both statically typed too, of course, and it's clear that static typing is helpful in any large code base just to wrap your head around things, and is also helpful with static tool support such as those that help in refactoring. However, any sufficiently strict type system will eventually get on one's nerves, even very advanced and expressive type systems such as Haskell's. Dynamic typing, therefore, (and late binding more generally) will always be in the toolbox of any good programmer. As Gilad Bracha points out, modern programming languages would benefit from having runtimes that are not dependent on static type systems, allowing type systems and other static analysers to be swapped in and out for different purposes by the programmer.

Tycho has chosen an entirely dynamic and somewhat structural type checking system in the form of schemas that also allow for the possibility of static analysis as we begin work on an optimising compiler.

**Domain Specific Languages**
One of the original goals of Tycho (several years ago) was to be a programming language in which one could invent new languages to express solutions to certain problems. This has also been the goal of a (by now) pretty large community of users and researchers in the field of Domain Specific Languages. A language that supported "internal" DSL development would effectively be a meta-language, allowing all sorts of syntax and compiler customisation.

DSLs may be entirely new programming languages or just extensions to existing ones; either way, any programming language capable of supporting DSLs would be extensible enough to be useful beyond its original design goals.

**Language Extensibility**
Most debates that surround programming language design have focussed on things such as whether functional or object-oriented programming is more productive, or whether static or dynamic typing produces higher quality software, but these features seem to pale in comparison to one language feature in particular - extensibility. Any language feature is a good one if you can change it.

Many people (Paul Graham, Steve Yegge) have talked about language extensibility (usually in terms of Lisp) and for good reason. Software must be able to evolve, either through being open source or because it has been designed for flexibility. If it cannot evolve it will perish, simply speaking.

Thus, much of Tycho aims to be extensible. New object systems can be created with actors, thereby giving programmers a chance to redefine how values and methods are interpreted at runtime. The (runtime) type system is also extensible with schemas, giving the programmer a chance to check much more than just the "type" of an object.

Macros allow the syntax (including "scannerless" lexing/parsing, combined) to be altered while source files are being parsed, and (coming soon) the compiler will allow additional program transformations to be made during compilation. One can imagine the compiler being even further extensible at compile-time, particularly once/if Tycho becomes self-hosting.

### Tutorial
Tycho is a scripting language, not dissimilar to the likes of Ruby, Python and Smalltalk, but it also has some handy language design features that we can use to build elegant solutions. In this tutorial we'll cover the basics of dynamic programming languages, including the building blocks of any modern object oriented programming language. Then, we'll quickly refactor our designs by building syntax that abstracts the programmer from the implementation details...

First, you'll need a Tycho prompt (to be released very soon). Start it up and you'll get the following prompt:

Here you can type any expression and Tycho will print out the result. You can do simple mathematical expressions as you would any most programming languages:

```
2 * 3 6 10 + 8 18 
```

See the full list of mathematical operators.

You can assign these results to variables using the := operator:

```
a := 2 * 3 6 a 6 a := 10 + 8 18 
```

Strings literals are written between single (') or double (") quotes. Strings in double quotes can specify tabs and carriage returns with the escape character, backslash \. A tab is \t, a carriage return is \n, a line feed is \r, there are others too. Strings specified in single quotes produce exactly the same string, with backslashes included.

```
'hello' "hello" "hello" "hello" greeting := "hello" "hello" greeting "hello" 
```

The boolean operators are and, or, xor and not:

Functions are specified with the => operator, parameters on the left and the function's body on the right. Call them with the arguments in parenthesis:

```
double := n => n * 2 
    ClosureObject 
double (7) 
    14 
double ("tuk") 
    "tuktuk"
```

If the function has more than one parameter, specify them in parenthesis delimited by commas.


### Strings/String Literals
String literals can be written in a number of ways. Some strings are escaped, that is, they can escape tabs, newlines, linefeeds and can also be used to interpolate expressions. Other strings are non-escaped and specify exactly the contents of the string, regardless of what special characters are used.

Escaped strings are written with double-quotes: `"a string with a tab in it: \t"`

Non-escaped strings are written with single-quotes: `'a string with backslash-t in it: \t'`

Escaped strings can also be written with the % sign. These strings are interpreted specially by the parser, and can return special values, depending on how the parser is set up. For example, a regular expression can be written like so: `%re{(\i+) = (.*);}`

You can also create an escaped string literal with a wrapping matched pair of curly-brace,colon. Using this syntax, you do not need to encode newlines as "\n", so you can create "multiline" strings (strings with literal linebreaks), inline. 

``` 
{:this string is an escaping string:}

{:so is this one:} 
```

You can also use indented syntax to create a string with literal linebreaks. Each line in the resulting string will have its indentation stripped, where its indentation is defined as any whitespace (space and tab character(s)) leading the first line of the string:

```
constant-string1 = : First Line Second Line Third Line 
```

is equivalent to "First line\n ;Second Line\nThird Line ".


### String interpolation
String interpolation allows strings to be constructed using a combination of string literals and the values of expressions. Best to start with a simple example:

`x = 2 * 3 print "2 times 3 is: #x"`

Or...

`print "2 times 3 is: #(2 * 3)"`

Both produce the output:

`2 times 3 is: 6`

**Details**
In a string literal, the # character can be used to evaluate the next token, which could be an identifier or an entire bracketed expression. The value of the evaluated token is then injected into the string, where it was placed. This makes for a simple way of building strings for printing out to the console, or for just building strings for any purpose.

String interpolation works for any escaping string, which is usually a string specified with double-quotes ("), but can be strings specified using the % string syntax.


### Functions
Functions are probably the simplest of all abstractions, yet are still the most useful. Functions in tycho can use variables declared in their outer scope, so they close over their outer scope and are hence lexical closures too. And for all intents and purposes they're also what some languages like to call lambdas.

They're defined using the => operator, which takes a list of parameters on the left side and an expression on the right. The parameters on the left can be in parenthesis if there are more than one, and the parameters are written as schemas. In effect, the parameters are schemas that guard the function, ensuring that the arguments are of the correct form or type.

Here are some examples: ``` add-one = n => n + 1

add-one (4) add = (a, b) => a + b

add (1, 2) add-lists = ([a1, a2], [b1, b2]) => list [a1 + b1, a2 + b2]

add-lists (list [1, 2], list [3, 4]) ```

Lexical Scope
Being lexical closures, they have access to the variables declared in their outer scope, and the lifetime of those variables are now extended to be equal to that of the closure itself. So if one function returns another, then the "outer" function's variables are still accessible, even though it has already returned.

In this example, the outer function declares outer-variable and the function inner which it returns. Each time inner is then called, it increments outer-variable and returns it's new value.

``` outer = () => outer-variable = 1

inner = () =>
    outer-variable = outer-variable + 1
inner = outer () print inner () print inner () print inner () ```

Will output the following 2 3 4

outer-variable lives as long as inner does, because inner has a reference to outer's stack frame and it can only be garbage collected when inner no longer has the reference or inner is also discarded.

Variable Arguments
Functions can also accept variable numbers of arguments, using the ... syntax:

``` my-print = (prefix, values, ...) => values.tycho:runtime:each v => system:console.write-line ("#prefix#v")

my-print ("> ", 1, 2, 3, 4) my-print (8, "x", "y") ```

Will produce:

```

1 2 3 4 8x 8y ```

The argument immediately before the ... will be the list of values passed to the function.

Similarly, in calling a function the ... syntax can be used to expand a list of values into the argument list of the function:

args = list [1, 2, 3] my-print ("num: ", args, ...)

Will produce:

num: 1 num: 2 num: 3

Calling Functions
Calling functions is very similar to other languages using the now common parenthesis with commas syntax: my-function (arg1, arg2, arg3). But functions can also be called with braces {} and semi-colons ;, like this: my-function {arg1; arg2; arg3}. Braces can be specified just by indenting on the next line, and semi-colons by a new-line, so a function can be called like this too:

my-function arg1 arg2 arg3

This is handy when arguments are a little too big to fit in one line of parenthesis, and especially useful when passing other functions as arguments. Such as when using tycho:runtime:map:

list [1, 2, 3].tycho:runtime:map item => item + 1

These can be chained together too, forming complex list processing expressions:

list ['one', 'two', 'three', 'four'].tycho:runtime:filter { item => item.tycho:runtime:count <= 4 }.tycho:runtime:map { item => 'number ' + item }


### Objects
An object is defined with the object keyword, properties in the object are defined with property and methods with the method keyword.

object {property name := "Luke", property address := "23 Avon St"}

object method add (a, b) => a + b

Objects don't have classes. They're just objects. One can invoke a method on them or get or set a property. As a user of an object you have next to no idea how it is implemented. It may even be an actor that doesn't have properties or methods, but interprets method invocations in any way it wishes. Objects are actors that have their implementation defined in methods and properties.

``` obj = object method add (a, b) => a + b property y := null

obj.y = obj.add (1, 2) ```

Objects can declare local variables inside them. These variables can be used inside the methods, like private instance variables. Variables can be functions too of course. self is a special variable, referring to the object itself, this can be used to invoke one of its own methods or properties.

``` counter = object c := 0 method inc () => c := c + 1 property current get => c

counter.inc () counter.inc () print counter.current ```

Objects can implement protocols to describe what they do. Protocols can be thought of as "interfaces" as seen in other languages like Java and C#, although protocols don't have to enforce explicitly what methods or properties an object must respond to. Protocols merely tag an object, saying "this object will behave like this". A protocol's real behaviour is not just about what methods should be defined on an object, but how that object will perform and interact with other objects.

``` counter-protocol = protocol

counter = object implements counter-protocol

c := 0
method inc () => c := c + 1
property current get => c
print counter :: counter-protocol ```

Objects can inherit methods and properties from other objects too. This achieves multiple inheritance by importing the inherited object's methods and properties into it. As with multiple inheritance in any language there is the danger of a name clash. Two methods in different inherited classes are the same, so one must explicitly override the other with the override keyword. Methods and properties are defined from the top of the object to the bottom (lexically), lower methods override higher, lower inherited objects override higher.

``` n-counter = object inherit counter

method inc (n) =>
    n.tycho:runtime:times (() => self.inc ())
n-counter.inc (5) print n-counter.current ```

You may have noticed that objects aren't really classes, and they don't have constructors. So how do we make new objects? With a function!

``` create-counter = () => object c := 0 method inc () => c := c + 1

counter1 = create-counter () counter2 = create-counter () ```

How do we make a "constructor" with arguments? Again, it's just a function with arguments:

``` create-counter = (initial-count) => object c := initial-count method inc () => c := c + 1

counter1 = create-counter (1) counter2 = create-counter (2) ```

Objects pick up the lexical scope around them too (like the above example) so you can define an object in terms of the current scope:

``` x = 0 y = 0 point = object property x get => x property y get => y

print point.x, point.y ```

"static" or "class" variables, variables scoped across all objects of a particular "class", in Tycho are defined like so:

``` total-points-created := 0

create-point = (x, y) => total-points-created := total-points-created + 1 object property x get => x property y get => y

point1 = create-point (1, 2) point2 = create-point (3, 4)

print total-points-created ```

We're just following the same rules as closures. Objects are pretty much a bunch of closures that are exposed to their clients as methods and properties. So all object "storage" is on the stack frame, not in the object itself! The only thing the object has is the list of methods and properties it exposes, everything else is taken from the context it was defined in.


### Control Flow
Control Flow Structures
Tycho makes available most of the standard control-flow structures and keywords with which most imperative programmers are familiar: if/else, while, and try/catch/finally/throw, as shown below. The condition predicates for if and while do not need surrounding parentheses. The apply-schema operator :: returns a boolean value, so it can be used in a predicate.

You can use curly braces { } to delineate the apodosis (the section of code to run if the condition is met), but a more idiomatic usage of Tycho is to use a line break and (deeper) indentation:

if false print "I'm unreachable!" else if x < 10 print "x is less than 10" else print "x is not less than 10" while x >= 10 { x := x - 1 }

The with keyword is provided to define a restricted lifespan for a particular object (without creating a new scope/stack frame). Below, disposable-object can be an object or any expression that returns a disposable object.

with disposable-object print "about to eval this code: " + disposable-object.string-representation eval disposable-object.string-representation

try expression-that-might-throw catch object-matching-exception-handler-schema finally expression-to-run-after-throw-or-return

Looping with an index
Tycho does not have a C-style for loop, but you can build one (and hopefully someday the compiler should be able to optimise it just as if it were formally built-in!). A macro could make this easier to denote. Note that the function for is called in indented-invocation style (where each argument has its own indented line below the function name) instead of in the (also available) parentheses/comma-delimited style.

``` for = (initializer, predicate, mutator, body) => index := null initializer (index) while predicate (index) body (index) mutator (index)

for (x) => x := 0 (x) => x < my-list.tycho:runtime:length (x) => x := x + 1 print "we're about to see if my-list has #(x+1) items" (x) => print "my-list item #x is " + my-list [x] ```


### Variables
Variables
Variables are easily the simplest of all abstractions, they're just a name for something. Variables can be assigned to, as in most programming languages. They should be familiar to all programmers.

Variables are declared and assigned to with the := operator:

x := 0 x := 1 x := "2"

Constants
Constants are like variables except that they can only ever have one value; they can't ever be assigned to like normal variables. Once declared, they'll keep their values forever (well, while they're in scope anyway).

Constants are declared with the = operator:

x = 0 y = 1 z = "2"

It is a compile time error to assign to a constant and it's an error to declare the same constant more than once.

Constants are useful from a static analysis point of view. You can look at a piece of code that uses constants and know that the value of the constant will not change. The object that the constant refers to may change, but it can never refer to a different object.

With constants, Tycho can support a kind of declarative programming style. Along with immutable data structures they represent static values that are unchangeable throughout program execution. The more they're used, the more declarative your program will be, and the more declarative a program is, the more static analysis can be made of it, either by the compiler (for type checking, optimisation, etc) or by yourself just trying to understand it.

Schemas
Variables and constants can also be declared with a schema, which can help the type system find type errors in the program and the compiler produce faster code. (The current version of Tycho will do neither of these things though!). Schemas are specified with the :: operator immediately after the variable name.

Here's a constant declared with an integer schema:

x :: integer = 0

And a variable:

x :: integer := 0


### Actors
Introduction
Actors are kind of objects, in that they receive and respond to method-calls. Calling an actor is exactly the same as calling any other object, and you'll never really know if you're calling an actor or an object.

The difference is in how they're implemented, actors give the programmer the chance to accept a method-call as it is, including the name of the method and all the arguments. Once received, the actor can act upon that method-call in any way it needs, then return its result. Often actors will do a little bit of work and then forward the method call onto another object, these actors are often called "proxies" in that they proxy another object. Common uses for these types of actors are in implementing aspects over other objects - logging, laziness, exception handling, etc.

Actors may act as a proxy to a network resource, such as a web service. In these cases they won't be proxying a real object but a conceptual object at the other end of a network connection. They may also mimick object behaviour for something that isn't an object, such as XML. An actor will present the XML as though it has properties like other objects. They're essentially a way of building new objects, but without the objects.

**Details**
We'll start with a simple actor, one that just prints the name of the method we call on it:

``` 
printer = actor (self, name, args, ...) => print name

printer.some-method () printer.another-method () printer.with-arguments (1, 2, 3) 
```

will produce:

user:some-method user:another-method user:with-arguments

(The user: bit is because user: is the default namespace)

**Syntax**
The syntax of actor is simple:

`actor function`

Where function is a function to be invoked whenever a method is called on the actor. This may be a plain function ((...) => {...}) or a multi-method (method {(...) => {...}; ...}), or any other object that implements the tycho:runtime:invoke method. (It could even be an actor!)

Actors respond to a single method-call (which incidentally, all objects respond to in different ways). This method call has at least two arguments:

The target of the method, that is, the object the method is being called on. (Usually referred to self inside an object's methods, or this in C-based languages.)
The name of the method, a symbol
The rest of the arguments are the arguments to the method.

**A Lazy Actor**
A laziness aspect is not much harder. We just need to keep track of the cached value - we have an operation, which will produce the lazy result, a cached value, which will contain the lazy result after its been invoked and is-cached to tell us if we have a lazy result yet or not. This will compute a result only when needed, and only once. In this example a list:

``` 
make-lazy = (operation) => cached := null is-cached := false actor (self, name, args, ...) => if not is-cached cached := operation () is-cached := true cached.(name) (args, ...)

lazy-list = make-lazy () => print "evaluating lazy operation" list [1, 2, 3]

print lazy-list[0], lazy-list[1], lazy-list[2] 
```

Will produce:

"evaluating lazy operation" 1, 2, 3

**General Use**
Actors are usually created like this:

`actor (self, name, args, ...) => another-object.(name) (args, ...)`

`self` will be different depending on what object the method was called on, so if the actor was called directly then self will refer to the actor.

`name` is the name of the method that was called on the actor, and is a symbol not a string. When making a method call, the name of the method can be specified in parenthesis, meaning that the name of the method is an expression - in this case, just the variable name.

The arguments are specified such that any number of arguments can be passed to the method (using the ... syntax). args will be a list, and they can be passed onto another method-call with the same ... syntax.

**Properties**
Property accesses are method calls too, but use the method names tycho:runtime:get-property and tycho:runtime:set-property. The property name is the first argument to the method, and in the case of a property set, the second argument is the new value of the property.

Here is an example that uses a multi-method to dispatch the getter and setter method calls to a dictionary, implementing struct behaviour.

```
create-dictionary-object = () => d = !dict {} actor method (self, symbol tycho:runtime:set-property, name, value) => d[name] = value (self, symbol tycho:runtime:get-property, name) => d[name]

data = create-dictionary-object ()

data.boke = "soul" data.soul = 78

print data.boke, data.soul 
```


