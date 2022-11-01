title=Nylo
tags=language
summary=A declarative programming language that takes some constructs from functional and logic paradigms, aims to be simple and clear, but powerful.
~~~~~~

[Source](https://github.com/veggero/nylo)

```
fib: (
    n: int
    prevs: fib(n: n-1) + fib(n: n-2)
    result: if(cond: n<2, then: n, else: sum_prev_fibs)
    -> result
)
```

Built on top of Python3.
