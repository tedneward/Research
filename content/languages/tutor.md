title=TUTOR (programming language) 
tags=language
summary=Designed for use in computer assisted instruction (CAI) and computer managed instruction (CMI).
~~~~~~

## [Wikipedia](https://en.wikipedia.org/wiki/TUTOR):
### Structure of a TUTOR lesson
A TUTOR lesson consists of a sequence of ''units'' where each unit begins with the presentation of information and progress from one unit to the next is contingent on correctly answering one or more questions.  As with [[COBOL]] paragraphs, control may enter a TUTOR unit from the preceding unit and exit into the next, but units are also callable as subroutines using the <code>do</code> or <code>join</code> commands.

Here is an example unit from page 5 of the ''TUTOR User's Memo'', March 1973 ([[Computer-based Education Research Laboratory]], University of Illinois at Urbana-Champaign):

```
unit    math
at      205
write   Answer these problems

        3 + 3 =

        4 × 3 =

arrow   413
answer  6
arrow   613
answer  12
```

Several things should be immediately apparent from this example.

* First, TUTOR is a fixed format language.  Each line begins with a command name, which must fit within a fixed 8-character field for the command name.  The arguments to that command (the ''tag'') begin at the 9th character.  Although a tab key was be used to get to the 9th column, it generated spaces as plato had no tab character.
* In some cases, such as the <code>write</code> command above, the tag may consist of multiple lines.  Continuation lines are either blank or have a leading tab.
* Screen coordinates are presented as single numbers, so 205 refers to line 2 column 5, and 413 refers to line 4 column 13.

What may not be apparent is the control structure implicit in this unit.  The <code>arrow</code> command marks the entrance to a ''judging block''  This control structure is one of TUTOR's unique features.

==Unique features==
TUTOR contained a number of unique features.  The following list is not intended as a substitute for a TUTOR manual, but merely highlights the most interesting, innovative, and sometimes confusing features of the language.

===Answer judging===
A ''judging block'' in TUTOR is a control structure that begins with an <code>arrow</code> command and ends with the next <code>arrow</code>, <code>endarrow</code> or <code>unit</code> command. The <code>arrow</code> command also prompts for input, with the special arrow character (resembling "▷") displayed as a prompt at the indicated screen coordinates.  In effect, a judging block can be thought of as a backtracking control structure where the student may make multiple attempts to answer a question until a correct answer allows forward progress.

====Judging pattern matching====
Each judging block consists of a sequence of [[pattern matching]] commands, each of which introduces a (possibly empty) block of commands to be executed if that pattern matches.  The two most common pattern matching commands were <code>answer</code> and <code>wrong</code>.  These had identical pattern matching semantics except that <code>answer</code> judged a student response to be correct if it matched, while <code>wrong</code> judged a student response to be incorrect.

The tag fields on the <code>answer</code> and <code>wrong</code> commands consisted of lists of optional, required and alternative words. consider this example from exercise 4-1 in the 1973 ''TUTOR User's Memo'':

<syntaxhighlight lang="text">
answer  <it, is,a, it's, figure,
        polygon>
        (right, rt) (triangle, triangular)
</syntaxhighlight>

This would match answers such as "it is a right triangle" or "it's a triangular figure" or just "rt triangle".  It would not match "sort of triangular" because the words "sort of" are not listed as ignored, and it would not match "triangle, right?" because the
order is wrong.

The pattern matching subsystem recognized spelling errors, so the words "triangel" or "triangl" would match the example pattern. The lesson author could use the <code>specs</code> command to set how pedantic the system was about spelling errors.

The pattern matching algorithms used by various TUTOR implementations varied in detail, but typically, each word in the input text and each word in the pattern were converted to [[bit vector]]s. To see whether a word of student input matched a word of the pattern, the [[Hamming distance]] between the two bit vectors was used as a measure of the degree of difference between the words. Bit vectors were typically 60 or 64 bits long, with fields for letter presence, letter pair presence, and the first letter. As a result, the number of one bits in the [[exclusive or]] of two such bit vectors approximated the extent of the phonetic difference between the corresponding words.<ref>Tenczar and Golden, ''Spelling, Word and Concept Recognition'', Computer-Based Education Research Laboratory Rep. X-35, University of Illinois at Urbana, 1972.</ref>

====Judging control structures====
All early presentations of the control structure of a TUTOR judging block were confusing.  In modern terms, however, a judging block can be described as an [[While loop|iterative control structure]] that exits when the student input is judged correct.  The body
of this control structure consists of a series of [[Conditional (programming)#Case and switch statements|cases]], each introduced by a [[pattern matching]] command such as <code>answer</code> or <code>wrong</code>. All output produced by the body of the judging loop in the
previous cycle is erased from the screen prior to the next cycle.

Consider this example, from exercise 4-1 of the 1973 ''TUTOR User's Memo'':

<syntaxhighlight lang="text">
wrong   <it, is,a> square
at      1501
write   A square has four
        sides.
</syntaxhighlight>

In the event that the student inputs "square" or "a square", the answer is judged to be incorrect, and the text "A square has four sides." is output starting at line 15 column 1 on the screen. This output remains on the screen until the student begins to enter
a new answer, at which point, it is erased so that the response to the new answer can be computed.  The mechanism by which the display screen rolls back to its previous state varies from implementation to implementation.  Early implementations operated by switching the terminal into erase mode and re-executing the entire case that had matched.  Some later implementations buffered the output produced during judging so that this output could be erased.

The <code>join</code> command was a unique form of subroutine call.  It was defined as being equivalent to textual substitution of the body of the joined unit in place of the join command itself (page 21, 1973 ''TUTOR User's Memo'').  As such, a joined unit could contain part of a judging block.  Thus, while the judging block is conceptually an [[While loop|iterator]] enclosing a series of [[Conditional (programming)#Case and switch statements|cases]], this block may be arbitrarily broken into subroutines.  (An alternative subroutine call, the <code>do</code> command, conformed to the usual semantics associated with subroutine calls in other programming languages.)

===Graphic and display commands===
The PLATO IV student terminal<ref>''The Plato IV Student Terminal'' by Jack Stifle, Nov 1974</ref> had a 512 by 512 [[pixel]] [[Plasma display|plasma display panel]],
with hardware support for [[point plotting]], line drawing, and text display.
Each pixel on the PLATO IV terminal was either orange or black.  The CDC PLATO V terminal used a monochrome black and white [[Cathode ray tube|CRT]] to emulate the plasma panel.  The built-in character set had 4 sets of 63 characters, each 8 by 16 pixels, half of these were fixed, half were programmable.  The Tutor language provided complete support for this terminal.

There were two [[coordinate system]]s (see page II-1 of ''The TUTOR Language'' by Bruce Sherwood):

* Coarse coordinates were specified in terms of the rows and columns of text.  The coarse coordinate 1501, for example, was a reference to line 15 character 1, where the upper left character on the screen was at location 101 and the lower right character was at 3264.
* Fine coordinates were specified as X and Y coordinates relative to the lower left corner of the screen.  The fine coordinate 0,511 specified the upper left corner of the screen, while 0,496 was equivalent to the coarse 101, allowing for the 16 pixel height of a character and the fact that characters were plotted relative to their lower left corner.

====Drawing commands====
The following example illustrates some of Tutor's drawing commands.<ref>from page II-11 of ''The TUTOR Language'' by Bruce Sherwood, 1974.</ref>

<syntaxhighlight lang="text">
draw    1812;1852;skip;1844;1544
circle  16,344,288
draw    1837;1537;1535;1633;1833
</syntaxhighlight>

Note the use of semicolons to separate successive coordinates on the <code>draw</code> command.  This allows unambiguous use of comma-separated fine coordinates.  Normally, the draw command connects consecutive points with line segments, but by putting <code>skip</code> in the tag, the <code>draw</code> command could be made to conceptually lift its pen.

The tags on the <code>circle</code> command give the radius and fine coordinates of the center.  Additional tags could specify starting and
ending angles for partial circles.

Hand composing draw commands is difficult, so a picture editor was included in the PLATO system by 1974 to automate this work.<ref>see page II-9 of ''The TUTOR Language'' by Bruce Sherwood, 1974</ref>  This could only deal with drawing commands with constant coordinates.

====Text rendering commands====
The following example illustrates some of the text rendering tools of Tutor.<ref>from page II-3 of ''The TUTOR Language'' by Bruce Sherwood, 1974</ref>

<syntaxhighlight lang="text">
unit    title
size    9.5     $$ text 9.5 times normal size
rotate  45      $$ text rotated 45 degrees
at      2519
write   Latin
size    0       $$ return to normal writing
rotate  0
at      3125
write   Lessons on Verbs
</syntaxhighlight>

Text rendered in size zero rotation zero used the built-in character rendering hardware of the PLATO terminal, while rendering with nonzero size and rotation was done with line segments and therefore significantly slower due to the speed of the communication link to the terminal.

===Control structures===
Aside from its unique answer judging mechanisms, TUTOR's original set of [[Control flow|control structures]] was rather sparse.  In the mid 1970s, this shortcoming was addressed by introducing <code>if</code>, <code>endif</code> blocks with optional <code>elseif</code> and <code>else</code> sections.  The semantics of these control structures was routine, but the syntax inherited the mandatory [[Indent style|indentation]] of the Tutor Language, presaging that of [[Python (programming language)|Python]] and adding a unique nonblank indent character to distinguish indenting from continuation lines.

This is illustrated in the following example, from page S5 of the ''Summary of TUTOR Commands and System Variables (10th ed)'' by [[Elaine Avner]], 1981:

<syntaxhighlight lang="text">
if      n8<4
.       write   first branch
.       calc    n9⇐34
elseif  n8=4
.       write   second branch
.       do      someunit
else
.       write   default branch
.       if      n8>6
.       .       write   special branch
.       endif
endif
</syntaxhighlight>

(The [[Assignment (computer science)|assignment]] arrow in the <code>calc</code> statement is not rendered correctly in some browsers.  It appears similar to <= but as one character.  It had a dedicated key on the PLATO IV keyboard.)

The same syntax was used for <code>loop</code>, <code>endloop</code> blocks with semantics comparable to [[while loop]]s in conventional programming languages.  This is illustrated in the following example, from page S6 of the ''Summary of TUTOR Commands and System Variables (10th ed)'' by Elaine Avner, 1981:

<syntaxhighlight lang="text">
loop    n8<10
.       write   within loop
.       sub1    n8
reloop  n8≥5
.       write   still within loop
.       do      someunit
outloop n8<3
.       write   still within loop
endloop
write   outside of loop
</syntaxhighlight>

Note that the <code>reloop</code> and <code>outloop</code> commands are somewhat analogous to the <code>continue</code> and <code>break</code> statements of languages based on [[C (programming language)|C]], except that they must sit at the indenting level of the loop they modify, and they have a condition tag that indicates when the indicated control transfer is to take place.  This makes the construct more powerful that in other languages, because any line of the inner loop could terminate or reloop several outer loops with one statement.

===Expression syntax===
TUTOR's expression syntax did not look back to the syntax of [[FORTRAN]], nor was it limited by poorly designed character sets of the era.  For example, the PLATO IV character set included [[control characters]] for [[subscript and superscript]], and TUTOR used these for exponentiation.  Consider this command (from page IV-1 of ''The TUTOR Language'', Sherwood, 1974):
 
 circle  (41<sup>2</sup>+72.6<sup>2</sup>)<sup>1/2</sup>,100,200

The character set also included the conventional symbols for multiplication and division, <code>&times;</code> and <code>÷</code>, but in a more radical departure from the conventions established by FORTRAN, it allowed implicit multiplication, so the expressions <code>(4+7)(3+6)</code> and <code>3.4+5(2<sup>3</sup>-3)/2</code> were valid, with the values 99 and 15.9, respectively (op cit).  This feature was seen as essential.  When students typed in a numeric answer to a question, they could use operators and variables and standard algebraic notation, and the program would use the TUTOR "compute" command to compile and run the formula and check that it was numerically equivalent (or within the floating point roundoff error) to the correct answer.

The language included a pre-defined constant named with the Greek letter pi (π), with the appropriate value, which could be used in calculations.   Thus, the expression <code>πr<sup>2</sup></code> could be used to calculate the area of a circle, using the built-in π constant, implicit multiplication and exponentiation indicated by a superscript.

In TUTOR, the floating-point comparison <code>x=y</code> was defined as being true if <code>x</code> and <code>y</code> were approximately equal (see page C5 of ''PLATO User's Memo, Number One'' by Avner, 1975).  This simplified life for mathematically naïve developers of instructional lessons, but it occasionally caused headaches for developers of numerically sophisticated code because it was possible that both <code>x&lt;y</code> and <code>x≥y</code> could be true at the same time.<ref>See page IX-3 of ''The TUTOR Language'' by Sherwood, 1974</ref>

===Memory management===
As an authoring language, TUTOR began with only minimal memory resources and only the crudest tools for manipulating them.  Each user process had a private data segment of 150 variables, and shared ''common blocks'' could be attached, allowing inter-user communication through shared memory.

On the PLATO IV system, words were 60 bits, in keeping with the [[CDC 6600]] family of computers.  Some later implementations changed this to 64 bits.<ref>see ''Run Time Support of the TUTOR Language on a Small Computer System'' by [[Douglas W. Jones]]</ref>

====Basic memory resources====
The private memory region of each process consisted of 150 words each, referred to as student variables; the values of these variables were persistent, following the individual user from session to session.  These were addressed as <code>n1</code> through <code>n150</code> when used to hold integer values, or as <code>v1</code> through <code>v150</code> when used to hold floating point values.<ref>see pages IV-2 and IX-17 of ''The TUTOR Language'', Sherwood, 1974</ref>

A TUTOR lesson could attach a single region of up to 1500 words of shared memory using the <code>common</code> command.  Each lesson could have an unnamed temporary common block containing variables shared by all users of that lesson.  Such blocks were created when a lesson came into use and deallocated when the lesson became inactive.  In contrast, named common blocks were associated with a block of a lesson (a disk file).  Shared memory was addressed as <code>nc1</code> through <code>nc1500</code> (for integers) or <code>vc1</code> through <code>vc1500</code> (for floating point numbers).<ref>see pages X-1 to X-3 and X-6 of ''The TUTOR Language'', Sherwood, 1974</ref>

Where 150 student variables was insufficient, a lesson could use the
<code>storage</code> command to create an additional private memory segment of up to 1000 words.  This segment existed in swap space only, but it could be mapped to student variables or common variables.  For example (from page X-11 of ''The TUTOR Language'', Sherwood, 1974):

<syntaxhighlight lang="text">
common  1000
storage 75
stoload vc1001,1,75
</syntaxhighlight>

This example defines <code>nc1</code> to <code>nc1000</code> as a shared unnamed common block, while <code>nc1001</code> to <code>nc1075</code> are private storage.

====Defining symbolic names====
The Tutor <code>define</code> command was very similar to the [[C (programming language)|C]] <code>#define</code> [[preprocessor]] directive.  This was the only way to associate mnemonic names with variables.  It was up to the programmer to statically allocate memory and assign names to variables.  Consider this example from page 17 of the ''TUTOR User's Memo -- Introduction to TUTOR'', 1973"

<syntaxhighlight lang="text">
define  mynames
        first=v1, second =v2
        result=v3
</syntaxhighlight>

This creates a set of definitions named <code>mynames</code> defining three floating point variables.  Users were advised that "<u>there should not be any v3's or v26's anywhere in your lesson except in the <code>define</code> statement itself</u>.  Put all your definitions at the very beginning of the lesson where you will have ready reference to which variables you are using." (underlining from the original, page IV-5 of ''The TUTOR Language'', Sherwood, 1974.)

Functions could be defined, with macro-substitution semantics, as in this illustration from page IX-2 of ''The TUTOR Language'', Sherwood, 1974:

<syntaxhighlight lang="text">
define  cotan(a)=cos(a)/sin(a)
</syntaxhighlight>

Unlike C, the original [[scope (programming)|scope rules]] of TUTOR were pure "definition before use" with no provisions for local definitions.  Thus, the formal parameter <code>a</code> used above must not have any previous definition.

Later in the development of TUTOR, with the introduction of multiple named sets of definitions, the programmer was given explicit control over which sets of definitions were currently in force.  For example, <code>define&nbsp;purge, setname</code> would discard all definitions in the named set.<ref>See page 15 of ''PLATO User's Memo -- Summary of TUTOR Commands and System Variables'', Avner, 1975</ref>

====Arrays, packed arrays, and text manipulation====
The original TUTOR tools for text manipulation were based on commands for specific text operations, for example, <code>pack</code> to place a packed character string into consecutive variables in memory, <code>search</code> to search for one string within another, and <code>move</code> to move a string from memory to memory.<ref>Pages VII-52 to VII-55 of ''The TUTOR Language'', Sherwood, 1974</ref>  By 1975, more general tools for arrays of integers and packed arrays were added.  Page 14 of ''PLATO User's Memo -- Summary of TUTOR Commands and System Variables'', Avner, 1975, gives the following:

<syntaxhighlight lang="text">
define  segment, name=starting var, num bits per byte, s
        array, name(size)=starting var
        array, name (num rows, num columns)=starting var
</syntaxhighlight>

''Segmented arrays'', defined with the keyword <code>segment</code>, were comparable to packed arrays in [[Pascal (programming language)|Pascal]].  The byte size and whether or not the array elements were to be treated as signed or unsigned were entirely under user control.  Arbitrary text manipulation could be done by setting the byte size to the machine byte size, 6 bits on implementations using [[display code]], 8 bits on some later [[ASCII]] and [[extended ASCII]] implementations.  Note the lack of any specification of array dimensionality for segmented arrays.

====Parameter passing====
A general [[Parameter (computer science)|parameter passing]] mechanism was added to TUTOR early in the PLATO IV era.  Page IV-10 of ''The TUTOR Language'' by Sherwood, 1974 gives the following example:

<syntaxhighlight lang="text">
define  radius=v1,x=v2,y=v3
unit    vary
do      halfcirc(100,150,300)
do      halfcirc(50)
*
unit    halfcirc(radius, x,y)
circle  radius, x,y,0,180
draw    x-radius, y;x+radius, y
</syntaxhighlight>

Notice that the [[Parameter (computer science)#Parameters and arguments|formal parameters]] listed in the argument list to the <code>unit</code> command are simply the defined names for statically allocated global variables.  The semantics of parameter passing was given as being equivalent to assignment at the time of the control transfer to the destination unit, and if [[Parameter (computer science)#Parameters and arguments|actual parameters]] were omitted, as in the second <code>do</code> command above, the effect was to leave the prior values of the corresponding formal parameters unchanged.

#### Local variables
Local variables were added to TUTOR some time around 1980.  Lesson authors wishing to use local variables were required to use the <code>lvars</code> command to declare the size of the buffer used for local variables, up to 128 words.<ref>Page C3 of ''Summary of TUTOR Commands and System Variables'', Avner, 1981</ref>  Having done so, a unit using local variables could begin as follows (from Page C2 of ''Summary of TUTOR Commands and System Variables'', Avner, 1981):

    ```
    unit    someu
            NAME1,NAME2,NAME3(SIZE)
            NAME4=CONSTANT
            floating:NAME5,NAME6,NAME7(SIZE)
            integer, NUM BITS:NAME8,NAME9
            integer, NUM BITS,signed:NAME10
            integer:NAME11
    ```

The continuation lines of the <code>unit</code> command given above are taken to be lines of an implicit <code>define</code> command with local [[Scope (programming)|scope]].  Conventional definitions in terms of student variables such as <code>n150</code> could be used in such a local <code>define</code>, but the forms illustrated here all automatically bind names to locations in the block of memory allocated by the <code>lvars</code> command.  The available TUTOR documentation does not discuss how local variables are allocated.

==Other implementations==
There has been a sizable family of TUTOR-related languages, each similar to the original TUTOR language but with differences. In particular, TUTOR was a component of a system (the PLATO computer-based education system) that ran on particular CDC mainframe hardware. For efficiency, there were some hardware-specific elements in TUTOR (e.g. variables that were 60-bit words that could be used as arrays of 60 bits or as 10 six-bit characters, etc.). Also, TUTOR was designed before the advent of the windows-oriented graphical user interface (GUI).

The microTutor language was developed in the PLATO project at UIUC to permit portions of a lesson to run in terminals that contained microcomputers, with connections to TUTOR code running on the mainframe. The microTutor dialect was also the programming language of the Cluster system developed at UIUC and licensed to TDK in Japan; the Cluster system consisted of a small group of terminals attached to a minicomputer which provided storage and compilation. The [http://tencore.com Tencore Language Authoring System] is a TUTOR derivative developed by Paul Tenczar for PCs and sold by Computer Teaching Corporation. cT was a derivative of TUTOR and microTutor developed at Carnegie Mellon which allowed programs to run without change in windowed GUI environments on Windows, Mac, and Unix/Linux systems: [http://vpython.org/contents/cTsource/cToverview.html The cT Programming Language Archives]

* [http://www.bitsavers.org/pdf/cdc/plato/97405900C_PLATO_Users_Guide_Apr81.pdf PLATO User's Guide], CDC Corporation, Revised April, 1981.
* [http://www.eric.ed.gov/ERICWebPortal/detail?accno=ED078665 TUTOR User's Memo. Introduction to TUTOR], Computer-Based Education Research Laboratory, University of Illinois at Urbana Champaign, March 1973.
* [http://www.eric.ed.gov/ERICWebPortal/detail?accno=ED124130 PLATO User's Memo, Number One: Summary of TUTOR Commands and System Variables. Third Edition], by Elaine Avner, Computer-Based Education Research Laboratory, University of Illinois at Urbana Champaign, November, 1975.
* [http://www.eric.ed.gov/ERICWebPortal/detail?accno=ED208879 Summary of TUTOR Commands and System Variables (10th edition)], by Elaine Avner, Computer-Based Education Research Laboratory, University of Illinois at Urbana Champaign, November, 1981.
* [http://portal.acm.org/citation.cfm?id=963999 A personal evaluation of the PLATO system] bu Stewart A. Denenberg, ''ACM SIGCUE Outlook, 12,'' 2 (April 1978) pages 3–10.
* [http://www.cs.uiowa.edu/~jones/plato/#tutor Run Time Support for the TUTOR Language on a Small Computer System], by [[Douglas W. Jones]], 1976.
* [http://www.eric.ed.gov/ERICWebPortal/detail?accno=ED124149 The TUTOR Language], by Bruce Sherwood, Computer-Based Education Research Laboratory, University of Illinois at Urbana Champaign, June 1974.
* [http://www.group-s.net/tutorlanguage The TUTOR Language], by Bruce Sherwood, Control Data Education Company, 1977.
* [http://archives.library.illinois.edu/erec/University%20Archives/0713808/1974%20Nov%20X-15%20Plato%20IV%20Student%20Terminal%20Stifle.pdf The Plato IV Student Terminal], by Jack Stifle
* [http://vpython.org/contents/cTsource/cToverview.html The cT Programming Language (derived from TUTOR)] from Center for Design of Educational Computing at Carnegie Mellon University, by David Andersen, Bruce Sherwood, Judith Sherwood, and Kevin Whitley (no longer supported as of 2002).
