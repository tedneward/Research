title=Awk
tags=tool, language, gnu
summary=Tool for text processing and manipulation.
~~~~~~

[Website: GNU awk](https://www.gnu.org/software/gawk/manual/gawk.html) | [Source]() | [GNU Awk User's Guide](https://www-zeuthen.desy.de/dv/documentation/unixguide/infohtml/gawk/gawk.html)

* [AWK cheatsheet](https://gist.github.com/Rafe/3102414)
* [An Awk Primer](https://en.wikibooks.org/wiki/An_Awk_Primer) - Wikibooks
* [Awk](https://www.grymoire.com/Unix/Awk.html) - Bruce Barnett
* [GNU awk](https://learnbyexample.github.io/learn_gnuawk/) - Sundeep Agarwal
* [AWKA](https://awka.sourceforge.net/index.html) - Awka is an open-source implementation. Awka is not an interpreter like Gawk, Mawk or Nawk, but instead it converts the program to ANSI-C, then compiles this using gcc or a native C compiler to create a binary executable. This means you must have an ANSI C compiler present on your system for Awka to work.


### [Learn X in Y Minutes](https://github.com/adambard/learnxinyminutes-docs/blob/master/awk.html.markdown) short intro

```awk
#!/usr/bin/awk -f

# Comments are like this


# AWK programs consist of a collection of patterns and actions.
pattern1 { action; } # just like lex
pattern2 { action; }

# There is an implied loop and AWK automatically reads and parses each
# record of each file supplied. Each record is split by the FS delimiter,
# which defaults to white-space (multiple spaces,tabs count as one)
# You can assign FS either on the command line (-F C) or in your BEGIN
# pattern

# One of the special patterns is BEGIN. The BEGIN pattern is true
# BEFORE any of the files are read. The END pattern is true after
# an End-of-file from the last file (or standard-in if no files specified)
# There is also an output field separator (OFS) that you can assign, which
# defaults to a single space

BEGIN {

    # BEGIN will run at the beginning of the program. It's where you put all
    # the preliminary set-up code, before you process any text files. If you
    # have no text files, then think of BEGIN as the main entry point.

    # Variables are global. Just set them or use them, no need to declare..
    count = 0;

    # Operators just like in C and friends
    a = count + 1;
    b = count - 1;
    c = count * 1;
    d = count / 1; # integer division
    e = count % 1; # modulus
    f = count ^ 1; # exponentiation

    a += 1;
    b -= 1;
    c *= 1;
    d /= 1;
    e %= 1;
    f ^= 1;

    # Incrementing and decrementing by one
    a++;
    b--;

    # As a prefix operator, it returns the incremented value
    ++a;
    --b;

    # Notice, also, no punctuation such as semicolons to terminate statements

    # Control statements
    if (count == 0)
        print "Starting with count of 0";
    else
        print "Huh?";

    # Or you could use the ternary operator
    print (count == 0) ? "Starting with count of 0" : "Huh?";

    # Blocks consisting of multiple lines use braces
    while (a < 10) {
        print "String concatenation is done" " with a series" " of"
            " space-separated strings";
        print a;

        a++;
    }

    for (i = 0; i < 10; i++)
        print "Good ol' for loop";

    # As for comparisons, they're the standards:
    # a < b   # Less than
    # a <= b  # Less than or equal
    # a != b  # Not equal
    # a == b  # Equal
    # a > b   # Greater than
    # a >= b  # Greater than or equal

    # Logical operators as well
    # a && b  # AND
    # a || b  # OR

    # In addition, there's the super useful regular expression match
    if ("foo" ~ "^fo+$")
        print "Fooey!";
    if ("boo" !~ "^fo+$")
        print "Boo!";

    # Arrays
    arr[0] = "foo";
    arr[1] = "bar";
    
    # You can also initialize an array with the built-in function split()
    
    n = split("foo:bar:baz", arr, ":");
   
    # You also have associative arrays (actually, they're all associative arrays)
    assoc["foo"] = "bar";
    assoc["bar"] = "baz";

    # And multi-dimensional arrays, with some limitations I won't mention here
    multidim[0,0] = "foo";
    multidim[0,1] = "bar";
    multidim[1,0] = "baz";
    multidim[1,1] = "boo";

    # You can test for array membership
    if ("foo" in assoc)
        print "Fooey!";

    # You can also use the 'in' operator to traverse the keys of an array
    for (key in assoc)
        print assoc[key];

    # The command line is in a special array called ARGV
    for (argnum in ARGV)
        print ARGV[argnum];

    # You can remove elements of an array
    # This is particularly useful to prevent AWK from assuming the arguments
    # are files for it to process
    delete ARGV[1];

    # The number of command line arguments is in a variable called ARGC
    print ARGC;

    # AWK has several built-in functions. They fall into three categories. I'll
    # demonstrate each of them in their own functions, defined later.

    return_value = arithmetic_functions(a, b, c);
    string_functions();
    io_functions();
}

# Here's how you define a function
function arithmetic_functions(a, b, c,     d) {

    # Probably the most annoying part of AWK is that there are no local
    # variables. Everything is global. For short scripts, this is fine, even
    # useful, but for longer scripts, this can be a problem.

    # There is a work-around (ahem, hack). Function arguments are local to the
    # function, and AWK allows you to define more function arguments than it
    # needs. So just stick local variable in the function declaration, like I
    # did above. As a convention, stick in some extra whitespace to distinguish
    # between actual function parameters and local variables. In this example,
    # a, b, and c are actual parameters, while d is merely a local variable.

    # Now, to demonstrate the arithmetic functions

    # Most AWK implementations have some standard trig functions
    localvar = sin(a);
    localvar = cos(a);
    localvar = atan2(b, a); # arc tangent of b / a

    # And logarithmic stuff
    localvar = exp(a);
    localvar = log(a);

    # Square root
    localvar = sqrt(a);

    # Truncate floating point to integer
    localvar = int(5.34); # localvar => 5

    # Random numbers
    srand(); # Supply a seed as an argument. By default, it uses the time of day
    localvar = rand(); # Random number between 0 and 1.

    # Here's how to return a value
    return localvar;
}

function string_functions(    localvar, arr) {

    # AWK, being a string-processing language, has several string-related
    # functions, many of which rely heavily on regular expressions.

    # Search and replace, first instance (sub) or all instances (gsub)
    # Both return number of matches replaced
    localvar = "fooooobar";
    sub("fo+", "Meet me at the ", localvar); # localvar => "Meet me at the bar"
    gsub("e+", ".", localvar); # localvar => "m..t m. at th. bar"

    # Search for a string that matches a regular expression
    # index() does the same thing, but doesn't allow a regular expression
    match(localvar, "t"); # => 4, since the 't' is the fourth character

    # Split on a delimiter
    n = split("foo-bar-baz", arr, "-"); # a[1] = "foo"; a[2] = "bar"; a[3] = "baz"; n = 3

    # Other useful stuff
    sprintf("%s %d %d %d", "Testing", 1, 2, 3); # => "Testing 1 2 3"
    substr("foobar", 2, 3); # => "oob"
    substr("foobar", 4); # => "bar"
    length("foo"); # => 3
    tolower("FOO"); # => "foo"
    toupper("foo"); # => "FOO"
}

function io_functions(    localvar) {

    # You've already seen print
    print "Hello world";

    # There's also printf
    printf("%s %d %d %d\n", "Testing", 1, 2, 3);

    # AWK doesn't have file handles, per se. It will automatically open a file
    # handle for you when you use something that needs one. The string you used
    # for this can be treated as a file handle, for purposes of I/O. This makes
    # it feel sort of like shell scripting, but to get the same output, the string
    # must match exactly, so use a variable:
    
    outfile = "/tmp/foobar.txt";

    print "foobar" > outfile;

    # Now the string outfile is a file handle. You can close it:
    close(outfile);

    # Here's how you run something in the shell
    system("echo foobar"); # => prints foobar

    # Reads a line from standard input and stores in localvar
    getline localvar;

    # Reads a line from a pipe (again, use a string so you close it properly)
    cmd = "echo foobar";
    cmd | getline localvar; # localvar => "foobar"
    close(cmd);

    # Reads a line from a file and stores in localvar
    infile = "/tmp/foobar.txt";
    getline localvar < infile; 
    close(infile);
}

# As I said at the beginning, AWK programs consist of a collection of patterns
# and actions. You've already seen the BEGIN pattern. Other
# patterns are used only if you're processing lines from files or standard
# input.
#
# When you pass arguments to AWK, they are treated as file names to process.
# It will process them all, in order. Think of it like an implicit for loop,
# iterating over the lines in these files. these patterns and actions are like
# switch statements inside the loop. 

/^fo+bar$/ {
    
    # This action will execute for every line that matches the regular
    # expression, /^fo+bar$/, and will be skipped for any line that fails to
    # match it. Let's just print the line:

    print;

    # Whoa, no argument! That's because print has a default argument: $0.
    # $0 is the name of the current line being processed. It is created
    # automatically for you.

    # You can probably guess there are other $ variables. Every line is
    # implicitly split before every action is called, much like the shell
    # does. And, like the shell, each field can be access with a dollar sign

    # This will print the second and fourth fields in the line
    print $2, $4;

    # AWK automatically defines many other variables to help you inspect and
    # process each line. The most important one is NF

    # Prints the number of fields on this line
    print NF;

    # Print the last field on this line
    print $NF;
}

# Every pattern is actually a true/false test. The regular expression in the
# last pattern is also a true/false test, but part of it was hidden. If you
# don't give it a string to test, it will assume $0, the line that it's
# currently processing. Thus, the complete version of it is this:

$0 ~ /^fo+bar$/ {
    print "Equivalent to the last pattern";
}

a > 0 {
    # This will execute once for each line, as long as a is positive
}

# You get the idea. Processing text files, reading in a line at a time, and
# doing something with it, particularly splitting on a delimiter, is so common
# in UNIX that AWK is a scripting language that does all of it for you, without
# you needing to ask. All you have to do is write the patterns and actions
# based on what you expect of the input, and what you want to do with it.

# Here's a quick example of a simple script, the sort of thing AWK is perfect
# for. It will read a name from standard input and then will print the average
# age of everyone with that first name. Let's say you supply as an argument the
# name of a this data file:
#
# Bob Jones 32
# Jane Doe 22
# Steve Stevens 83
# Bob Smith 29
# Bob Barker 72
#
# Here's the script:

BEGIN {

    # First, ask the user for the name
    print "What name would you like the average age for?";

    # Get a line from standard input, not from files on the command line
    getline name < "/dev/stdin";
}

# Now, match every line whose first field is the given name
$1 == name {

    # Inside here, we have access to a number of useful variables, already
    # pre-loaded for us:
    # $0 is the entire line
    # $3 is the third field, the age, which is what we're interested in here
    # NF is the number of fields, which should be 3
    # NR is the number of records (lines) seen so far
    # FILENAME is the name of the file being processed
    # FS is the field separator being used, which is " " here
    # ...etc. There are plenty more, documented in the man page.

    # Keep track of a running total and how many lines matched
    sum += $3;
    nlines++;
}

# Another special pattern is called END. It will run after processing all the
# text files. Unlike BEGIN, it will only run if you've given it input to
# process. It will run after all the files have been read and processed
# according to the rules and actions you've provided. The purpose of it is
# usually to output some kind of final report, or do something with the
# aggregate of the data you've accumulated over the course of the script.

END {
    if (nlines)
        print "The average age for " name " is " sum / nlines;
}
```

### [Cheat Sheet](https://github.com/Randy8080/reference/blob/main/awk.md)

**Have a try**

```shell script
$ awk -F: '{print $1, $NF}' /etc/passwd
```

|-  | -             | -                         |
|---|---------------|---------------------------|
|   | `-F:`         | Colon as a separator      |
|   | `{...}`       | Awk program               |
|   | `print`       | Prints the current record |
|   | `$1`          | First field               |
|   | `$NF`         | Last field                |
|   | `/etc/passwd` | Input data file           |



#### Awk program
```
BEGIN          {<initializations>} 
   <pattern 1> {<program actions>} 
   <pattern 2> {<program actions>} 
   ...
END            {< final actions >}
```

**Example**
```
awk '
    BEGIN { print "\n>>>Start" }
    !/(login|shutdown)/ { print NR, $0 }
    END { print "<<<END\n" }
' /etc/passwd
```


#### Variables
```bash
          $1      $2/$(NF-1)    $3/$NF
           ▼          ▼           ▼ 
        ┌──────┬──────────────┬───────┐
$0/NR ▶ │  ID  │  WEBSITE     │  URI  │
        ├──────┼──────────────┼───────┤
$0/NR ▶ │  1   │  quickref.me │  awk  │
        ├──────┼──────────────┼───────┤
$0/NR ▶ │  2   │  google.com  │  25   │
        └──────┴──────────────┴───────┘
```

```
# First and last field
awk -F: '{print $1,$NF}' /etc/passwd

# With line number
awk -F: '{print NR, $0}' /etc/passwd

# Second last field
awk -F: '{print $(NF-1)}' /etc/passwd

# Custom string 
awk -F: '{print $1 "=" $6}' /etc/passwd
```



#### Awk program examples
```
awk 'BEGIN {print "hello world"}'        # Prints "hello world"
awk -F: '{print $1}' /etc/passwd         # -F: Specify field separator

# /pattern/ Execute actions only for matched pattern
awk -F: '/root/ {print $1}' /etc/passwd                     

# BEGIN block is executed once at the start
awk -F: 'BEGIN { print "uid"} { print $1 }' /etc/passwd     

# END block is executed once at the end
awk -F: '{print $1} END { print "-done-"}' /etc/passwd
```


**Conditions**
```
awk '{if ($3>30) print $1}' /etc/passwd
```


**Generate 1000 spaces**
```
awk 'BEGIN{
    while (a++ < 1000)
        s=s " ";
    print s
}'
```



**Arrays**
```
awk 'BEGIN {
   fruits["mango"] = "yellow";
   fruits["orange"] = "orange"
   print fruits["orange"] 
   print fruits["mango"]
}'
```



**Functions**
```
# => 5
awk 'BEGIN{print length("hello")}'
# => HELLO
awk 'BEGIN{print toupper("hello")}'
# => hel
awk 'BEGIN{print substr("hello", 1, 3)}'
```




#### Variables
**Build-in variables**

|----------------|-----------------------------------------------------|
| `$0`           | Whole line                                          |
| `$1, $2...$NF` | First, second… last field                           |
| `NR`           | Total `N`umber of `R`ecords                         |
| `NF`           | `N`number of `F`ields                               |
| `OFS`          | `O`utput `F`ield `S`eparator  <br> _(default " ")_  |
| `FS`           | input `F`ield `S`eparator <br> _(default " ")_      |
| `ORS`          | `O`utput `R`ecord `S`eparator <br> _(default "\n")_ |
| `RS`           | input `R`ecord `S`eparator <br> _(default "\n")_    |
| `FILENAME`     | Name of the file                                    |



**Expressions**

|---------------------|------------------------------------|
| `$1 == "root"`      | First field equals root            |
| `{print $(NF-1)}`   | Second last field                  |
| `NR!=1{print $0}`   | From 2th record                    |
| `NR > 3`            | From 4th record                    |
| `NR == 1`           | First record                       |
| `END{print NR}`     | Total records                      |
| `BEGIN{print OFMT}` | Output format                      |
| `{print NR, $0}`    | Line number                        |
| `{print NR "	" $0}` | Line number (tab)                  |
| `{$1 = NR; print}`  | Replace 1th field with line number |
| `$NF > 4`           | Last field > 4                     |
| `NR % 2 == 0`       | Even records                       |
| `NR==10, NR==20`    | Records 10 to 20                   |
| `BEGIN{print ARGC}` | Total arguments                    |
| `ORS=NR%5?",":"\n"` | Concatenate records                |




**Examples**
Print sum and average
```
awk -F: '{sum += $3}
     END { print sum, sum/NR }
' /etc/passwd
```

Printing parameters
```
awk 'BEGIN {
    for (i = 1; i < ARGC; i++)
        print ARGV[i] }' a b c
```

Output field separator as a comma
```
awk 'BEGIN { FS=":";OFS=","}
    {print $1,$2,$3,$4}' /etc/passwd
```

Position of match
```
awk 'BEGIN {
    if (match("One Two Three", "Tw"))
        print RSTART }'
```

Length of match
```
awk 'BEGIN {
    if (match("One Two Three", "re"))
        print RLENGTH }'
```





**Environment Variables**

| -         | -                                                         |
|-----------|-----------------------------------------------------------|
| `ARGC`    | Number or arguments                                       |
| `ARGV`    | Array of arguments                                        |
| `FNR`     | `F`ile `N`umber of `R`ecords                              |
| `OFMT`    | Format for numbers       <br> _(default "%.6g")_          |
| `RSTART`  | Location in the string                                    |
| `RLENGTH` | Length of match                                           |
| `SUBSEP`  | Multi-dimensional array separator <br> _(default "\034")_ |
| `ARGIND`  | Argument Index                                            |



#### GNU awk only

| -             | -                     |
|---------------|-----------------------|
| `ENVIRON`     | Environment variables |
| `IGNORECASE`  | Ignore case           |
| `CONVFMT`     | Conversion format     |
| `ERRNO`       | System errors         |
| `FIELDWIDTHS` | Fixed width fields    |



**Defining variable**
```
awk -v var1="Hello" -v var2="Wold" '
    END {print var1, var2}
' </dev/null
```

**Use shell variables**
```
awk -v varName="$PWD" '
    END {print varName}' </dev/null
```



### Operators

| -                | -           |
|------------------|-------------|
| `{print $1}`     | First field |
| `$2 == "foo"`    | Equals      |
| `$2 != "foo"`    | Not equals  |
| `"foo" in array` | In array    |

**Regular expression**

| -               | -                 |
|-----------------|-------------------|
| `/regex/`       | Line matches      |
| `!/regex/`      | Line not matches  |
| `$1 ~ /regex/`  | Field matches     |
| `$1 !~ /regex/` | Field not matches |

**More conditions**

| -                        | -   |
|--------------------------|-----|
| `($2 <= 4 || $3 < 20)` | Or  |
| `($1 == 4 && $3 < 20)`   | And |

**Arithmetic operations**
- `+`
- `-`  
- `*`  
- `/`  
- `%`  
- `++` 
- `--` 

**Shorthand assignments**
- `+=` 
- `-=` 
- `*=` 
- `/=` 
- `%=` 

**Comparison operators**
- `==`
- `!=`
- `<`
- `>`
- `<=`
- `>=`



**Examples**
```
awk 'BEGIN {
    if ("foo" ~ "^fo+$")
        print "Fooey!";
}'
```
**Not match**
```
awk 'BEGIN {
    if ("boo" !~ "^fo+$")
        print "Boo!";
}'
```
**if in array**
```
awk 'BEGIN {
    assoc["foo"] = "bar";
    assoc["bar"] = "baz";
    if ("foo" in assoc)
        print "Fooey!";
}'
```




#### Functions

**Common functions**

| Function              | Description                                                                     |
|-----------------------|---------------------------------------------------------------------------------|
| `index(s,t)`          | Position in string s where string t occurs, 0 if not found                      |
| `length(s)`           | Length of string s (or $0 if no arg)                                            |
| `rand`                | Random number between 0 and 1                                                   |
| `substr(s,index,len)` | Return len-char substring of s that begins at index (counted from 1)            |
| `srand`               | Set seed for rand and return previous seed                                      |
| `int(x)`              | Truncate x to integer value                                                     |
| `split(s,a,fs)`       | Split string s into array a split by fs, returning length of a                  |
| `match(s,r)`          | Position in string s where regex r occurs, or 0 if not found                    |
| `sub(r,t,s)`          | Substitute t for first occurrence of regex r in string s (or $0 if s not given) |
| `gsub(r,t,s)`         | Substitute t for all occurrences of regex r in string s                         |
| `system(cmd)`         | Execute cmd and return exit status                                              |
| `tolower(s)`          | String s to lowercase                                                           |
| `toupper(s)`          | String s to uppercase                                                           |
| `getline`             | Set $0 to next input record from current input file.                            |


**User defined function**
```
awk '
    # Returns minimum number
    function find_min(num1, num2){
       if (num1 < num2)
       return num1
       return num2
    }
    # Returns maximum number
    function find_max(num1, num2){
       if (num1 > num2)
       return num1
       return num2
    }
    # Main function
    function main(num1, num2){
       result = find_min(num1, num2)
       print "Minimum =", result
      
       result = find_max(num1, num2)
       print "Maximum =", result
    }
    # Script execution starts here
    BEGIN {
       main(10, 60)
    }
'
```




#### Arrays

**Array with index**
```
awk 'BEGIN {
    arr[0] = "foo";
    arr[1] = "bar";
    print(arr[0]); # => foo
    delete arr[0];
    print(arr[0]); # => ""
}'
```

**Array with key**
```
awk 'BEGIN {
    assoc["foo"] = "bar";
    assoc["bar"] = "baz";
    print("baz" in assoc); # => 0
    print("foo" in assoc); # => 1
}'
```


**Array with split**
```
awk 'BEGIN {
    split("foo:bar:baz", arr, ":");
    for (key in arr)
        print arr[key];
}'
```

**Array with asort**
```
awk 'BEGIN {
    arr[0] = 3
    arr[1] = 2
    arr[2] = 4
    n = asort(arr)
    for (i = 1; i <= n ; i++)
        print(arr[i])
}'
```

**Multi-dimensional**
```
awk 'BEGIN {
    multidim[0,0] = "foo";
    multidim[0,1] = "bar";
    multidim[1,0] = "baz";
    multidim[1,1] = "boo";
}'
```

**Multi-dimensional iteration**
```
awk 'BEGIN {
    array[1,2]=3;
    array[2,3]=5;
    for (comb in array) {
        split(comb,sep,SUBSEP);
        print sep[1], sep[2], 
        array[sep[1],sep[2]]
    }
}'
```



#### Conditions

**if-else statement**
```
awk -v count=2 'BEGIN {
    if (count == 1)
        print "Yes";
    else
        print "Huh?";
}'
```
**Ternary operator**
```
awk -v count=2 'BEGIN {
    print (count==1) ? "Yes" : "Huh?";
}'
```

**Exists**
```
awk 'BEGIN {
    assoc["foo"] = "bar";
    assoc["bar"] = "baz";
    if ("foo" in assoc)
        print "Fooey!";
}'
```
**Not exists**
```
awk 'BEGIN {
    assoc["foo"] = "bar";
    assoc["bar"] = "baz";
    if ("Huh" in assoc == 0 )
        print "Huh!";
}'
```


**switch**
```
awk -F: '{
    switch (NR * 2 + 1) {
        case 3:
        case "11":
            print NR - 1
            break
        
        case /2[[:digit:]]+/:
            print NR
        
        default:
            print NR + 1
        
        case -1:
            print NR * -1
    }
}' /etc/passwd
```


#### Loops

**`for...i`**
```
awk 'BEGIN {
    for (i = 0; i < 10; i++)
        print "i=" i;
}'
```
**Powers of two between 1 and 100 **
```
awk 'BEGIN {
    for (i = 1; i <= 100; i *= 2)
        print i
}'
```


**`for...in`**
```
awk 'BEGIN {
    assoc["key1"] = "val1"
    assoc["key2"] = "val2"
    for (key in assoc)
        print assoc[key];
}'
```

**Arguments**
```
awk 'BEGIN {
    for (argnum in ARGV)
        print ARGV[argnum];
}' a b c
```



#### Examples

**Reverse records**
```
awk -F: '{ x[NR] = $0 }
    END {
        for (i = NR; i > 0; i--)
        print x[i]
    }
' /etc/passwd
```

**Reverse fields**
```
awk -F: '{
    for (i = NF; i > 0; i--)
        printf("%s ",$i);
    print ""
}' /etc/passwd
```

**Sum by record**
```
awk -F: '{
    s=0;
    for (i = 1; i <= NF; i++)
        s += $i;
    print s
}' /etc/passwd
```


**Sum whole file**
```
awk -F: '
    {for (i = 1; i <= NF; i++)
        s += $i;
    };
    END{print s}
' /etc/passwd
```



**`while`**
```
awk 'BEGIN {
    while (a < 10) {
        print "- " " concatenation: " a
        a++;
    }
}'
```

**`do...while`**
```
awk '{
    i = 1
    do {
        print $0
        i++
    } while (i <= 5)
}' /etc/passwd
```



**Break**
```
awk 'BEGIN {
    break_num = 5
    for (i = 0; i < 10; i++) {
        print i
        if (i == break_num)
            break
    }
}'
```



**Continue**
```
awk 'BEGIN {
    for (x = 0; x <= 10; x++) {
        if (x == 5 || x == 6)
            continue
        printf "%d ", x
    }
    print ""
}'
```



#### Formatted Printing

**Right align**
```
awk 'BEGIN{printf "|%10s|\n", "hello"}'

|     hello|
```

**Left align**
```
awk 'BEGIN{printf "|%-10s|\n", "hello"}'

|hello     |
```

**Common specifiers **

| Character     | Description           |
|---------------|-----------------------|
| `c`           | ASCII character       |
| `d`           | Decimal integer       |
| `e`, `E`, `f` | Floating-point format |
| `o`           | Unsigned octal value  |
| `s`           | String                |
| `%`           | Literal %             |




**Space**
```
awk -F: '{
    printf "%-10s %s\n", $1, $(NF-1)
}' /etc/passwd | head -n 3
```
Outputs
```shell script
root       /root
bin        /bin
daemon     /sbin
```



**Header**
```
awk -F: 'BEGIN {
    printf "%-10s %s\n", "User", "Home"
    printf "%-10s %s\n", "----","----"}
    { printf "%-10s %s\n", $1, $(NF-1) }
' /etc/passwd | head -n 5
```
Outputs
```
User       Home
----       ----
root       /root
bin        /bin
daemon     /sbin
```



#### Miscellaneous

**Regex Metacharacters**
- `\`
- `^`
- `$`
- `.`
- `[`
- `]`
- `|`
- `(`
- `)`
- `*`
- `+`
- `?`

**Escape Sequences**

| -      | -                   |
|--------|---------------------|
| `\b`   | Backspace           |
| `\f`   | Form feed           |
| `\n`   | Newline (line feed) |
| `\r`   | Carriage return     |
| `\t`   | Horizontal tab      |
| `\v`   | Vertical tab        |


**Run script**
```shell script
$ cat demo.awk
#!/usr/bin/awk -f
BEGIN { x = 23 }
      { x += 2 }
END   { print x }
$ awk -f demo.awk /etc/passwd
69
```

