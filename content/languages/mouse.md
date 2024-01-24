title=Mouse
tags=language
summary=A small computer programming language developed by Dr. Peter Grogono in the late 1970s and early 1980s; originally intended as a small, efficient language for microcomputer systems with limited memory; illustrates some of the concepts involved in creating a simple interpreter for a programming language.
~~~~~~

[Website](http://mouse.davidgsimpson.com/index.html) | [Wikipedia](https://en.wikipedia.org/wiki/Mouse_(programming_language))

There are three dialects of Mouse described here:

* Mouse-79 - The original dialect described in Byte Magazine in 1979.
* Mouse-83 - The version described in Grogono's 1983 book, Mouse: A Language for Microcomputers. This version has some different syntax than the 1979 version, but the language is otherwise very similar.
* Mouse-2002 - This is a new version I've recently developed. It's based on Mouse-83, and includes numerous extensions: floating-point support, arrays, file I/O, etc.

## Examples
This short program prints 'Hello world.'

```
"Hello world."
$
```

This program displays the squares of the integers from 1 to 10.

```
1 N:              ~ initialize N to 1
( N. N. * ! " "   ~ begin loop; print squares of numbers
  N. 10 - 0 < ^   ~ exit loop if N >= 10
  N. 1 + N: ) $   ~ increment N and repeat loop
```

