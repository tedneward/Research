title=Icon (and Unicon)
tags=language, object
summary=Icon is a high-level, general-purpose programming language novel features including string scanning and goal-directed evaluation. Unicon is Icon with portable, platform-independent access to hardware and software features that have become ubiquitous in modern applications development, such as objects, networks, and databases. 
~~~~~~

# Icon

[Website](https://www2.cs.arizona.edu/icon/) | [Source](https://github.com/gtownsend/icon) | [Language Reference](https://www2.cs.arizona.edu/icon/refernce/ref.htm)

## Reading

### Introduction
> It is interesting to compare Icon and Unicon with the competition. Mainstream programming languages such as C, C++, and Java, like the assembler languages that were mainstream before them, are ideal tools for writing all sorts of programs, so long as vast amounts of programmer time are available. Throwing more programmers at a big project does not work well, and programmers are getting more expensive while computing resources continue to become cheaper. These pressures inexorably lead to the use of higher-level languages and the development of better design and development methods. Such human changes are incredibly slow compared to technological changes, but they are visibly occurring nevertheless. Today, the most productive programmers are using extra CPU cycles and memory to reduce the time it takes to develop useful programs.

> There is a subcategory of mainstream languages, marketed as rapid application development languages, whose stated goals seem to address this phenomenon. Languages such as Visual Basic or PowerBuilder provide graphical interface builders and integrated database connectivity, giving productivity increases in the domain of data entry and presentation. The value added in these products are in their programming environments, not their languages. The integrated development environments and tools provided with these languages are to be acclaimed and emulated, but they do not provide productivity gains that are equally relevant to all application domains. They are only a partial solution to the needs of complex applications.

> Icon is designed to be easier and faster to program than mainstream languages. The value it adds is in the expressive power of the language itself, in the category of very high level languages that includes Lisp, APL, Smalltalk, REXX, Perl, Tcl, Python, and Ruby; there are many others. Very high-level languages can be subdivided into scripting languages and applications languages. Scripting languages often glue programs together from disparate sources. They are typically strong in areas such as multilingual interfacing and system interactions, while suffering from weaker expression semantics, typing, scope rules, and control structures than their applications-oriented cousins. Applications languages typically originate within a particular application domain and support that domain with special syntax, control structures, and data types. Since scripting is an application domain, scripting languages are just one prominent subcategory of very high-level languages.

> Icon is an applications language with roots in text processing and linguistics. Icon programs tend to be more readable than similar programs written in other very high-level languages, making Icon well-suited to the aims of literate programming. For example, Icon was used to implement Norman Ramsey's literate programming tool noweb (Ramsey, 1994). Literate programming is the practice of writing programs and their supporting textual description together in a single document.

> Unicon makes the core contributions of Icon useful for a broader range of applications: Programmer time must be minimized; Maintainable, concise source code is desired; The program includes complex data structures or experimental algorithms; The program involves a mixture of text processing and analysis, custom graphics, data manipulation, network or file system operations; The program must run on several operating systems and have a nearly identical graphical user interface with little or no source code differences. 

> Unicon is not the last word in programming. You probably should not use Unicon if your program has one or more of the following requirements: The fastest possible performance is needed; The program has hard real-time constraints; The program must perform low-level or platform-specific interactions with the hardware or operating system.

### Books
["The Icon Programming Language"](https://www2.cs.arizona.edu/icon/ftp/doc/lb1up.pdf) | ["Graphics Programming in Icon"](http://www2.cs.arizona.edu/icon/ftp/doc/gb1up.pdf) | ["Icon Programming for Humanists"](http://unicon.org/books/humanist.pdf) | ["The Implementation of the Icon Programming Language"](https://www2.cs.arizona.edu/icon/ftp/doc/ib1up.pdf)

#### [From:](https://www2.cs.arizona.edu/icon/intro.htm)
Icon is a very high-level imperative language with a rich repertoire of string and structure processing facilities. It is available on a wide range of computers and is in wide use.

In Icon, values, not variables, are typed. Built-in data types include numerics, character sets, strings, sets, lists, associative tables, records, and procedures. The aggregate types - sets, lists, tables, and records - can hold values of any type. Tables can be indexed by values of any type. Numerics, character sets, and strings are atomic values; operations on them produce new values. Aggregates use pointer semantics; operations on them can change existing values as well as produce new ones. Strings and aggregates can be of arbitrary size, and their sizes can change during execution. Memory management is automatic.

Icon has an expression-oriented syntax; even control structures are expressions. Procedures consist of zero or more expressions separated by newlines or semicolons. Icon programs consist of one or more procedure definitions, and execution begins by calling the procedure named main.

Expressions can produce zero or more values. As in traditional languages, many Icon expressions produce a single value, for example, x+5 produces the sum of x and 5. Other expressions can produce more than one value, for example, x | 5 produces x then, if necessary, produces 5. Such expressions are called generators; there are several built-in generators and procedures can be written to be generators. Other examples of built-in generators include x to y, which generates the integers from x to y, and !x, which generates all the characters from string x or the elements from aggregate x.

A `goal-directed' expression evaluation mechanism is Icon's most distinguishing characteristic. Expression evaluation seeks `success' - at least one value for an expression. An expression `fails' if it does not produce a value. The evaluation mechanism tries all combinations of values from generators in pursuit of a successful outcome. For example, y < (x | 5) first compares y to x. If y is less than x, evaluation succeeds and produces the value x. If y is not less than x, y is compared to 5, the next value generated by the subexpression x | 5. If y is less than 5, evaluation succeeds and produces 5. Otherwise, evaluation fails, and no value is produced. Comparison operators produce the value of their right operand if they succeed.

Failure drives control expressions and inhibits subsequent evaluation. For example, max := max < x sets max to x only when it is less than x. Likewise,

```
if y < (x | 5) then write("y=", y)
```

prints the value of y only if it is less than x or 5. The evaluation mechanism pervades Icon; for example, procedures are called only if all of their arguments succeed, so the last example could be written more succinctly as

```
write("y=", (x | 5) > y)
```

The backtracking implied by the goal-directed evaluation mechanism is limited to the expression in which it occurs. For example, in

```
max := max < x
write("y=", (x | 5) > y)
```

failure in the second expression does not affect the outcome of the first.

The expression every e1 do e2 `drives' e1 - it evaluates e2 for every successful outcome of e1. So, if p is a list of 100 elements,

```
every i := (1 to 10) | (91 to 100) do write(p[i])
```

prints the first and last ten elements of p. The do clause is optional, and the evaluation mechanism often helps eliminate temporary variables like i, for example,

```
every write(p[(1 to 10) | (91 to 100)])
```

also prints the first and last ten elements of p, and

```
every !p := 0
```

sets each element of p to zero.

Icon has numerous built-in procedures and operators that help analyze strings. Many of these take strings and positions as operands and return strings or positions. Positions denote locations between characters. Strings can be analyzed by manipulating positions explicitly, but Icon's string scanning facility eliminates the need for most explicit positions. The expression s ? e establishes s as the subject to which string processing operations in e apply. The expression e typically includes string analysis operations, but may include any operation. An example of a string analysis operation is find(s), which produces the positions in the subject at which s occurs as a substring. For instance, if line is

```
"a fish is a fish is a fish"
```

then

```
every line ? write(find("fish"))
```

prints 3, 13, and 23.

Another example is move(i), which advances the position by i characters. If the advancement is successful, move returns the i-character substring between the initial and final positions. For example,

```
t := ""
line ? while t := t || move(1) || "."
```

sets t to a string containing the characters of line followed by periods; || denotes string concatenation. while evaluates t := t || move(1) || "." repeatedly until it fails, which occurs when move(1) is invoked at the end of the subject string.

move is a matching function because it returns the substring of the subject that is `matched' as a result of changing the position. Another matching function is tab(i), which moves to position i in the subject and returns the substring between the old and new positions.

upto(s) returns the position of any of the characters in s, and many(s) returns the position following the longest possible substring containing only characters in s starting at the current position. It is important to note that functions like many return positions, but the specific values of those positions are rarely important. Positions are used most often as arguments to matching functions like tab. For example, the following function generates the `words' in its argument.

```
procedure getword(str)
	str ? while tab(upto(&letters)) do {
		word := tab(many(&letters))
		suspend word
	}
end
```

`&letters` contains all of the upper- and lowercase letters. The expression tab(upto(&letters)) advances the position up to the next letter, and tab(many(&letters)) matches the word and assigns it to word. suspend is like return, but suspends the invocation so that it can be resumed for alternate values, if necessary. When the invocation is resumed, it continues where the suspend left off, so subsequent resumptions return the remaining words. The while terminates when tab(upto(&letters)) fails because there are no more words in str.

An example of using getword is `common words,' a program that lists the most commonly used words in its input and their frequencies of occurrence. The line numbers are for explanatory purposes and are not part of the program.

```
procedure main(args)
	k := integer(args[1]) | 10
	words := table(0)
	while line := read() do every words[getword(line)] +:= 1
	words := sort(words, 4)
	every 1 to k do write(pull(words), "\n", pull(words))
end
```

This program prints the k most commonly used words. Line 2 sets k to the command-line argument, if there is one and it is a legal integer, or to 10. Line 3 assigns an associative table to words; the argument to table specifies each entry's initial value. This table accumulates the frequency counts. Line 4 reads in lines and uses getword to generate the words in each line, which index words. The operator +:= increments its left operand. sort(words, 4) in line 5 returns the contents of the table words in a list sorted in increasing order by the frequency counts. Indices and their count values alternate in this list, which is assigned to words. Line 6 prints the counts and words for the k most frequently used words by pulling them off the end of the list, which also shortens the list. pull fails when the list is empty, in case there are not k words.

---

# Unicon

[Website](http://unicon.org/) | [Source](https://github.com/uniconproject/unicon) | Source: `git clone git://git.code.sf.net/p/unicon/unicon`

["Programming in Unicon"](http://unicon.org/book/ub.pdf) | ["The Implementation of Icon and Unicon: a Compendium"](http://unicon.org/book/ib-nightly.pdf)

