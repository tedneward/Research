title=Pipelines
tags=language, python
summary=An experimental programming language for data flow.
~~~~~~

[Source](https://github.com/calebwin/pipelines)

Example: Fizzbuzz:
```
from fizzbuzz import numbers
from fizzbuzz import even
from fizzbuzz import fizzbuzz
from fizzbuzz import printer

numbers
/> even 
|> fizzbuzz where (number=*, fizz="Fizz", buzz="Buzz")
|> printer
```
where the implementation of the components would be written in Python:
```
def numbers():
    for number in range(1, 100):
        yield number

def even(number):
    return number % 2 == 0

def fizzbuzz(number, fizz, buzz):
    if number % 15 == 0: return fizz + buzz
    elif number % 3 == 0: return fizz
    elif number % 5 == 0: return buzz
    else: return number

def printer(number):
    print(number)
```
