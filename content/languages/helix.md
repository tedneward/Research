title=Helix
tags=language, native
summary=A high-performance general-purpose language that seamlessly integrates with C++, Rust, and Python.
~~~~~~

[Website](https://www.helix-lang.com/) | [Source](https://github.com/helixlang/helix-lang)

#### Example Code: Current Helix (C++ Backend)

While we're working on the standard library, here's an example of what works right now:

```
ffi "c++" import "iostream";

fn main() -> i32 {
    let name: string;

    std::cout << "What is your name? ";
    std::cin >> name;

    std::cout << "Hello, " << name << "!";

    return 0;
}
```

Currently, Helix supports C++ includes, essentially making it a C++ re-skin for now.

#### More Complex Example: Matrix and Point Classes
Here's a more advanced example with matrix operations and specialization for points:

```
import std::io;
import std::memory;
import std::libc;

#[impl(Arithmetic)] // Procedural macro, not inheritance
class Point {
    let x: i32;
    let y: i32;
}

class Matrix requires <T> if Arithmetic in T {
    priv {
        let rows: i32;
        let cols: i32;
        let data: unsafe *T;
    }

    fn Matrix(self, r: i32, c: i32) {
        self.rows = r;
        self.cols = c;
         = std::libc::malloc((self.rows * self.cols) * sizeof(T)) as unsafe *T;
    }

    op + fn add(self, other: &Matrix::<T>) -> Matrix::<T> { // rust like turbofish syntax is only temporary and will be remoevd in the self hosted compiler
        let result = Matrix::<T>(self.rows, self.cols);
        for (let i: i32 = 0; i < self.rows * self.cols; ++i):
            ...
        return result;
    }

    fn print(self) {
        for i in range(self.rows) {
            for j in range(self.cols) {
                ::print(f"({self(i, j)}) ");
            }
        }
    }
}

extend Matrix for Point { // Specialization for Matrix<Point>
    op + fn add(const other: &Matrix::<Point>) -> Matrix::<Point> {
        ...
    }

    fn print() {
        ...
    }
}

fn main() -> i32 {
    let intMatrix = Matrix::<i32>(2, 2); // Matrix of i32s
    intMatrix(0, 0) = 1;
    intMatrix(0, 1) = 2;
    intMatrix.print();

    let pointMatrix = Matrix::<Point>(2, 2); // Specialized Matrix for Point
    pointMatrix(0, 0) = Point{x=1, y=2};
    pointMatrix(0, 1) = Point{x=3, y=4};
    pointMatrix.print();

    let intMatrix2 = Matrix::<i32>(2, 2); // Another Matrix of i32s
    intMatrix2(0, 0) = 2;
    intMatrix2(0, 1) = 3;

    let intMatrixSum = intMatrix + intMatrix2;
    intMatrixSum.print();

    return 0;
}
```
