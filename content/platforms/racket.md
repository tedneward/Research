title=Racket
tags=platform, language, functional, object, metaobject
summary=Racket language/platform is a Lisp, but has numerous language implementations built on it.
~~~~~~

[Website](https://racket-lang.org/) | [Docs](https://docs.racket-lang.org/index.html) | [Source](https://github.com/racket/racket)

General-purpose programming language, as well as ecosystem for language-oriented programming. Languages available (through the `#lang` directive):

* racket
* scribble/base
* typed/racket
* [datalog](datalog.html)
* racket/gui
* web-server/insta
* plait (plai language with a type system close to that of ML)
* profj (ProfessorJ: Java in Racket)
* racklog (Prolog-style logic programming)

Really broad ecosystem; deserves much more attention than it gets.

["An introduction to Racket, with pictures"](https://docs.racket-lang.org/quick/index.html)

Example: HelloWorld
```lisp
#lang racket/gui

(define my-language 'English)

(define translations
  #hash([English . "Hello world"]
        [French . "Bonjour le monde"]
        [German . "Hallo Welt"]
        [Greek . "Γειά σου, κόσμε"]
        [Portuguese . "Olá mundo"]
        [Spanish . "Hola mundo"]
        [Thai . "สวัสดีชาวโลก"]))

(define my-hello-world
  (hash-ref translations my-language
            "hello world"))

(message-box "" my-hello-world)
```

Example: Language-Oriented Programming
```
#lang typed/racket

;; Using higher-order occurrence typing
(define-type SrN (U String Number))
(: tog ((Listof SrN) -> String))
(define (tog l)
  (apply string-append
         (filter string? l)))
(tog (list 5 "hello "
           1/2 "world" (sqrt -1)))
```

```
#lang scribble/base

@; Generate a PDF or HTML document
@(require (only-in racket ~a))
@(define N 99)
@title{Bottles: @italic{Abridged}}
@(apply
  itemlist
  (for/list ([n (in-range N 0 -1)])
    @item{@(~a n) bottles.}))
```

```
#lang datalog

ancestor(A, B) :- parent(A, B).
ancestor(A, B) :-
  parent(A, C), ancestor(C, B).
parent(john, douglas).
parent(bob, john).
ancestor(A, B)?
```

