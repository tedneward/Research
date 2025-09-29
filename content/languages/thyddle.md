title=Thyddle
tags=language, python
summary=A JavaScript-inspired, semicolon-strict programming language built in Python.
~~~~~~

[Source](https://github.com/AlmostGalactic/Thyddle)

## 🌟 Features

* Familiar JavaScript-like syntax with `var`, `const`, and `func`
* Must use semicolons
* Anonymous functions using `->`
* Arrays and objects as first-class values
* Conditional statements (`if`, `elseif`, `else`), loops (`while`, `for`)
* Import system for adding libraries
* **Full math library** (abs, sqrt, sin, cos, tan, floor, ceil, pow, log, exp, random, and more)
* Built-in `true`, `false`, and `nothing` (Thyddle's `None`)
* `eval` and `pyth` functions for dynamic Thyddle or Python execution

---

## 🏗 Project Structure

```
/ thyddle
├── interpreter.py    # Core interpreter
├── parser.py         # Syntax parser
├── lib/              # Standard and extra libraries
├── examples/         # Sample programs
└── README.md         # This document
```

---

## ✏️ Basic Syntax

### Variables

```javascript
var name = "John";
const age = 25;
```

### Functions

```javascript
func greet(name) {
    console.output.println("Hello, " + name);
}

greet("Alice");
```

Anonymous functions:

```javascript
var greet = (name) -> {
    console.output.println("Hi, " + name);
};
```

### Arrays

```javascript
var numbers = [1, 2, 3, 4, 5];
console.output.println(numbers[0]);  // prints 1
```

### Objects

```javascript
var person = {
    name: "John",
    age: 30,
    greet: (other) -> {
        console.output.println("Hey, " + other.name + "!");
    }
};

person.greet({ name: "Alice" });
```

### Control Flow

```javascript
if (age > 18) {
    console.output.println("Adult");
} elseif (age == 18) {
    console.output.println("Just became an adult");
} else {
    console.output.println("<18");
}

while (condition) {
    // code
}

for (var i = 0; i < 10; i = i + 1;) {
    console.output.println(i);
}
```

---

## 📦 Importing Libraries

```javascript
import "lib/standard";

println("Hello, world!");  // thanks to lib/standard
```

**Standard Library Highlights:**

* `println`, `print`, `input`
* `arr.combine(array, separator)`
* `arr.map(array, function)`
* `string.split(text)` → split text by every character
* `string.reverse(text)`

**File IO Library:**

* `fileio.write(path, content)`
* `fileio.append(path, content)`
* `fileio.read(path)`
* `multi_line(array)` → joins array into newline-separated string

**Math Library (built-in, complete):**

* `math.abs(x)`
* `math.sqrt(x)`
* `math.sin(x)`
* `math.cos(x)`
* `math.tan(x)`
* `math.asin(x)`
* `math.acos(x)`
* `math.atan(x)`
* `math.atan2(y, x)`
* `math.sinh(x)`
* `math.cosh(x)`
* `math.tanh(x)`
* `math.asinh(x)`
* `math.acosh(x)`
* `math.atanh(x)`
* `math.floor(x)`
* `math.ceil(x)`
* `math.pow(x, y)`
* `math.exp(x)`
* `math.log(x)`
* `math.rad(x)` (degrees to radians)
* `math.random.randint(min, max)`
* `math.random.uniform(min, max)`

---

## 🔨 Built-in Functions

| Function                  | Description                                                                 |
| ------------------------- | --------------------------------------------------------------------------- |
| `len(x)`                  | Length of string, object, or array                                          |
| `type(x)`                 | Returns the type of `x`                                                     |
| `tonum(x)`                | Converts to number                                                          |
| `tostr(x)`                | Converts to string                                                          |
| `eval(code)`              | Runs Thyddle code                                                           |
| `pyth(code)`              | Runs Python code                                                            |
| `reverse(x)`              | Reverses array or object                                                    |
| `ord(char)`               | Gets Unicode code of character                                              |
| `chr(code)`               | Gets character from Unicode code                                            |
| `array.append(arr, item)` | Appends item to array                                                       |
| `array.pop(arr)`          | Pops last item from array                                                   |
| `split(string, sep)`      | Splits string by separator (use `string.split` for per-character splitting) |

---