title=Onyx
tags=language, wasm, procedural
summary=A data-oriented, procedural programming language, compiling solely to WebAssembly.
~~~~~~

[Website](https://onyxlang.io/) | [Source](https://github.com/onyx-lang/onyx)

## Syntax

Modern syntax
```
use core { printf, iter }

main :: () {
    for i in 1 .. 10 {
        fact := factorial(i)
        printf("{}! = {}\n", i, fact)
    }
}

factorial :: (n: i32) -> i32 {
    return iter.as_iter(1 .. n)
        |> iter.fold(1, (x, y) => x * y)
}
```

Type Safety
```
use core { printf }

main :: () {
    // Inferred variable type
    x := 10

    // Function with entirely inferred types.
    change_value :: x => x + 10

    // Onyx figures out the types of
    // `change_value` when you call it.
    printf("Value: {}.\n", change_value(x))
}
```

## Getting Started

### Install Onyx
On any Linux, MacOS, or WSL system, run the following command to install Onyx onto your system.

`sh <(curl https://get.onyxlang.io -sSfL)`

For more details, or how to install on Windows, see the installation docs.

### Create an Onyx project
This is an optional step, but does set you up to use packages in your project. Learn more about the package manager here.

Create a new directory and setup a new project. Optionally project values when prompted.

```
$ mkdir my-onyx-project
$ cd my-onyx-project
$ onyx package init

Creating new project manifest in ./onyx-pkg.kdl.

Package name: my-onyx-project
Package description: My first Onyx project
Package url: 
Package author: Brendan Hansen
Package version (0.0.1):
```

### Write your first Onyx program
Open your favorite text editor, optionally install editor support, and create a new file called main.onyx in this project folder. Write the following code in that file.

```
use core {printf}

main :: () {
    printf("Hello, Onyx!\n");
}
```

This code brings in the printf symbol from the core libraries so we can print to the console. Then in the main function, we print "Hello, Onyx!".

### Run your program!
To run our newly created program, we use the following command from within the project folder.

```
$ onyx run main.onyx
Hello, Onyx!
```

Congratulations! You just wrote your first Onyx program.

Now you can read the docs and experiment with Onyx in this project.

## Examples
This example reads a single line of input from standard input, splits it in half on the first space using string.bisect, converts both parts to integers using conv.parse, then prints the results using printf for formatted printing.

```
// Use the necessary core libraries
use core.io { Reader }
use core.conv

// Use the printf function that lives in the core package.
// This cannot be `use core.printf`, because that will look
// for a package called `printf` in `core`.
use core {
    printf, stdio
}

main :: () {
    // Create a io.Reader over the stdio.stream to be able scan
    // the input in parts. Also, defer freeing the reader until
    // the end of `main`.
    stdin_reader := Reader.make(&stdio.stream)
    defer Reader.free(&stdin_reader)

    // Read a single line of input.
    line := stdin_reader->read_line()

    // Split the line on the first space.
    a_str, b_str := line->bisect(" ")

    // Parse and convert both parts to i32s, with a default value
    // of 0 if it fails to parse as an i32.
    a_value := conv.parse(i32, a_str)->value_or(0)
    b_value := conv.parse(i32, b_str)->value_or(0)

    // Compute our result.
    result := a_value + b_value

    // Output our result using formatted printing.
    printf("{} + {} = {}\n", a_value, b_value, result)
}
```

This example shows various ways of reading and writing to a file. The core idea behind files in Onyx is that they extend the io.Stream structure, so you can use the core.io package to interact with them.

```
use core.os
use core.io
use core.string
use core {
    printf
}

#doc "Writes example text into a file."
write_data_into_file :: (filename: str) {
    // This is one way of opening a file: call os.open and then os.close later.
    // os.open returns a Result(os.File, os.FileError), so it must be handled
    // to use the os.File. This program opts to unwrap the result.
    file := os.open(filename, .Write)->unwrap()
    defer os.close(&file)

    // Create an io.Writer over the file stream using io.writer_make.
    // Also, free it later by defering io.writer_free. This also flushes
    // the internal buffer of io.Writer to make sure everything is written
    // to the file.
    file_writer := io.Writer.make(&file)
    defer io.Writer.free(&file_writer)

    // The simplest way of writing a string to the file.
    file_writer->write("This is the first line of text.\n")

    // io.write_format can be used to "printf" into a file.
    // printf can be thought of as io.write_format(&stdio.stream, ...).
    file_writer->write_format("This is a {} line of text.\n", "formatted")

    for i in 0 .. 5 {
        file_writer->write_format("Another line numbered {}.\n", i)
    }
}

#doc "Reads example text from a file."
read_whole_file :: (filename: str) {
    // This is the simplest way to get the entire content of a file
    // into a string ([] u8). Also, defer "deleting" the string, which
    // will free the memory allocated for the string.
    contents := os.get_contents(filename)
    defer delete(&contents)

    printf("Whole contents:\n{}\n", contents)
}

main :: () {
    filename := "test.txt"

    write_data_into_file(filename)
    read_whole_file(filename)
}
```

