title=Tug
tags=language, jvm, lua
summary=Simple and neat syntax as well as minimalistic keywords and data types.
~~~~~~

[Source](https://github.com/tuglang/tug)

# README
Is a programming language with a simple and neat syntax as well as minimal in terms of keywords and data types. Code execution speed is fast and minimal and the current version is `v0.1.0`.

## Features
- Code processing speed is fast, easy and extremely simple for beginners.
- Few features, few data types, few keywords, has been greatly simplified.

## Syntax
**Reserved keywords:** `if`, `else`, `loop`, `skip`, `break`, `func`, `ret`

**Data types:** `str`, `num`, `none`, `func`, `table`

### Hello, World program
```
print("Hello, World!")
```
Factorial using recursion
```
func factorial(n) {
  if n == 1 {
    ret n
  } else {
    ret n * factorial(n - 1)
  }
}
```

## Compile Java to Tug
- This feature help Tug program running more faster by using pure Java.

### Example

```java
public class module {
    public static TugObject test(TugPosition pos, TugTable global, TugArgs args) {
        System.out.println("Hello, World!");
        return new TugNone();
    }
}
```
Compile java to tug by using command:
```
tug jcompile module.java
```
And it will produce 2 files: `module.class` and `module.tugb`
To import module into Tug program 2 files must be together and in same directory, same location
main.tug
```lua
module = import("module")
module.test()
```
Output:
```
Hello, World!
```

## More examples
### Cat program
```
loop {
  print(input())
}
```
### FizzBuzz
```lua
n = 1
loop 20 {
  if n % 3 == 0 && n % 5 == 0 {
    print("FizzBuzz")
  } else if n % 3 == 0 {
    print("Fizz")
  } else if n % 5 == 0 {
    print("Buzz")
  } else {
    print(n)
  }
  n += 1
}
```
### Table
```lua
account = {
  money = 100,
  bank = 0
}

func deposit(account, amount) {
  account.money -= amount
  account.bank += amount
}

func withdraw(account, amount) {
  account.money += amount
  account.bank -= amount
}

deposit(account, 50)
print(account.money)
```
### Multithreading
```lua
thread = import("thread")

task1 = thread.new(func() {
    loop 100 {
        print("Hello")
    }
})

task2 = thread.new(func() {
    loop 100 {
        print("sup")
    }
})

thread.start(task1)
thread.start(task2)
```
### donut.tug
```lua
math = import("math")
theta = 0.07
phi = 0.02

a = 0
ba = 0

main_str = {'.', ',', '-', '~', ':', ';', '=', '!', '*', '#', '$', '@'}
print("\n"*50)

z = {}
b = {}

loop {
    j = 0
    l = 0
    loop 1760 {
        z[l] = 0
        l++
    }
    t = 0
    loop 1760 {
        b[t] = ' '
        t++
    }

    loop if j < 6.28 {
        j += theta
        i = 0
        loop if i < 6.28 {
            i += phi

            c = math.sin(i)
            l = math.cos(i)
            d = math.sin(j)
            f = math.cos(j)

            e = math.sin(a)
            g = math.cos(a)
            h = d + 2
            D = 1 / (c * h * e + f * g + 5)

            m = math.cos(ba)
            n = math.sin(ba)
            t = c * h * g - f * e

            x = math.floor(40 + 30 * D * (l * h * m - t * n))
            y = math.floor(12 + 15 * D * (l * h * n + t * m))
            o = math.floor(x + (80 * y))
            N = math.floor(8 * ((f * e - c * d * g) * m - c * d * e - f * g - l * d * n))

            if 22 > y && y > 0 && 80 > x && x > 0 {
                if z[o] == none {
                    b[o + 1] = '.'
                } else {
                    z[o] = 0
                    if N > 0 {
                        b[o] = main_str[N]
                    } else {
                        b[o + 1] = '.'
                    }
                }
            }
        }
    }

    print("\n"*50)
    res = ""
    l = 0
    loop 1760 {
        if l % 80 != 0 {
            res += b[l]
        } else {
            res += "\n"
        }
        l++
    }
    print(res)

    a += 0.16
    ba += 0.08
}
```