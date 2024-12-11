title=daScript
tags=language
summary=High-performance statically strong typed scripting language.
~~~~~~

[Source](https://dascript.org/) | [Source](https://github.com/GaijinEntertainment/daScript) | [HN](https://news.ycombinator.com/item?id=24166505)

daScript is a high-level programming language that features strong static typing. It is designed to provide high performance and serves as an embeddable 'scripting' language for C++ applications that require fast and reliable performance, such as games or back end/servers. Additionally, it functions effectively as a standalone programming language.

### What Does it look like?
daScript's syntax is reminiscent of (Typed) Python, while its static strong typed nature is similar to ML or Zig. Its POD types are closely aligned with hardware/machine types. Additionally, the language makes use of type inference, as can be seen in the following Fibonacci code snippet.

```
def fibR(n)
    if (n < 2)
        return n
    else
        return fibR(n - 1) + fibR(n - 2)

def fibI(n)
    var last = 0
    var cur = 1
    for i in range(0, n-1)
        let tmp = cur
        cur += last
        last = tmp
    return cur
```

Also, for those who for some reason prefer curly brackets over Python-style indenting, it is also possible to write:

```
def fibR(n) {
    if (n < 2) {
        return n;
    } else {
        return fibR(n - 1) + fibR(n - 2);
    }
}
def fibI(n) {
    var last = 0;
    var cur = 1;
    for i in range(0, n-1); {
        let tmp = cur;
        cur += last;
        last = tmp;
    }
    return cur;
}
```

(Note that within curly brackets semicolons (;) are required to separate statements).