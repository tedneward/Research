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

Sieve of Eratosthenes:

```
2 to: 120 ||-> [ $: n (stack without: [ n /? ]) asStack n ] each: echo
```

Zigzag problem from LeetCode, with the examples as tests. Observe the boundary between terseness and readability.

```
"""
Not the mathy one but the naive one, because programming is
not math thank goodness!
"""

[ dup 1 = => [ drop ^ ]

  collect: '' dup 1 |to $: grid

  0 $: col

  [ grid |: |> |atRightBound? asc desc sel ] $: desc
  [ grid |: <| |afterFirst? desc asc sel (col 1 + =: col) ] $: asc
  desc @: action

  [ $: char grid |: [ char ~ ] ] @: put

  each: [ put action =: action ]

  grid join
] @: convert


describe 'Zigzag Conversion' [
  in leetcode

  it should 'follow the happy path' [
    'A' 1 convert 'A' assert=
    'A' 3 convert 'A' assert=
    'HELLOWORLD' 1 convert 'HELLOWORLD' assert=
  ]

  it should 'convert given 3 rows' [
    'PAYPALISHIRING' 3 convert 'PAHNAPLSIIGYIR' assert=
  ]

  it should 'convert given 4 rows' [
    'PAYPALISHIRING' 4 convert 'PINALSIGYAHRPI' assert=
  ]
]

runTestsInGroup: leetcode
```

