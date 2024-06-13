title=Literate
tags=language, literate
summary=A literate programming tool for any language
~~~~~~

[Source](https://github.com/zyedidia/Literate) | [Website](https://zyedidia.github.io/literate/)

Written in Literate D (D code wrapped in this Literate system code).

## Examples
Word Count (wc.lit)
```
@code_type c .c
@comment_type /* %s */
@compiler lit -t wc.lit && gcc wc.c && rm a.out

@title Word Count Program

@s An example of Literate programming

This example is a close adaptation of a tutorial example for Knuth and Levy's `CWEB` programming system,
translated from `CWEB` to the `Literate` programming system. 
That example in turn is based on a program by Klaus Guntermann and Joachim Schrod 
[*TUGboat* **7** (1986), 134–137] for a version of the "word count" program from `UNIX`.

This example demonstrates literate programming in C, although the 
`Literate` programming system can be used in conjunction with any programming language. 
The level of detail in this document is intentionally high, 
for didactic purposes; many of the things spelled out here don’t need to be explained in other programs.

The purpose of `wc` is to count lines, words, and/or characters in a list of files. 
The number of lines in a file is the number of newline characters it contains. 
The number of characters is the file length in bytes. A "word" is a maximal 
sequence of consecutive characters other than newline, space, or tab, containing at 
least one visible ASCII code. (We assume that the standard ASCII code is in use.)

This version of `wc` has a nonstandard "silent" option (`-s`), which suppresses printing 
except for the grand totals over all files.

@s

Most `Literate` programs share a common structure. It’s probably a good idea to state 
the overall structure explicitly at the outset, even though the various parts could all be 
introduced in a piecemeal fashion.

Here, then, is an overview of the file `wc.c` that is defined by this `Literate` program `wc.lit`:

--- wc.c
@{Header files to include}
@{Preprocessor definitions}
@{Global variables}
@{Functions}
@{The main program}
---

@s

We must include the standard I/O definitions, since we want to send formatted output to *stdout* and *stderr*.

--- Header files to include
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
---

@s

The `status` variable will tell the operating system if the run was successful or not, 
and `prog_name` is used in case there’s an error message to be printed.

--- Preprocessor definitions
#define OK 1    /* status code for successful run */
#define usage_error 1    /* status code for improper syntax */
#define cannot_open_file 2    /* status code for file access error */ 
---

--- Global variables
int status = OK;    /* exit status of command, initially OK */
char *prog_name;    /* who we are */
---

@s

Now we come to the general layout of the `main()` function.

--- The main program
int main(int argc, char **argv)
{
    @{Variables local to main}
    prog_name = argv[0];
    @{Set up option selection}
    @{Process all the files}
    @{Print the grand totals if there were multiple files}
    return status;
}
---

@s

If the first argument begins with a '`-`', the user is choosing the desired counts and 
specifying the order in which they should be displayed. Each selection is given by the 
initial character (lines, words, or characters). For example, '`-cl`' would cause just 
the number of characters and the number of lines to be printed, in that order. The 
default, if no special argument is given, is '`-lwc`'.

We do not process this string now; we simply remember where it is. It will be used 
to control the formatting at output time.

If the '`-`' is immediately followed by '`s`', only summary totals are printed.

--- Variables local to main
int file_count;    /* how many files there are */
char *which;    /* which counts to print */
int silent = 0;    /* nonzero if the silent option was selected */
---

@s

--- Set up option selection
which = "lwc";    /* if no option is given, print all three values */
if (argc >1 && *argv[1] == '-') {
    argv[1]++;
    if (*argv [1] == 's') silent = 1, argv [1]++;
    if (*argv [1]) which = argv [1];
    argc--;
    argv++;
}
file_count = argc - 1;
---

@s

Now we scan the remaining arguments and try to open a file, if possible. The file 
is processed and its statistics are given. We use a `do ... while` loop because 
we should read from the standard input if no file name is given.

--- Process all the files
argc--;
do {
    @{If a file is given, try to open *(++argv ); continue if unsuccessful}
    @{Initialize pointers and counters}
    @{Scan file}
    @{Write statistics for file}
    @{Close file}
    @{Update grand totals} 
} while (--argc > 0);
---

@s

Here’s the code to open the file. A special trick allows us to handle input from *stdin* 
when no name is given. Recall that the file descriptor to *stdin* is `0`; that’s what we 
use as the default initial value.

--- Variables local to main +=
int fd = 0;
---

@s
--- Preprocessor definitions +=
#define READ_ONLY 0
---

--- If a file is given, try to open *(++argv ); continue if unsuccessful
if (file_count > 0 && (fd = open(*(++argv), READ_ONLY)) < 0) {
    fprintf(stderr, "%s: cannot open file %s\n", prog_name, *argv);
    status |= 2;
    file_count--;
    continue;
}
---

@s

--- Close file
close(fd);
---

@s

We will do some homemade buffering in order to speed things up: Characters will be 
read into the buffer array before we process them. To do this we set up appropriate 
pointers and counters.

--- Variables local to main +=
char buffer[BUFSIZ];    /* we read the input into this array */
register char *ptr;    /* the first unprocessed character in buffer */
register char *buf_end;    /* the first unused position in buffer */
register int c;    /* current character or number of characters just read */
int in_word;    /* are we within a word? */
long word_count, line_count, char_count;   
    /* number of words, lines, and characters found in the file so far */
---

@s

--- Initialize pointers and counters
ptr = buf_end = buffer;
line_count = word_count = char_count = 0;
in_word = 0;
---

@s

The grand totals must be initialized to zero at the beginning of the program. 
If we made these variables local to main, we would have to do this initialization explicitly; 
however, C’s globals are automatically zeroed. (Or rather, "statically zeroed.") (Get it?)

--- Global variables +=
long tot_word_count, tot_line_count, tot_char_count; 
    /* total number of words, lines and chars */
---

@s

The present section, which does the counting that is `wc`'s *raison d'être*, was actually 
one of the simplest to write. We look at each character and change state if it begins or ends a word.

--- Scan file
while (1) {
    @{Fill buffer if it is empty; break at end of file}
    c = *ptr++;
    if (c > ' ' && c < 177) {    /* visible ASCII codes */
        if (!in_word) {
            word_count++;
            in_word = 1;
        }
        continue;
    }
    if (c == '\n') line_count++;
    else if (c != ' ' && c != '\t') continue;
    in_word = 0;    /* c is newline, space, or tab */
}
---

@s

Buffered I/O allows us to count the number of characters almost for free.

--- Fill buffer if it is empty; break at end of file
if (ptr >= buf_end) {
    ptr = buffer;
    c = read(fd, ptr, BUFSIZ);
    if (c <= 0) break;
    char_count += c;
    buf_end = buffer + c;
}
---

@s

It’s convenient to output the statistics by defining a new function `wc_print()`; 
then the same function can be used for the totals. Additionally we must decide here 
if we know the name of the file we have processed or if it was just *stdin*.

--- Write statistics for file
if (!silent) {
    wc_print(which, char_count, word_count, line_count);
    if (file_count) printf(" %s\n", *argv);    /* not stdin */
    else printf("\n");    /* stdin */
}
---

@s

--- Update grand totals
tot_line_count += line_count;
tot_word_count += word_count;
tot_char_count += char_count;
---

@s

We might as well improve a bit on `UNIX`’s `wc` by displaying the number of files too.

--- Print the grand totals if there were multiple files
if (file_count > 1 || silent) {
    wc_print(which, tot_char_count, tot_word_count, tot_line_count);
    if (!file_count) printf("\n");
    else printf(" total in %d file%s\n", file_count, file_count > 1 ? "s" : "");
}
---

@s

Here now is the function that prints the values according to the specified options. 
The calling routine is supposed to supply a newline. If an invalid option character 
is found we inform the user about proper usage of the command. Counts are printed 
in 8-digit fields so that they will line up in columns.

--- Functions
void wc_print(char *which, long char_count, long word_count, long line_count)
{
    while (*which)
        switch (*which++) {
        case 'l': printf("%8ld", line_count);
            break;
        case 'w': printf("%8ld", word_count);
            break;
        case 'c': printf("%8ld", char_count);
            break;
        default:
            if ((status & 1) == 0) {
                fprintf(stderr, "\nUsage: %s [-lwc] [filename ...]\n", prog_name);
                status |= 1;
            }
        }
}
---
```

Hangman
```
@code_type python .py
@comment_type # %s
@compiler lit -t hangman.lit && pyflakes hangman.py

@title Hangman

@s Introduction
This is a Hangman program. It lets you make guesses about which letters are in an unknown word. On the eighth incorrect guess you lose.
The structure of the hangman program will look like this:

--- hangman.py
import random
import sys

print "Welcome to hangman!"
@{Setup}
lives_left = 8
while lives_left > 0:
    @{User input}
    @{Check input}
    @{Check win}

@{End}
---

@s The Setup

First, we have the computer come up with a secret word which it chooses randomly from a list of words read from a text file.

--- Setup
words = open("words.txt").read().split()
secret_word = random.choice(words)
---

Next we initialize the variable to hold the dashes.

--- Setup +=
dashes = []
for i in range(0, len(secret_word)):
    dashes.append('-')
---

@s Getting User Input

Now we can start the game. We ask for the user's guess and store it in the `guess` variable.

--- User input
@{print dashes array}
print "You have " + str(lives_left) + " lives left"
print "What's your guess? "
guess = raw_input()
---

@s Checking the User's Guess

We loop through the secret word, checking if any of its letters were guessed. If they were, reveal that letter in the dashes array. If none of the letters in secret word were equal to the guess, then `got_one_correct` will be false, and one guess will be added.

--- Check input
got_one_correct = False
for i in range(0, len(secret_word)):
    if secret_word[i] == guess:
        got_one_correct = True
        dashes[i] = guess

if not got_one_correct:
    lives_left -= 1
---

@s Checking for Victory

Now we should check if the user has guessed all the letters.

Here we see if there are any dashes left in the array that holds the dashes. If there aren't, the user has won.

--- Check win
if not ('-' in dashes):
    print "You win! The word was " + secret_word
    exit()
---

@s Pretty Printing the Dashes

We want the dashes to look pretty when they are printed, not look like an array of chars. Instead of `['-', '-', '-', '-']`, we want `----`.

--- print dashes array
for letter in dashes:
    sys.stdout.write(letter)
print "\n",
---

@s The End

--- End
print "You lose. The word was " + secret_word
---

@s Words

Here is the file containing all the words for the game. It's just a simple text file with words split by whitespace.

@comment_type none

--- words.txt
able about account acid across act addition adjustment 
advertisement after again against agreement almost among
attempt attention attraction authority automatic awake 
baby back bad bag balance ball band base basin basket bath be
beautiful because bed bee before behaviour belief bell 
bent berry between bird birth bit bite bitter black blade blood
carriage cart cat cause certain chain chalk chance 
change cheap cheese chemical chest chief chin church circle clean clear
clock cloth cloud coal coat cold collar colour comb 
come comfort committee common company comparison competition complete
complex condition connection conscious control cook copper copy 
cord cork cotton cough country cover cow crack credit crime
delicate dependent design desire destruction detail development 
different digestion direction dirty discovery discussion disease
last late laugh law lead leaf learning leather left letter level 
library lift light like limit line linen lip liquid
morning mother motion mountain mouth move much muscle music nail 
name narrow nation natural near necessary neck need needle
private probable process produce profit property prose protest public 
pull pump punishment purpose push put quality question
seem selection self send sense separate serious servant shade shake 
shame sharp sheep shelf ship shirt shock shoe short
square stage stamp star start statement station steam steel stem step 
stick sticky stiff still stitch stocking stomach stone
stop store story straight strange street stretch strong structure 
substance such sudden sugar suggestion summer sun support surprise
very vessel view violent voice waiting walk wall war warm wash waste 
watch water wave wax way weather week weight well west
wet wheel when where while whip whistle white who why wide will wind 
window wine wing winter wire wise with woman wood wool word
work worm wound writing wrong year yellow yesterday young
---
```
