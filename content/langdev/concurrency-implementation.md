title=Async/concurrency language implementation
tags=langdev, concurrent, async
summary=Notes and loinks on how to build out "async" and other functions in a programming language.
~~~~~~

### [Async Implementation](https://langdev.stackexchange.com/questions/3414/async-implementation)

**Q** I have recently been making my own programming language and I am finding most concepts easy to understand, however I'm not sure how to implement async/await in my language.

ATM, I'm using C# to create this language and I have no idea how to go about implementing such features.

The language is an interpreted one.

I'm able to implement a JS-like Promise system, but this doesn't help with running asynchronous C# functions, for example sending a HTTP request.

What I have working with such "promise-like" system is this:

    var any f = Future.create(|resolve, reject| => resolve(2));
    f.then(val => Console.writeLine(val));

It works perfectly within the language, however trying to run async C# functions whilst the entire interpreter does not use async at all I have no idea how to do.

The only options I can think of is

1. Make every C# function async (like the parser, interpreter, etc.) by default, but I'm not sure if this would help
2. Use the .GetAwaitor().GetResult() but apparently this shouldn't really be used

I've tried searching and looking everywhere on Google for ways to implement this but I could never find any, so any resources for this topic would be appreciated.

**A** Async/await is syntax sugar for promises.

You'll need to familiarize yourself with Continuation Passing Style (CPS). Basically, CPS is a way to write regular, sequential ("procedural") code as a chain of callbacks. Ex:

    function() {
        let x = foo("a", "b")
        let y = bar("c", "d")
        let z = baz(1, 2, x)
        return y + z
    }

converted into CPS is

    function(k) {
        foo("a", "b", function(x) {
            bar("c", "d", function(y) {
            baz(1, 2, x, function(z) k(y + z))
            })
        })
    }

This is roughly what your interpreter needs to do with async functions before you interpret them. Convert:

    async function() {
        let x = await foo("a", "b");
        let y = await bar("c", "d");
        let z = await baz(1, 2, x);
        return y + z;
    }

into

    function() { return new Promise(resolve => 
        foo("a", "b").then(function(x) {
            bar("c", "d").then(function(y) {
            baz(1, 2, x).then(function(z) resolve(y + z))
            })
        })
    }

Specifically:

* After parsing an async function or other kind of aysnc block, desugar it into a regular function which returns a promise, where all the awaits are replaced with .then and .catch callbacks.
* If your language supports top-level async, you can parse and desugar the entire source to get one big promise which you then execute. Alternatively, to avoid parsing the entire file at once, you can parse and desugar each individual statement into a promise, waiting to parse the next statement until the promise resolves. Basically, write an async function evalRemaining(int pos), which lexes/parses and desugars the first statement into a promise, then adds a .then callback to that promise which recursively calls evalRemaining with the position right after that statement's end.
* If your language supports top-level async in a REPL you handle it similarly: read/lex/parse/desugar the current line into a promise, then wait until that promise resolves before asking the user for the next line, by putting the code to do so in the promise callback.

Now, your goal is to desugar a statement or expression with `await`s, into a promise expression where the `await`s are replaced with `.then` and `.catch` callbacks, and the promise resolves into the expression result. This is essentially the same as converting a block of procedural code into a function written in CPS.

There's a lot of existing literature on continuation passing style. You mentioned having trouble finding resources to implement async/await, but if you can rephrase your queries about implementing async/await into implementing CPS conversion, I guarantee you'll find online guides and other resources.




