title=Odin
tags=language
summary=Designed with the intent of creating an alternative to C around simplicity, high performance, built for modern systems, and joy of programming.
~~~~~~

[Website](https://odin-lang.org/) | [Source](https://github.com/odin-lang/Odin)

### Examples:
```
package main

import "core:fmt"

main :: proc() {
	program := "+ + * 😃 - /";
	accumulator := 0;

	for token in program {
		switch token {
		case '+': accumulator += 1;
		case '-': accumulator -= 1;
		case '*': accumulator *= 2;
		case '/': accumulator /= 2;
		case '😃': accumulator *= accumulator;
		case: // Ignore everything else
		}
	}

	fmt.printf("The program \"%s\" calculates the value %d\n",
	           program, accumulator);
}
```
