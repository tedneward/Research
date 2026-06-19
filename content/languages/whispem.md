title=Whispem
tags=language, vm
summary=A small, self-hosted programming language; compiler is written in Whispem, compiles itself, and runs on a standalone C VM — no external dependencies beyond a C compiler.
~~~~~~

[Source](https://github.com/whispem/whispem-lang)

## Examples

```
# Variables
let name = "Em"
let age  = 26

# F-strings
print f"Hello, {name}! Age: {age}"

# Conditionals
if age >= 18 {
    print "adult"
} else if age >= 13 {
    print "teen"
} else {
    print "child"
}

# For / while loops
for fruit in ["apple", "banana", "cherry"] { print fruit }

let i = 0
while i < 5 { print i\nlet i = i + 1 }

# Functions
fn greet(person) { return f"Hello, {person}!" }
print greet("world")

# Lambdas
let double = fn(x) { return x * 2 }
print double(7)   # 14

# Closures
fn make_adder(n) { return fn(x) { return x + n } }
print make_adder(5)(3)   # 8

# Higher-order functions (v6)
print map([1, 2, 3], fn(x) { return x * x })       # [1, 4, 9]
print filter([1..5], fn(n) { return n % 2 == 1 })   # [1, 3, 5]
print reduce([1,2,3,4,5], fn(a,n){return a+n}, 0)   # 15

# Arrays
let nums = push([1, 2, 3], 4)
print length(nums)   # 4

# Dicts
let person = {"name": "Em", "age": 26}
print person["name"]

# assert and type_of
assert(type_of(double) == "function")
print type_of(42)   # number
```

