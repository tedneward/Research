title=Let's Build a Compiler (Jack Crenshaw)
tags=language
summary=A very good tutorial on writing a simple compiler in 16 articles. By Jack W. Crenshaw.
~~~~~~

[Original ZIP file of text files](/reading/languages/crenshaw-txt.zip) | [F# Version](https://github.com/craigstuntz/lbac)

# Copyright
The following copyright notice applies to everything below this line; all I have changed is formatting for easier reading (into Markdown).

```
*****************************************************************
*                                                               *
*                        COPYRIGHT NOTICE                       *
*                                                               *
*   Copyright (C) 1988 Jack W. Crenshaw. All rights reserved.   *
*                                                               *
*****************************************************************
```

# TUTOR (README)

This file contains all of the installments of Jack Crenshaw's tutorial on compiler construction, including the new Installment 15. The intended audience is those folks who are not computer scientists, but who enjoy computing and have always wanted to know how compilers work. A lot of compiler theory has been left out, but the practical issues are covered. By the time you have completed the series, you should be able to design and build your own working compiler. It will not be the world's best, nor will it put out incredibly tight code. Your product will probably never put Borland or MicroSoft out of business.  But it will work, and it will be yours.

A word about the file format: The files were originally created using Borland's DOS editor, Sprint.  Sprint could write to a text file only if you formatted the file to go to the selected printer.  I used the most common printer I could think of, the Epson MX-80, but even then the files ended up with printer control sequences at the beginning and end of each page.

To bring the files up to date and get myself positioned to continue the series, I recently (1994) converted all the files to work with Microsoft Word for Windows.  Unlike Sprint, Word allows you to write the file as a DOS text file.  Unfortunately, this gave me a new problem, because when Word is writing to a text file, it doesn't write hard page breaks or page numbers.  In other words, in six years we've gone from a file with page breaks and page numbers, but embedded escape sequences, to files with no embedded escape sequences but no page breaks or page numbers.  Isn't progress wonderful?

Of course, it's possible for me to insert the page numbers as straight text, rather than asking the editor to do it for me.  But since Word won't allow me to write page breaks to the file, we would end up with files with page numbers that may or may not fall at the ends of the pages, depending on your editor and your printer.  It seems to me that almost every file I've ever downloaded from CompuServe or BBS's that had such page numbering was incompatible with my printer, and gave me pages that were one line short or one line long, with the page numbers consequently walking up the page.  

So perhaps this new format is, after all, the safest one for general distribution.  The files as they exist will look just fine if read into any text editor capable of reading DOS text files.  Since most editors these days include rather sophisticated word processing capabilities, you should be able to get your editor to paginate for you, prior to printing.

I hope you like the tutorials.  Much thought went into them.

                                Jack W. Crenshaw
								CompuServe 72325,1327

# TUTOR1: INTRODUCTION

This series of articles is a tutorial on the theory  and practice of  developing language parsers and compilers.    Before  we  are finished,  we  will  have  covered  every   aspect   of  compiler construction, designed a new programming  language,  and  built a working compiler.

Though I am not a computer scientist by education (my Ph.D. is in a different  field, Physics), I have been interested in compilers for many years.  I have  bought  and tried to digest the contents of virtually every  book  on  the  subject ever written.  I don't mind  telling you that it was slow going.    Compiler  texts  are written for Computer  Science  majors, and are tough sledding for the rest of us.  But over the years a bit of it began to seep in. What really caused it to jell was when I began  to  branch off on my own and begin to try things on my own computer.  Now I plan to share with you what I have  learned.    At the end of this series you will by no means be  a  computer scientist, nor will you know all the esoterics of  compiler  theory.    I intend to completely ignore the more theoretical  aspects  of  the  subject.  What you _WILL_ know is all  the  practical aspects that one needs to know to build a working system.

This is a "learn-by-doing" series.  In the course of the series I will be performing  experiments  on  a  computer.    You  will be expected to follow along,  repeating  the  experiments that I do, and  performing  some  on your own.  I will be using Turbo Pascal 4.0 on a PC  clone.   I will periodically insert examples written in TP.  These will be executable code, which you will be expected to copy into your own computer and run.  If you don't have a copy of  Turbo,  you  will be severely limited in how well you will be able to follow what's going on.  If you don't have a copy, I urge you to get one.  After  all,  it's an excellent product, good for many other uses!

Some articles on compilers show you examples, or show you  (as in the case of Small-C) a finished product, which you can  then copy and  use without a whole lot of understanding of how it works.  I hope to do much more  than  that.    I  hope to teach you HOW the things get done,  so that you can go off on your own and not only reproduce what I have done, but improve on it.
                              
This is admittedly an ambitious undertaking, and it won't be done in  one page.  I expect to do it in the course  of  a  number  of articles.    Each  article will cover a single aspect of compiler theory,  and  will  pretty  much  stand  alone.   If  all  you're interested in at a given time is one  aspect,  then  you  need to look only at that one article.  Each article will be  uploaded as it  is complete, so you will have to wait for the last one before you can consider yourself finished.  Please be patient.

The average text on  compiler  theory covers a lot of ground that we won't be covering here.  The typical sequence is:

* An introductory chapter describing what a compiler is.
* A chapter or two on syntax equations, using Backus-Naur Form (BNF).
* A chapter or two on lexical scanning, with emphasis on deterministic and non-deterministic finite automata.
* Several chapters on parsing theory, beginning with top-down recursive descent, and ending with LALR parsers.
* A chapter on intermediate languages, with emphasis on P-code and similar reverse polish representations.
* Many chapters on alternative ways to handle subroutines and parameter passing, type declarations, and such.
* A chapter toward the end on code generation, usually for some imaginary CPU with a simple instruction set.  Most readers (and in fact, most college classes) never make it this far.
* A final chapter or two on optimization. This chapter often goes unread, too.

I'll  be taking a much different approach in  this  series.    To begin  with,  I  won't dwell long on options.  I'll be giving you _A_ way that works.  If you want  to  explore  options,  well and good ...  I  encourage  you  to do so ... but I'll be sticking to what I know.   I also will skip over most of the theory that puts people  to  sleep.  Don't get me  wrong:  I  don't  belittle  the theory, and it's vitally important  when it comes to dealing with the more tricky  parts  of  a  given  language.  But I believe in putting first things first.    Here we'll be dealing with the 95% of compiler techniques that don't need a lot of theory to handle.

I  also  will  discuss only one approach  to  parsing:  top-down, recursive descent parsing, which is the  _ONLY_  technique that's at  all   amenable  to  hand-crafting  a  compiler.    The  other approaches are only useful if you have a tool like YACC, and also don't care how much memory space the final product uses.
                              
I  also take a page from the work of Ron Cain, the author of  the original Small C.  Whereas almost all other compiler authors have historically  used  an  intermediate  language  like  P-code  and divided  the  compiler  into two parts (a front end that produces P-code,  and   a  back  end  that  processes  P-code  to  produce executable   object  code),  Ron  showed  us   that   it   is   a straightforward  matter  to  make  a  compiler  directly  produce executable  object  code,  in  the  form  of  assembler  language statements.  The code will _NOT_ be the world's tightest code ... producing optimized code is  a  much  more  difficult job. But it will work, and work reasonably well.  Just so that I  don't leave you with the impression that our end product will be worthless, I _DO_ intend to show you how  to  "soup up" the compiler with some optimization.

Finally, I'll be  using  some  tricks  that I've found to be most helpful in letting  me  understand what's going on without wading through a lot of boiler plate.  Chief among these  is  the use of single-character tokens, with no embedded spaces,  for  the early design work.  I figure that  if  I  can get a parser to recognize and deal with I-T-L, I can  get  it  to do the same with IF-THEN-ELSE.  And I can.  In the second "lesson,"   I'll  show  you just how easy it  is  to  extend  a  simple parser to handle tokens of arbitrary length.  As another  trick,  I  completely  ignore file I/O, figuring that  if  I  can  read source from the keyboard and output object to the screen, I can also do it from/to disk files. Experience  has  proven  that  once  a   translator   is  working correctly, it's a  straightforward  matter to redirect the I/O to files.    The last trick is that I make no attempt  to  do  error correction/recovery.   The   programs   we'll  be  building  will RECOGNIZE errors, and will not CRASH, but they  will  simply stop on the first error ... just like good ol' Turbo does.  There will be  other tricks that you'll see as you go. Most of them can't be found in any compiler textbook, but they work.

A word about style and efficiency.    As  you will see, I tend to write programs in  _VERY_  small, easily understood pieces.  None of the procedures we'll  be  working with will be more than about 15-20 lines long.  I'm a fervent devotee  of  the  KISS  (Keep It Simple, Sidney) school of software development.  I  try  to never do something tricky or  complex,  when  something simple will do. Inefficient?  Perhaps, but you'll like the  results.    As  Brian Kernighan has said,  FIRST  make  it  run, THEN make it run fast. If, later on,  you want to go back and tighten up the code in one of  our products, you'll be able to do so, since the code will be quite understandable. If you  do  so, however, I urge you to wait until the program is doing everything you want it to.

I  also  have  a  tendency  to  delay  building  a module until I discover that I need  it.    Trying  to anticipate every possible future contingency can  drive  you  crazy,  and  you'll generally guess wrong anyway.    In  this  modern day of screen editors and fast compilers, I don't hesitate to change a module when I feel I need a more powerful one.  Until then,  I'll  write  only  what I need.

One final caveat: One of the principles we'll be sticking to here is that we don't  fool  around with P-code or imaginary CPUs, but that we will start out on day one  producing  working, executable object code, at least in the form of  assembler  language source. However, you may not  like  my  choice  of assembler language ... it's 68000 code, which is what works on my system (under SK*DOS). I  think  you'll  find, though, that the translation to any other CPU such as the 80x86 will  be  quite obvious, though, so I don't see  a problem here.  In fact, I hope someone out there who knows the '86 language better than I do will offer  us  the  equivalent object code fragments as we need them.


THE CRADLE

Every program needs some boiler  plate  ...  I/O  routines, error message routines, etc.   The  programs we develop here will be no exceptions.    I've  tried to hold  this  stuff  to  an  absolute minimum, however, so that we  can  concentrate  on  the important stuff without losing it  among  the  trees.  The code given below represents about the minimum that we need to  get  anything done. It consists of some I/O routines, an error-handling routine and a skeleton, null main program.   I  call  it  our  cradle.    As we develop other routines, we'll add them to the cradle, and add the calls to them as we  need to.  Make a copy of the cradle and save it, because we'll be using it more than once.

There are many different ways to organize the scanning activities of  a  parser.   In Unix systems, authors tend to  use  `getc`  and `ungetc`.  I've had very good luck with the  approach  shown  here, which is to use  a  single, global, lookahead character.  Part of the initialization procedure  (the  only part, so far!) serves to "prime  the  pump"  by reading the first character from the input stream.  No other special  techniques are required with Turbo 4.0 ... each successive call to  GetChar will read the next character in the stream.


```
{--------------------------------------------------------------}
program Cradle;

{--------------------------------------------------------------}
{ Constant Declarations }

const TAB = ^I;

{--------------------------------------------------------------}
{ Variable Declarations }

var Look: char;              { Lookahead Character }
                              
{--------------------------------------------------------------}
{ Read New Character From Input Stream }

procedure GetChar;
begin
   Read(Look);
end;

{--------------------------------------------------------------}
{ Report an Error }

procedure Error(s: string);
begin
   WriteLn;
   WriteLn(^G, 'Error: ', s, '.');
end;


{--------------------------------------------------------------}
{ Report Error and Halt }

procedure Abort(s: string);
begin
   Error(s);
   Halt;
end;


{--------------------------------------------------------------}
{ Report What Was Expected }

procedure Expected(s: string);
begin
   Abort(s + ' Expected');
end;

{--------------------------------------------------------------}
{ Match a Specific Input Character }

procedure Match(x: char);
begin
   if Look = x then GetChar
   else Expected('''' + x + '''');
end;


{--------------------------------------------------------------}
{ Recognize an Alpha Character }

function IsAlpha(c: char): boolean;
begin
   IsAlpha := upcase(c) in ['A'..'Z'];
end;
                              

{--------------------------------------------------------------}

{ Recognize a Decimal Digit }

function IsDigit(c: char): boolean;
begin
   IsDigit := c in ['0'..'9'];
end;


{--------------------------------------------------------------}
{ Get an Identifier }

function GetName: char;
begin
   if not IsAlpha(Look) then Expected('Name');
   GetName := UpCase(Look);
   GetChar;
end;


{--------------------------------------------------------------}
{ Get a Number }

function GetNum: char;
begin
   if not IsDigit(Look) then Expected('Integer');
   GetNum := Look;
   GetChar;
end;


{--------------------------------------------------------------}
{ Output a String with Tab }

procedure Emit(s: string);
begin
   Write(TAB, s);
end;

{--------------------------------------------------------------}
{ Output a String with Tab and CRLF }

procedure EmitLn(s: string);
begin
   Emit(s);
   WriteLn;
end;

{--------------------------------------------------------------}
{ Initialize }

procedure Init;
begin
   GetChar;
end;


{--------------------------------------------------------------}
{ Main Program }

begin
   Init;
end.
{--------------------------------------------------------------}
```

That's it for this introduction.  Copy the code above into TP and compile it.  Make sure that it compiles and runs  correctly. Then proceed to the first lesson, which is on expression parsing.

# TUTOR2: EXPRESSION PARSING

GETTING STARTED

If you've read the introduction document to this series, you will already know what  we're  about.    You will also have copied the cradle software  into your Turbo Pascal system, and have compiled it.  So you should be ready to go.


The purpose of this article is for us to learn  how  to parse and translate mathematical expressions.  What we would like to see as output is a series of assembler-language statements  that perform the desired actions.    For purposes of definition, an expression is the right-hand side of an equation, as in

> `x = 2*y + 3/(4*z)`

In the early going, I'll be taking things in _VERY_  small steps. That's  so  that  the beginners among you won't get totally lost. There are also  some  very  good  lessons to be learned early on, that will serve us well later.  For the more experienced readers: bear with me.  We'll get rolling soon enough.

SINGLE DIGITS

In keeping with the whole theme of this series (KISS, remember?), let's start with the absolutely most simple case we can think of. That, to me, is an expression consisting of a single digit.

Before starting to code, make sure you have a  baseline  copy  of the  "cradle" that I gave last time.  We'll be using it again for other experiments.  Then add this code:

```
{---------------------------------------------------------------}
{ Parse and Translate a Math Expression }

procedure Expression;
begin
   EmitLn('MOVE #' + GetNum + ',D0')
end;
{---------------------------------------------------------------}
```

And add the  line  "Expression;"  to  the main program so that it
reads:
                              
```
{---------------------------------------------------------------}
begin
   Init;
   Expression;
end.
{---------------------------------------------------------------}
```

Now  run  the  program. Try any single-digit number as input. You should get a single line of assembler-language output.    Now try any  other character as input, and you'll  see  that  the  parser properly reports an error.

CONGRATULATIONS! You have just written a working translator!

OK, I grant you that it's pretty limited. But don't brush  it off too  lightly.  This little "compiler" does,  on  a  very  limited scale,  exactly  what  any larger compiler does:    it  correctly recognizes legal  statements in the input "language" that we have defined for it, and  it  produces  correct,  executable assembler code,  suitable  for  assembling  into  object  format.  Just  as importantly,  it correctly  recognizes  statements  that  are NOT legal, and gives a  meaningful  error message.  Who could ask for more?  As we expand our  parser,  we'd better make sure those two characteristics always hold true.

There  are  some  other  features  of  this  tiny  program  worth mentioning.    First,  you  can  see that we don't separate  code generation from parsing ...  as  soon as the parser knows what we want  done, it generates the object code directly.    In  a  real compiler, of course, the reads in GetChar would be  from  a  disk file, and the writes to another  disk  file, but this way is much easier to deal with while we're experimenting.

Also note that an expression must leave a result somewhere.  I've chosen the  68000  register  DO.    I  could have made some other choices, but this one makes sense.


BINARY EXPRESSIONS

Now that we have that under our belt,  let's  branch  out  a bit. Admittedly, an "expression" consisting of only  one  character is not going to meet our needs for long, so let's see what we can do to extend it. Suppose we want to handle expressions of the form:

```
                         1+2
     or                  4-3
     or, in general, <term> +/- <term>
```

(That's a bit of Backus-Naur Form, or BNF.)
                              
To do this we need a procedure that recognizes a term  and leaves its   result   somewhere,  and  another   that   recognizes   and distinguishes  between   a  '+'  and  a  '-'  and  generates  the appropriate code.  But if Expression is going to leave its result in DO, where should Term leave its result?    Answer:    the same place.  We're  going  to  have  to  save the first result of Term somewhere before we get the next one.

OK, basically what we want to  do  is have procedure Term do what Expression was doing before.  So just RENAME procedure Expression as Term, and enter the following new version of Expression:

```
{---------------------------------------------------------------}
{ Parse and Translate an Expression }

procedure Expression;
begin
   Term;
   EmitLn('MOVE D0,D1');
   case Look of
    '+': Add;
    '-': Subtract;
   else Expected('Addop');
   end;
end;
{--------------------------------------------------------------}
```

Next, just above Expression enter these two procedures:

```
{--------------------------------------------------------------}
{ Recognize and Translate an Add }

procedure Add;
begin
   Match('+');
   Term;
   EmitLn('ADD D1,D0');
end;


{-------------------------------------------------------------}
{ Recognize and Translate a Subtract }

procedure Subtract;
begin
   Match('-');
   Term;
   EmitLn('SUB D1,D0');
end;
{-------------------------------------------------------------}
```                              

When you're finished with that,  the order of the routines should
be:

* Term (The OLD Expression)
* Add
* Subtract
* Expression

Now run the program.  Try any combination you can think of of two single digits,  separated  by  a  '+' or a '-'.  You should get a series of four assembler-language instructions out  of  each run. Now  try  some  expressions with deliberate errors in them.  Does the parser catch the errors?

Take  a  look  at the object  code  generated.    There  are  two observations we can make.  First, the code generated is  NOT what we would write ourselves.  The sequence

```
        MOVE #n,D0
        MOVE D0,D1
```

is inefficient.  If we were  writing  this code by hand, we would probably just load the data directly to D1.

There is a  message  here:  code  generated by our parser is less efficient  than the code we would write by hand.  Get used to it. That's going to be true throughout this series.  It's true of all compilers to some extent.  Computer scientists have devoted whole lifetimes to the issue of code optimization, and there are indeed things that can be done to improve the quality  of  code  output. Some compilers do quite well, but  there  is a heavy price to pay in complexity, and it's  a  losing  battle  anyway ... there will probably never come a time when  a  good  assembler-language programmer can't out-program a compiler.    Before  this  session is over, I'll briefly mention some ways that we can do a  little optimization,  just  to  show you that we can indeed improve things without too much trouble.  But remember, we're here to learn, not to see how tight we can make  the  object  code.    For  now, and really throughout  this  series  of  articles,  we'll  studiously ignore optimization and  concentrate  on  getting  out  code that works.

Speaking of which: ours DOESN'T!  The code is _WRONG_!  As things are working  now, the subtraction process subtracts D1 (which has the FIRST argument in it) from D0 (which has the second).  That's the wrong way, so we end up with the wrong  sign  for the result. So let's fix up procedure Subtract with a  sign-changer,  so that it reads

```
{-------------------------------------------------------------}
{ Recognize and Translate a Subtract }

procedure Subtract;
begin
   Match('-');
   Term;
   EmitLn('SUB D1,D0');
   EmitLn('NEG D0');
end;
{-------------------------------------------------------------}
```

Now  our  code  is even less efficient, but at least it gives the right answer!  Unfortunately, the  rules that give the meaning of math expressions require that the terms in an expression come out in an inconvenient  order  for  us.    Again, this is just one of those facts of life you learn to live with.   This  one will come back to haunt us when we get to division.

OK,  at this point we have a parser that can recognize the sum or difference of two digits.    Earlier,  we  could only recognize a single digit.  But  real  expressions can have either form (or an infinity of others).  For kicks, go back and run the program with the single input line '1'.

Didn't work, did it?   And  why  should  it?    We  just finished telling  our  parser  that the only kinds of expressions that are legal are those  with  two  terms.    We  must  rewrite procedure Expression to be a lot more broadminded, and this is where things start to take the shape of a real parser.




GENERAL EXPRESSIONS

In the  REAL  world,  an  expression  can  consist of one or more terms, separated  by  "addops"  ('+'  or  '-').   In BNF, this is written

```
          <expression> ::= <term> [<addop> <term>]*
```

We  can  accomodate  this definition of an  expression  with  the addition of a simple loop to procedure Expression:

```
{---------------------------------------------------------------}
{ Parse and Translate an Expression }

procedure Expression;
begin
   Term;
   while Look in ['+', '-'] do begin
      EmitLn('MOVE D0,D1');
      case Look of
       '+': Add;
       '-': Subtract;
      else Expected('Addop');
      end;
   end;
end;
{--------------------------------------------------------------}
```

NOW we're getting somewhere!   This version handles any number of terms, and it only cost us two extra lines of code.  As we go on, you'll discover that this is characteristic  of  top-down parsers ... it only takes a few lines of code to accomodate extensions to the  language.    That's  what  makes  our  incremental  approach possible.  Notice, too, how well the code of procedure Expression matches the BNF definition.   That, too, is characteristic of the method.  As you get proficient in the approach, you'll  find that you can turn BNF into parser code just about as  fast  as you can type!

OK, compile the new version of our parser, and give it a try.  As usual,  verify  that  the  "compiler"   can   handle   any  legal expression,  and  will  give a meaningful error  message  for  an illegal one.  Neat, eh?  You might note that in our test version, any error message comes  out  sort of buried in whatever code had already been  generated. But remember, that's just because we are using  the  CRT  as  our  "output  file"  for   this   series  of experiments.  In a production version, the two  outputs  would be separated ... one to the output file, and one to the screen.


USING THE STACK

At  this  point  I'm going to  violate  my  rule  that  we  don't introduce any complexity until  it's  absolutely  necessary, long enough to point out a problem with the code we're generating.  As things stand now, the parser  uses D0 for the "primary" register, and D1 as  a place to store the partial sum.  That works fine for now,  because  as  long as we deal with only the "addops" '+' and '-', any new term can be added in as soon as it is found.  But in general that isn't true.  Consider, for example, the expression 

```
               1+(2-(3+(4-5)))
```

If we put the '1' in D1, where  do  we  put  the  '2'?    Since a general expression can have any degree of complexity, we're going to run out of registers fast!

Fortunately,  there's  a  simple  solution.    Like  every modern microprocessor, the 68000 has a stack, which is the perfect place to save a variable number of items. So instead of moving the term in D0 to  D1, let's just push it onto the stack.  For the benefit of  those unfamiliar with 68000 assembler  language,  a  push  is written `-(SP)` and a pop, `(SP)+ `.


So let's change the EmitLn in Expression to read:

```
               EmitLn('MOVE D0,-(SP)');
```

and the two lines in Add and Subtract to

```
               EmitLn('ADD (SP)+,D0')
```

and
```
               EmitLn('SUB (SP)+,D0'),
```

respectively.  Now try the parser again and make sure  we haven't broken it.

Once again, the generated code is less efficient than before, but it's a necessary step, as you'll see.


MULTIPLICATION AND DIVISION

Now let's get down to some REALLY serious business.  As  you  all know,  there  are  other  math   operators   than   "addops"  ... expressions can also have  multiply  and  divide operations.  You also  know  that  there  is  an implied operator  PRECEDENCE,  or hierarchy, associated with expressions, so that in  an expression like

```
                    2 + 3 * 4
```

we know that we're supposed to multiply FIRST, then  add.    (See why we needed the stack?)

In the early days of compiler technology, people used some rather complex techniques to insure that the  operator  precedence rules were  obeyed.    It turns out,  though,  that  none  of  this  is necessary ... the rules can be accommodated quite  nicely  by our top-down  parsing technique.  Up till now,  the  only  form  that we've considered for a term is that of a  single  decimal  digit.

More generally, we  can  define  a  term as a PRODUCT of FACTORS; i.e.,

```
          <term> ::= <factor>  [ <mulop> <factor ]*
```

What  is  a factor?  For now, it's what a term used to be  ...  a single digit.

Notice the symmetry: a  term  has the same form as an expression. As a matter of fact, we can  add  to  our  parser  with  a little judicious  copying and renaming.  But  to  avoid  confusion,  the listing below is the complete set of parsing routines.  (Note the way we handle the reversal of operands in Divide.)

```
{---------------------------------------------------------------}
{ Parse and Translate a Math Factor }

procedure Factor;
begin
   EmitLn('MOVE #' + GetNum + ',D0')
end;


{--------------------------------------------------------------}
{ Recognize and Translate a Multiply }

procedure Multiply;
begin
   Match('*');
   Factor;
   EmitLn('MULS (SP)+,D0');
end;


{-------------------------------------------------------------}
{ Recognize and Translate a Divide }

procedure Divide;
begin
   Match('/');
   Factor;
   EmitLn('MOVE (SP)+,D1');
   EmitLn('DIVS D1,D0');
end;


{---------------------------------------------------------------}
{ Parse and Translate a Math Term }

procedure Term;
begin
   Factor;
   while Look in ['*', '/'] do begin
      EmitLn('MOVE D0,-(SP)');
      case Look of
       '*': Multiply;
       '/': Divide;
      else Expected('Mulop');
      end;
   end;
end;

{--------------------------------------------------------------}
{ Recognize and Translate an Add }

procedure Add;
begin
   Match('+');
   Term;
   EmitLn('ADD (SP)+,D0');
end;

{-------------------------------------------------------------}
{ Recognize and Translate a Subtract }

procedure Subtract;
begin
   Match('-');
   Term;
   EmitLn('SUB (SP)+,D0');
   EmitLn('NEG D0');
end;

{---------------------------------------------------------------}
{ Parse and Translate an Expression }

procedure Expression;
begin
   Term;
   while Look in ['+', '-'] do begin
      EmitLn('MOVE D0,-(SP)');
      case Look of
       '+': Add;
       '-': Subtract;
      else Expected('Addop');
      end;
   end;
end;
{--------------------------------------------------------------}
```

Hot dog!  A NEARLY functional parser/translator, in only 55 lines of Pascal!  The output is starting to look really useful,  if you continue to overlook the inefficiency,  which  I  hope  you will. Remember, we're not trying to produce tight code here.


PARENTHESES

We  can  wrap  up this part of the parser with  the  addition  of parentheses with  math expressions.  As you know, parentheses are a  mechanism to force a desired operator  precedence.    So,  for example, in the expression

```
               2*(3+4)
```

the parentheses force the addition  before  the  multiply.   Much more importantly, though, parentheses  give  us  a  mechanism for defining expressions of any degree of complexity, as in

```
               (1+2)/((3+4)+(5-6))
```

The  key  to  incorporating  parentheses  into our parser  is  to realize that  no matter how complicated an expression enclosed by parentheses may be,  to  the  rest  of  the world it looks like a simple factor.  That is, one of the forms for a factor is:

```
          <factor> ::= (<expression>)
```

This is where the recursion comes in. An expression can contain a factor which contains another expression which contains a factor, etc., ad infinitum.

Complicated or not, we can take care of this by adding just a few lines of Pascal to procedure Factor:
                             
```
{---------------------------------------------------------------}
{ Parse and Translate a Math Factor }

procedure Expression; Forward;

procedure Factor;
begin
   if Look = '(' then begin
      Match('(');
      Expression;
      Match(')');
      end
   else
      EmitLn('MOVE #' + GetNum + ',D0');
end;
{--------------------------------------------------------------}
```

Note again how easily we can extend the parser, and how  well the Pascal code matches the BNF syntax.

As usual, compile the new version and make sure that it correctly parses  legal sentences, and flags illegal  ones  with  an  error message.


UNARY MINUS

At  this  point,  we have a parser that can handle just about any expression, right?  OK, try this input sentence:

```
                         -1
```

WOOPS!  It doesn't work, does it?   Procedure  Expression expects everything to start with an integer, so it coughs up  the leading minus  sign.  You'll find that +3 won't  work  either,  nor  will something like

```
                    -(3-2)
```

There  are  a  couple of ways to fix the problem.    The  easiest (although not necessarily the best)  way is to stick an imaginary leading zero in  front  of  expressions  of this type, so that -3 becomes 0-3.  We can easily patch this into our  existing version of Expression:


```
{---------------------------------------------------------------}
{ Parse and Translate an Expression }

procedure Expression;
begin
   if IsAddop(Look) then
      EmitLn('CLR D0')
   else
      Term;
   while IsAddop(Look) do begin
      EmitLn('MOVE D0,-(SP)');
      case Look of
       '+': Add;
       '-': Subtract;
      else Expected('Addop');
      end;
   end;
end;
{--------------------------------------------------------------}
```

I TOLD you that making changes  was  easy!   This time it cost us only  three  new lines of Pascal.   Note  the  new  reference  to function IsAddop.  Since the test for an addop appeared  twice, I chose  to  embed  it in the new function.  The  form  of  IsAddop should be apparent from that for IsAlpha.  Here it is:

```
{--------------------------------------------------------------}
{ Recognize an Addop }

function IsAddop(c: char): boolean;
begin
   IsAddop := c in ['+', '-'];
end;
{--------------------------------------------------------------}
```

OK, make these changes to the program and recompile.   You should also include IsAddop in your baseline copy of the cradle.   We'll be needing  it  again  later.   Now try the input -1 again.  Wow! The efficiency of the code is  pretty  poor ... six lines of code just for loading a simple constant ... but at least it's correct. Remember, we're not trying to replace Turbo Pascal here.

At this point we're just about finished with the structure of our expression parser.   This version of the program should correctly parse and compile just about any expression you care to  throw at it.    It's still limited in that  we  can  only  handle  factors involving single decimal digits.    But I hope that by now you're starting  to  get  the  message  that we can  accomodate  further extensions  with  just  some  minor  changes to the parser.   You probably won't be  surprised  to  hear  that a variable or even a function call is just another kind of a factor.
                             
In  the next session, I'll show you just how easy it is to extend our parser to take care of  these  things too, and I'll also show you just  how easily we can accomodate multicharacter numbers and variable names.  So you see,  we're  not  far at all from a truly useful parser.




A WORD ABOUT OPTIMIZATION

Earlier in this session, I promised to give you some hints  as to how we can improve the quality of the generated code.  As I said, the  production of tight code is not the  main  purpose  of  this series of articles.  But you need to at least know that we aren't just  wasting our time here ... that we  can  indeed  modify  the parser further to  make  it produce better code, without throwing away everything we've done to date.  As usual, it turns  out that SOME optimization is not that difficult to do ... it simply takes some extra code in the parser.

There are two basic approaches we can take:

* Try to fix up the code after it's generated

    This is  the concept of "peephole" optimization.  The general idea it that we  know  what  combinations of instructions the compiler  is  going  to generate, and we also know which ones are pretty bad (such as the code for -1, above).    So all we do  is  to   scan   the  produced  code,  looking  for  those combinations, and replacing  them  by better ones.  It's sort of   a   macro   expansion,   in   reverse,   and   a  fairly straightforward  exercise  in   pattern-matching.   The  only complication,  really, is that there may be  a  LOT  of  such combinations to look for.  It's called  peephole optimization simply because it only looks at a small group of instructions at a time.  Peephole  optimization can have a dramatic effect on  the  quality  of the code,  with  little  change  to  the structure of the compiler  itself.   There is a price to pay, though,  in  both  the  speed,   size, and complexity of  the compiler.  Looking for all those combinations calls for a lot of IF tests, each one of which is a source of error.  And, of course, it takes time.

    In  the  classical  implementation  of a peephole optimizer, it's done as a second pass to the compiler.  The  output code is  written  to  disk,  and  then  the  optimizer  reads  and processes the disk file again.  As a matter of fact,  you can see that the optimizer could  even be a separate PROGRAM from the compiler proper.  Since the optimizer only  looks  at the code through a  small  "window"  of  instructions  (hence the name), a better implementation would be to simply buffer up a few lines of output, and scan the buffer after each EmitLn.

* Try to generate better code in the first place
                             
    This approach calls for us to look for  special  cases BEFORE we Emit them.  As a trivial example,  we  should  be  able to  identify a constant zero,  and  Emit a CLR instead of a load, or even do nothing at all, as in an add of zero, for example.  Closer to home, if we had chosen to recognize the unary minus in Factor  instead of in Expression, we could treat constants like -1 as ordinary constants,  rather  then  generating them from  positive  ones.   None of these things are difficult to deal with ... they only add extra tests in the code, which is why  I  haven't  included them in our program.  The way I see it, once we get to the point that we have a working compiler, generating useful code  that  executes, we can always go back and tweak the thing to tighten up the code produced.   That's why there are Release 2.0's in the world.

There IS one more type  of  optimization  worth  mentioning, that seems to promise pretty tight code without too much hassle.  It's my "invention" in the  sense  that I haven't seen it suggested in print anywhere, though I have  no  illusions  that  it's original with me.

This  is to avoid such a heavy use of the stack, by making better use of the CPU registers.  Remember back when we were  doing only addition  and  subtraction,  that we used registers  D0  and  D1, rather than the stack?  It worked, because with  only  those  two operations, the "stack" never needs more than two entries.

Well,  the 68000 has eight data registers.  Why not use them as a privately managed stack?  The key is to recognize  that,  at  any point in its processing,  the  parser KNOWS how many items are on the  stack, so it can indeed manage it properly.  We can define a private "stack pointer" that keeps  track  of  which  stack level we're at, and addresses the  corresponding  register.   Procedure Factor,  for  example,  would  not  cause data to be loaded  into register  D0,  but   into  whatever  the  current  "top-of-stack" register happened to be.

What we're doing in effect is to replace the CPU's RAM stack with a  locally  managed  stack  made  up  of  registers.    For  most expressions, the stack level  will  never  exceed eight, so we'll get pretty good code out.  Of course, we also  have  to deal with those  odd cases where the stack level  DOES  exceed  eight,  but that's no problem  either.    We  simply let the stack spill over into the CPU  stack.    For  levels  beyond eight, the code is no worse  than  what  we're generating now, and for levels less than eight, it's considerably better.

For the record, I  have  implemented  this  concept, just to make sure  it  works  before  I  mentioned  it to you.  It does.    In practice, it turns out that you can't really use all eight levels ... you need at least one register free to  reverse  the  operand order for division  (sure  wish  the  68000 had an XTHL, like the 8080!).  For expressions  that  include  function calls, we would also need a register reserved for them. Still, there  is  a  nice improvement in code size for most expressions.

So, you see, getting  better  code  isn't  that difficult, but it does add complexity to the our translator ...  complexity  we can do without at this point.  For that reason,  I  STRONGLY  suggest that we continue to ignore efficiency issues for the rest of this series,  secure  in  the knowledge that we can indeed improve the code quality without throwing away what we've done.

Next lesson, I'll show you how to deal with variables factors and function calls.  I'll also show you just how easy it is to handle multicharacter tokens and embedded white space.
 
# TUTOR3: MORE EXPRESSIONS

INTRODUCTION

In the last installment, we examined the techniques used to parse and  translate a general math expression.  We  ended  up  with  a simple parser that  could handle arbitrarily complex expressions, with two restrictions:

* No variables were allowed, only numeric factors
* The numeric factors were limited to single digits

In this installment, we'll get  rid of those restrictions.  We'll also extend what  we've  done  to  include  assignment statements function  calls  and.    Remember,   though,   that   the  second restriction was  mainly self-imposed  ... a choice of convenience on our part, to make life easier and to let us concentrate on the fundamental concepts.    As  you'll  see  in  a bit, it's an easy restriction to get rid of, so don't get  too  hung  up  about it. We'll use the trick when it serves us to do so, confident that we can discard it when we're ready to.


VARIABLES

Most expressions  that we see in practice involve variables, such as

```
               b * b + 4 * a * c
```

No parser is much good without being able  to  deal  with  them. Fortunately, it's also quite easy to do.

Remember that in our parser as it currently stands, there are two kinds of  factors  allowed:  integer  constants  and  expressions within parentheses.  In BNF notation,

     <factor> ::= <number> | (<expression>)

The '|' stands for "or", meaning of course that either form  is a legal form for a factor.   Remember,  too, that we had no trouble knowing which was which  ...  the  lookahead  character is a left paren '(' in one case, and a digit in the other.
                              
It probably won't come as too much of a surprise that  a variable is just another kind of factor.    So  we extend the BNF above to read:

```
     <factor> ::= <number> | (<expression>) | <variable>
```

Again, there is no  ambiguity:  if  the  lookahead character is a letter,  we  have  a variable; if a digit, we have a number. Back when we translated the number, we just issued code  to  load  the number,  as immediate data, into D0.  Now we do the same, only we load a variable.

A minor complication in the  code generation arises from the fact that most  68000 operating systems, including the SK*DOS that I'm using, require the code to be  written  in "position-independent" form, which  basically means that everything is PC-relative.  The format for a load in this language is

```
               MOVE X(PC),D0
```

where X is, of course, the variable name.  Armed with that, let's modify the current version of Factor to read:

```
{---------------------------------------------------------------}
{ Parse and Translate a Math Factor }

procedure Expression; Forward;

procedure Factor;
begin
   if Look = '(' then begin
      Match('(');
      Expression;
      Match(')');
      end
   else if IsAlpha(Look) then
      EmitLn('MOVE ' + GetName + '(PC),D0')
   else
      EmitLn('MOVE #' + GetNum + ',D0');
end;
{--------------------------------------------------------------}
```

I've  remarked before how easy it is to  add  extensions  to  the parser, because of  the  way  it's  structured.  You can see that this  still  holds true here.  This time it cost us  all  of  two extra lines of code.  Notice, too, how the if-else-else structure exactly parallels the BNF syntax equation.

OK, compile and test this new version of the parser.  That didn't hurt too badly, did it?
                              

FUNCTIONS

There is only one  other  common kind of factor supported by most languages: the function call.  It's really too early  for  us  to deal with functions well,  because  we  haven't yet addressed the issue of parameter passing.  What's more, a "real" language would include a mechanism to  support  more than one type, one of which should be a function type.  We haven't gotten there  yet, either. But I'd still like to deal with functions  now  for  a  couple of reasons.    First,  it  lets  us  finally  wrap  up the parser in something very close to its final form, and second, it  brings up a new issue which is very much worth talking about.

Up  till  now,  we've  been  able  to  write  what  is  called  a "predictive parser."  That  means  that at any point, we can know by looking at the current  lookahead character exactly what to do next.  That isn't the case when we add functions.  Every language has some naming rules  for  what  constitutes a legal identifier. For the present, ours is simply that it  is  one  of  the letters 'a'..'z'.  The  problem  is  that  a variable name and a function name obey  the  same  rules.   So how can we tell which is which? One way is to require that they each be declared before  they are used.    Pascal  takes that approach.  The other is that we might require a function to be followed by a (possibly empty) parameter list.  That's the rule used in C.

Since  we  don't  yet have a mechanism for declaring types, let's use the C  rule for now.  Since we also don't have a mechanism to deal  with parameters, we can only handle  empty  lists,  so  our function calls will have the form

```
                    x()
```

Since  we're  not  dealing  with  parameter lists yet,  there  is nothing  to do but to call the function, so we need only to issue a BSR (call) instead of a MOVE.

Now that there are two  possibilities for the "If IsAlpha" branch of the test in Factor, let's treat them in a  separate procedure. Modify Factor to read:

```
{---------------------------------------------------------------}
{ Parse and Translate a Math Factor }

procedure Expression; Forward;

procedure Factor;
begin
   if Look = '(' then begin
      Match('(');
      Expression;
      Match(')');
      end
   else if IsAlpha(Look) then
      Ident
   else
      EmitLn('MOVE #' + GetNum + ',D0');
end;
{--------------------------------------------------------------}
```

and insert before it the new procedure

```
{---------------------------------------------------------------}
{ Parse and Translate an Identifier }

procedure Ident;
var Name: char;
begin
   Name := GetName;
   if Look = '(' then begin
      Match('(');
      Match(')');
      EmitLn('BSR ' + Name);
      end
   else
      EmitLn('MOVE ' + Name + '(PC),D0')
end;
{---------------------------------------------------------------}
```

OK, compile and  test  this  version.  Does  it  parse  all legal expressions?  Does it correctly flag badly formed ones?

The important thing to notice is that even though  we  no  longer have  a predictive parser, there is  little  or  no  complication added with the recursive descent approach that we're  using.   At the point where  Factor  finds an identifier (letter), it doesn't know whether it's a variable name or a function name, nor does it really care.  It simply passes it on to Ident and leaves it up to that procedure to figure it out.  Ident, in  turn,  simply  tucks away the identifier and then reads one more  character  to decide which kind of identifier it's dealing with.

Keep this approach in mind.  It's a very powerful concept, and it should be used  whenever  you  encounter  an  ambiguous situation requiring further lookahead.   Even  if  you  had to look several tokens ahead, the principle would still work.


MORE ON ERROR HANDLING

As long as we're talking  philosophy,  there's  another important issue to point out:  error  handling.    Notice that although the parser correctly rejects (almost)  every malformed  expression we can  throw at it, with a meaningful  error  message,  we  haven't really had to  do much work to make that happen.  In fact, in the whole parser per se (from  Ident  through  Expression)  there are only two calls to the error routine, Expected.  Even those aren't necessary ... if you'll look again in Term and Expression, you'll see that those statements can't be reached.  I put them  in early on as a  bit  of  insurance,  but  they're no longer needed.  Why don't you delete them now?

So how did we get this nice error handling  virtually  for  free? It's simply  that  I've  carefully  avoided  reading  a character directly  using  GetChar.  Instead,  I've  relied  on  the  error handling in GetName,  GetNum,  and  Match  to  do  all  the error checking for me.    Astute  readers  will notice that some of the calls to Match (for example, the ones in Add  and  Subtract)  are also unnecessary ... we already know what the character is by the time  we get there ... but it maintains  a  certain  symmetry  to leave them in, and  the  general rule to always use Match instead of GetChar is a good one.

I mentioned an "almost" above.   There  is a case where our error handling  leaves a bit to be desired.  So far we haven't told our parser what and  end-of-line  looks  like,  or  what  to  do with embedded  white  space.  So  a  space  character  (or  any  other character not part of the recognized character set) simply causes the parser to terminate, ignoring the unrecognized characters.

It  could  be  argued  that  this is reasonable behavior at  this point.  In a "real"  compiler, there is usually another statement following the one we're working on, so any characters not treated as part of our expression will either be used for or  rejected as part of the next one.

But  it's  also a very easy thing to fix up, even  if  it's  only temporary.   All  we  have  to  do  is assert that the expression should end with an end-of-line , i.e., a carriage return.

To see what I'm talking about, try the input line

> 1+2 <space> 3+4

See  how the space was treated as a terminator?  Now, to make the compiler properly flag this, add the line

```
if Look <> CR then Expected('Newline');
```

in the main  program,  just  after  the call to Expression.  That catches anything left over in the input stream.  Don't  forget to define CR in the const statement:

```
CR = ^M;
```
As usual, recompile the program and verify that it does what it's supposed to.


ASSIGNMENT STATEMENTS

OK,  at  this  point we have a parser that works very nicely. I'd like to  point  out  that  we  got  it  using  only  88  lines of executable code, not  counting  what  was  in  the  cradle.   The compiled  object  file  is  a  whopping  4752  bytes.   Not  bad, considering we weren't trying very  hard  to  save  either source code or object size.  We just stuck to the KISS principle.

Of course, parsing an expression  is not much good without having something to do with it afterwards.  Expressions USUALLY (but not always) appear in assignment statements, in the form

> <Ident> = <Expression>

We're only a breath  away  from being able to parse an assignment statement, so let's take that  last  step.  Just  after procedure Expression, add the following new procedure:

```
{--------------------------------------------------------------}
{ Parse and Translate an Assignment Statement }

procedure Assignment;
var Name: char;
begin
   Name := GetName;
   Match('=');
   Expression;
   EmitLn('LEA ' + Name + '(PC),A0');
   EmitLn('MOVE D0,(A0)')
end;
{--------------------------------------------------------------}
```

Note again that the  code  exactly parallels the BNF.  And notice further that  the error checking was painless, handled by GetName and Match.

The reason for the two  lines  of  assembler  has  to  do  with a peculiarity in the  68000,  which requires this kind of construct for PC-relative code.

Now change the call to Expression, in the main program, to one to Assignment.  That's all there is to it.

Son of a gun!  We are actually  compiling  assignment statements. If those were the only kind of statements in a language, all we'd have to  do  is  put  this in a loop and we'd have a full-fledged compiler!

Well, of course they're not the only kind.  There are also little items  like  control  statements  (IFs  and  loops),  procedures, declarations, etc.  But cheer  up.    The  arithmetic expressions that we've been dealing with are among the most challenging  in a language.      Compared  to  what  we've  already  done,  control statements  will be easy.  I'll be covering  them  in  the  fifth installment.  And the other statements will all fall in  line, as long as we remember to KISS.


MULTI-CHARACTER TOKENS

Throughout  this   series,   I've   been   carefully  restricting everything  we  do  to  single-character  tokens,  all  the while assuring  you  that  it wouldn't be difficult to extend to multi- character ones.    I  don't  know if you believed me or not ... I wouldn't  really blame you if you were a  bit  skeptical.    I'll continue  to use  that approach in  the  sessions  which  follow, because it helps keep complexity away.    But I'd like to back up those  assurances, and wrap up this portion  of  the  parser,  by showing you  just  how  easy  that  extension  really is.  In the process, we'll also provide for embedded white space.  Before you make  the  next  few changes, though, save the current version of the parser away under another name.  I have some more uses for it in  the  next  installment, and we'll be working with the single- character version.

Most compilers separate out the handling of the input stream into a separate module called  the  lexical scanner.  The idea is that the scanner deals with all the character-by-character  input, and returns the separate units  (tokens)  of  the  stream.  There may come a time when we'll want  to  do something like that, too, but for  now  there  is  no  need. We can handle the  multi-character tokens that we need by very slight and  very  local modifications to GetName and GetNum.

The usual definition of an identifier is that the first character must be a letter, but the rest can be  alphanumeric  (letters  or numbers).  To  deal  with  this,  we  need  one  other recognizer function

```
{--------------------------------------------------------------}
{ Recognize an Alphanumeric }

function IsAlNum(c: char): boolean;
begin
   IsAlNum := IsAlpha(c) or IsDigit(c);
end;
{--------------------------------------------------------------}
```

Add this function to your parser.  I put mine just after IsDigit. While you're  at  it,  might  as  well  include it as a permanent member of Cradle, too.

Now, we need  to  modify  function  GetName  to  return  a string instead of a character:

```
{--------------------------------------------------------------}
{ Get an Identifier }

function GetName: string;
var Token: string;
begin
   Token := '';
   if not IsAlpha(Look) then Expected('Name');
   while IsAlNum(Look) do begin
      Token := Token + UpCase(Look);
      GetChar;
   end;
   GetName := Token;
end;
{--------------------------------------------------------------}
```

Similarly, modify GetNum to read:

```
{--------------------------------------------------------------}
{ Get a Number }

function GetNum: string;
var Value: string;
begin
   Value := '';
   if not IsDigit(Look) then Expected('Integer');
   while IsDigit(Look) do begin
      Value := Value + Look;
      GetChar;
   end;
   GetNum := Value;
end;
{--------------------------------------------------------------}
```

Amazingly enough, that  is  virtually all the changes required to the  parser!  The local variable Name  in  procedures  Ident  and Assignment was originally declared as  "char",  and  must  now be declared string[8].  (Clearly,  we  could  make the string length longer if we chose, but most assemblers limit the length anyhow.) Make  this  change,  and  then  recompile and test. _NOW_ do  you believe that it's a simple change?


WHITE SPACE

Before we leave this parser for awhile, let's  address  the issue of  white  space.   As it stands now, the parser  will  barf  (or simply terminate) on a single space  character  embedded anywhere in  the input stream.  That's pretty  unfriendly  behavior.    So let's "productionize" the thing  a  bit  by eliminating this last restriction.

The  key  to easy handling of white space is to come  up  with  a simple rule for how the parser should treat the input stream, and to  enforce that rule everywhere.  Up  till  now,  because  white space wasn't permitted, we've been able to assume that after each parsing action, the lookahead character  Look  contains  the next meaningful  character,  so  we could test it  immediately.    Our design was based upon this principle.

It still sounds like a good rule to me, so  that's  the one we'll use.    This  means  that  every routine that advances the  input stream must skip over white space, and leave  the  next non-white character in Look.   Fortunately,  because  we've been careful to use GetName, GetNum, and Match  for most of our input processing, it is  only  those  three  routines  (plus  Init) that we need to modify.

Not  surprisingly,  we  start  with  yet  another  new recognizer routine:

```
{--------------------------------------------------------------}
{ Recognize White Space }

function IsWhite(c: char): boolean;
begin
   IsWhite := c in [' ', TAB];
end;
{--------------------------------------------------------------}
```

We  also need a routine that  will  eat  white-space  characters, until it finds a non-white one:

```
{--------------------------------------------------------------}
{ Skip Over Leading White Space }

procedure SkipWhite;
begin
   while IsWhite(Look) do
      GetChar;
end;
{--------------------------------------------------------------}
```

Now,  add calls to SkipWhite to Match,  GetName,  and  GetNum  as shown below:

```
{--------------------------------------------------------------}
{ Match a Specific Input Character }

procedure Match(x: char);
begin
   if Look <> x then Expected('''' + x + '''')
   else begin
      GetChar;
      SkipWhite;
   end;
end;


{--------------------------------------------------------------}
{ Get an Identifier }

function GetName: string;
var Token: string;
begin
   Token := '';
   if not IsAlpha(Look) then Expected('Name');
   while IsAlNum(Look) do begin
      Token := Token + UpCase(Look);
      GetChar;
   end;
   GetName := Token;
   SkipWhite;
end;


{--------------------------------------------------------------}
{ Get a Number }

function GetNum: string;
var Value: string;
begin
   Value := '';
   if not IsDigit(Look) then Expected('Integer');
   while IsDigit(Look) do begin
      Value := Value + Look;
      GetChar;
   end;
   GetNum := Value;
   SkipWhite;
end;
{--------------------------------------------------------------}
```

(Note  that  I  rearranged  Match  a  bit,  without changing  the functionality.)

Finally, we need to skip over leading blanks where we  "prime the pump" in Init:

```                             
{--------------------------------------------------------------}
{ Initialize }

procedure Init;
begin
   GetChar;
   SkipWhite;
end;
{--------------------------------------------------------------}
```

Make these changes and recompile the program.  You will find that you will have to move Match below SkipWhite, to  avoid  an  error message from the Pascal compiler.  Test the program as  always to make sure it works properly.

Since we've made quite  a  few  changes  during this session, I'm reproducing the entire parser below:

```
{--------------------------------------------------------------}
program parse;

{--------------------------------------------------------------}
{ Constant Declarations }

const TAB = ^I;
       CR = ^M;

{--------------------------------------------------------------}
{ Variable Declarations }

var Look: char;              { Lookahead Character }

{--------------------------------------------------------------}
{ Read New Character From Input Stream }

procedure GetChar;
begin
   Read(Look);
end;

{--------------------------------------------------------------}
{ Report an Error }

procedure Error(s: string);
begin
   WriteLn;
   WriteLn(^G, 'Error: ', s, '.');
end;


{--------------------------------------------------------------}
{ Report Error and Halt }
                             
procedure Abort(s: string);
begin
   Error(s);
   Halt;
end;


{--------------------------------------------------------------}
{ Report What Was Expected }

procedure Expected(s: string);
begin
   Abort(s + ' Expected');
end;


{--------------------------------------------------------------}
{ Recognize an Alpha Character }

function IsAlpha(c: char): boolean;
begin
   IsAlpha := UpCase(c) in ['A'..'Z'];
end;


{--------------------------------------------------------------}
{ Recognize a Decimal Digit }

function IsDigit(c: char): boolean;
begin
   IsDigit := c in ['0'..'9'];
end;


{--------------------------------------------------------------}
{ Recognize an Alphanumeric }

function IsAlNum(c: char): boolean;
begin
   IsAlNum := IsAlpha(c) or IsDigit(c);
end;


{--------------------------------------------------------------}
{ Recognize an Addop }

function IsAddop(c: char): boolean;
begin
   IsAddop := c in ['+', '-'];
end;


{--------------------------------------------------------------}
{ Recognize White Space }
                             
function IsWhite(c: char): boolean;
begin
   IsWhite := c in [' ', TAB];
end;


{--------------------------------------------------------------}
{ Skip Over Leading White Space }

procedure SkipWhite;
begin
   while IsWhite(Look) do
      GetChar;
end;


{--------------------------------------------------------------}
{ Match a Specific Input Character }

procedure Match(x: char);
begin
   if Look <> x then Expected('''' + x + '''')
   else begin
      GetChar;
      SkipWhite;
   end;
end;


{--------------------------------------------------------------}
{ Get an Identifier }

function GetName: string;
var Token: string;
begin
   Token := '';
   if not IsAlpha(Look) then Expected('Name');
   while IsAlNum(Look) do begin
      Token := Token + UpCase(Look);
      GetChar;
   end;
   GetName := Token;
   SkipWhite;
end;


{--------------------------------------------------------------}
{ Get a Number }

function GetNum: string;
var Value: string;
begin
   Value := '';
   if not IsDigit(Look) then Expected('Integer');
   while IsDigit(Look) do begin
      Value := Value + Look;
      GetChar;
   end;
   GetNum := Value;
   SkipWhite;
end;


{--------------------------------------------------------------}
{ Output a String with Tab }

procedure Emit(s: string);
begin
   Write(TAB, s);
end;


{--------------------------------------------------------------}
{ Output a String with Tab and CRLF }

procedure EmitLn(s: string);
begin
   Emit(s);
   WriteLn;
end;


{---------------------------------------------------------------}
{ Parse and Translate a Identifier }

procedure Ident;
var Name: string[8];
begin
   Name:= GetName;
   if Look = '(' then begin
      Match('(');
      Match(')');
      EmitLn('BSR ' + Name);
      end
   else
      EmitLn('MOVE ' + Name + '(PC),D0');
end;


{---------------------------------------------------------------}
{ Parse and Translate a Math Factor }

procedure Expression; Forward;

procedure Factor;
begin
   if Look = '(' then begin
      Match('(');
      Expression;
      Match(')');
      end
   else if IsAlpha(Look) then
      Ident
   else
      EmitLn('MOVE #' + GetNum + ',D0');
end;


{--------------------------------------------------------------}
{ Recognize and Translate a Multiply }

procedure Multiply;
begin
   Match('*');
   Factor;
   EmitLn('MULS (SP)+,D0');
end;


{-------------------------------------------------------------}
{ Recognize and Translate a Divide }

procedure Divide;
begin
   Match('/');
   Factor;
   EmitLn('MOVE (SP)+,D1');
   EmitLn('EXS.L D0');
   EmitLn('DIVS D1,D0');
end;


{---------------------------------------------------------------}
{ Parse and Translate a Math Term }

procedure Term;
begin
   Factor;
   while Look in ['*', '/'] do begin
      EmitLn('MOVE D0,-(SP)');
      case Look of
       '*': Multiply;
       '/': Divide;
      end;
   end;
end;


{--------------------------------------------------------------}
{ Recognize and Translate an Add }

procedure Add;
begin
   Match('+');
   Term;
   EmitLn('ADD (SP)+,D0');
end;


{-------------------------------------------------------------}
{ Recognize and Translate a Subtract }

procedure Subtract;
begin
   Match('-');
   Term;
   EmitLn('SUB (SP)+,D0');
   EmitLn('NEG D0');
end;


{---------------------------------------------------------------}
{ Parse and Translate an Expression }

procedure Expression;
begin
   if IsAddop(Look) then
      EmitLn('CLR D0')
   else
      Term;
   while IsAddop(Look) do begin
      EmitLn('MOVE D0,-(SP)');
      case Look of
       '+': Add;
       '-': Subtract;
      end;
   end;
end;


{--------------------------------------------------------------}
{ Parse and Translate an Assignment Statement }

procedure Assignment;
var Name: string[8];
begin
   Name := GetName;
   Match('=');
   Expression;
   EmitLn('LEA ' + Name + '(PC),A0');
   EmitLn('MOVE D0,(A0)')
end;


{--------------------------------------------------------------}
{ Initialize }
                             
procedure Init;
begin
   GetChar;
   SkipWhite;
end;


{--------------------------------------------------------------}
{ Main Program }

begin
   Init;
   Assignment;
   If Look <> CR then Expected('NewLine');
end.
{--------------------------------------------------------------}
```

Now the parser is complete.  It's got every feature we can put in a  one-line "compiler."  Tuck it away in a safe place.  Next time we'll move on to a new subject, but we'll still be  talking about expressions for quite awhile.  Next installment, I plan to talk a bit about interpreters as opposed  to compilers, and show you how the structure of the parser changes a bit as we change  what sort of action has to be taken.  The information we pick up there will serve  us in good stead later on, even if you have no interest in interpreters.  See you next time.

# TUTOR4: INTERPRETERS

INTRODUCTION

In the first three installments of this series,  we've  looked at parsing and  compiling math expressions, and worked our way gradually and methodically from dealing  with  very  simple one-term, one-character "expressions" up through more general ones, finally arriving at a very complete parser that could parse and translate complete  assignment  statements,  with  multi-character  tokens, embedded white space, and function calls.  This  time,  I'm going to walk you through the process one more time, only with the goal of interpreting rather than compiling object code.

Since this is a series on compilers, why should  we  bother  with interpreters?  Simply because I want you to see how the nature of the  parser changes as we change the goals.  I also want to unify the concepts of the two types of translators, so that you can see not only the differences, but also the similarities.

Consider the assignment statement

               x = 2 * y + 3

In a compiler, we want the target CPU to execute  this assignment at EXECUTION time.  The translator itself doesn't  do  any arithmetic ... it only issues the object code that will cause  the CPU to do it when the code is executed.  For  the  example above, the compiler would issue code to compute the expression and store the results in variable x.

For an interpreter,  on  the  other  hand, no object code is generated.   Instead, the arithmetic is computed immediately, as the parsing is going on.  For the example, by the time parsing of the statement is complete, x will have a new value.

The approach we've been  taking  in  this  whole series is called "syntax-driven translation."  As you are aware by now, the structure of the  parser  is  very  closely  tied to the syntax of the productions we parse.  We  have built Pascal procedures that recognize every language  construct.   Associated with each of these constructs (and procedures) is  a  corresponding  "action," which does  whatever  makes  sense to do  once  a  construct  has  been recognized.    In  our  compiler  so far, every  action  involves emitting object code, to be executed later at execution time.  In an interpreter, every action  involves  something  to be done immediately.

What I'd like you to see here is that the  layout  ... the structure ... of  the  parser  doesn't  change.  It's only the actions that change.   So  if  you  can  write an interpreter for a given language, you can also write a compiler, and vice versa.  Yet, as you  will  see,  there  ARE  differences,  and  significant ones. Because the actions are different,  the  procedures  that  do the recognizing end up being written differently.    Specifically, in the interpreter  the recognizing procedures end up being coded as FUNCTIONS that return numeric values to their callers.    None of the parsing routines for our compiler did that.

Our compiler, in fact,  is  what we might call a "pure" compiler. Each time a construct is recognized, the object  code  is emitted IMMEDIATELY.  (That's one reason the code is not very efficient.) The interpreter we'll be building  here is a pure interpreter, in the sense that there is  no  translation,  such  as "tokenizing," performed on the source code.  These represent  the  two extremes of translation.  In  the  real  world,  translators are rarely so pure, but tend to have bits of each technique.

I can think of  several  examples.    I've already mentioned one: most interpreters, such as Microsoft BASIC,  for  example, translate the source code (tokenize it) into an  intermediate  form so that it'll be easier to parse real time.

Another example is an assembler.  The purpose of an assembler, of course, is to produce object code, and it normally does that on a one-to-one basis: one object instruction per line of source code. But almost every assembler also permits expressions as arguments. In this case, the expressions  are  always  constant expressions, and  so the assembler isn't supposed to  issue  object  code  for them.  Rather,  it  "interprets" the expressions and computes the corresponding constant result, which is what it actually emits as object code.

As a matter of fact, we  could  use  a bit of that ourselves. The translator we built in the  previous  installment  will dutifully spit out object code  for  complicated  expressions,  even though every term in  the  expression  is  a  constant.  In that case it would be far better if the translator behaved a bit more  like an interpreter, and just computed the equivalent constant result.

There is  a concept in compiler theory called "lazy" translation. The  idea is that you typically don't just  emit  code  at  every action.  In fact, at the extreme you don't emit anything  at all, until  you  absolutely  have to.  To accomplish this, the actions associated with the parsing routines  typically  don't  just emit code.  Sometimes  they  do,  but  often  they  simply  return information back to the caller.  Armed with  such  information, the caller can then make a better choice of what to do.

For example, given the statement

               x = x + 3 - 2 - (5 - 4)

our compiler will dutifully spit  out a stream of 18 instructions to load each parameter into  registers,  perform  the arithmetic, and store the result.  A lazier evaluation  would  recognize that the arithmetic involving constants can  be  evaluated  at compile time, and would reduce the expression to

               x = x + 0 

An  even  lazier  evaluation would then be smart enough to figure out that this is equivalent to

               x = x 

which  calls  for  no  action  at  all.   We could reduce 18  instructions to zero!

Note that there is no chance of optimizing this way in our translator as it stands, because every action takes place immediately.

Lazy  expression  evaluation  can  produce  significantly  better object code than  we  have  been  able  to  so  far.  I warn you, though: it complicates the parser code considerably, because each routine now has to make decisions as to whether  to  emit  object code or not.  Lazy evaluation is certainly not named that because it's easier on the compiler writer!

Since we're operating mainly on  the KISS principle here, I won't go  into much more depth on this subject.  I just want you to  be aware  that  you  can get some code optimization by combining the techniques of compiling and  interpreting.    In  particular, you should know that the parsing  routines  in  a  smarter translator will generally  return  things  to  their  caller,  and sometimes expect things as  well.    That's  the main reason for going over interpretation in this installment.


THE INTERPRETER

OK, now that you know WHY we're going into all this, let's do it. Just to give you practice, we're going to start over with  a bare cradle and build up the translator all over again.  This time, of course, we can go a bit faster.

Since we're now going  to  do arithmetic, the first thing we need to do is to change function GetNum, which up till now  has always returned a character  (or  string).    Now, it's better for it to return an integer.    MAKE  A  COPY of the cradle (for goodness's sake, don't change the version  in  Cradle  itself!!)  and modify GetNum as follows:

```
{--------------------------------------------------------------}
{ Get a Number }

function GetNum: integer;
begin
   if not IsDigit(Look) then Expected('Integer');
   GetNum := Ord(Look) - Ord('0');
   GetChar;
end;
{--------------------------------------------------------------}
```

Now, write the following version of Expression:

```
{---------------------------------------------------------------}
{ Parse and Translate an Expression }

function Expression: integer;
begin
   Expression := GetNum;
end;
{--------------------------------------------------------------}
```

Finally, insert the statement

```
   Writeln(Expression);
```

at the end of the main program.  Now compile and test.

All this program  does  is  to  "parse"  and  translate  a single integer  "expression."    As always, you should make sure that it does that with the digits 0..9, and gives an  error  message  for anything else.  Shouldn't take you very long!

OK, now let's extend this to include addops.    Change Expression to read:

```
{---------------------------------------------------------------}
{ Parse and Translate an Expression }

function Expression: integer;
var Value: integer;
begin
   if IsAddop(Look) then
      Value := 0
   else
      Value := GetNum;
   while IsAddop(Look) do begin
      case Look of
       '+': begin
               Match('+');
               Value := Value + GetNum;
            end;
       '-': begin
               Match('-');
               Value := Value - GetNum;
            end;
      end;
   end;
   Expression := Value;
end;
{--------------------------------------------------------------}
```

The structure of Expression, of  course,  parallels  what  we did before,  so  we  shouldn't have too much  trouble  debugging  it. There's  been  a  SIGNIFICANT  development, though, hasn't there? Procedures Add and Subtract went away!  The reason  is  that  the action to be taken  requires  BOTH arguments of the operation.  I could have chosen to retain the procedures and pass into them the value of the expression to date,  which  is Value.  But it seemed cleaner to me to  keep  Value as strictly a local variable, which meant that the code for Add and Subtract had to be moved in line. This result suggests  that,  while the structure we had developed was nice and  clean  for our simple-minded translation scheme, it probably  wouldn't do for use with lazy  evaluation.    That's  a little tidbit we'll probably want to keep in mind for later.

OK,  did the translator work?  Then let's  take  the  next  step. It's not hard to  figure  out what procedure Term should now look like.  Change every call to GetNum in function  Expression  to  a call to Term, and then enter the following form for Term:

```
{---------------------------------------------------------------}
{ Parse and Translate a Math Term }

function Term: integer;
var Value: integer;
begin
   Value := GetNum;
   while Look in ['*', '/'] do begin
      case Look of
       '*': begin
               Match('*');
               Value := Value * GetNum;
            end;
       '/': begin
               Match('/');
               Value := Value div GetNum;
            end;
      end;
   end;
   Term := Value;
end;
{--------------------------------------------------------------}
```

Now, try it out.    Don't forget two things: first, we're dealing with integer division, so, for example, 1/3 should come out zero. Second, even  though we can output multi-digit results, our input is still restricted to single digits.

That seems like a silly restriction at this point, since  we have already  seen how easily function GetNum can  be  extended.    So let's go ahead and fix it right now.  The new version is

```
{--------------------------------------------------------------}
{ Get a Number }

function GetNum: integer;
var Value: integer;
begin
   Value := 0;
   if not IsDigit(Look) then Expected('Integer');
   while IsDigit(Look) do begin
      Value := 10 * Value + Ord(Look) - Ord('0');
      GetChar;
   end;
   GetNum := Value;
end;
{--------------------------------------------------------------}
```

If you've compiled and  tested  this  version of the interpreter, the  next  step  is to install function Factor, complete with parenthesized  expressions.  We'll hold off a  bit  longer  on  the variable  names.    First, change the references  to  GetNum,  in function Term, so that they call Factor instead.   Now  code  the following version of Factor:

```
{---------------------------------------------------------------}
{ Parse and Translate a Math Factor }

function Expression: integer; Forward;

function Factor: integer;
begin
   if Look = '(' then begin
      Match('(');
      Factor := Expression;
      Match(')');
      end
   else
       Factor := GetNum;
end;
{---------------------------------------------------------------}
```

That was pretty easy, huh?  We're rapidly closing in on  a useful interpreter.


A LITTLE PHILOSOPHY

Before going any further, there's something I'd like  to  call to your attention.  It's a concept that we've been making use  of in all these sessions, but I haven't explicitly mentioned it up till now.  I think it's time, because it's a concept so useful, and so powerful,  that  it  makes all the difference  between  a  parser that's trivially easy, and one that's too complex to deal with.

In the early days of compiler technology, people  had  a terrible time  figuring  out  how to deal with things like operator precedence  ...  the  way  that  multiply  and  divide operators  take precedence over add and subtract, etc.  I remember a colleague of some  thirty years ago, and how excited he was to find out how to do it.  The technique used involved building two  stacks,    upon which you pushed each operator  or operand.  Associated with each operator was a precedence level,  and the rules required that you only actually performed an operation  ("reducing"  the  stack) if the precedence level showing on top of the stack was correct.  To make life more interesting,  an  operator  like ')' had different precedence levels, depending  upon  whether or not it was already on the stack.  You  had to give it one value before you put it on the stack, and another to decide when to take it  off.   Just for the experience, I worked all of  this  out for myself a few years ago, and I can tell you that it's very tricky.

We haven't  had  to  do  anything like that.  In fact, by now the parsing of an arithmetic statement should seem like child's play. How did we get so lucky?  And where did the precedence stacks go?

A similar thing is going on  in  our interpreter above.  You just KNOW that in  order  for  it  to do the computation of arithmetic statements (as opposed to the parsing of them), there have  to be numbers pushed onto a stack somewhere.  But where is the stack?

Finally,  in compiler textbooks, there are  a  number  of  places where  stacks  and  other structures are discussed.  In the other leading parsing method (LR), an explicit stack is used.  In fact, the technique is very  much  like the old way of doing arithmetic expressions.  Another concept  is  that of a parse tree.  Authors like to draw diagrams  of  the  tokens  in a statement, connected into a tree with  operators  at the internal nodes.  Again, where are the trees and stacks in our technique?  We haven't seen any. The answer in all cases is that the structures are  implicit, not explicit.    In  any computer language, there is a stack involved every  time  you  call  a  subroutine.  Whenever a subroutine  is called, the return address is pushed onto the CPU stack.   At the end of the subroutine, the address is popped back off and control is  transferred  there.   In a recursive language such as Pascal, there can also be local data pushed onto the stack, and  it, too, returns when it's needed.

For example,  function  Expression  contains  a  local  parameter called  Value, which it fills by a call to Term.  Suppose, in its next call to  Term  for  the  second  argument,  that  Term calls Factor, which recursively  calls  Expression  again.    That "instance" of Expression gets another value for its  copy  of Value. What happens  to  the  first  Value?    Answer: it's still on the stack, and  will  be  there  again  when  we return from our call sequence.

In other words, the reason things look so simple  is  that  we've been making maximum use of the resources of the  language.    The hierarchy levels  and  the  parse trees are there, all right, but they're hidden within the  structure  of  the parser, and they're taken care of by the order with which the various  procedures are called.  Now that you've seen how we do it, it's probably hard to imagine doing it  any other way.  But I can tell you that it took a lot of years for compiler writers to get that smart.  The early compilers were too complex  too  imagine.    Funny how things get easier with a little practice.

The reason  I've  brought  all  this up is as both a lesson and a warning.  The lesson: things can be easy when you do  them right. The warning: take a look at what you're doing.  If, as you branch out on  your  own,  you  begin to find a real need for a separate stack or tree structure, it may be time to ask yourself if you're looking at things the right way.  Maybe you just aren't using the facilities of the language as well as you could be.

The next step is to add variable names.  Now,  though,  we have a slight problem.  For  the  compiler, we had no problem in dealing with variable names ... we just issued the names to the assembler and let the rest  of  the program take care of allocating storage for  them.  Here, on the other hand, we need to be able to  fetch the values of the variables and return them as the  return values of Factor.  We need a storage mechanism for these variables.

Back in the early days of personal computing,  Tiny  BASIC lived. It had  a  grand  total  of  26  possible variables: one for each letter of the  alphabet.    This  fits nicely with our concept of single-character tokens, so we'll  try  the  same  trick.  In the beginning of your  interpreter,  just  after  the  declaration of variable Look, insert the line:

               Table: Array['A'..'Z'] of integer;

We also need to initialize the array, so add this procedure:

```
{---------------------------------------------------------------}
{ Initialize the Variable Area }

procedure InitTable;
var i: char;
begin
   for i := 'A' to 'Z' do
      Table[i] := 0;
end;
{---------------------------------------------------------------}
```

You must also insert a call to InitTable, in procedure Init. DON'T FORGET to do that, or the results may surprise you!

Now that we have an array  of  variables, we can modify Factor to use it.  Since we don't have a way (so far) to set the variables, Factor  will always return zero values for  them,  but  let's  go ahead and extend it anyway.  Here's the new version:

```
{---------------------------------------------------------------}
{ Parse and Translate a Math Factor }

function Expression: integer; Forward;

function Factor: integer;
begin
   if Look = '(' then begin
      Match('(');
      Factor := Expression;
      Match(')');
      end
   else if IsAlpha(Look) then
      Factor := Table[GetName]
   else
       Factor := GetNum;
end;
{---------------------------------------------------------------}
```

As always, compile and test this version of the  program.    Even though all the variables are now zeros, at least we can correctly parse the complete expressions, as well as catch any badly formed expressions.

I suppose you realize the next step: we need to do  an assignment statement so we can  put  something INTO the variables.  For now, let's  stick  to  one-liners,  though  we will soon  be  handling multiple statements.

The assignment statement parallels what we did before:

```
{--------------------------------------------------------------}
{ Parse and Translate an Assignment Statement }
                             
procedure Assignment;
var Name: char;
begin
   Name := GetName;
   Match('=');
   Table[Name] := Expression;
end;
{--------------------------------------------------------------}
```

To test this,  I  added  a  temporary write statement in the main program,  to  print out the value of A.  Then I  tested  it  with various assignments to it.

Of course, an interpretive language that can only accept a single line of program  is not of much value.  So we're going to want to handle multiple statements.  This  merely  means  putting  a loop around  the  call  to Assignment.  So let's do that now. But what should be the loop exit criterion?  Glad you  asked,  because  it brings up a point we've been able to ignore up till now.

One of the most tricky things  to  handle in any translator is to determine when to bail out of  a  given construct and go look for something else.  This hasn't been a problem for us so far because we've only allowed for  a  single kind of construct ... either an expression  or an assignment statement.   When  we  start  adding loops and different kinds of statements, you'll find that we have to be very careful that things terminate properly.  If we put our interpreter in a loop, we need a way to quit.    Terminating on a newline is no good, because that's what sends us back for another line.  We could always let an unrecognized character take us out, but that would cause every run to end in an error  message, which certainly seems uncool.

What we need  is  a  termination  character.  I vote for Pascal's ending period ('.').   A  minor  complication  is that Turbo ends every normal line  with  TWO characters, the carriage return (CR) and line feed (LF).   At  the  end  of  each line, we need to eat these characters before processing the next one.   A  natural way to do this would  be  with  procedure  Match, except that Match's error  message  prints  the character, which of course for the CR and/or  LF won't look so great.  What we need is a special procedure for this, which we'll no doubt be using over and over.  Here it is:

```
{--------------------------------------------------------------}
{ Recognize and Skip Over a Newline }

procedure NewLine;
begin
   if Look = CR then begin
      GetChar;
      if Look = LF then
         GetChar;
   end;
end;
{--------------------------------------------------------------}
```

Insert this procedure at any convenient spot ... I put  mine just
after Match.  Now, rewrite the main program to look like this:

```
{--------------------------------------------------------------}
{ Main Program }

begin
   Init;
   repeat
      Assignment;
      NewLine;
   until Look = '.';
end.
{--------------------------------------------------------------}
```

Note that the  test for a CR is now gone, and that there are also no  error tests within NewLine itself.   That's  OK,  though  ... whatever is left over in terms of bogus characters will be caught at the beginning of the next assignment statement.

Well, we now have a functioning interpreter.  It doesn't do  us a lot of  good,  however,  since  we have no way to read data in or write it out.  Sure would help to have some I/O!

Let's wrap this session  up,  then,  by  adding the I/O routines. Since we're  sticking to single-character tokens, I'll use '?' to stand for a read statement, and  '!'  for a write, with the character  immediately  following  them  to  be used as  a  one-token "parameter list."  Here are the routines:

```
{--------------------------------------------------------------}
{ Input Routine }

procedure Input;
begin
   Match('?');
   Read(Table[GetName]);
end;


{--------------------------------------------------------------}
{ Output Routine }

procedure Output;
begin
   Match('!');
   WriteLn(Table[GetName]);
end;
{--------------------------------------------------------------}
```

They aren't very fancy, I admit ... no prompt character on input, for example ... but they get the job done.

The corresponding changes in  the  main  program are shown below. Note that we use the usual  trick  of a case statement based upon the current lookahead character, to decide what to do.

```
{--------------------------------------------------------------}
{ Main Program }

begin
   Init;
   repeat
      case Look of
       '?': Input;
       '!': Output;
       else Assignment;
      end;
      NewLine;
   until Look = '.';
end.
{--------------------------------------------------------------}
```

You have now completed a  real, working interpreter.  It's pretty sparse, but it works just like the "big boys."  It includes three kinds of program statements  (and  can  tell the difference!), 26 variables,  and  I/O  statements.  The only things that it lacks, really, are control statements,  subroutines,    and some kind of program editing function.  The program editing part, I'm going to pass on.  After all, we're  not  here  to build a product, but to learn  things.    The control statements, we'll cover in the next installment, and the subroutines soon  after.  I'm anxious to get on with that, so we'll leave the interpreter as it stands.

I hope that by  now  you're convinced that the limitation of single-character names  and the processing of white space are easily taken  care  of, as we did in the last session.   This  time,  if you'd like to play around with these extensions, be my  guest ... they're  "left as an exercise for the student."    See  you  next time.

# TUTOR5: 

# TUTOR6:

# TUTOR7:

# TUTOR8:

# TUTOR9:

# TUTOR10:

# TUTOR11:

# TUTOR12:

# TUTOR13:

# TUTOR14:

# TUTOR15:

# TUTOR16:






