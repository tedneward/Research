title=Racket
tags=language, lisp
summary=Lisp-inspired/-oriented language and platform, for both program development and language development.
~~~~~~

[Website](https://racket-lang.org/) | [Docs](https://docs.racket-lang.org/)

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

