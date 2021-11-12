title=Haste
tags=language, functional
summary=an implementation of the Haskell functional programming language, geared towards web applications; compiler generates JavaScript code from Haskell.
~~~~~~

[Website](https://haste-lang.org/) | [Source](https://github.com/valderman/haste-compiler)

### Features

* Seamless, type-safe single program framework for client-server communication
* Support for modern web technologies such as WebSockets, WebStorage and Canvas
* Simple JavaScript interoperability
* Generates small, fast programs
* Supports all GHC extensions except Template Haskell
* Uses standard Haskell libraries
* Cabal integration
* Simple, one-step build; no need for error prone Rube Goldberg machines of
  Vagrant, VirtualBox, GHC sources and other black magic
* Concurrency and MVars with Haste.Concurrent
* Unboxed arrays, ByteArrays, StableNames and other low level features
* Low-level DOM base library
* Easy integration with Google's Closure compiler
* Works on Windows, GNU/Linux and Mac OS X

### Usage

To compile your Haskell program to a JavaScript blob ready to be included in an
HTML document or run using a command line interpreter:

    $ hastec myprog.hs

This is equivalent to calling ghc --make myprog.hs; Main.main will be called
as soon as the JS blob has finished loading.

You can pass the same flags to hastec as you'd normally pass to GHC:

    $ hastec -O2 -fglasgow-exts myprog.hs

Haste also has its own set of command line arguments. Invoke it with `--help`
to read more about them. In particular `--opt-all`, `--opt-minify`,
`--start` and `--with-js` should be fairly interesting.

If you want your package to compile with both Haste and, say, GHC, you might
want to use the CPP extension for conditional compilation. Haste defines the
preprocessor symbol `__HASTE__` in all modules it compiles. This symbol may
also be used to differentiate between Haste versions, since it is defined
as an integer representation of the current Haste version. Its format is
`MAJOR*10 000 + MINOR*100 + MICRO`. Version 1.2.3 would thus be represented as
10203, and 0.4.3 as 403.

Haste also comes with wrappers for cabal and ghc-pkg, named haste-cabal and
haste-pkg respectively. You can use them to install packages just as you would
with vanilla GHC and cabal:

    $ haste-cabal install mtl

Finally, you can interact with JavaScript code using the `Haste.Foreign`
module in the bundled `haste-lib` library.
See `doc/js-externals.txt` for more information about that.
This library also contains all sorts of functionality for DOM manipulation,
event handling, preemptive multitasking, canvas graphics, native JS
string manipulation, etc.

For more information on how Haste works, see
[the Haste Report](http://haste-lang.org/hastereport.pdf "Haste Report"),
though beware that parts of Haste may have changed quite a bit.

You should also have a look at the documentation and/or source code for
`haste-lib`, which resides in the `libraries/haste-lib` directory, and the
small programs in the `examples` directory, to get started.


### Interfacing with JavaScript

When writing programs you will probably want to use some native JavaScript
in your program; bindings to native libraries, for instance.
The preferred way of doing this is the `Haste.Foreign` module:

    {-# LANGUAGE OverloadedStrings #-}
    import Haste.Foreign
    
    addTwo :: Int -> Int -> IO Int
    addTwo = ffi "(function(x, y) {return x + y;})"

The `ffi` function is a little bit safer than the GHC FFI in that it enforces
some type invariants on values returned from JS, and is more convenient.
Performance-wise, it is roughly as fast as the GHC FFI except for complex types
(lists, records, etc.) where it is an order of magnitude faster.

If you do not feel comfortable throwing out your entire legacy JavaScript
code base, you can export selected functions from your Haste program and call
them from JavaScript:

fun.hs:

    {-# LANGUAGE OverloadedStrings #-}
    import Haste.Foreign
    import Haste.Prim (toJSStr)

    fun :: Int -> String -> IO String
    fun n s = return $ "The number is " ++ show n ++ " and the string is " ++ s

    main = do
      export "fun" fun

legacy.js:

    function mymain() {
      console.log(Haste.fun(42, "hello"));
    }

...then compile with:

    $ hastec '--start=$HASTE_MAIN(); mymain();' --with-js=legacy.js fun.hs

`fun.hs` will export the function `fun` when its `main` function is run.
Our JavaScript obviously needs to run after that, so we create our "real" main
function in `legacy.js`. Finally, we tell the compiler to start the program by
first executing Haste's `main` function (the `$HASTE_MAIN` gets replaced by
whatever name the compiler chooses for the Haste `main`) and then executing
our own `mymain`.

The mechanics of `Haste.Foreign` are described in detail in this
[paper](http://haste-lang.org/ifl15.pdf).


### Effortless type-safe client-server communication

Using the framework from the `Haste.App` module hierarchy, you can easily write
web applications that communicate with a server without having to write a
single line of AJAX/WebSockets/whatever. Best of all: it's completely type
safe.

In essence, you write your web application as a single program - no more forced
separation of your client and server code. You then compile your program once
using Haste and once using GHC, and the two compilers will magically generate
client and server code respectively.

You will need to have the same libraries installed with both Haste and vanilla
GHC (unless you use conditional compilation to get around this).
`haste-compiler` comes bundled with all of `haste-lib`, so you
only need to concern yourself with this if you're using third party libraries.
You will also need a web server, to serve your HTML and JS files; the binary
generated by the native compilation pass only communicates with the client part
using WebSockets and does not serve any files on its own.

Examples of Haste.App in action is available in `examples/haste-app` and
`examples/chatbox`.

For more information about how exactly this works, see this
[paper](http://haste-lang.org/haskell14.pdf).



