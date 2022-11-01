title=Dictu
tags=language, dynamic
summary=A high-level dynamically typed, multi-paradigm, interpreted programming language.
~~~~~~

[Website](https://dictu-lang.com/) | [Source](https://github.com/dictu-lang/Dictu)

Dictu is a high-level dynamically typed, multi-paradigm, interpreted programming language. Dictu has a very familiar C-style syntax along with taking inspiration from the family of languages surrounding it, such as Python and JavaScript.

```
import System;

const guess = 10;

while {
    const userInput = input("Input your guess: ").toNumber().unwrap();
    if (userInput == guess) {
        print("Well done!");
        break;
    } else if (userInput < guess) {
        print("Too low!");
    } else {
        print("Too high!");
    }

    System.sleep(1);
}
```

