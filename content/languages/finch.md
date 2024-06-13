title=Finch
tags=language, object, dynamic
summary=A simple bytecode interpreted, purely object-oriented, prototype-based, dynamically-typed programming language. It's mostly inspired by Smalltalk, Self, and Javascript.
~~~~~~

[Website](http://finch.stuffwithstuff.com/) | [Source](https://github.com/munificent/finch)

It is written in C++ with a hand-written lexer and parser. It has minimal dependencies. I want Finch to be:

* Syntactically expressive yet minimal. Your code should look beautiful and do what you want.

* An example of a small, clean C++ codebase for an interpreter. If you can read C++ and want to learn more about programming languages, I hope Finch's code will be a good primer.

* A language in the Smalltalk family that's friendly to people coming from a text file and curly brace background.

* A minimal prototype-based dynamic language. I think prototypes are a really cool paradigm, but Self goes too far, and Javascript doesn't go far enough.

* Easily embeddable in other applications. I don't know if Finch ever will have real use, but if it does, it will likely be as a configuration or scripting language within a larger application, much like Lua.

Example:
```
// create an object and put it in a variable "dragon"
dragon <- [
  // define a "trace:" method for outputting the series of left and
  // right turns needed to draw a dragon curve.
  trace: depth {
    self trace-depth: depth turn: "R"
    write-line: "" // end the line
  }

  // the main recursive method
  trace-depth: n turn: turn {
    if: n > 0 then: {
      self trace-depth: n - 1 turn: "R"
      write: turn
      self trace-depth: n - 1 turn: "L"
    }
  }
]

// now let's try it
dragon trace: 5
```

## Expressions
Expressions are the heart of any programming language—they're the building blocks for programs. Finch, like many functional languages but unlike most C-derived languages, does not have statements, only expressions. We'll go over the different kinds of expressions Finch supports, starting from the bottom up.

#### Comments
OK, technically comments aren't expressions, but here is as good a place as any to describe them. Line comments start with // and end at the end of the line:

```
// this is a comment
```

Block comments start with /* and end with */. They can span multiple lines or be within a single one. Unlike C and others, block comments can nest in Finch:

```
/* this is /* a nested */ comment */
```

#### Literals

Finch currently supports two atomic types: numbers and strings. Numbers are double-precision floating point values, and strings are text. Finch doesn't support a lot of fancy formats for them yet, just the basic:

```
0
1234
-432.1
"a string"
"another string"
"supported escapes: \" \n \\"
```

Finch also has a couple of special standard objects. The object nil is used to indicate the absence of a value. true and false are boolean values that you can use with things like if:then: and while:do:. Unlike numbers and strings, these aren't built into the language. They are just regular objects implemented in Finch code that happen to do useful things.

#### Variables
Variable names in Finch are more flexible than in most other languages. They must contain a letter or an underscore somewhere in the name, but pretty much everything else is fair game. All of these are valid variable names:

```
foo
Bar
best-friends4eva
_under_score_
I<3punctuation!!!!!1
```

Finch has two kinds of variables. Normal variables are lexically scoped like other languages. Variables that start with an underscore (_) are fields. These are looked up on the object that the current method is being called on. In other words, when you see _name, it's a bit like this.name in other languages.

#### Messages
What other languages refer to as "calling a function" or "invoking a method", Finch calls "sending a message." Sending a message to an object (and remember, everything is an object) invokes a method on that object. There are three flavors of message sends in Finch: unary, operator, and keyword.

**Unary Messages**
An unary message has a name but no arguments. You can send an unary message to an object by following the object with the name of the message:

```
// send the 'length' message to the string "hi there"
"hi there" length
```

**Operators**
A series of one or more punctuation characters is an operator. You can define whatever operators you like, but don't go too crazy. The goal here is not to make your code look like comic strip profanity:

```
// valid punctuation characters
+ - ! $ % ^ & * = < > / ? ~

// can also be combined
-- ?! ---@ <=/=> @*#%&#$@&!
```

All operators are infix—they have operands on both sides. Using an operator sends a message to the left-hand operand with the right-hand one as an argument.

```
a + b
```

The above expression means "send a + message to a, passing in b as an argument." Finch doesn't have any built-in operators: they're all just message sends.

Because of this, all operators have the same precedence and associativity (left to right). This is unlike most other languages with hard-coded precedence levels. Parentheses are your friends here.

```
1 + 2 * 3   // evaluates to 9 in Finch
1 + (2 * 3) // evaluates to 7
```

Because there are no built-in operators, there are no unary operators in Finch. Instead, it uses a unary message for what would be an unary operator in another language:

```
// Finch            C/JS/etc.
value neg        // -value
condition not    // !condition
```

**Keyword Messages**
We've covered messages that take zero arguments (unary) and one (operators). To pass more than one argument, you use keyword messages. A single keyword is a name terminated by a colon (:), or just a colon by itself. A keyword message is formed by alternating keywords and arguments. An example will help here:

```
dictionary add-key: "some key" value: "the value"
```

This sends the add-key:value: message to the dictionary object, passing in "some key" and "the value" as arguments. You can chain as many keywords as you want in a single message (within reason):

```
chef cook-soup: tomato appetizer: calimari entree: veal dessert: cake
```

That sends a single cook-soup:appetizer:entree:dessert: message to chef with four arguments.

Like other messages, keyword messages usually follow a receiver (dictionary and chef in the above examples). However, you can also omit the receiver. In that case, it will implicitly be sent to a special Ether object:

```
// this:
write: "hi"
// is equivalent to:
Ether write: "hi"
```

Most of Finch's control flow operations like if:then: and while:do are defined as methods on Ether.

#### Sequences
Multiple expressions can be sequenced together into a single expression by separating them with commas.

```
write: "hi", write: "bye"
```

This code forms a single expression that writes "hi" and then "bye". When executed, a sequence evaluates each of its expressions in order, and then returns the result of the last one.

To make things a little cleaner, Finch also treats newlines as commas in places where that makes sense. In other words, we could write the above just as:

```
write: "hi"
write: "bye"
```

This doesn't mean all newlines will be treated as commas. If the end of a line is obviously not the end of an expression, a newline will be ignored. For example:

```
write: 1 +
  2
// prints 3
```

Since a + can't end an expression, the newline after is ignored and it continues onto the next line.

#### Cascades
Sometimes you want to send a series of messages to the same object. To avoid making you repeat the receiver over and over, you can cascade messages by separating them with semicolons (;). Instead of doing:

```
file write: "A line"
file << "Another line"
file write: "A third"
file close
```

You can instead do:

```
file write: "A line" ; << "Another line" ; write: "A third" ; close
```

This style is emulated in other languages using fluent interfaces. In Finch, any object can be cascaded.

#### Blocks
Finch looks like a lot of other languages in that curly braces define local blocks:

```
{
  write: "inside a block"
}
```

However, these blocks aren't what you think they are. When you enclose an expression in curly braces, you're actually creating a block object. A block object is essentially a closure or a local function. It's an object that contains a chunk of code and a lexical scope (i.e. its own set of local variables).

When you create a block, the code inside it isn't immediately executed. It's just packaged up into the block object. The above example won't actually print anything. To invoke the code inside a block, you send the block object a call message:

```
{ write: "inside a block" } call
```

Now "inside a block" will be printed.

#### Blocks are Objects
It's important to realize that blocks really are just objects. They can be stored in variables, passed to methods, etc. In fact, Finch doesn't have any built-in flow control structures. Consider:

```
if: a < b then: {
  write: "less"
} else: {
  write: "greater"
}
```

That looks like some built-in if/then construct. It isn't. What you're looking at is an if:then:else: keyword message being sent to Ether. The two blocks are arguments that are sent with the message. The implementation of that method looks at the first condition argument, and decides which of the two blocks to call based on that.

#### Block Arguments
Because blocks are basically functions, you can also pass arguments to them. If a block has arguments, they appear after the opening curly brace, surrounded by pipes (|):

```
{|a b| a + b }
```

The above code creates a block that takes two arguments. When called, it returns the sum of the arguments. You pass arguments to a block by using one of the keyword versions of call. For example:

```
{|a| write: a } call: "arg" // one argument
{|a b| write: a + b } call: "one" : "two" // two args
{|a b c| write: a + b + c } call: "one" : "two" : "three" // three
```

If you pass too many arguments to a block, the extra ones will be ignored. If you don't pass enough, it will assign the special value nil to the missing ones.

#### Assignment
Variables are declared and given values using assignment expressions. An assignment expression is simply a name followed by an assignment arrow, followed by some expression for the value to assign to the variable. For example:

```
a <- "some value"
```

Variables do not have to be explicitly declared—assigning it a value will create it if it doesn't already exist. The value returned by an assignment expression is the assigned value. For example:

```
write: (a <- "hi")
```

This creates a variable a, assigns "hi" to it, then prints "hi".

#### Short and Long Assignment
There are actually two kinds of assignment in Finch: short and long. The <- operator is short assignment and is what you'll use most of the time. It assigns to a variable in the current scope. If you want to avoid creating a new variable in the current scope and instead assign to an existing variable defined in an outer scope, you use the long assignment arrow: <--.

An example will clarify:

```
a <- "outside"
do: {
  a <- "inside"
}
write: a
```

This chunk of code will display "outside". The assignment inside the do: block creates a new a variable local to that block. When the block ends, that a is discarded and the outer one remains. Let's change it to use long assignment:

```
a <- "outside"
do: {
  a <-- "inside"
}
write: a
```

Now this code will print "inside". The a <-- "inside" line now means "walk up the scope chain looking for an existing variable named a and assign to it." (If it fails to find a previously declared variable to assign to, it just does nothing.)

One way you can think of this is that short assignment always means "declare a new variable in the current scope" and long assignment means "assign to an existing one."

#### Arrays
Finch has built-in support for resizable arrays. Most of the things you can do with arrays use normal message syntax, but there's also a little special sauce for creating arrays. A hash (#) followed a series of expressions in square brackets creates an array with an element for the value of each expression. Elements are separated with commas (or newlines) like a normal sequence. Enough talk:

```
#[]             // creates an empty array
#[1, 2, 3]      // a three-element array
#[123, "text"]  // arrays can have elements of different types
#[1 + 2, 3 neg] // expressions are fine too

// newlines can separate elements too
#["first"
  "second"
  "third"]
```

Arrays are objects like everything else, so they can be stored in variables, passed to methods, etc.

#### Precedence and Associativity
OK, so we've got the building blocks. Now let's talk about how they interact. The two keys parts are precedence and associativity. Precedence determines which expressions bind "tighter" when different expression types are mixed together. From lowest (loosest) to highest, we have: binds, sequences, assignment, keyword messages, operators, then unary messages. For example, given an expression like this:

```
a <- 8 + 2 neg mod: 4 - 2
write: a
```

Finch will parse that like this:

```
((a <- ((8 + (2 neg)) mod: (4 - 2))), (write: a))
```

Associativity controls how a series of the same type of expression is interpreted. Unary and operator messages associate to the left. A series of keywords will be parsed into a single keyword. Assignment is right-associative. Or, by example:

```
3 neg abs square            // is parsed as (((3 neg) abs) square)
1 + 2 * 3 - 4               // is parsed as (((1 + 2) * 3) - 4)
dict addKey: 123 value: "v" // is parsed as a single "addKey:value:" message
a <- b <- c <- 4            // is parsed as (a <- (b <- (c <- 4)))
```

That's pretty much the entirety of Finch's syntax. It's different, but I think it's a good bit simpler than most languages out there. (I'm looking at you C++.)


## Objects
When it comes to an object-oriented language, one of the most important things is, uh, objects. In Finch, everything is an object: numbers, strings, blocks of code, collections, etc. Many of these are primitive objects built into the language, but you can create your own objects too. An object contains a couple of things:

A set of methods. These are chunks of code associated with names. When you send a message to an object, invoking the method with that name is how it responds.

An internal state. Much like a local scope has variables, an object contains its own scope with named variables.

#### Object Literals
You create an object by defining these things. The easiest way is with an object literal, like so:

```
[ greet { write-line: "Hi!" } ]
```

An object literal is a pair of square brackets. Inside the brackets are a series of definitions, separated by commas (or newlines).

In the above example, we've defined one thing: an unary method named "greet" whose body is { write-line: "Hi!" }. If we store our object in a variable like this:

```
greeter <- [
  greet { write-line: "Hi!" }
]
```

Then we can send it a message like so:

```
greeter greet // "Hi!"
```

#### Method Definitions
Much like unary, operator and keyword messages, object literals let you define unary, operator, and keyword methods. They look like this:

```
greeter <- [
  // unary
  greet { write-line: "Hi!" }

  // operator
  +++ other { write-line: "I am at " + other }

  // keyword
  greet: who and: who-else {
    write-line: "Hi, " + who " and " + who-else
  }
]
```

When you send a message to the object, it will look for a matching method, bind the arguments to the method's parameters, and then call its block. So when you do:

```
greeter +++ "Fred"
```

It will bind "Fred" to other and then call the block.

#### Fields
Within the body of a method, you can access and set state on the object itself. Doing so looks like working with regular variables, except their names start with an underscore (_).

```
counter <- [
  increment {
    if: _count == nil then: { _count <- 0 }
    _count <- _count + 1
  }

  count { _count }
]
```

Here, the increment and count methods both use a _count field. Fields are like variables that are in scope within all methods of an object. Within a method, you can create a field simply by assigning it.

Fields are not visible outside of the object's methods. Unlike JavaScript and Self, they aren't just slots. So with the above example, you couldn't do this:

```
counter _count // nope
```

That's why greeter defines a count method to explicitly expose that. The idea here is that objects should encapsulate their internal state and only expose an interface to that that they control.

#### Field Definitions
Often when you create an object you want it to start with some initial state. To make that easier, you can also initialize fields in an object literal. We can simplify our above example by doing:

```
counter <- [
  _count <- 0

  increment { _count <- _count + 1 }
  count { _count }
]
```

#### Property Definitions
While it's good that objects encapsulate their state, it's also pretty common for them to expose some of it with simply unary methods that just get a field. To make that easier, you can do this:

```
counter <- [
  count <- 0
  increment { _count <- _count + 1 }
]
```

Here, the count <- 0 bit is exactly equivalent to initializing _count (with the underscore!) to zero, and then defining an accessor method count that returns it.

#### Self
Within the body of a method, you often want to get the object that the method is being invoked on. In Finch, that's called self:

```
counter <- [
  count <- 0
  increment { _count <- _count + 1 }
  increment-twice {
    self increment
    self increment
  }
]
```

Here, we're using self in order to call one method from another. Unlike Java and C++, but like JavaScript, you have to explicitly use self (or this in those languages) to send a message to yourself.

#### Modifying objects
The above features are fine when you want a new object, but what if you want to mess with one you already have? For that, Finch has the bind operator: ::. This lets you add new methods and fields to an existing object.

If we have some object fred, we can add a method to it like this:

```
fred :: dance { writeLine: "Sorry, I'm too sexy." }
fred dance // "Sorry, I'm too sexy."
```

This also works for operators and keyword messages:

```
fred :: ? right {
  writeLine: "What do I do with a " + right + "?"
}

fred :: give: gift to: who {
  writeLine: "Here, " + who + ", have a " + gift + "."
}

fred ? "plunger"
fred give: "plunger" to: "Bill"
```

#### Multibinds
It's common to want to define a number of methods on an object all at once. To make that easier, you can also use parentheses after :: and define a group of methods, like so:

```
fred :: (
  dance { writeLine: "Sorry, I'm too sexy." }

  ? right { writeLine: "What do I do with a " + right + "?" }

  give: gift to: who {
    writeLine: "Here, " + who + ", have a " + gift + "."
  }
)
```

In addition to methods, you can use bind expressions to define object variables:

#### Variable Binding
```
fred :: (
  _name <- "Fred"
  sayName { writeLine: _name }
)
fred sayName // "Fred"
```

If the name is an object variable name like _name here, it just defines that variable on the object (or assigns to it if it already exists). If you use a name without a leading underscore, then it will define an object variable with that name and automatically add an accessor method. In other words, this:

```
fred :: (
  band <- "Right Said Fred"
)
```

Is exactly the same as doing:

```
fred :: (
  _band <- "Right Said Fred"
  band { _band }
)
```

#### Inheritance
Finch is a prototype-based language. That means it doesn't have classes. When you send a message to an object, it's the object itself that we look for the methods on. But Finch does support inheritance. Every object can have a parent object.

When you send a message to an object, if it doesn't have a matching method, it delegates to its parent (which may in turn delegate to its parent, and so on, all the way up to Object, the root from which all objects ultimately descend).

You specify an object's parent by placing an expression between pipes (|) at the beginning of the literal. If you omit it, it defaults to Object.

```
parent <- [ inherited { "from parent" } ]
child <- [|Parent| childish { "in child" } ]

child childish // "in child"
child inherited // "in parent"
```

When an inherited method is called, self will still be the object that originally received the message, not the parent where the method was actually found. By example:

```
parent <- [
  say-name { write-line: self name }
  name { "parent" }
]

child <- [ name { "child" } ]
child say-name // "child"
```

Likewise, when you access fields in an inherited method, it will look for them in the original receiving object:

```
parent <- [
  say-name { write-line: _name }
  _name <- "parent"
]

child <- [ _name <- "child" ]
child say-name // "child"
```

In the same way that methods are inherited, fields are too. When you access a field in an object, if it can't be found there, it will look up the parent chain to find it.

When you set a field, it will always set it in the receiving object, even if it's set by an inherited method.

#### Prototypes and Type Objects
Finch doesn't have classes, but it's still common to define "kinds of things" when you write programs. Classes are a common pattern for doing that. In Finch, they are just that: a convention that you can follow when it makes sense.

A class in other languages generally defines two things: a set of behavior that all instances of the class share, and some behavior that is specific to the class itself. In class-based languages, the former is basically your instance methods and fields. The latter is the "static" methods of the class and the constructors.

In Finch, we define those as two separate objects. We call the former the "prototype" and the latter the "type object". The prototype's job is to be the parent that all instances of this type inherit from. That way, they all share the prototype's methods and behave the same.

The type object's job is to contain the "static" methods that are relevant to the type itself but not any particular instance of it. Constructors are the most important part of this.

The convention in Finch is that the type object is named using a singular PascalCased noun, and the prototype is plural.

```
Point <- [
  new-x: x y: y { [|Points| _x <- x, _y <- y ] }
]

Points <- [
  x { _x }
  y { _y }
  + other { Point new-x: _x + other x y: _y + other y }
  toString { "(" + _x + ", " + _y + ")" }
]
```

Here we're defining a two-dimensional point type. The Point object represents the type itself. It's one contribution is to define a constructor method that creates a new point instance. That method just returns an object literal with some state initialized and its parent correctly wired up to Points.

Points, in turn, is the prototype. It has the methods that all points support. Here it's just accessors for the coordinates, a little + operator so you can do vector math, and a to-string method so it can display itself. We can use these like so:

```
a <- Point new-x: 2 y: 3
b <- Point new-x: 1 y: 4
write-line: a + b // (3, 7)
```

So, without adding any complexity to the language, we can define class-like things where that pattern makes sense. But, if all you need as an object, you don't have to deal with that baggage.

https://github.com/munificent/finch
Finch is a simple bytecode interpreted, purely object-oriented, prototype-based, dynamically-typed programming language. It's mostly inspired by Smalltalk, Self, and Javascript.
