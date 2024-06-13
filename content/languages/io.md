title=Io
tags=language, dynamic
summary=Inspired by Self, Smalltalk and LISP.
~~~~~~

[Website](http://iolanguage.org/) 

## Implementations

* [Reference](https://github.com/IoLanguage/io)
* [CLR](https://github.com/stangelandcl/io-clr)
* [GraalVM](https://github.com/guillermomolina/graal-io)
* [JS](https://github.com/dariusf/iota)
* [PyPy](https://pypi.org/project/mio-lang/)

> The focus of programming language research for the last thirty years has been to combine the expressive power of high level languages like Smalltalk and the performance of low level languages like C. The results have neither been as fast as C or as expressive as Smalltalk. Io's purpose is to refocus attention on expressiveness by exploring higher level dynamic programming features with greater levels of runtime flexibility combined with simplified programming syntax and semantics.
> In Io, all values are objects (of which, anything can change at runtime, including slots, methods and inheritance), all code is made up of expressions (which are runtime inspectable and modifiable) and all expressions are made up of dynamic message sends (including assignment and control structures). Execution contexts themselves are objects and activatable objects such as methods/blocks and functions are unified into blocks with assignable scope. Concurrency is made more easily manageable through actors and implemented using coroutines for scalability.

> Goals: To be a language that is: simple (conceptually simple and consistent, easily embedded and extended), powerful(highly dynamic and introspective, highly concurrent (via coroutines and async i/o)), practical (fast enough, multi-platform, unrestrictive BSD/MIT license, comprehensive standard packages in distro)

### Syntax
Io has no keywords or statements. Everything is an expression composed entirely of messages, each of which is a runtime accessible object.

Message arguments are passed as expressions and evaluated by the receiver. Selective evaluation of arguments can be used to implement control flow. Examples:
```
for(i, 1, 10, i println)
a := if(b == 0, c + 1, d)
```
In the above code, "for" and "if" are just normal messages, not special forms or keywords.
Likewise, dynamic evaluation can be used with enumeration without the need to wrap the expression in a block. Examples:
```
people select(person, person age < 30)
names := people map(person, person name)
```
Methods like map and select will typically apply the expression directly to the values if only the expression is provided:
```
people select(age < 30)
names := people map(name)
```
There is also some syntax sugar for operators (including assignment), which are handled by an Io macro executed on the expression after it is compiled into a message tree. Some sample source code:
```
Account := Object clone
Account balance := 0
Account deposit := method(amount,
    balance = balance + amount
)

account := Account clone
account deposit(10.00)
account balance println
```
Like [Self](../self), Io's syntax does not distinguish between accessing a slot containing a method from one containing a variable.

An operator is just a message whose name contains no alphanumeric characters (other than ";", "_", '"' or ".") or is one of the following words: or, and, return. Example:
```
1 + 2
```
This just gets compiled into the normal message:
```
1 +(2)
```
Which is the form you can use if you need to do grouping:
```
1 +(2 * 4)
```
Standard operators follow C's precedence order, so:
```
1 + 2 * 3 + 4
```
Is parsed as:
```
1 +(2 *(3)) +(4)
```
User defined operators (that don't have a standard operator name) are performed left to right.

Operators can also be added or removed, or have their precedence changed by using the global OperatorTable object. For example:
```
OperatorTable addOperator("!!", 3)
```
adds the `!!` operator with a precedence of 3. Note that this change will not effect the source file in which the OperatorTable is modified as the full file is parsed before it is evaluated.

Io has three assignment operators:

operator|action
--------|------
`::=`|Creates slot, creates setter, assigns value
`:=`|Creates slot, assigns value
`=`|Assigns value to slot if it exists, otherwise raises exception

These operators are compiled to normal messages whose methods can be overridden. For example:

source|compiles to
------|----------
`a ::=1`|`newSlot("a", 1)`
`a := 1`|`setSlot("a", 1)`
`a = 1`|`updateSlot("a", 1)`

On Locals objects, updateSlot is overridden so it will update the slot in the object in which the method was activated if the slot is not found the locals. This is done so update assignments in methods don't require self to be an explicit target.

### Objects
Io's guiding design principle is simplicity and power through conceptual unification.

concept|unifies
-------|--------
scopable|blocks	functions, methods, closures
prototypes|objects, classes, namespaces, locals
messages|operators, calls, assigns, var access

* **Prototypes**
  In Io, everything is an object (including the locals storage of a block and the namespace itself) and all actions are messages (including assignment). Objects are composed of a list of key/value pairs called slots, and an internal list of objects from which it inherits called protos. A slot's key is a symbol (a unique immutable sequence) and its value can be any type of object.

  New objects are made by cloning existing ones. A clone is an empty object that has the parent in its list of protos. A new instance's init slot will be activated which gives the object a chance to initialize itself. Like NewtonScript, slots in Io are create-on-write.

  When an object receives a message it looks for a matching slot, if not found, the lookup continues depth first recursively in its protos. Lookup loops are detected (at runtime) and avoided. If the matching slot contains an activatable object, such as a Block or CFunction, it is activated, if it contains any other type of value it returns the value. Io has no globals and the root object in the Io namespace is called the Lobby.

  Since there are no classes, there's no difference between a subclass and an instance.



### Examples
Cards (a deck of cards, shuffling, dealing, etc):
```
// By Jason Sackett

Random setSeed(Date clone now asNumber)

List shuffle := method(
    for(i, 1, size - 1, 
	    swapIndices(i, Random value(0, size) floor)
    )
)

Deck := Object clone do(
    init := method(
      self cards := List clone
      list("h", "d", "c", "s") foreach(suit, 
	    for(value, 2, 14, cards append(value asString .. suit))
	)
    )
    init
    shuffle  := method(cards shuffle)
    dealCard := method(cards pop)
    show := method(cards foreach(i, card, write(card, " ")); "\n" print)
)

Deck show
Deck shuffle
Deck show

Deck dealCard println
Deck dealCard println
Deck dealCard println
```

https://github.com/IoLanguage/io
Io is a pure object-oriented (relying on prototype-based paradigm) programming language focused on expressiveness through simplicity.
