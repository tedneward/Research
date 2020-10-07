title=Fay
tags=language, functional, nodejs, browser
summary=A proper subset of Haskell that compiles to JavaScript.
~~~~~~

Fay has the following properties:

* A proper syntactic and semantic subset of Haskell
* Statically typed
* Lazy
* Pure by default
* Compiles to JavaScript
* Has fundamental data types (Double, String, etc.) based upon what JS can support, and compound data types (ADTs and GADTs)
* Outputs minifier-aware code for small compressed size
* Has a trivial foreign function interface to JavaScript
* Supports cabal installation of Fay packages
* Can automatically transcode values to/from JSON using the FFI
* Provides an API to transcode on the server side as well
* Lets you call Fay code from JavaScript
* Has the Fay monad for side effects (think of it like IO)

[Wiki/Website](https://github.com/faylang/fay/wiki) | [Source](https://github.com/faylang/fay)

Install:
```
cabal install cpphs 
# make sure cpphs is in your PATH
cabal install fay fay-base
```

Write awesome software:
```
{-# LANGUAGE EmptyDataDecls #-}
module Hello where

import FFI

data Event

alert :: String -> Fay ()
alert = ffi "alert(%1)"

setBodyHtml :: String -> Fay ()
setBodyHtml = ffi "document.body.innerHTML = %1"

addWindowEvent :: String -> (Event -> Fay ()) -> Fay ()
addWindowEvent = ffi "window.addEventListener(%1, %2)"

greet :: Event -> Fay ()
greet event = do
  putStrLn "The document has loaded"
  setBodyHtml "Hello HTML!"

main :: Fay ()
main = do
  putStrLn "Hello Console!"
  alert "Hello Alert!"
  addWindowEvent "load" greet
```

Compile it: `fay Hello.hs --html-wrapper`

Run the generated `Hello.html`