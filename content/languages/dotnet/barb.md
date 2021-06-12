title=Barb
tags=language, clr
summary=A small dynamic scripting language for .NET.
~~~~~~

[Source](https://github.com/Rickasaurus/Barb) | [Video](https://vimeo.com/39381728)

Barb is a small dynamic scripting language for .NET with the following properties:

* Syntax that makes both F# and C# devs feel at home
* Fully expression oriented (Whitespace is completely ignored)
* Paren based scoping rules (Lisp-like)
* Pure functional (No mutation allowed)

This makes Barb an easy to learn language which you can give to your users for safely scripting over data in your application. Best of all, you'll be able to use it without learning a bunch of new syntax.

### Examples of Use
The best way to think about Barb is over some collection of records (data classes to you C# folks).

```
type CustRecord =
	{
		Name: string
		Age: int
		Weight: int
		Source: obj
		Locations: string array
	}
```

**As mentioned above, Barb is great for writing queries.**
In Barb you can choose either the words "and"/"or" or use "&&"/"||", whichever makes you more comfortable.

    let predicate = buildExpr<CustRecord,bool>("Name.Contains 'John' and (Age > 20 or Weight > 200)")

This will will return a predicate which you can then use to filter over large numbers of records.

**It can also be used to for user specified reflection.**
One case where I use this is for writing out CSV files. Given a set of record field specifying strings, you can easily build functions which will grab the specified data.

    let fld1Getter = buildExpr<CustRecord,int>("Weight") 

Quite simple right? Barb will also convert to the correct output type if able.

    let fld1Getter = buildExpr<CustRecord,string>("Weight") 

Here the integer will be converted on the fly to string because it's what you statically specified.

    let fld1Getter = buildExpr<CustRecord,string>("Source.Url")

Barb can will also reflect into the real type of a given obj, which can be quite handy for taking the hard work out of accessing untyped data.

Barb supports many of the constructs a F# user would expect

    buildExpr<CustRecord,string>("Locations.[0]") // The F# style '.' is optional :)
    buildExpr<CustRecord,string>("if Age > 40 then 'Old' else 'Young'")
    buildExpr<CustRecord,int>("let x = Age + 1 in x") // or..
    buildExpr<CustRecord,int>("var x = Age + 1 in x") // (although, I may use var for mutables in the future)

...and some fancier ones from F#

    buildExpr<unit,seq<int>>("{ 1 .. 5 }") // Returns 1,2,3,4,5 as a sequence
    buildExpr<unit,seq<int>>("{ 1 .. 2 .. 10 }") // Returns 1,3,5,7,9 as a sequence
    buildExpr<unit,int []>("[|1; 2; 3|]") // Returns 1,2,3 as an array

...all looping must currently be handled with lambda recursion

    buildExpr<unit,seq<int>>("let recfun = fun x -> if x > 1 then x else recfun (x + 1) in recfun 0") 

...but it's still growing and more features are being added all the time.

**Language Details**

Subexpression Forms | 
--------------- | ------------
Subscope: | ( <code> )
Tuple: | ... <code>, <code>, <code>, ...
Array: | [| <code>; <code>; <code>; ... |]
Lambda: | fun <binding> -> <code> ...
Lambda (alternate): | <binding> => <code> ...
Branching: | if <code> then <code> else <code> ...
Indexing: | <obj>[ <code> ]
Binding: | let <name> = <code> in
Binding (Alternate*): | var <name> = <code> in
Nested Invocation: | <obj collection>..<Property/Method>

Except in the case of nested invocation the '...' here indicates an unbounded expression and is not actual Barb syntax. Any unbounded expression can be bounded implicitly by a parent expression or explicitly by creating a subscope with parentheses.

* The var keyword may be used in the future to allow for locally mutable variables.

