title=LDPL
tags=language, native
summary=A free, powerful, compiled, open-source programming language designed from the ground up to be excessively expressive, readable, fast and easy to learn.
~~~~~~

[Website](https://www.ldpl-lang.org/) | [Source](https://github.com/lartu/ldpl) | [Docs](https://docs.ldpl-lang.org/)

Transpiles to C++ (?).

### Philosophies
LDPL (LDPL, the Dinosaur Programming Language) is a language designed to be easy to understand and simple to write. Designed to be easy to learn and simple to use. We believe that coding should be easy and simple. Nothing should become a frustrating chore. Compiling source code should be easy and simple: a single, flagless command should be enough to compile any source code. Every statement in the language should do one and one thing only, not multiple things depending on the context. Complex, low level stuff like encoding, sockets, floating point number comparison, etc., should be dealt by the compiler, transparently to the user. Hard stuff should be made easier.

We understand that this philosophy may lead to longer source code, more verbose statements and extra steps to reach an end, but we also believe that it should make coding in LDPL easier and more enjoyable than in other languages.

As one user once put it, "Usually when I'm programming, I feel like I'm in a big fancy jet and there's a lot of turbulence and it's not going well but then all of a sudden it's smooth air again and the drink cart comes along and I get a ginger ale and it's great. But with LDPL, I feel like I'm a cub scout out in the woods with a box of matches and a hatchet and my Scout's Handbook (the LDPL Docs) just exploring and figuring it out as I go. Whenever I run into a problem I just check my handbook and, sure enough, there's a solution right there waiting for me!".

We want to make LDPL a language you'll love not because it lets you do many things in one line, nor because of the way it runs, nor because of how modern it is: but because it's designed to stay by your side and tell you everything's gonna be okay even when times get dark.

### Quick intro

```
# This is a single line comment in LDPL.
# LDPL doesn't have multi-line comments.

# LDPL is a case-insensitive language: dIsPlaY and DISPLAY are the same
# statement, and foo and FOO name the same variable.

# An LDPL source file is divided in two sections, the DATA section and
# the PROCEDURE section.

DATA:
# Within the DATA section, variables are declared.

myNumber is number          # Defines a real number.
myString is text            # Defines a string.
myList is number list       # Defines a list of numbers.
myMap  is number map        # Defines a map of numbers.

# LDPL understands four data types: two scalar types (NUMBER, TEXT)
# and two container types (LISTs and MAPs).
# LISTs can be TEXT LISTs or NUMBER LISTs, while MAPs can be
# TEXT MAPs and NUMBER MAPs. You can also chain many containers
# to create larger data types:
textListList is text list list
myMulticontainer is number list list map 
# Defines a map of lists of lists of numbers.

PROCEDURE:
# Within the PROCEDURE section, your code is written.

store -19.2 in myNumber         # Use the STORE statement to assign values
store "Hi there" in myString    # to variables.
push 890 to myList # Use PUSH - TO to append values to lists.
push 100 to myList
push 500 to myList
store 45 in myMap:"someIndex" # Use the : operator to index containers.

push list to textListList # Push an empty list into a list of lists.
push "LDPL is nice!" to textListList:0 #Push text to the pushed list.

display "Hello World!" # Use the DISPLAY statement to print values.
# The display statement can receive multiple values separated by spaces.
display crlf "How are you today?" myNumber myString crlf
# CRLF is the standard line break value in LDPL.
display textListList:0:0 " Isn't it?" crlf

# IF statements in LDPL are extremely verbose:
if myNumber is equal to -19.2 and myList:0 is less than 900 then
    display "Yes!" crlf
else if myMap:"someIndex" is not equal to 45 then
    display "This is an else if!" crlf
else
    display "Else!" crlf
end if
# Valid LDPL comparisson operators are
# - IS EQUAL TO
# - IS NOT EQUAL TO
# - IS LESS THAN
# - IS GREATER THAN
# - IS LESS THAN OR EQUAL TO
# - IS GREATER THAN OR EQUAL TO
if "Hi there!" is not equal to "Bye bye!" then
    display "Yep, those weren't equal." crlf
end if
# LDPL normally doesn't understand inline expressions, so you
# cannot do stuff like:
# if myNumber - 9 * 2 is equal to 10 then
# LDPL will set your computer on fire and burst your screen if you do so.

# WHILE loops follow the same rules
store 0 in myNumber
while myNumber is less than 10 do
    display "Loop number " myNumber "..." crlf
    in myNumber solve myNumber + 1 # You can do math like this.
repeat
# You can use 'break' and 'continue' inside loops just like any other language.

# LDPL also has FOR loops and FOR EACH loops
for myNumber from 0 to 100 step 2 do
    display myNumber crlf
repeat

for each myNumber in myList do
    display myNumber
repeat

display "Enter your name: "
accept myString # Use ACCEPT to let the user input values.
display "Hi there, " myString crlf
display "How old are you?: "
accept myNumber
if myNumber is greater than 200 then
    display "Woah, you are so old!" crlf
end if

wait 1000 milliseconds # Pause the program for a whole second.

# Let's do some math
store 1.2 in myNumber
in myNumber solve myNumber * (10 / 7.2) # Operators are separated by spaces.
floor myNumber
display myNumber crlf
get random in myNumber # get a random number between 0 and 1 
                       # and store it in myNumber

# Functions in LDPL are called sub-procedures. Sub-procedures, like source
# files, are divided in sections. The sections found in sub-procedures are
# the PARAMETERS section, the LOCAL DATA section and the PROCEDURE section.
# All sections except the PROCEDURE section can be skipped if they aren't
# used. If no PARAMTERS nor LOCAL DATA sections are used, the PROCEDURE
# keyword may be omited.
sub myFunction
    parameters:
        a is number # LDPL is pass by reference
        b is number
        result is number # Thus you can return values through a parameter.
    local data:
        c is number
    procedure:
        get random in c
        in result solve a + b * c
end sub

sub sayHello
    display "Hi there!" crlf
    return
    display "This won't be displayed :("
end sub

call myFunction with 1 2 myNumber
display myNumber crlf
call sayHello
call sayBye # sub-procedures may be called before they are declared

sub sayBye
    display "Bye!"
end sub

# One of the greatest features of LDPL is the ability to create your
# own statements.

create statement "say hi" executing sayHello
say hi

create statement "random add $ and $ in $" executing myFunction
random add 1 and 2 in myNumber
display myNumber crlf

exit
```

