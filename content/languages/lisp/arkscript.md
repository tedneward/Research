title=ArkScript
tags=language, functional, vm
summary=A small, fast, functional and scripting language for C++ projects.
~~~~~~

[Website](https://arkscript-lang.github.io/) | [Source](https://github.com/ArkScript-lang/Ark)

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
