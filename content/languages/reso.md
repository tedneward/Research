title=Reso
tags=language, distribution
summary=A resource-oriented programming language for building high-performance web services and APIs.
~~~~~~

[Source](https://github.com/reso-lang/reso)

Reso is a resource-oriented programming language for building high-performance web services and APIs.

> **⚠️ Early Development Notice**: Reso is currently under active development. APIs and language features may change significantly in the future and cause breaking changes. Using Reso in production is not recommended at this time.

## About Reso

Reso is a statically typed language that natively supports the definition and use of paths. 
Everything in Reso is treated as a resource with methods that can be accessed via paths, integrating REST-like concepts directly into the language and simplifying API definition.

Unlike conventional OOP languages with long method names, Reso organizes interfaces between runtime components through hierarchical paths — just like an OpenAPI specification. 
Paths consist of parameters and identifiers to identify a resource, making connections and relationships more expressive.

### Key Features & Design Goals

- **Resource-Oriented**: Structure code around resources rather than traditional classes
- **Path-Based Access**: Access resource methods via intuitive paths
- **Memory Safety**: Automatic memory management with garbage collection
- **Cross-Platform**: Target multiple architectures through LLVM
- **Clean Syntax**: Simple, readable syntax design
- **Static Typing**: Compile-time type checking with type inference

## Language Features

### Primitive Types
- Integers: `i8`, `i16`, `i32`, `i64`, `isize` (signed) and `u8`, `u16`, `u32`, `u64`, `usize` (unsigned)
- Floating-point: `f32`, `f64`
- Other: `bool`, `char`

### Resources

Resources are the primary organizational unit, combining data and behavior:
```reso
resource Customer {
    pub const id: i64,
    var userName: String,
    const products: Vector<String>
}:
    path:
        pub def summarize() -> String:
            return this.id.toString().append(": ").append(this.userName)

    path id:
        pub def get() -> i64: return this.id

    path userName:
        pub def get() -> String:
            return this.userName

        pub def set(newName: String):
            this.userName = newName

    path products:
        pub def add(product: String):
            this.products.add(product)

    path products[index: usize]:
        pub def get() -> String:
            return this.products[index].get()
```

Resources can contain:

- Fields (both mutable `var` and immutable `const`)
- Methods
- Path definitions
- Visibility controls (`pub` for public access)

The default visibility for methods and fields is file-private. To expose the members outside the defining file, use the `pub` keyword.

A resource body consists of paths and methods. The paths should contains nouns that represent the resource structure, while methods should contain a single verb that represent actions on the resource.
The path definition can be empty for root-level methods. The methods implicitly have access to the resource instance via `this`.

Resources can be instantiated using a resource initializer. 
The initializer must provide a value for each field and is globally visible unless at least one field is file-private.

```reso
def main() -> i32:
    var customer = Customer {1, "Alice", Vector()}
```

### Variables
Variables are declared using `var` for mutable and `const` for immutable. 
All variables must be initialized upon declaration.
Immutable variables cannot be reassigned after their initial assignment.
The type can be explicitly annotated or inferred by the compiler.
```reso
def main() -> i32:
    # Explicit type annotation
    var counter: i32 = 0
    
    # Type inference
    var message = "Hello"
    
    # Constants
    const pi: f64 = 3.14159
    const maxSize: i32 = 100
```

### Literals

#### Integer Literals
Integer literals are untyped and can be assigned to any compatible integer type. 
The compiler automatically infers the appropriate type based on context or defaults to `i32`.
The compiler throws an error if the literal does not fit into the inferred type.
Integer literals can be specified in decimal, hexadecimal (`0x`), octal (`0o`), or binary (`0b`) formats.
```reso
def main() -> i32:
    # Decimal literals
    var decimal = 42
    var largeDecimal = 1_000_000
    
    # Hexadecimal literals (0x or 0X prefix)
    var hexValue = 0xFF
    var hexLarge = 0x1A_2B_3C
    
    # Binary literals (0b or 0B prefix)  
    var binary = 0b1010_1111
    var binaryByte = 0b11111111
    
    # Octal literals (0o or 0O prefix)
    var octal = 0o755
    var octalLarge = 0o1_777
    
    # Negative integers
    var negative = -123
    var negativeHex = -0xFF
```

#### Floating-Point Literals
Floating-point literals are untyped and can be assigned to `f32` or `f64`.
The compiler infers the type based on context or defaults to `f64`.
Floating-point literals support decimal notation and scientific (exponential) notation.
```reso
def main() -> i32:
    # Basic decimal notation
    var simpleFloat = 3.14
    var withUnderscores = 1_234.567_89
    
    # Scientific notation
    var scientific = 1.23e4        # 12300.0
    var negativeExp = 2.5e-3      # 0.0025
    var capitalE = 6.022E23       # Avogadro's number
    var positiveExp = 1.0e+6      # 1000000.0
    
    # Edge cases
    var justDecimal = .5          # 0.5
    var noFraction = 42.          # 42.0
    var expOnly = 1e10            # 10000000000.0
```  

#### String Literals
String literals are enclosed in double quotes (`"`).
They are immutable, UTF-8 encoded and support escape sequences:
```reso
def main() -> i32:
    # Basic string
    var greeting = "Hello, World!"
    
    # Empty string
    var empty = ""
    
    # Strings with escape sequences
    var withEscapes = "Line 1\nLine 2\tTabbed"
    var quotes = "She said \"Hello\" to me"
    var backslash = "Path: C:\\Users\\Name"
    
    # Unicode escape sequences
    var unicode = "Unicode: \u{1F600} \u{2603}"  # 😀 ☃
    var chinese = "Chinese: \u{4E2D}\u{6587}"    # 中文
```  

Supported escape sequences:
- `\n`: Newline
- `\t`: Tab
- `\r`: Carriage return
- `\b`: Backspace
- `\f`: Form feed
- `\"`: Double quote
- `\'`: Single quote
- `\\`: Backslash
- `\u{XXXX}`: Unicode code point (1-6 hex digits)

#### Character Literals
Character literals are enclosed in single quotes (`'`).
They represent a single Unicode scalar value and support escape sequences.
Internally, characters are stored as unsigned 32-bit integers to support the full Unicode range (0 to 0x10FFFF).
```reso
def main() -> i32:
    # Basic characters
    var letter = 'A'
    var digit = '7'
    var symbol = '@'
    
    # Escape sequences
    var newline = '\n'
    var tab = '\t'
    var quote = '\''
    var backslash = '\\'
    
    # Unicode characters
    var smiley = '\u{1F600}'      # 😀
    var chinese = '\u{4E2D}'      # 中
    var euro = '\u{20AC}'         # €
```  

#### Boolean Literals
Boolean literals are `true` and `false`:
```reso
def main() -> i32:
    var isValid = true
    var isComplete = false
    
    # Used in conditions
    if isValid:
        # do something
```

#### Null Literal
The `null` literal represents the absence of a value:
```reso
def main() -> i32:
    var ptr: String = null  # Nullable type
    if ptr == null:
        ptr = "Initialized"
```

### Type Conversions
Type conversions in Reso are explicit using the `as` operator. 
The language does not perform implicit conversions between different numeric types.
```reso
def main() -> i32:
    # Integer conversions
    var small: i8 = 42
    var large: i64 = small as i64         # Widening conversion
    var back: i16 = large as i16          # Narrowing conversion
    
    # Float conversions
    var float32: f32 = 3.14
    var float64: f64 = float32 as f64     # Precision extension
    
    # Integer-float conversions
    var intVal: i32 = 42
    var asFloat: f64 = intVal as f64      # Convert to float
    var backToInt: i32 = asFloat as i32   # Truncates towards zero
    
    # Char to integer and back
    var charVal: char = 'A'
    var charCode: u32 = charVal as u32    # Unicode code point
    var fromCode: char = charCode as char # Back to char
```

### Arithmetic Operators
Arithmetic operators work on integer and floating-point types with different behaviors depending on the type:
```reso
def main() -> i32:
    # Integer arithmetic
    var a: i32 = 15
    var b: i32 = 4
    
    var sum = a + b           # Addition: 19
    var diff = a - b          # Subtraction: 11  
    var product = a * b       # Multiplication: 60
    var quotient = a div b    # Division: 3 (truncated towards zero)
    var remainder = a rem b   # Remainder: 3 (sign of dividend)
    var modulus = a mod b     # Modulo: 3 (always non-negative)
    
    # Floating-point arithmetic
    var x: f64 = 10.5
    var y: f64 = 3.2
    
    var floatSum = x + y     # 13.7
    var floatDiv = x div y   # 3.28125 (true division)
    var floatRem = x rem y   # 1.1 (floating-point remainder)
    var floatMod = x mod y   # 1.1 (same as rem for positive numbers)
```

### Bitwise Operators
Bitwise operators work on integer types:
```reso
def main() -> i32:
    var a: u8 = 0b1100_1010  # 202
    var b: u8 = 0b1010_1111  # 175
    
    var andResult = a & b    # Bitwise AND: 0b1000_1010 (138)
    var orResult = a | b     # Bitwise OR:  0b1110_1111 (239)
    var xorResult = a ^ b    # Bitwise XOR: 0b0110_0101 (101)
    
    # Shift operations
    var leftShift = a << 2   # Left shift: 0b0010_1000 (808, truncated to 40)
    var rightShift = a >> 2  # Right shift: 0b0011_0010 (50)
    
    # Bitwise NOT (complement)
    var complement = ~a       # 0b0011_0101 (53)
```

### Comparison Operators
Comparison operators return a boolean result.
The `==` and `!=` operators can be used with all types, while ordering operators (`<`, `<=`, `>`, `>=`) are only valid for integer and floating-point types.
```reso
def main() -> i32:
    # Integer comparisons
    var a: i32 = 10
    var b: i32 = 20
    
    var equal = a == b        # false
    var notEqual = a != b     # true  
    var less = a < b          # true
    var lessEqual = a <= b    # true
    var greater = a > b       # false
    var greaterEqual = a >= b # false
    
    # Float comparisons
    var x: f64 = 3.14
    var y: f64 = 2.71
    var floatGreater = x > y  # true
```

### Unary Operators
Unary operators operate on a single operand and include negation (`-`), logical NOT (`not`), and bitwise NOT (`~`):
```reso
def main() -> i32:
    # Arithmetic unary operators
    var positive: i32 = +42   # Identity: 42 (rarely used)
    var negative: i32 = -42   # Negation: -42
    
    var floatNeg: f64 = -3.14159   # Float negation: -3.14159
    
    # Logical NOT (boolean only)
    var flag: bool = true
    var inverted: bool = not flag   # false
    
    # Bitwise NOT (integers only)  
    var byteVal: u8 = 0b1010_1010    # 170
    var complement: u8 = ~byteVal    # 0b0101_0101 (85)
```

### Assignment Operators

#### Simple Assignment
The simple assignment operator `=` assigns the value of the right-hand side expression to the left-hand
side variable:
```reso
def main() -> i32:
    var x: i32 = 10
    x = x + 5  # x is now 15
```

#### Compound Assignment
Compound assignment operators combine an arithmetic or bitwise operation with assignment:
```reso
def main() -> i32:
    var x: i32 = 10
    var bits: u8 = 0b1100_1010
    
    # Arithmetic compound assignments
    x += 5               # x = x + 5 (15)
    x -= 3               # x = x - 3 (12)
    x *= 2               # x = x * 2 (24)
    x div= 4             # x = x div 4 (6)
    x rem= 5             # x = x rem 5 (1)
    x mod= 3             # x = x mod 3 (1)
    
    # Bitwise compound assignments
    bits &= 0b0111_1111  # bits = bits & 0b0111_1111 (clear bit 7)
    bits |= 0b0000_0001  # bits = bits | 0b0000_0001 (set bit 0)
    bits ^= 0b1111_0000  # bits = bits ^ 0b1111_0000 (flip upper 4 bits)
    bits <<= 2           # bits = bits << 2 (shift left by 2)
    bits >>= 1           # bits = bits >> 1 (shift right by 1)
```

### Logical Operators
Logical operators work exclusively on `bool` values and use short-circuit evaluation.
Short-Circuit behavior:
- `and`: If the left operand is `false`, the right operand is not evaluated, and the result is `false`.
- `or`: If the left operand is `true`, the right operand is not evaluated, and the result is `true`.
```reso
def main() -> i32:
    var a: bool = true
    var b: bool = false
    var c: bool = true
    
    # Logical AND with short-circuit evaluation
    var result1: bool = a and b          # false (b is evaluated)
    var result2: bool = b and c          # false (c is NOT evaluated)
    
    # Logical OR with short-circuit evaluation  
    var result3: bool = a or b           # true (b is NOT evaluated)
    var result4: bool = b or c           # true (c is evaluated)
```

### Operators Precedence
Operators have the following precedence, from highest to lowest:
1. Method calls
2. Field access
3. Function calls
4. resource initializers 
5. Type conversion (as)
6. Unary operators (+, -, not, ~)
7. Multiplicative operators (*, div, rem, mod)
8. Additive operators (+, -)
9. Shift operators (<<, >>)
10. Bitwise AND (&)
11. Bitwise XOR (^)
12. Bitwise OR (|)
13. Relational operators (<, >, <=, >=)
14. Equality operators (==, !=)
15. Logical AND (and)
16. Logical OR (or)
17. Ternary operator (if ... else)

### Functions
Functions are defined using the `def` keyword. 
They can have parameters and return types.
If no return type is specified, the function returns the unit type `()`.
The unit type has exactly one value, also written `()`, and is used when no meaningful value is returned.
This value is implicitly returned if the end of the function body is reached without encountering a return statement.

Functions are only visible within the file they are defined in unless marked with the `pub` keyword.
```reso
# Basic function syntax
def functionName(param1: Type1, param2: Type2) -> ReturnType:
    # function body
    return expression

# Examples
def add(a: i32, b: i32) -> i32:
    return a + b

pub def greet(name: String) -> String:
    return "Hello, " + name

def processData():
    # Unit function (no return value)
    var data: i32 = 42
    # Implicit return
    
# Internally this is equivalent to:
def processData() -> ():
    var data: i32 = 42
    return ()
```

**Main Function:**
The main function is the program entry point and has special requirements:
```reso
# Required signature for main
def main() -> i32:
    # Program entry point
    return 0  # Exit code

# Main function requirements:
# - Must be named 'main'
# - Returns an i32 exit code (implicitly 0)
# - Cannot have parameters
# - Must have an i32 return type
```

### Control Flow

#### If-else statements:
```reso
def controlFlow(x: i32) -> i32:
    if x > 10:
        return x * 2
    else if x > 5:
        return x + 1
    else:
        return x
    
    # Ternary expressions
    return x if x > 0 else -x
```

#### Loops:
```reso
def loops() -> i32:
    var i: i32 = 0
    var sum: i32 = 0
    
    while i < 10:
        sum = sum + i
        i = i + 1
        
        if i == 5:
            continue  # Skip to next iteration
        
        if sum > 20:
            break     # Exit loop
    
    return sum
```

## Builtin Types and Functions

### Vector<T>
Vector<T> is a dynamic container that can grow and shrink in size.
It provides methods for adding, removing, and accessing elements.

- `add(value: T)`: Adds an element to the end of the vector.
- `insert(index: usize, value: T)`: Inserts an element at the specified index.
- `remove(index: usize) -> T`: Removes and returns the element at the specified index.
- `[index: usize].get() -> T`: Returns the element at the specified index.
- `[index: usize].set(value: T)`: Sets the element at the specified index.
- `/size.get() -> usize`: Returns the current number of elements in the vector.
- `/capacity.get() -> usize`: Returns the current allocated capacity of the vector.

```reso
def main() -> i32:
    # Create vectors with explicit type
    var numbers: Vector<i32> = Vector()
    var chars: Vector<char> = Vector()
    
    # Add elements
    numbers.add(42)
    numbers.add(13)
    numbers.add(7)
    
    # Access elements
    var first: i32 = numbers[0].get()    # Get first element
    numbers[1].set(99)                   # Set second element
    
    # Insert and remove
    numbers.insert(1, 55)                 # Insert 55 at index 1
    var removed: i32 = numbers.remove(2)  # Remove element at index 2
    
    # Size and capacity
    var size: u64 = numbers/size.get()
    var capacity: u64 = numbers/capacity.get()
```

### String
String represents UTF-8 encoded text data.

- `append(other: String) -> String`: Concatenates another string and returns a new string.
- `contains(substr: String) -> bool`: Checks if the string contains the specified substring.
- `startsWith(prefix: String) -> bool`: Checks if the string starts with the specified prefix.
- `endsWith(suffix: String) -> bool`: Checks if the string ends with the
- `replace(old: String, new: String) -> String`: Replaces occurrences of a substring with another substring and returns a new string.
- `isEmpty() -> bool`: Checks if the string is empty.
- `/chars.get() -> Vector<char>`: Returns a vector of characters in the string.
- `/chars/size.get() -> usize`: Returns the number of characters in the string.
- `/chars[index: usize].get() -> char`: Returns the character at the specified index.
- `/bytes.get() -> Vector<u8>`: Returns a vector of bytes in the string.
- `/bytes/size.get() -> usize`: Returns the number of bytes in the string.
- `/bytes[index: usize].get() -> u8`: Returns the byte at the specified index.
- `/substring.get(start: usize, end: usize) -> String`: Returns a substring starting at the specified index and ending before the specified index.

Every primitive type has a `toString()` method to convert the value to a string representation.
Furthermore, the `print()` and `println()` functions can be used to output a String to the console.

## Prerequisites

### Linux (Ubuntu/Debian)

#### JDK

Building and running the reso compiler requires Java 25.
Download the JDK from [Adoptium](https://adoptium.net/temurin/releases).

Check the installation:
```bash
javac --version
```

#### Clang
Install LLVM/Clang version 20:
```bash
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 20
clang-20 --version
```

#### Boehm Garbage Collector
Install the Boehm GC:
```bash
sudo apt install libgc-dev
```

### Windows

#### JDK
Building and running the reso compiler requires Java 25.

Download the JDK from [Adoptium](https://adoptium.net/temurin/releases) und set the JAVA_HOME environment variable to the downloaded JDK.

Check the installation:
```bash
javac --version
```

#### Clang
Download the LLVM installer version 20.1.7 or newer on [GitHub](https://github.com/llvm/llvm-project/releases).
Execute the installer and choose "Add LLVM to the system PATH".

Check the clang version:
```bash
clang --version
```

#### Boehm Garbage Collector

Install vcpkg
```bash
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
.\bootstrap-vcpkg.bat
.\vcpkg integrate install
```

Install boehm-gc
```bash
.\vcpkg install bdwgc
```

Add gc.dll to the output folder where the .ll files are located:
```bash
copy <vcpkg-root>\installed\x64-windows\bin\gc.dll <output-folder>
```

## Commands for the Reso Compiler

### Generate ANTLR Parser
Generates lexer, parser, and visitor classes from the ANTLR grammar files:
```bash
./gradlew generateGrammarSource
```

### Compile the Project
```bash
./gradlew compileJava
```

### Run Tests
Executes all unit tests across all modules:
```bash
./gradlew test
```

### Build the Project
Compiles all source code, runs tests, and creates JAR files:
```bash
./gradlew build
```

### Run with Default Example
Executes the compiler with the default example file (examples/HelloWorld.reso):
```bash
./gradlew run
```

### Run with Custom Source Files
Compile your own Reso source files:
```bash
# Single file
./gradlew run --args="path/to/your/File.reso"

# Multiple files
./gradlew run --args="File1.reso File2.reso File3.reso"

# With output file specification
./gradlew run --args="main.reso -o output/Output.ll"

# With optimization enabled
./gradlew run --args="Main.reso -O2 -o Optimized.ll"
```

### Display Help
```bash
Show all available compiler options:
./gradlew run --args="-h"
```

### Execute on Windows:
```bash
clang <input>.ll -o <output>.exe -L <vcpkg-root>\installed\x64-windows\lib -lgc
.\<output>.exe
echo $LASTEXITCODE
```

### Execute on Linux:
```bash
clang-20 <input>.ll -o <output> -lgc
./<output>
echo $?
```

## Limitations

The Reso programming language is currently in development and has the following limitations:

- **No Generics**: Generic types and functions are not yet supported
- **No Exception Handling**: Try-catch blocks and exception throwing mechanisms are not implemented
- **No Module System**: Import/export mechanisms and package management are not available
- **No Standard Library**: Built-in functions and data structures are minimal
- **No Concurrency**: Threading, async/await, and parallel execution are not supported