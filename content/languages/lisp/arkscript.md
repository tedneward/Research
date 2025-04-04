title=ArkScript
tags=language, functional, vm, native
summary=A small, fast, functional and scripting language for C++ projects.
~~~~~~

[Website](https://arkscript-lang.dev/) | [Source](https://github.com/ArkScript-lang/Ark)

ArkScript is

* small: the core fit under 8000 lines of code ; also small in terms of keywords (only 9)
* a scripting language: very easy to embed it in your projects. Registering your own functions in the language is made easy
* portable: a unique bytecode which can be run everywhere the virtual machine is
* a functional language: every parameter is passed by value, everything is immutable unless specified
* powerful: provides closures and explicit capture
* promoting functionalities before performances: expressiveness often brings more productivity, though performances aren't left behind
* a Lisp inspired language, with fewer parentheses: [...] is expanded to (list ...) and {} to (begin ...)
* extensible: supports C++ module to use it in the language, adding functionalities

Example: More-or-less game:
```
# more or less game
(print "More or less game!")

(import "random.arkm")
(import "Math/Arithmetic.ark")

(let number (mod (abs (random)) 10000))
(print number)
(mut value 0)
(mut tries 0)

(mut continue true)

(while continue {
    (set value (toNumber (input "Input a numeric value: ")))

    (if (< value number)
        # then
        (print "More!")
        # else
        (if (= value number)
            # then
            { (print "Bingo!") (set continue false) }
            # else
            (print "Less!")))

    (set tries (+ 1 tries))})

(print "You won in" tries "tries")
```

* [Implementing an IR for ArkScript](https://lexp.lt/posts/implementing_an_intermediate_representation/)

Embedding in C++
```
#include <Ark/Ark.hpp>
 
int main()
{
    // A state can be shared by multiple VM ; they can't overwrite it
    Ark::State state;
 
    // This will compile the code, but you can also give a file with state.doFile()
    state.doString("(let foo (fun (x y) (+ x y 2)))");
    // You can register C++ function (only before calling vm.run())
    state.loadFunction("cpp_foo", [](std::vector<Ark::Value>& args, Ark::VM* vm) {
        return Ark::Value(static_cast<int>(args.size()));
    });
 
    Ark::VM vm(state);
    vm.run();
 
    auto value = vm.call("foo", 5, 6.0);
    // displays 13
    std::cout << value << "\n";
 
    return 0;
}
```
