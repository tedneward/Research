title=GUILE
tags=language, lisp, scheme, functional, dynamic, ecmascript, web assembly
summary=The GNU Ubiquitous Intelligent Language for Extensions.
~~~~~~

Guile is designed to help programmers create flexible applications that can be extended by users or other programmers with plug-ins, modules, or scripts. With Guile you can create applications and games for the [desktop](https://www.gnu.org/software/guile/#apps-using-guile), the [Web](https://www.gnu.org/software/guile/#apps-using-guile), the [command-line](https://www.gnu.org/software/guile/#apps-using-guile), and more.

[Website](https://www.gnu.org/software/guile/) | [Source](http://git.savannah.gnu.org/cgit/guile/guile-web.git)

> Guile contains an efficient compiler and virtual machine. It can be used out of the box to write programs in Scheme, or can easily be integrated with C and C++ programs.

> In addition to Scheme, Guile includes compiler front-ends for ECMAScript and Emacs Lisp (support is underway for Lua), which means your application may be extended in the language (or languages) most appropriate for your user base. And Guile's tools for parsing and compiling are exposed as part of its standard module set, so support for additional languages can be added without writing a single line of C.

Examples:
```
;;; Hello world program
(define name "World")
(display (string-append "Hello " name "!"))
(newline)
```

```
;;; Show current date and time
(use-modules (srfi srfi-19))

(display (date->string (current-date)
                       "~A, ~B ~e ~Y ~H:~S"))
(newline)
```
Import the srfi-19 module and use its functions to display the current date and time in the format WEEKDAY, MONTH MONTHDAY YEAR HOUR:SECOND.

```
;;; Hello HTTP server
(use-modules (web server))

(define (my-handler request request-body)
  (values '((content-type . (text/plain)))
          "Hello World!"))

(run-server my-handler)
```

[Tutorial showing embedding GUILE](https://www.gnu.org/software/guile/docs/guile-tut/tutorial.html)

---

[Hoot](https://gitlab.com/spritely/guile-hoot): an ahead-of-time compiler for all of R7RS-small Scheme to WebAssembly.
