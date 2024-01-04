title=Novika
tags=language
summary=A moldable, concise, expressive language in the spirit of Forth, Self, Red/Rebol, and Lisp.
~~~~~~

[Website](https://novika-lang.github.io) | [Source](https://github.com/novika-lang/novika)

Written in [Crystal](/languages/ruby/crystal)

## Examples
Hello World:

```novika
'Hello World' echo
```

---

Factorial. Note that parentheses `()` do not mean anything in Novika. They're like single-character comments.

```novika
(5 to: 1) product "120"
```

---

First 100 Fizz buzz rounds:

```novika
1 to: 100 each: [
  [ [ 15 /? ] 'FizzBuzz'
    [  5 /? ] 'Buzz'
    [  3 /? ] 'Fizz'
  ] choose echo
]
```
