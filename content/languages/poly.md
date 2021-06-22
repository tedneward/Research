title=Poly
tags=language, functional
summary=A general-purpose language based on the idea of treating types as first-class values.
~~~~~~

Poly is, I believe, outdated and no longer exists; however, it was the original implementation language for [PolyML](../ml), and three papers (copied here) describe it in deep enough fashion to warrant capture and study. All appear to be by David C.J. Matthews.

------
# [Introduction to Poly](https://www.polyml.org/documentation/Papers/poly/intro.html)

<body>
<p><strong>Abstract</strong><br>
  This report is a tutorial introduction to the programming language <strong>Poly</strong>. 
  It describes how to write and run programs in Poly using the VAX/UNIX implementation. 
  Examples given include polymorphic list functions, a double precision integer 
  package and a subrange type constructor.</p>
<h2>Introduction to Poly</h2>
<p>Poly is a programming language which supports polymorphic operations. This 
  document explains how it is used on the VAX. </p>
<h4>1. Commands and Declarations</h4>
<p>The system is entered by running the appropriate program (e.g.<strong> /mnt/dcjm/poly</strong> 
  at Cambridge). The compiler will then reply with a prompt (<font face="Courier New, Courier, mono">></font>). 
  To exit from Poly at any time type ctrl-D (end-of-text) or ctrl-C (interrupt). 
  There are three types of instructions which can be typed to Poly; declarations 
  of identifiers, statements (commands), or expressions. An example of a command 
  and the output it produces is</p>
<pre>> print("Hello");
Hello</pre>
<p>Note the closing semicolon which must be present to indicate the end of the 
  command. If you forget it the compiler will print a <font face="Courier New, Courier, mono">#</font> 
  as a prompt to indicate that the command is not yet complete.</p>
<p>An example of an expression is</p>
<pre>> "Hi";
Hi </pre>
<p>Poly prints the value of an expression without the need to type the word 'print'. 
</p>
<p>Commands can be grouped by enclosing them with the bracketing symbols <strong>begin</strong> 
  and <strong>end</strong> or <strong>(</strong> and <strong>)</strong>. For instance 
<pre>> begin
# print("Hello");
# print(" again")
# end;
Hello again</pre>
Any object in Poly can be bound to an identifier by writing a declaration. For 
instance 
<pre>> let message == "Hello "; </pre>
declares an identifier 'message' to have the value of the string 'Hello '. It 
can be printed in the same way as the string constant. 
<pre>> message;
Hello </pre>
<p>Names can be either a sequence of letters and digits starting with a letter, 
  or a sequence of the special characters + - * = < > etc. Certain names are reserved 
  to have special meanings and cannot be used in declarations. Those words can 
  be written in upper, lower or mixed case, all other words are considered to 
  be different if written in different cases. When declaring a name made up of 
  the special characters remember to put a space between the name and the == or 
  colon which follows it. Comments are enclosed in curly brackets <strong>{</strong> 
  and <strong>}</strong>. They are ignored by the compiler and are equivalent 
  to a single space or newline between words.</p>
<h3> 2. Procedures</h3>
<p>Statements or groups of statements can be declared by making them into procedures. 
</p>
<pre>> let printmessage == 
#     proc()
#       (print("A message ")); </pre>
<p>A procedure consists of a procedure header (in this case the word <strong>proc</strong> 
  and parentheses <strong>(</strong> and <strong>)</strong> ) and a body. The 
  procedure body must be enclosed in bracketing symbols (in this case '(' and 
  ')') even if there is only one statement. </p>
<p> This is simply another example of a declaration. Just as previously 'message' 
  was declared to have the value "Hello#", 'printmessage' has been declared with 
  the value of the procedure. </p>
<p> The procedure is called by typing the procedure name followed by <strong>()</strong>. 
</p>
<pre>> printmessage();
A message </pre>
 
<p>The effect of this is execute the body of the procedure and so print the string. 
</p>
<p>Procedures can take arguments so that values can be passed to them when they 
  are called. </p>
<pre>> let pmessage == 
# proc(m : string) 
# begin 
# print("The message is :");
# print(m) 
# end; </pre>
This can be called by typing 
<pre>> pmessage("Hello");
The message is :Hello </pre>
or by typing 
<pre>> pmessage("Goodbye"); 
The message is :Goodbye </pre>
<h3>3. Specifications</h3>
<p>As well as having a value all objects in Poly have a specification, analogous 
  to a type in other languages. It is used by the compiler to ensure that only 
  meaningful statements will be accepted. You can find the specification of a 
  declared name x by typing <strong>? "x";</strong>. </p>
<pre>> ? "message";
message : string </pre>
This means that message is a constant belonging to the type 'string'. 
<pre>> ? "pmessage"; 
pmessage : PROC(string) </pre>
This means that pmessage is a procedure taking a value of type string as its argument. 
Since message has that specification the call 
<pre>> pmessage(message);
The message is :Hello </pre>
will work. Likewise the call 
<pre>> pmessage("Hi");
The message is :Hi </pre>
will work because "Hi" also belongs to type string. However 
<pre>> pmessage(pmessage); 
Error - specifications have different forms </pre>
 
<p>will fail because 'pmessage' has the wrong specification. Incidentally, the 
  specification of the procedure is the same as the header used when it was declared, 
  ignoring the differences in the case of some of the words.</p>
<h3>4. Integer and Boolean</h3>
<p>So far the only constants used have been those belonging to the type string. 
  Another type, <strong>integer</strong> provides operations on integral numbers. 
</p>
<pre>> print(42); 
42 </pre>
The usual arithmetic operations +, -, *, div, mod, succ and pred are available. 
<pre>> 42+10-2; 50 </pre>
However, unlike other languages all infix operators have the same precedence so 
<pre>> 4+3*2; 14 </pre>
 
<p>prints 14 rather than 10. Also - is an infix operator only, there is a procedure 
  neg which complements its argument. </p>
<p>Another 'standard' type is <strong>boolean</strong> which has only two values 
  <strong>true</strong> and <strong>false</strong>. Its main use is in tests for 
  equality (the <strong>=</strong> operator), inequality (<strong><></strong>) 
  and magnitude (<strong>> < >= <=</strong>). </p>
<pre>> let two == 2;
> 1 = two;
false
> 2 = two;
true
> 3 <> 4;
true 
> 4 >= 5;
false </pre>
The expression '1 = two' has type boolean. Identifiers can be declared to have 
boolean values in the same way as integers and strings. 
<pre>> let testtwo == two > 1; </pre>
<p>declares testtwo to be 'true' since 'two' is greater than 1. There are three 
  operators which work on boolean values, <strong>&</strong>, <strong>|</strong> 
  and <strong>~</strong>. <strong>~</strong> is a prefix operator which complements 
  its argument (i.e. if its argument was false the result is true, and vice-versa). 
  <strong>&</strong> is an infix operator which returns true only if both its 
  arguments are true. <strong>|</strong> is also an infix operator which returns 
  true if either of its arguments is true. </p>
<h3>5. If-Statement</h3>
<p>Boolean values are particularly useful since they can be tested using <strong>if</strong>. 
  The if-statement causes different statements to be obeyed depending on a condition. 
</p>
<pre>> if two = 2 
# then print("It is two")
# else print("It isn't two");
It is two </pre>
tests the value of the expression 'two = 2' and executes the statement after the 
word <strong>then</strong> if it is true, and the statement after the word <strong>else</strong> 
if it is false. This could be written as a procedure, 
<pre>> let iszero == 
# proc(i: integer) 
# (if i = 0 then print("It is zero") 
# else print("It isn't zero")); </pre>
which could then be called to test a value. 
<pre>> iszero(4);
It isn't zero</pre>
since 4 is not zero. If-statements can return values as well as perform actions 
in the then and else parts. An alternative way of writing 'iszero' could have 
been 
<pre>> let iszero == 
# proc(i: integer) 
# (print( 
# if i  = 0 
# then "It is zero" 
# else "It isn't zero"
# )); </pre>
 
<p>This version tests the condition, and returns one or other of the strings for 
  printing. This can only be used if both the then and else parts return values 
  with similar specifications (in this case both sides return string constants). 
  The version of the if-statement which does not return a value can be written 
  with only a then-part. If the then-part returns a value there must be an else-part 
  (otherwise what value would be returned if the condition were false?). </p>
<h3>6. More on Procedures</h3>
<p>Procedures can be written which return results. For instance a further way 
  of writing 'iszero' would be to allow it to return the value of the string. 
</p>
<pre>> let iszero == 
# proc(i: integer)string
# (if i = 0 then "It is zero" 
# else "It isn't zero"); 
> ? "iszero";
iszero : PROC(integer)string</pre>
Calling it would then cause it to return the appropriate string which would then 
be printed. 
<pre>> iszero(0);
It is zero </pre>
Another example is a procedure which returns the square of its argument. 
<pre>> let sqr ==
# proc(i: integer)integer (i*i); </pre>
declares sqr to be a procedure which takes an argument with type integer and returns 
a result with type integer. The body of the procedure evaluates the square of 
the argument i, and the result is the value of the expression. The call 
<pre>> sqr(4); 
16 </pre>
<p>will therefore print out the value 16. </p>
<p> Procedures in Poly can be written which call themselves, i.e. recursive procedures. 
  These are declared using <strong>letrec</strong> rather than <strong>let</strong>. 
</p>
<pre>> letrec fact == 
# proc(i: integer)integer 
# (if i = 1 then 1 
# else i*fact(i-1)); </pre>
This is the recursive definition of the factorial function. The procedure can 
be called by using 
<pre>> fact(5); 
120 </pre>
 
<p>which prints the result. <strong>letrec</strong> has the effect of making the 
  name being declared available in the expression following the <strong>==</strong>, 
  whereas <strong>let</strong> does not declare it until after the closing semicolon. 
</p>
<h3>7. Variables</h3>
<p>Constants are objects whose value cannot be changed. There are also objects 
  whose value can change, these are variables. Variables are created by declarations 
  such as </p>
<pre>> let v == new(0); </pre>
The procedure 'new' returns a variable whose initial value is the argument. 
<pre>> v; 
0 </pre>
A new value can be given to v by using the assignment operator. 
<pre>> v := 3; 
> v; 
3 </pre>
Thus v now has the value 3. The new value can depend on the old value. 
<pre>> v := (v+2); </pre>
Sets the value to be 5. The parentheses are necessary because otherwise the order 
of evaluation would be strictly left-to-right. Variables can be of any type. 
<pre>> let sv == new("A string"); </pre>
 
<p>declares sv to be a string variable. The specification of a variable is not 
  as simple as it may seem and will be dealt with later.</p>
<h3>8. The While Loop</h3>
<p> It is often necessary to repeat some statements more than once. This can be 
  done using the <strong>while</strong> statement. For instance </p>
<pre>> let x == new(10);
> while x <> 0
# do
# begin
# print(x*x);
# print(" ");
# x := pred(x)
# end; 
100 81 64 49 25 16 9 4 1 </pre>
prints the square of all the numbers from 10 down to 1. The body of the loop (the 
statement after the word <strong>do</strong>) is executed repeatedly while the 
condition (the expression after the word <strong>while</strong>) is true. The 
condition is tested before the loop is entered, so 
<pre>> while false
# do print("Looping"); </pre>
 
<p>will not print anything.</p>
<h3> 9. Operators</h3>
<p>We have already seen examples of operators such as + and &. In Poly operators 
  are just procedures whose specifications include the words <strong>infix</strong> 
  or <strong>prefix</strong>. They are declared in a similar way to procedures, 
  for instance </p>
<pre>> let  sq == proc prefix (i : integer)integer (i*i); </pre>
has declared sq as a prefix operator. It can be used like any other prefix operator: 
<pre>> sq 3; 
9 </pre>
 
<p>The difference between a prefix operator and other procedures is that the argument 
  to a prefix operator does not need to be in parentheses. Infix operators can 
  be defined similarly.</p>
<h3>10. The Specifications of Types</h3>
<p>All objects in Poly have specifications. This includes types such as string, 
  integer and boolean. </p>
<pre> > ? "boolean";
boolean : TYPE (boolean)
   & : PROC INFIX (boolean; boolean)boolean;
   false : boolean;
   print : PROC (boolean);
   true : boolean; 
   | : PROC INFIX (boolean; boolean)boolean;
   ~ : PROC PREFIX (boolean)boolean
END </pre>
Types in Poly are regarded as sets of "attributes". These attributes are usually 
procedures or constants but could be other types. The attributes of a type can 
be used exactly like ordinary objects with the same specification. However, since 
different types may have attributes with the same name, it is necessary to prefix 
the name of the attribute with the name of the type separated by <strong>$</strong>. 
<pre>> integer$print(5);
5 </pre>
This invokes the attribute 'print' belonging to integer and prints the number. 
Most types have a print attribute which prints a value of that type in an appropriate 
format. $ acts a selector which finds the attribute belonging to a particular 
type. It is not an operator so operators always work on the selected name rather 
than the type name. 
<pre>> ~ boolean$true;
false </pre>
<h3>11. Records</h3>
<p>Poly allows new types to be created in the same way as new procedures, constants 
  or variables. One way of creating a new type is by making a record. A record 
  is a group of similar or dissimilar objects. </p>
<pre>> let rec == record(a, b: integer);</pre>
This declares 'rec' to be a record with two components, a and b, both of type 
integer. 
<pre>> ? "rec";
rec : TYPE (rec)
   a : PROC(rec)integer; 
   b : PROC(rec)integer;
   constr : PROC(integer;integer)rec
END </pre>
'constr' is a procedure which makes a record by taking two integers, and 'a' and 
'b' are procedures which return the 'a' and 'b' values of the record. 
<pre>> let recv == rec$constr(3, 4); </pre>
creates a new record with 3 in the first field (a) and 4 in the second field (b). 
The result is given the name 'recv'. 
<pre>> rec$a(recv);
3
> rec$b(recv);
4 </pre>
<p>show that the values of the individual fields can be found by using 'a' and 
  'b' as procedures. They must of course be prefixed by 'rec$' to show the type 
  they belong to.</p>
<p>Records can be made with fields of any specification, not just constants. </p>
<pre>> let arec == 
# record(x:integer; p: proc(integer)integer); </pre>
declares a record with fields x and p, x being an integer constant and p a procedure. 
<pre>> let apply ==
# proc(z : arec)integer
# begin
# let pp == arec$p(z);
# pp(arec$x(z))
# end; </pre>
is a procedure which takes a constant of this record type and applies the procedure 
p to the value x and returns the result. In fact, it is not necessary to declare 
pp in the body of the procedure. An alternative way of writing apply is 
<pre>> let apply ==
# proc(z : arec)integer 
# (arec$p(z)(arec$x(z))); </pre>
<h3>12. Unions</h3>
<p>Another way of constructing a type is using a 'union'. A union is a type whose 
  values can be constructed from the values of several other types. For instance 
  a value of a union of integer and string could be either an integer or a string. 
</p>
<pre>> let un == union(int: integer; str: string); </pre>
This has created a type which is the union of integer and string. A value of the 
union type can be constructed by using an injection function. This union type 
has two such functions, their names made by appending 'int' and 'str' onto the 
letters 'inj_', making 'inj_int' and 'inj_str'. ('int' and 'str' were the 'tags' 
given in the declaration, in a similar way to fields in a record). 
<pre>> let intunion == un$inj_int(3); </pre>
This has created a value with type 'un' containing the integer value 3. 
<pre>> let stringunion == un$inj_str("The string"); </pre>
creates a value, also with type 'un', but this time containing a string. Given 
a value of a union type it is often useful to be able to decide which of its constituent 
types it was made from. For each of the 'tags' there is a procedure whose name 
is made by prefixing with the letters 'is_', which returns 'true' or 'false' depending 
on whether its argument was made from the corresponding injection function. 
<pre>> un$is_int(intunion); true </pre>
prints 'true' because intunion was made from 'inj_int'. However 
<pre>> un$is_str(intunion); 
false </pre>
Values of the original types can be obtained by using 'projection' functions, 
which are the reverse of the 'injection' functions. Their names are made by prefixing 
the tags with 'proj_' to make names like 'proj_str' and 'proj_int'. 
<pre>> un$proj_int(intunion);
3
> un$proj_str(stringunion); 
The string </pre>
print the original values. It is possible to write 
<pre>> un$proj_str(intunion);
Exception projecte raised </pre>
because 'intunion' has type 'un', just like 'stringunion'. However, 'proj_str' 
is expected to return a value with type string so when this is run it will cause 
an error. The effect will be to raise an 'exception' called 'projecterror' which 
means that a projection procedure was given an argument constructed using a different 
injection procedure. 
<pre>> let unprojstr == un$proj_str;
> ? "unprojstr"; 
unprojstr : PROC(un)string RAISES projecterror </pre>
<p>shows that 'proj_str' may raise 'projecterror'. Exceptions will be dealt with 
  in more detail later on. </p>
<h3>13. The Type-Constructor</h3>
<p>It is often useful to be able to construct a type which is similar to an existing 
  one but with additional attributes. This can be done by using the type-constructor. 
</p>
<pre>> let nrec ==
# type (r) extends rec;
# let print ==
# proc(v : r)
# begin
# print(r$a(v)); 
# print(",");
# print(r(v))
# end
# end;
> ? "nrec";
   nrec : TYPE (nrec)
   a : PROC (nrec)integer;
   b : PROC (nrec)integer;
   constr : PROC (integer; integer)nrec;
   print : PROC (nrec)
END </pre>
This declares 'nrec' to be a new type which is an 'extension' of an existing type 
'rec'. It then lists the new attributes, in this case just the procedure 'print', 
which are declared just as though they were ordinary declarations. The name 'r' 
in parentheses which follows the word 'type' is the name for the new type within 
the body of the type constructor, so the argument of the procedure 'print' is 
given the type 'r'. It is important to remember that the new type is a completely 
separate type from 'rec'. Values <em>can</em> be changed from the old to the new 
type and vice versa, but they cannot be used interchangeably. The specification 
of nrec is similar to that of rec except that there is now an extra procedure 
'print'. 
<pre>> let nrecv == nrec$constr(5,6);
> nrec$print(nrecv);
5,6 </pre>
makes a value with type nrec, and prints it using the new 'print' attribute. It 
is possible to write simply 
<pre>> print(nrecv);
5,6 </pre>
because there is a procedure 'print' which looks for the 'print' attribute of 
the type of the value given, and then calls it. This is the way integers and strings 
are printed (they both have 'print' attributes). Many of the other operations 
such as ':=' and '+' work in a similar way. A further alternative is to write 
an expression. 
<pre>> nrecv;
5,6 </pre>
 
<p>In this case the compiler looks for the 'print' attribute and applies it. </p>
<h3>14. A Further Example</h3>
<p>This record could be extended in a different way, to make a double-precision 
  integer. Suppose that the maximum range of numbers which could be held in a 
  single integer was from -9999 to 9999. Then a double-precision number could 
  be defined by representing it as a record with two fields, a high and low order 
  part, and the actual number would have value (high)*10000 + (low). This can 
  be implemented as follows. </p>
<pre> > let dp ==
# type (d) extends record(hi, lo: integer);
# let succ ==
# proc(x:d)d
# begin
# if d$lo(x) = 9999
# then d$constr(succ(d$hi(x)), 0)
# else if (d$hi(x) < 0) & (d$lo(x) = 0)
# then d$constr(succ(d$hi(x)), neg(9999))
# else d$constr(d$hi(x), succ(d$lo(x)))
# end;
# let pred ==
# proc(x:d)d
# begin
# if d$lo(x) = neg(9999)
# then d$constr(pred(d$hi(x)), 0)
# else if (d$hi(x) > 0) & (d$lo(x) = 0) 
# then d$constr(pred(d$hi(x)), 9999)
# else d$constr(d$hi(x), pred(d$lo(x))) 
# end;
# let print ==
# proc(x:d)
# begin
# if d$hi(x) <> 0
# then
# begin
# print(d$hi(x));
# if abs(d$lo(x)) < 10
# then print("000")
# else if abs(d$lo(x)) < 100
# then print("00")
# else if abs(d$lo(x)) < 1000
# then print("0");
# print(abs(d$lo(x)))
# end
# else print(d$lo(x))
# end;
# let zero == d$constr(0,0); 
# let iszero ==
# proc(x:d) boolean
# ((d$hi(x) = 0) & (d$lo(x) = 0))
# end; </pre>
 
<p>This is sufficient to provide the basis of all the arithmetic operations, since 
  +,-,* etc. can all be defined in terms of succ, pred, zero and iszero.</p>
<h3>15. Exceptions</h3>
<p>In the section on union types above mention was made of exceptions. In the 
  case of the projection operations of a union type an exception is raised when 
  attempting to project a union value onto a type which was not the one used in 
  the injection. An exception is simply a name and any exception can be raised 
  by writing 'raise' followed by the name of the exception. </p>
<pre>> raise somefault;
Exception somefault raised </pre>
raises an exception called 'somefault'. 
<pre>> let procraises
# == proc(b: boolean) 
# (if b then raise afault); </pre>
has specification 
<pre>PROC(b: boolean) RAISES afault </pre>
<p>Various operations, as well as projection, may raise exceptions. For instance 
  many of the attributes of integer, such as 'succ' raise the exception 'rangeerror' 
  if the result of the operation is outside the range which can be held in an 
  integer constant. 'div' will raise 'divideerror' if it is asked to divide something 
  by 0.</p>
<p>As well as being raised exceptions can also be caught, which allows a program 
  to recover from an error. A group of statements enclosed in brackets or 'begin' 
  and 'end' can have a 'catch phrase' as the last item. A catch phrase is the 
  word <strong>catch</strong> followed by a procedure. e.g. 'catch p' will catch 
  any exception raised in the group of statements and apply p to its name. </p>
<pre>>let proccatches ==
# proc(excp: string) (print(excp)); 
> begin
# procraises(true);
# catch proccatches
# end;
afault </pre>
'proccatches' has been declared as a procedure which takes a argument of type 
string. The exception is raised by 'procraises' and, since it is not caught in 
that procedure it propagates back to the point at which 'procraises' was called. 
The catch phrase catches the exception and calls the procedure with the name of 
the exception as the argument. The catching procedure can then look at the argument 
and decide what to do. 
<pre>> begin
# procraises(false);
# catch proccatches
# end; </pre>
<p>does not print anything because an exception has not been raised and so the 
  procedure is not called.</p>
<p>If the block containing the catch phrase returns a value, then the catching 
  procedure must return a similar value. </p>
<pre>> let infinity == 99999;
> let divi ==
# proc infix(a, b: integer)integer 
# begin
# a div b
# catch proc(string)integer (infinity)
# end; </pre>
<p>This declares 'divi' to be similar to 'div' except that instead of raising 
  an exception it returns a large number. Since 'a div b' returns an integer value 
  the catch phrase must also return an integer.</p>
<h3>16. The Specification of Variables</h3>
<p>The specification of a variable in Poly is not, as one might expect, a constant 
  of some reference type or a separate kind of specification, but each variable 
  is in fact a separate type. Since a type in Poly is simply a set of constants, 
  procedures or other types, a type can be used simply as a way of conveniently 
  grouping together objects. </p>
<pre>> let intpair ==
# type
# let first == 1;
# let second == 2
# end; </pre>
<p>This has declared 'intpair' to be a pair of integers containing the values 
  1 and 2. 'intpair$first' and 'intpair$second' can be used as integer values 
  directly. </p>
<p> The specification of an integer variable is </p>
<pre>TYPE
assign: PROC(integer);
content: PROC()integer 
END </pre>
A variable is a pair of procedures, 'assign' which stores a new value in the variable, 
and 'content' which extracts the current value from it. The standard assignment 
operator ':=' simply calls 'assign' on the variable. The compiler inserts a call 
to 'content' automatically when a variable is used when a constant is expected. 
'assign' and 'content' can both be called explicitly. 
<pre>> let vx == new(5);
> vx$assign(vx$content() + 1);
> vx$content(); 
6 </pre>
As an example of a more complicated variable, suppose we wanted to write a subrange 
variable, similar to a subrange in Pascal, which could hold values between 0 and 
10. 
<pre>> let sr ==
# begin
# let varbl == new(0);
# type
# let content == varbl$content;
# let assign ==
# proc(i: integer) 
# (if (i < 0) | (i > 10
# then raise rangeerror
# else varbl$assign(i)) 
# end
# end; </pre>
'varbl' is an integer variable which is initially set to 0. 'assign' checks the 
value before assigning it to 'varbl', and raises an exception if it is out of 
range. 'content' is just the 'content' procedure of the variable. It can be used 
in a similar way to a simple variable. 
<pre>> sr := 2;
> sr;
2
> sr := 20;
Exception rangeerror raised
> sr;
2 </pre>
<h3>17. Specifications in Declarations</h3>
<p>The double-precision type declared above has one drawback. The specification 
  contains the 'hi', 'lo' and 'constr' attributes in the specification of the 
  type which would allow someone to construct a value which had the type 'dp', 
  but had, for instance, fields outside the range -9999 to 9999 or with different 
  signs. This could make some of the operations fail to work. We need a way of 
  hiding details of the internals of a type declaration so that they do not appear 
  in the specification, and so cannot be used outside. In Poly a specification 
  can be given to something explicitly as well as having it inferred from the 
  declaration. </p>
<pre>> let aconst: integer == 2; </pre>
declares 'aconst' and forces it to have type 'integer'. The specification is written 
in the same way as the specification of the argument of a procedure. 
<pre>> let quote : proc(string)
# == proc(x: string)
# begin
# print("`"); 
# print(x);
# print("'")
# end; </pre>
is another example of explicitly giving a specification to a value. An explicitly 
written specification is the specification of the name which is being declared. 
It need not be identical to the specification of the value following the '=='. 
However it must be possible to convert the specification of the value to the explicit 
specification (the 'context'). 
<pre>> let avar == new(3);
> let bconst: integer == avar; </pre>
declares 'avar' to be an integer variable and 'bconst' to be an integer constant. 
In the latter case the specification is necessary, otherwise 'bconst' would have 
been a variable and would have been another name for 'avar'. The conversion of 
a variable to a constant in order to match a given specification is one example 
of a 'coercion' of a value to match a 'context'. There are several others which 
can be applied depending on the particular specification. For instance the specification 
of a procedure may be changed from an operator to a simple procedure or vice versa. 
<pre>> let plus:
# proc(integer;integer)integer raises rangeerror 
# == integer$+ ; </pre>
declares 'plus' as a procedure which is the same as the '+' attribute of integer 
except that it is not an infix operator. 
<pre>> plus(3,4);
7 </pre>
<p>The list of exceptions raised by the procedure must be included in the specification. 
  The exception list in the specification given must include all the exceptions 
  which may be raised, but may include others as well. A special exception name 
  <strong>any</strong> can be used to indicate that a procedure can raise any 
  exception. Any exception list will match a context with exception list 'raises 
  any'. </p>
<p> The specifications of the arguments and result must all match. </p>
<pre>> let dble:
# type (d)
# succ, pred: proc(d)d raises rangeerror;
# print: proc(d) raises rangeerror;
# zero: d;
# iszero: proc(d)boolean;
# end
# == dp; </pre>
 
<p>creates a new type 'dble' with the specification given. The specification is 
  the same as that of 'dp' but with some of the attributes of dp missing. </p>
<p> In the case of types the specification of the value must possess all the attributes 
  of the explicit specification, but the explicit specification need not include 
  all the attributes of the value. If a type is regarded as a set of named attributes 
  then it is possible to take a subset of them and make them into a new type, 
  simply by giving the new type the required specification. The specification 
  of each attribute must itself match the specification that is given for it. 
</p>
<p> This mechanism provides a way of 'hiding' internal operations from the specification 
  of a type. The specification of 'dble' above has only those attributes which 
  are necessary to use it, and none of the operations which are used internally.</p>
<h3>18. Types as Results of Procedures</h3>
<p>So far we have considered procedures which take constants as arguments or return 
  constants as results. In Poly values of any specification can be passed to or 
  returned from a procedure. For instance </p>
<pre>> let subrange 
# == proc(min, max, initial: integer)
# type (s)
# content: proc()integer; 
# assign: proc(integer) raises outofrange
# end
# begin
# type
# let varbl == new(initial);
# let content == varbl$content;
# let assign == 
# proc(i: integer)
# (if (i < min) | (i > max)
# then raise outofrange 
# else varbl$assign(i))
# end
# end; </pre>
This procedure is similar to the definition of the subrange type 'sr' previously. 
However the bounds of the type are now arguments of a procedure so their values 
can be supplied when the program is run. Also new subrange variables can be created 
by calling the procedure. 
<pre>> let sv == subrange(0,10,0); </pre>
<p>This creates 'sv' as a variable of this subrange type. As with any procedure 
  the arguments can be arbitrary expressions provided they return results with 
  the correct specification. </p>
<h3>19. Types as Arguments to Procedures</h3>
<p>Types can be passed as arguments as well as being returned from procedures. 
</p>
<pre>> let copy ==
# proc(atype: type end)
# type (t)
# into: proc(atype)t;
# outof: proc(t)atype
# end 
# begin
# type (t) extends atype;
# let into == t$up
# let outof == t$down
# end
# end; </pre>
This procedure takes a type and returns a type with two operations 'into' and 
'outof'. 'up' and 'down' are procedures which are created when 'extends' is used, 
and provide a way of converting between the original and the resulting types. 
The specification of 'atype' merely says that it must be passed a type as an argument, 
but since it does not list any attributes then any type can be used as an actual 
argument (this is effectively saying that the empty set is a subset of every set). 
The procedure can be called, giving it an actual type as argument. 
<pre>> let copyint == copy(integer);</pre>
The specification of the result is 
<pre>TYPE (copyint)
into: PROC(integer)copyint; 
outof: PROC(copyint)integer
END; </pre>
The specification of copyint allows mapping between integer and copyint since 
the type integer has been included in the specification. 
<pre>> let copy5 == copyint$into(5);
> copyint$outof(copy5); 
5 </pre>
has mapped the integer constant 5 into and out of 'copyint'. 
<pre>> let copychar == copy(char); </pre>
 
<p>creates a similar type which maps between char and copychar.</p>
<h3>20. Polymorphic Procedures</h3>
<p>There are often cases where, in addition to passing a type as a argument, one 
  or more values of that type are passed as well. For instance a procedure to 
  find the second successor of a value might be written as </p>
<pre>> let add2 ==
# proc(atype:
# type (t)
# succ: proc(t)t raises rangeerror
# end;
# val: atype)
# (atype$succ(atype$succ(val)));</pre>
The specification of 'val' is that it must be a constant, and its type is 'atype'. 
However 'atype' is also an argument to the procedure so the specification really 
means that this procedure could be called by giving it any type with the required 
attributes, and a constant which must be of the same type as the first argument. 
<pre>> add2(integer, 2);
4 </pre>
Similarly 
<pre>> add2(char, 'A'); C </pre>
However 
<pre>> add2(integer, 'A'); </pre>
and 
<pre>> add2(string, "A string"); </pre>
 
<p>both fail, in the first case because 'A' is not integer, and in the second 
  because string does not have a successor function.</p>
<h3> 21. Implied Arguments</h3>
<p>Many types have a 'print' attribute which prints a constant of the type. </p>
<pre>> let pri ==
# proc(printable: type (t) print(t) end; val: printable)
# (printable$print(val)); </pre>
declares 'pri' as a procedure which takes as arguments a type and a constant of 
that type and prints the constant using the 'print' attribute. This can be called 
by writing 
<pre>> pri(integer, 3); or > pri(char, 'a'); </pre>
since both 'integer' and 'char' have a 'print' attribute. Having to pass the type 
explicitly is really unnecessary, since it is possible for the system to find 
the type from the specification of the constant. It would be possible for the 
system to convert 'pri(3)' into 'pri(integer,3)' since '3' has type integer. In 
Poly types which can be deduced from the specifications of other arguments can 
be declared as 'implied' arguments. A argument list written in square brackets, 
<strong>[</strong> and <strong>]</strong>, can precede the normal argument list 
and those parameters, which must be all be types, are inferred from the other 
actual arguments when the procedure is called. 
<pre>> let prin == 
# proc [printable: type (t) print: proc(t) end]
# (val: printable)
# (printable$print(val)); 
  </pre>
This can now be called by writing 
<pre>> prin(3);
or
> prin("hello");</pre>
and is in fact the definition of 'print' in the standard library. Alternatively 
'prin' could have been declared by giving it an explicit specification and using 
'pri'. 
<pre>> let prin: proc[printable: type (t) print: proc(t) end]
# (printable)
# == pri; </pre>
This is another form of conversion which can be made using an explicit specification. 
Using implied parameters can simplify considerably the use of procedures with 
types as arguments, and allow infix or prefix operators to be used in cases where 
they could not otherwise be used. For instance, consider an addition operation 
defined as 
<pre>> let add == 
# proc(summ: type (s) + : proc infix (s;s) raises rangeerror
# end;
# i, j: summ)summ
# (i + j); </pre>
would be used by writing 
<pre>> add(integer, 1, 2);
3 </pre>
However, by writing 
<pre>> let +
# : proc infix [summ: type(s)
# + : proc infix (s;s)raises rangeerror
# end]
# (i, j: summ)summ raises rangeerror
# == add; </pre>
 
<p>'+' can become an infix operator, since it has only two actual arguments. Similar 
  definitions are used for many of the other declarations in the library. </p>
<h3>22. Literals</h3>
<p>We have already seen how constants can be written as "Hello" or 42. These are 
  known as literal constants, because their values are given by the characters 
  which form them, rather than by some previous declaration. They are however, 
  only sequences of characters, it is only by convention that "Hello" is a string 
  constant and 42 an integer constant. This is only important when we wish to 
  use some other definition than the 'standard' one. For instance, if the type 
  integer were restricted to the range -9999 to 9999 then the constant 100000 
  would be an error if it were treated as an integer. The definition of double-precision 
  integer above, would, however, be able to represent it.</p>
<p>In Poly, therefore, literals have no intrinsic type, they must be converted 
  into a value by the use of a conversion routine. The compiler recognises certain 
  sequences of characters as literals rather than names or special symbols. The 
  three forms of literal constants recognised by the compiler are 'numbers', 'double-quoted 
  sequences' and 'single-quoted sequences'. 'Numbers' begin with a digit and may 
  consist of numbers or letters. </p>
<pre>42 0H3F6A 3p14159 </pre>
are examples of 'numbers'. 'Double-quoted sequences' are sequences of characters 
contained in double-quotes. A double-quote character inside the sequence must 
be written twice. 
<pre>"Hello" "" "He said ""Hello"""</pre>
'Single-quoted sequences' are similar to double-quoted sequences but single rather 
than double-quotes are used. 
<pre>'Hello' '' 'He said ''Hello''' </pre>
When the compiler recognises one of these literals it tries to construct a call 
to a conversion routine which can interpret it as a value of some type. For instance, 
the standard library contains a definition of 'convertn' which the compiler calls 
if it finds a 'number'. That definition has specification 
<pre>PROC(string)integer </pre>
<p>All conversion routines must have similar specifications, but the result type 
  will differ and some exceptions may be raised. The literal is supplied as a 
  constant of type 'string'. The conversion routine can examine the characters 
  which form the literal and return the appropriate value. It may of course raise 
  an exception if the characters do not form a valid value, if either the value 
  would be out of range or if the literal contains illegal characters. </p>
<p> There are also two other conversion routines in the standard library, 'converts' 
  which converts double-quoted sequences into string values, and 'convertc' which 
  converts single-quoted sequences into values of the type 'char'. These definitions 
  can be overridden by preceding the literal by the name of a type and a $ sign. 
  For instance </p>
<pre>> let int == integer; 
> let one == int$1; </pre>
 
<p>applies the 'convertn' routine belonging to 'int', so that 'one' has type int 
  rather than integer. </p>
<h3>23. Lists</h3>
<p>Lists are a convenient example for polymorphic operations. List types can be 
  constructed by the following procedure. </p>
<pre>> let list ==
# proc(base: type end) 
# type (list)
# car : proc(list)base raises nil_list;
# cdr : proc(list)list raises nil_list; 
# cons: proc(base; list)list; 
# nil : list; 
# null: proc(list)boolean 
# end
# begin
# type (list)
# let node == record(cr: base; cd: list);
# extends union(nl : void; nnl : node); 
# let cons == # proc(bb: base; ll: list)list
# (list$inj_nnl(node$constr(bb, ll)));
# let car ==
# proc(ll: list)base
# begin
# node$cr(list$proj_nnl(ll)) 
# catch proc(string)base (raise nil_list)
# end;
# let cdr ==
# proc(ll: list)list
# begin
# node$cd(list$proj_nnl(ll))
# catch proc(string)list (raise nil_list)
# end;
# let nil == list$inj_nl(void$empty);
# let null == list$is_nl
# end
# end; </pre>
<p>'void' is a standard type which has only one value (empty), and is used to 
  represent the 'nil' value of the list. The list structure is made using a recursive 
  union with each node containing a value of the 'base' type and the next item 
  of the list, or containing a nil value. 'cons' makes a new node of the list, 
  'car' and 'cdr' find the 'base' and 'list' parts of a node respectively, and 
  'null' tests for the value 'nil'. 'car' and 'cdr' both trap the exception which 
  would be raised if a projection error occurred and raise 'nil_value' in its 
  place. </p>
<p> A particular list type can now be created, for instance a list of integers. 
</p>
<pre>> let ilist == list(integer);
> let il == ilist$cons(1, ilist$cons(2, ilist$cons(3, ilist$nil))); </pre>
A polymorphic 'cons' function could be declared to work on lists of any base type. 
<pre>> let cons ==
# proc[base: type end;
# list: type (l) cons: proc(base; l)l end]
# (bb: base; ll: list)list # (list$cons(bb, ll)); </pre>
It is now possible to write simply 
<pre>> let il == cons(1, cons(2, cons(3, ilist$nil))); </pre>
Polymorphic 'car', 'cdr' and 'null' functions can be written similarly. As further 
examples some other polymorphic list functions are given. 
<pre>> letrec append ==
# proc[base: type end;
# list: type (l)
# car: proc(l)base raises nil_list;
# cdr: proc(l)l raises nil_list; 
# cons: proc(base; l)l;
# null: proc(l)boolean end]
# (first, second: list)list
# ( if null(first) then second
# else cons(car(first), append(cdr(first), second)) );
> letrec reverse ==
# proc[base: type end;
# list: type (l)
# car: proc(l)base raises nil_list;
# cdr: proc(l)l raises nil_list; 
# cons: proc(base; l)l;
# nil: l;
# null: proc(l)boolean end]
# (ll: list)list
# ( if null(ll) then list$nil
# else append(reverse(cdr(ll)), cons(car(ll), list$nil)) ); </pre>
A useful function would be one which would print the data part of a list if the 
base type could be printed. 
<pre>> letrec pr ==
# proc [base: type(b) print: proc(b) end;
# list: type(l) car: proc(l)base raises nil_list;
# cdr: proc(l)l raises nil_list;
# null: proc(l)boolean
# end ]
# (ll: list)
# begin
# if null(ll)
# then print("nil") 
# else
# begin
# print("( ");
# print(list$car(ll));
# print(". ");
# pr(list$cdr(ll));
# print(") ")
# end
# catch proc(string) () 
# end; </pre>
The list created above can now be printed. 
<pre>> pr(il); 
( 1. ( 2. ( 3. nil) ) ) </pre>
 
<p>Other polymorphic functions on lists can be declared in a similar way.</p>
<h3>24. Conclusion</h3>
<p>This document is intended as an introduction to Poly and to give some idea 
  of the ways in which it can be used. It is not a rigorous description and various 
  details, such as the precise checking rules for specifications, have been deliberately 
  skated over in order to explain the language simply. A companion document, the 
  Poly Report, is the reference for the precise details of the language. </p> 
</p>
</body>


------
# [An Overview of the Poly Programming Language](https://www.polyml.org/documentation/Papers/poly/overview.html)

<body>
Poly is a general purpose programming language based on the idea of treating
types as first-class values. It can support polymorphic operations by passing
types as parameters to procedures, and abstract types and parameterised types
by returning types as results.

Although Poly is not intended specifically as a database programming language
it was convenient to implement it in a persistent storage system.
This allows the user to retain data structures from one session to the 
next and can support large programming systems such as 
the Poly compiler and a Standard ML system.

<h2>1. Poly and its Type System</h2>
<p>Poly[Mat85] is based on the idea of types as first class values first used 
  in the language Russell.[Dem79] In the terms used by Cardelli and MacQueen[Car85] 
  it uses the <em>abstract witness</em> model of a type. Treating a type this 
  way means that polymorphism, parameterised types and modules are all handled 
  by the general concept of function application. </p>
<h3>1.1 Types as Values</h3>
<p>A type in Poly is a set of values, normally functions. For example the type 
  <em>integer</em> has operations +, - etc. Other types may have these operations, 
  the type <em>real</em> also has + and - but will not have a <em>mod</em> (remainder) 
  operation. The operations need not be functions, <em>integer</em> also has <em>zero</em>, 
  <em>first</em> and <em>last</em> which are <em>simple values</em>, and other types 
  may contain types. All values in Poly have a <em>signature</em>, called a <em>
  specification</em> in earlier reports, which is only used at compile-time. It is 
  the analogue of a type in languages like Pascal and corresponds in many ways 
  to the idea of a type in Ponder\cite{Ponder}. There are three classes of value 
  in Poly, the <em>simple value</em> which corresponds to what are normally thought 
  of as values in, say Pascal, numbers, strings, vectors etc.; the <em>procedure</em> 
  or function which operates on values and the <em>type</em> which is a set of values. 
  Each kind of value has a signature. To show why this view of types is useful 
  we will consider some properties of other languages, and how they are handled 
  in Poly.</p>
<h3>1.2 Polymorphism</h3>
<p>A polymorphic function is one that can be applied to values of many different 
  types. The phrase is sometimes used where <em>overloading</em> would be more appropriate, 
  for example the + operator in Pascal. In Pascal, or languages like it, there 
  are operators which can be applied to values of more than one data type and 
  their meanings are different according to the type of their arguments. They 
  can be thought of as a set of overloaded operators in the same way as operators 
  in Ada can be overloaded. Truly polymorphic functions are somewhat different. 
  They are functions which are applicable to values of a wide variety of data 
  types, including types which may not exist at the time the function is written. 
  The fundamental difference is that a new polymorphic function can be written 
  in terms of other polymorphic functions, while a function written in terms of 
  overloaded functions must be defined for each data type even if the program 
  is the same for each. For example </p>
<p> <font face="Arial, Helvetica, sans-serif"><strong>function</strong></font> 
  <em>min</em>(<em>i</em>,<em>j</em>: <em>integer</em>):<em>integer<br>
  </em><font face="Arial, Helvetica, sans-serif"><strong>begin</strong></font><br> 
  <font face="Arial, Helvetica, sans-serif"><strong>if</strong></font> <em>i</em> 
  &lt; <em>j</em> <font face="Arial, Helvetica, sans-serif"><strong>then</strong></font> 
  <em>min</em> := <em>i</em> <font face="Arial, Helvetica, sans-serif"><strong>else</strong></font> 
  <em>min</em> := <em>j</em><font face="Arial, Helvetica, sans-serif"><strong><br>
  end</strong></font>;<font face="Arial, Helvetica, sans-serif"><strong><br>
  function</strong></font> <em>min</em>(<em>i</em>,<em>j</em>: <em>real</em>):<em>real</em><font face="Arial, Helvetica, sans-serif"><strong><br>
  begin<br>
  </strong></font><font face="Arial, Helvetica, sans-serif"><strong>if</strong></font> 
  <em>i</em> &lt; <em>j</em> <font face="Arial, Helvetica, sans-serif"><strong>then</strong></font> 
  <em>min</em> := <em>i</em> <font face="Arial, Helvetica, sans-serif"><strong>else</strong></font> 
  <em>min</em> := <em>j</em><br>
  <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font>;</p>
<p>The ML [Mil84] programming language provides polymorphic operations on an all-or-nothing 
  basis. This allows one to write an identity function which simply returns its 
  argument, and this function is applicable to values of any type. One can also 
  write functions which operate on lists of any type or on functions of any type. 
  This generally works very well but has problems when one wants to write an operation 
  which operates differently on different data types. For example it is still 
  necessary to overload = since comparing two integers is different to comparing 
  two lists of real numbers. The <em>min</em> function cannot be written as a 
  single function in ML. What is required is a way of writing operations which 
  are <em> type-dependent</em>.</p>
<p>A type in Poly is characterised by the operations it has. Both <em>real</em> 
  and <em>integer</em> have &lt; operations though they will be implemented in 
  different ways. Many other types may have &lt; operations since Poly allows 
  the user to make new types. Poly allows a function to be written which selects 
  certain operations from a type and values of any type with those operations 
  can be used as a parameter. For example there is a <em>single</em> &lt; function 
  which works on types which have a &lt; operation and simply applies the operations 
  to the arguments. The effect is as though &lt; were being overloaded. However, 
  we can write a function in terms of this, such as the <em>min</em> function. 
  This will also work on values of any type which has a &lt; operation. For example, 
  <em>min</em> is a function which will work on values of any type with the &lt; 
  operation. Such a type has signature</p>
<p><font face="Arial, Helvetica, sans-serif"><strong>type</strong></font> (<em>t</em>) 
  &lt; : <font face="Arial, Helvetica, sans-serif"><strong>proc</strong></font>(<em>t</em>;<em>t</em>)<em>boolean</em> 
  <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font></p>
<p>This type has an operation, &lt;, which takes two values and returns a <em>boolean</em>. 
  We will first write a version of <em>min</em> which takes three parameters; 
  a type and two values of this type and returns a value of the type. It has signature:</p>
<p><font face="Arial, Helvetica, sans-serif"><strong>proc</strong></font>(<em>t</em>: 
  <font face="Arial, Helvetica, sans-serif"><strong>type</strong></font> (<em>t</em>) 
  &lt; : <font face="Arial, Helvetica, sans-serif"><strong>proc</strong></font>(<em>t</em>;<em>t</em>)<em>boolean</em> 
  <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font>; <em>t</em>; 
  <em>t</em>)<em>t</em> </p>
<p>We can write the whole function.</p>
<p><font face="Arial, Helvetica, sans-serif"><strong>let</strong></font> <em>min</em> 
  ==<br> <font face="Arial, Helvetica, sans-serif"><strong>proc</strong></font>(<em>t</em>: 
  <font face="Arial, Helvetica, sans-serif"><strong>type</strong></font> (<em>t</em>) 
  &lt; : <font face="Arial, Helvetica, sans-serif"><strong>proc</strong></font>(<em>t</em>; 
  <em>t</em>)boolean <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font>; 
  <em>x</em>, <em>y</em>: <em>t</em>)<em>t<br>
  </em><font face="Arial, Helvetica, sans-serif"><strong>begin</strong></font><font face="Arial, Helvetica, sans-serif"><strong><br>
  if</strong></font> <em>x</em> &lt; <em>y</em> <font face="Arial, Helvetica, sans-serif"><strong>then</strong></font> 
  <em>x</em> <font face="Arial, Helvetica, sans-serif"><strong>else</strong></font> 
  <em>y</em><br>
  <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font>;</p>
<p>It can be applied to integer values </p>
<p><em>min</em>(<em>integer</em>, 1, 2)</p>
<p>or string values </p>
<p><em>min</em>(<em>string</em>, "abc", "abd"</p>
<p> or values of any type with a &lt; operation. The first parameter is a type 
  which must have a &lt; operation which compares two values of the type, and 
  the second and third parameters must be values of the type. When we call </p>
<p><em>min</em>(<em>integer</em>, 1, 2)</p>
<p>the actual parameters are matched to the formal parameters from left to right. 
  First the types are matched by checking that the type given has the appropriate 
  operation, and then the values are matched. They are not of course the same 
  type as <em>t</em>, since they have type <em>integer</em>, but we invoke a matching 
  rule which says that if we have matched an actual type parameter to a formal 
  type then we can match values of corresponding types. In addition the type of 
  the result becomes matched so that the result has type <em>integer</em>. This 
  can be thought of as a systematic renaming of <em>t</em> with <em>integer</em>. 
</p>
<h3>1.3 Implied Parameters</h3>
<p>Having to pass the types explicitly is often a nuisance so there is a sugared 
  form which gives a way of omitting the types and having the compiler insert 
  them automatically using the types of the parameters. The only difference to 
  the definition of the function is that the types are written in square brackets 
  before the other parameters. The definition of <em>min</em> would then be: </p>
<p><font face="Arial, Helvetica, sans-serif"><strong>let</strong></font> <em>min</em> 
  ==<font face="Arial, Helvetica, sans-serif"><strong><br>
  proc</strong></font>$[$<em>t</em>: <font face="Arial, Helvetica, sans-serif"><strong>type</strong></font> 
  (<em>t</em>) &lt; : <font face="Arial, Helvetica, sans-serif"><strong>proc</strong></font>(<em>t</em>; 
  <em>t</em>)boolean <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font>$]$ 
  (<em>x</em>, <em>y</em>: <em>t</em>)<em>t</em><br>
  <font face="Arial, Helvetica, sans-serif"><strong>begin</strong></font><br>
  <font face="Arial, Helvetica, sans-serif"><strong>if</strong></font> <em>x</em> 
  &lt; <em>y</em> <font face="Arial, Helvetica, sans-serif"><strong>then</strong></font> 
  <em>x</em> <font face="Arial, Helvetica, sans-serif"><strong>else</strong></font> 
  <em>y</em><font face="Arial, Helvetica, sans-serif"><strong><br>
  end</strong></font>;</p>
<p>It can be used by just giving the values. </p>
<p><em>min</em>(1, 2);<br> <em><br>
  min</em>("abc", "abd"); </p>
<p>This sugaring also allows us to define operators such as + and &lt; which simply 
  apply the operation with the same name from the types of their arguments giving 
  the effect of overloading. </p>
<p><font face="Arial, Helvetica, sans-serif"><strong>let</strong></font> + ==<br>
  <font face="Arial, Helvetica, sans-serif"><strong>proc</strong></font> <font face="Arial, Helvetica, sans-serif"><strong>infix</strong></font> 
  6 $[$<em>t</em>: <font face="Arial, Helvetica, sans-serif"><strong>type</strong></font> 
  (<em>t</em>) + : <font face="Arial, Helvetica, sans-serif"><strong>proc</strong></font>(<em>t</em>; 
  <em>t</em>)<em>t</em> <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font>$]$ 
  (<em>x</em>, <em>y</em>: <em>t</em>)<em>t</em><br>
  <font face="Arial, Helvetica, sans-serif"><strong>begin</strong></font><br>
  <em>t</em>$+ (<em>x</em>, <em>y</em>)<br>
  <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font>;</p>
<h2>2. Parameterised Types</h2>
<p>So far we have seen how having types as parameters to a procedure allows us 
  to write polymorphic operations. Types can also be returned from procedures 
  and this provides a way of defining types which are parameterised by either 
  types or values. As an example, suppose we wanted to construct an associative 
  memory in which to store values of arbitrary type together with a number which 
  would identify each. This could be defined as follows</p>
<p><font face="Arial, Helvetica, sans-serif"><strong>let</strong></font> <em>associative</em> 
  ==<br>
  <font face="Arial, Helvetica, sans-serif"><strong>proc</strong></font>(<em>element</em>: 
  <font face="Arial, Helvetica, sans-serif"><strong>type</strong></font> <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font>)<br>
  <font face="Arial, Helvetica, sans-serif"><strong>type</strong></font> (<em>assoc</em>)<br>
  <em>enter</em>: <font face="Arial, Helvetica, sans-serif"><strong>proc</strong></font>(<em>assoc</em>; 
  <em>integer</em>; <em>element</em>)<em>assoc</em>;<br>
  <em>lookup</em>: <font face="Arial, Helvetica, sans-serif"><strong>proc</strong></font>(<em>assoc</em>; 
  <em>integer</em>)<em>element</em>;<br>
  <em>empty</em>: <em>assoc</em><br>
  <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font><br>
  <font face="Arial, Helvetica, sans-serif"><strong>begin</strong></font><br>
  <font face="Arial, Helvetica, sans-serif"><strong>type</strong></font> (<em>assoc</em>)<br>
  <font face="Arial, Helvetica, sans-serif"><strong>extends</strong></font> <font face="Arial, Helvetica, sans-serif"><strong>struct</strong></font>(<em>next</em>: 
  <em>assoc</em>; <em>index</em>: <em>integer</em>; <em>value</em>: <em>element</em>);<br>
  <font face="Arial, Helvetica, sans-serif"><strong>let</strong></font> <em>empty</em> 
  == <em>assoc</em>$<em>nil</em>;<br>
  <font face="Arial, Helvetica, sans-serif"><strong>let</strong></font> <em>enter</em> 
  ==<br>
  <font face="Arial, Helvetica, sans-serif"><strong>proc</strong></font>(<em>table</em>: 
  <em>assoc</em>; <em>num</em>: <em>integer</em>; <em>val</em>: <em>element</em>)<em>assoc</em><br>
  <font face="Arial, Helvetica, sans-serif"><strong>begin</strong></font><br>
  <em>assoc</em>$<em>constr</em>(<em>table</em>, <em>num</em>, <em>val</em>)<br>
  <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font>;<br>
  <font face="Arial, Helvetica, sans-serif"><strong>letrec</strong></font> <em>lookup</em> 
  ==<br>
  <font face="Arial, Helvetica, sans-serif"><strong>proc</strong></font>(<em>table</em>: 
  <em>assoc</em>; <em>num</em>: <em>integer</em>)<em>element</em><br>
  <font face="Arial, Helvetica, sans-serif"><strong>begin</strong></font><br>
  <font face="Arial, Helvetica, sans-serif"><strong>if</strong></font> <em>table</em> 
  = <em>assoc</em>$<em>nil</em><br>
  <font face="Arial, Helvetica, sans-serif"><strong>then</strong></font> <font face="Arial, Helvetica, sans-serif"><strong>raise</strong></font> 
  <em>not_found</em><br>
  <font face="Arial, Helvetica, sans-serif"><strong>else</strong></font> <font face="Arial, Helvetica, sans-serif"><strong>if</strong></font> 
  <em>table</em>.<em>index</em> = <em>num</em><br>
  <font face="Arial, Helvetica, sans-serif"><strong>then</strong></font> <em>table</em>.<em>value</em><br>
  <font face="Arial, Helvetica, sans-serif"><strong>else</strong></font> <em>lookup</em>(<em>table</em>.<em>next</em>, 
  <em>num</em>)<br>
  <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font><br>
  <font face="Arial, Helvetica, sans-serif"><strong>en</strong></font>}<br>
  <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font>;</p>
<p>This is a very simple minded definition but it illustrates the point. We start 
  by giving the header of the procedure which includes the signature of the argument, 
  in this case that <em>element</em> is a type but that any type will do, and 
  the signature of the result. The result is a type with three objects, a value 
  which denotes the empty table and procedures to enter and look up items from 
  the table. It is implemented in terms of a <font face="Arial, Helvetica, sans-serif"><strong>struct</strong></font> 
  (a record with a <em>nil</em> value and equality) which makes up a list of index/value 
  pairs. <em>enter</em> just returns a new list with the new pair &quot;cons-ed&quot; 
  onto the front (We could have written simply <font face="Arial, Helvetica, sans-serif"><strong>let</strong></font> 
  <em>enter</em> == <em>assoc</em>$<em>constr</em>; since the arguments are in 
  the same order). A better implementation would check to see if there was already 
  an entry with that index and return a list with the old entry replaced by the 
  new one. <em>lookup</em> searches the list for an entry with the required index 
  and either returns the value or raises an exception. </p>
<p>There is no particular reason why we should use integers as the indexing value, 
  it would be perfectly possible to use any type which had an equality operation. 
  The procedure header would then be </p>
<p><font face="Arial, Helvetica, sans-serif"><strong>proc</strong></font>(<em>element</em>: 
  <font face="Arial, Helvetica, sans-serif"><strong>type</strong></font> <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font>;<br>
  <em>index_type</em>: <font face="Arial, Helvetica, sans-serif"><strong>type</strong></font> 
  (<em>i</em>) = : <font face="Arial, Helvetica, sans-serif"><strong>proc</strong></font>(<em>i</em>;<em>i</em>)<em>boolean</em> 
  <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font>)...</p>
<p> with <em>integer</em> replaced everywhere in the body by <em>index_type</em>. 
  A more efficient implementation for index types with an ordering would be to 
  use binary trees rather than lists. We would then have to add a > or &lt; to 
  <em>index_type</em>, or at least replace the = by one of these. Now, since types 
  are values we could incorporate an if-statement into the procedure and use one 
  or other of the implementations depending on the value of a further parameter. 
  We might want to do this because one implementation may be more efficient for, 
  say, small tables and the other for larger ones. For the example we will assume 
  a parameter <em>use_binary_tree</em>. The procedure will now look something 
  like this.</p>
<p><font face="Arial, Helvetica, sans-serif"><strong>proc</strong></font>(<em>element</em>: 
  <font face="Arial, Helvetica, sans-serif"><strong>type</strong></font> <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font>;<br>
  <em>index_type</em>: <font face="Arial, Helvetica, sans-serif"><strong>type</strong></font> 
  (<em>i</em>) = , &lt; : <font face="Arial, Helvetica, sans-serif"><strong>proc</strong></font>(<em>i</em>;<em>i</em>)<em>boolean</em> 
  <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font>;<br>
  <em>use_binary_tree</em>: <em>boolean</em>)...<br>
  <font face="Arial, Helvetica, sans-serif"><strong>begin</strong></font><br>
  <font face="Arial, Helvetica, sans-serif"><strong>if</strong></font> <em>use_binary_tree</em><br>
  <font face="Arial, Helvetica, sans-serif"><strong>then</strong></font><br>
  <font face="Arial, Helvetica, sans-serif"><strong>type</strong></font> .... 
  {Binary tree implementation}<br>
  <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font><br>
  <font face="Arial, Helvetica, sans-serif"><strong>else</strong></font><br>
  <font face="Arial, Helvetica, sans-serif"><strong>type</strong></font> .... 
  {List implementation}<br>
  <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font><br>
  <font face="Arial, Helvetica, sans-serif"><strong>end</strong></font></p>
<p>This could now be called as</p>
<p><font face="Arial, Helvetica, sans-serif"><strong>let</strong></font> <em>a_table</em> 
  == <em>associative</em>(<em>string</em>, <em>integer</em>, <em>true</em>);<br>
  <font face="Arial, Helvetica, sans-serif"><strong>let</strong></font> <em>another_table</em> 
  == <em>associative</em>(<em>string</em>, <em>integer</em>, <em>size</em> > 30); 
</p>
<p>In the second case the expression may not be able to be evaluated when the 
  call to the procedure is compiled, <em>but this does not matter</em>. We do 
  not know at compile-time which of the two implementations of the type will be 
  used, but we know that either of them have all the operations required so they 
  will do equally well. There is however a problem with this idea of types which 
  this example shows quite nicely. Since the expression may not be evaluated at 
  compile-time how do we know when two values have the same type? The type system 
  must ensure that we apply the <em>lookup</em> procedure which understands the 
  representation of the particular associative memory. It would be catastrophic 
  to try to look up a value assuming that the value represented a tree when it 
  was in fact a list. We need the type system to assure us at compile-time that 
  the expressions </p>
<p><font face="Arial, Helvetica, sans-serif"><strong>let</strong></font> <em>y</em> 
  == X$<em>enter</em>(X$<em>empty</em>, 1, "hello");<br>
  X$<em>lookup</em>(<em>y</em>); </p>
<p>where X stands for a type or type-returning expression, will not give faults 
  at run-time because of a mistake in interpreting the representations. There 
  are several possible approaches to the problem of which Poly and Russell illustrate 
  two. In Russell values can have types such as </p>
<p><em>associative</em>(<em>string</em>, <em>integer</em>, <em>size</em> > 30)</p>
<p>provided nothing in the expression involves a global variable (Variable in 
  this context means something whose value can be changed by assignment.) This 
  essentially means that all functions have to be &quot;variable-free&quot;, not 
  just those which directly return types. Given this restriction it is possible 
  to say that if two expressions are syntatically the same in a given context 
  then they return the same value. If however, <em>size</em> were a variable, 
  or <em>associative</em> looked at the value of a global variable, then we could 
  not say with certainty that two values with type</p>
<p><em>associative</em>(<em>string</em>, <em>integer</em>, <em>size</em> > 30)</p>
<p>had the same type. Taking a purely synatactic view means that expressions like</p>
<p><em>associative</em>(<em>string</em>, <em>integer</em>, 2 > 1)</p>
<p>and </p>
<p><em>associative</em>(<em>string</em>, <em>integer</em>, <em>true</em>)</p>
<p>are not the same type. In Poly types are only regarded as the same if they 
  are the same <em>named</em> type. So while values with types which are expressions 
  can sometimes be produced there is very little that can be done with them. To 
  be useful a type-returning expression has to be bound to an identifier.</p>
<p><font face="Arial, Helvetica, sans-serif"><strong>let</strong></font> <em>a_table</em> 
  == <em>associative</em>(<em>string</em>, <em>integer</em>, <em>true</em>);<br>
  <font face="Arial, Helvetica, sans-serif"><strong>let</strong></font> <em>a_val</em> 
  == <em>a_table</em>$<em>enter</em>(<em>a_table</em>$<em>empty</em>, 1, "hello");<br>
  <font face="Arial, Helvetica, sans-serif"><strong>let</strong></font> <em>another_table</em> 
  == <em>associative</em>(<em>string</em>, <em>integer</em>, <em>true</em>);<br>
  <font face="Arial, Helvetica, sans-serif"><strong>let</strong></font> <em>another_val</em> 
  == <em>another_table</em>$<em>enter</em>(<em>another_table</em>$<em>empty</em>, 
  1, "hello"); </p>
<p><em>a_val</em> and <em>another_val</em> have distinct types <em>a_table</em> 
  and <em>another_table</em>. </p>
<p>A side-effect of this is that &quot;types&quot; such as</p>
<p><em>list</em>(<em>integer</em>)</p>
<p>cannot be used directly. We have to write</p>
<p><font face="Arial, Helvetica, sans-serif"><strong>let</strong></font> <em>int_list</em> 
  == <em>list</em>(<em>integer</em>); </p>
<p>and then use <em>int_list</em> as the type. However this is not such a problem 
  as might at first appear. Since we can write functions which take implied parameters 
  we can write an <em>append</em> function which will work on values of any type 
  with the appropriate <em>hd</em>, <em>tl</em> etc., irrespective of their actual 
  implementations. </p>
<h2>3. Modules</h2>
<p>A module is conventionally thought of as a collection of types and functions 
  which can be separately compiled. It has an interface which is the types of 
  these functions so that other modules can make use of it without having to know 
  the precise implementation.</p>
<p>Types in Poly can be thought of in the same way. A type is a collection of 
  operations and its signature gives their &quot;types&quot; (We usually think of a type 
  as being something like <em>integer</em> which has values, but a type in Poly 
  can be any collection of objects. So a collection of floating point functions 
  <em>sin</em>, <em>cos</em> etc. could be combined as a type even though there 
  is no such thing as a value of this type.). A module which makes use of other 
  modules, <em>imports</em> them in conventional terms, can be represented as 
  a procedure which is applied to types and returns a type. One of the big advantages 
  of this view of modules is that binding modules together is done using statements 
  written in Poly and type-checked using the normal Poly type-checker. There is 
  no need, as with MESA and C-MESA[Mit79] for a separate module binding language. 
</p>
<p>The module system for ML[Har85] is essentially a system built on top of the 
  kernel language. <em>Structures</em> and <em>functors</em> correspond to values 
  and functions in the kernel but the ML type system makes it impossible to unify 
  these concepts. </p>
<h2>4. Persistence in Poly</h2>
<p>Poly is an interactive system in which the user types expressions and declarations 
  and these are compiled and executed immediately. When objects are declared they 
  are added to the objects the system knows about and they can be used in subsequent 
  expressions. Such systems are quite common and usually work on a core image 
  which can be saved from one session to the next. This is fine provided that 
  the core image does not grow too big. However as the core image gets larger 
  the costs of reading it in and writing it out get more serious. Also the cost 
  of garbage-collection rises. There is a further question about the security 
  of the data if the machine crashes while writing out a large image. </p>
<p>For these reasons Poly is implemented in a persistent store [Atk81a][Atk81b] 
  which can be thought of as a core image where objects are only read in when 
  they are actually required. The cost of loading objects from the image, or database, 
  depends on the amount of the store which is used by a program rather than the 
  total size of the image. A simple transaction mechanism ensures that the database 
  remains in a consistent state in the event of a machine crash or if the program 
  is killed halfway through writing out. Some experiments have been done on using 
  multiple databases so that large programs such as the compiler can be shared 
  between several users. </p>
<p>Using this persistent store the Poly compiler has been boot-strapped so that 
  it is just another procedure. A Standard ML compiler has also been written which 
  uses the same back-end as the Poly compiler.</p>
<p> In a typical interactive programming system there is a single name space for 
  all identifiers, but as the number of declarations have grown it has become 
  necessary to divide up the name space into separate <em>environments</em>. An 
  environment is very similar to a directory in a filing system or to a block 
  in a programming language. When an environment is selected all new identifiers 
  are entered into it and looked up in it. There is the equivalent of the scope 
  rules in a programming language so that an identifier is looked up in a series 
  of nested environments until it is found. It could be thought of as a Poly type 
  since it is a collection of objects, but it cannot be quite the same because 
  declarations can be added or removed dynamically to an environment while a Poly 
  type must be &quot;frozen&quot;. </p>
<h2>5. Conclusions</h2>
<p>Poly was designed as a general purpose language and has been used successfully 
  for some medium scale projects (there is about 20000 lines of code in the Poly 
  and ML compilers). After some years of programming in it the type system has 
  proved to work very well. Treating types as first-class values seems to result 
  in a generally simpler language than languages where types are treated as purely 
  compile-time objects. Experience with Standard ML suggests that pattern-matching 
  and exceptions with parameters (exceptions in Poly cannot carry parameters) 
  are something that should be added. Some kind of type inference based on unification 
  could be used to reduce the amount of type information which must be given explicitly, 
  though it cannot remove it completely. The presence of a persistent store tends 
  to break down the distinction between compile-time and run-time, since the compiler 
  is just another function to be applied. Compile-time does have some meaning 
  in this system however. Compiling an expression means checking the interfaces 
  between functions and their arguments so that the result can be guaranteed not 
  to produce a type-checking error later on. If we compile a procedure then we 
  want to produce a type for the procedure as a whole and remove the type information 
  within it. Not only does this improve the efficiency of the procedure but it 
  also gives us a degree of certainty that the procedure will not fail. It is 
  a little way along the road to proving the correctness of the procedure. There 
  is a cost in this static type checking in Poly in that some procedures which 
  are in fact type-correct will fail to pass a static type-checker, but the advantages 
  of static type-checking more than outweigh the disadvantages.</p>
<h2> References</h2>
<table width="100%" border="0">
  <tr> 
    <td valign="top">[Atk81a]</td>
    <td>Atkinson M.P., Chisholm K.J. and Cockshott W.P. &quot;PS-Algol: An Algol with 
      a Persistent Heap.&quot; Technical Report CSR-94-81, Computer Science Dept., 
      University of Edinburgh.</td>
  </tr>
  <tr> 
    <td valign="top">[Atk81b]</td>
    <td>Atkinson, M.P., Bailey P., Cockshott W.P., Chisholm K.J. and Morrison 
      R. &quot;Progress with Persistent Programming.&quot; Technical Report PPR-8-81, 
      Computer Science Dept., University of Edinburgh. </td>
  </tr>
  <tr> 
    <td valign="top">[Car85]</td>
    <td>Cardelli L. and MacQueen D. &quot;Persistence and Type Abstraction.&quot; Proc. 
      of the Persistence and Data Types Workshop, August 1985.</td>
  </tr>
  <tr> 
    <td valign="top">[Dem79]</td>
    <td>Demers A. and Donahue J. &quot;Revised Report on Russell.&quot; TR 79-389 Dept. 
      of Computer Science, Cornell University.</td>
  </tr>
  <tr> 
    <td valign="top">[Fai85]</td>
    <td>Fairbairn J. &quot;A New Type-Checker for a Functional Language.&quot; Proc. of 
      the Persistence and Data Types Workshop, August 1985.</td>
  </tr>
  <tr> 
    <td valign="top">[Har85]</td>
    <td>Harper R. &quot;Modules and Persistence in Standard ML.&quot; Proc. of the Persistence 
      and Data Types Workshop, August 1985. </td>
  </tr>
  <tr> 
    <td valign="top">[Mat85]</td>
    <td>Matthews D.C.J. &quot;Poly Manual&quot; SIGPLAN Notices. Vol.20 No.9 Sept. 1985. 
    </td>
  </tr>
  <tr> 
    <td valign="top">[Mil84]</td>
    <td>Milner R. &quot;A Proposal for Standard ML&quot; in &quot;Proceedings of the 1984 
      ACM Symposium on Lisp and Functional Programming&quot;, Austin, Texas 1984. 
    </td>
  </tr>
  <tr>
    <td valign="top">[Mit79]</td>
    <td>Mitchell James G. et al. &quot;MESA Language Manual.&quot; XEROX PARC, 
      1979 </td>
  </tr>
</table>

------
# [Poly Manual](https://www.polyml.org/documentation/Papers/poly/polymanual.html)

<body>
<h2>Chapter 1. Introduction</h2> 
<p>Poly is a general purpose high-level programming language. It has a simple
  type system which is also very powerful. Higher order procedures, polymorphic
  operations, parameterised abstract types and modules are all supported by a
  single mechanism.</p>
<p>Poly is <strong>strongly</strong> typed. All objects have a <strong>signature</strong> which
  the compiler can use to check that operations applied to them are sensible.
  Type errors cannot cause run time faults.</p>
<p>The language is <strong>safe</strong>. Any faults that occur at run time will result in
  exceptions which can be caught and handled by the user. All variables must be
  initialised before they are used so faults due to undefined variables cannot
  occur.</p>
<p>Poly allows <strong>higher</strong> order procedures to be declared and used. A higher
  order procedure is one which takes a procedure as a parameter or returns a
  procedure as its result. Since Poly is <strong>statically</strong> scoped (the value
  bound to an identifier is determined by the static block structure) the
  procedure that is returned may refer to the arguments and local values
  belonging to the procedure that returned it, even though that procedure is no
  longer active.</p>
<p>Poly allows <strong>polymorphic</strong> operations. For example, in many languages such
  as Pascal or MODULA-2 programs to sort arrays of integers, arrays of strings
  or arrays of real numbers are textually almost identical. They differ only in
  the actual operation used to compare two elements of the array. In Poly one
  program can be written which will sort arrays of any type provided elements
  can be compared.</p>
<p>Poly allows <strong>abstract</strong> types to be created and manipulated. 
  A&quot;hash table&quot; type can be defined that allows an arbitrary object 
  to be stored along with a string which acts as a key. There would be a look-up 
  function that will return the object stored with a given key. These can be written 
  so that only the functions to create a table, enter a value against a key, and 
  return the value with the key, are available to the user of the hash table. 
  This has the advantages that the writer of the hash table function can change 
  the <strong>way</strong> it is implemented provided it has the same <strong>external</strong> 
  properties. The user can make use of the hash table knowing that he will not 
  be able to upset its internal structure by accidentally using a function which 
  was intended to be private.</p>
<p>Abstract types can be <strong>parameterised</strong> so that a set of types with similar
  properties can be defined in a single definition. A specific type can then be
  made from that. For example, a single hash table type could be declared from
  which hash tables to hold any particular type could be derived.</p>
<p>Types in Poly are similar to <strong>modules</strong> in other languages. For example,
  types can be separately compiled. An abstract type which makes use of other
  types can be written as though it were polymorphic - it will work if it is
  given any type (module) which has the required operations. Its operation may
  be simply to return a new type (module) as its result. This new type may be
  used directly or as a parameter to other polymorphic abstract types. There is
  a mechanism for constructing large programs out of their modules and
  recompiling those which have been modified since they were last compiled.
</p>
<p>
<h2>Chapter 2. The Type System</h2>
<p>The purpose of a type system is to avoid mistakes due to using a value in a
  way that was not intended, while making meaningful operations easy to express.
  For example, if we have two matrices with the same dimensions, it should be
  just as easy to write the instruction to add them together as if they were
  integers. However it should not be possible to add an integer to a matrix. A
  type system could be designed in which all these rules were built into the
  type checker. This has the problem that new types with new rules cannot be
  added in. A better way is to have a few simple rules which allow new types to
  be added and checked but which can be used to catch most of the faults which
  could be made. The Poly type system is based on this idea.</p>
<p>All objects have a <strong>signature</strong> which is checked by the type-checker.
  The signature corresponds to a <strong>type</strong> in other languages, but is more
  general to take account of the greater power of the type system. For example,
  in a language like Pascal, a parameter to a procedure may have type
  <em>integer</em>. This gives enough information for the compiler to check that
  the procedure is correctly used; it can only be applied to an integer value,
  but it does not specify precisely which value. It can be applied to 1, 2, 3
  etc. but not to strings such as "hello" or "goodbye". The checking done
  by the compiler ensures that certain kinds of faults will not happen when the
  program is run, but it cannot prevent all faults.</p>
<p>In Poly this approach is generalised to include procedures, types and exceptions
  as well
  as values. The signature of an object contains the information which the
  compiler uses to check that it is correctly used without restricting it to
  precisely one object. Expressions and variables can be made to return any
  kind of object and the signature of the result can be worked out by the
  compiler, provided of course that all the signatures in the expression
  match. Specifications have a standard textual form which allows them to be
  written in a program or output by the compiler. The rules for matching each
  kind of signature and their textual forms are described below.</p>
<h3>2.1. Values</h3>

<p>The simplest kind of object is the <strong>value</strong> which can be operated 
  on but does not do anything itself. Examples are the number 42 or the string 
  &quot;hello&quot;. A value is said to <strong>belong</strong> to a type or <strong>have</strong> 
  a particular type, which in Poly is always a named type. The signature is the 
  name of the type. For example, the signature of the number 42 is <em>integer</em> 
  and that of &quot;hello&quot; is <em>string</em>. Two values only match if they 
  belong to the same type. </p>
<table width="600" border="1">
  <tr>
    <td><strong>Syntax</strong></td>
  </tr>
  <tr>
    <td><p>&lt;value signature&gt; ::= &lt;identifier&gt; |&lt;value signature&gt;$&lt;identifier&gt;</p>
      </td>
  </tr>
</table>
<h3>2.2. Procedures</h3>
<p><strong>Procedures</strong> are objects which perform a computation. They often 
  take <strong>parameters</strong> which can be used by the procedure and always 
  return a <strong>result</strong>. They may also have <strong>side-effects</strong> 
  or raise <strong>exceptions</strong>. Examples of procedures are "+" which adds 
  together two values and "<em>print</em>" which prints a value. "+" is an infix 
  operator which takes two values as parameters, and returns a single result. 
</p>
<p>3 + 4</p>
<p>"<em>print</em>" is a procedure which has the side-effect of printing the value.</p>
<p><em>print</em>(3+4);</p>
<p>prints out the value 7. It incidentally also produces a result, but it has 
  type <em>void</em> which has only one value, and is ignored.</p>
<p>Procedures can take procedures or types as parameters as well as simple values 
  and can also return them as results. Procedures match if their parameters and 
  results all match. The various forms of procedures will be described in the 
  section on the procedure constructor.</p>
<table width="600" border="1">
  <tr> 
    <td><strong>Syntax</strong></td>
  </tr>
  <tr> 
    <td><table width="600" border="0">
        <tr> 
          <td valign="top">&lt;procedure signature&gt;</td>
          <td valign="top">::=</td>
          <td><p>proc &lt;mode list&gt; &lt;implied parameters&gt; &lt;actual 
              parameters&gt; &lt;signature&gt;</p></td>
        </tr>
        <tr> 
          <td valign="top">&lt;mode list&gt;</td>
          <td valign="top">::=</td>
          <td>&lt;empty&gt; | &lt;mode&gt; &lt;mode list&gt;</td>
        </tr>
        <tr> 
          <td valign="top">&lt;mode&gt;</td>
          <td valign="top">::=</td>
          <td><strong>infix</strong> &lt;digit&gt; | <strong>infixr</strong> &lt;digit&gt; 
            | <strong>early</strong> | <strong>inline</strong></td>
        </tr>
        <tr> 
          <td valign="top">&lt;implied parameters&gt;</td>
          <td valign="top">::=</td>
          <td>[ &lt;parameter list&gt; ] | &lt;empty&gt;</td>
        </tr>
        <tr> 
          <td valign="top">&lt;actual parameters&gt;</td>
          <td valign="top">::=</td>
          <td>( &lt;parameter list&gt; )</td>
        </tr>
        <tr> 
          <td valign="top">&lt;parameter list&gt;</td>
          <td valign="top">::=</td>
          <td>&lt;empty&gt; | &lt;parameter&gt; |&lt;parameter&gt;; &lt;parameter 
            list&gt;</td>
        </tr>
        <tr> 
          <td valign="top">&lt;parameter&gt;</td>
          <td valign="top">::=</td>
          <td>&lt;identifier list&gt;: &lt;signature&gt; | &lt;signature&gt;</td>
        </tr>
        <tr>
          <td valign="top">&lt;identifier list&gt;</td>
          <td valign="top">::=</td>
          <td>&lt;identifier&gt; | &lt;identifier list&gt;, &lt;identifier&gt;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

<h3>2.3. Types</h3>
Poly has a novel view of <strong>types</strong> in that they are treated as being 
objects as well as having a role in checking the signature of values. Each type 
has a set of objects associated with it and a <strong>type mark</strong>. The 
type mark is used purely by the compiler in checking the signatures of objects 
and corresponds to the notion of a type in other languages, while the set of objects 
makes a type in Poly very similar to a module. All types have both a set of objects 
(which may however be empty) and a type mark, but one or the other may be more 
important in different circumstances.
<h4>2.3.1. Sets of Objects</h4>
<p>As an example of the set of objects, the type <em>integer</em>
  has various operations such as addition, subtraction, multiplication
  etc. which can operate on values of the integer type.
  Any program which works on integers will ultimately be written in terms
  of these basic operations.
  Similarly the type <em>real</em>
  will have these operations along with others which convert between
  integer and real.</p>
<p>The signature of a type is the signature of the objects which
  make it up.
  Every object in a type has a name, and all the names in one type are
  different, although objects with the same name frequently exist in
  different types.
  So for instance, many types have a <em>print</em>
  procedure which takes as its parameter a value of the type, and prints it.</p>
<p>The name of an object in a type is intended to suggest the semantics of the 
  operation, but there is no guarantee that the + operations in all types are 
  commutative; in the type <em>string</em> it is used for concatenation. ( This 
  would require a completely new level of semantic checking which is outside the 
  scope of a conventional compiler. The CLEAR system [Burstall and Goguen] attempts 
  this kind of checking.).</p>
<p>Most of the objects in types are procedures, but a type can contain simple 
  values as well as other types. For instance there may be a <em>first</em> and 
  a <em>last</em> value which give the maximum and minimum values. There is a 
  distinction between objects which are <em>part</em> of the type and those which 
  been created by operations of it and are said to <em>belong</em> to the type 
  or <em>have</em> that type. For example, there is no 3 in the type <em>integer</em> 
  but the number 3 <em>has</em> type <em>integer</em>.</p>
<p>As types are regarded as sets it is reasonable to be able to take subsets or 
  select a particular object from a type. For example, </p>
<p><strong>type</strong> (<em>atype</em>)<em><br>
  x</em>, <em>y</em>: <em>atype</em>;<br>
  <em>add</em>: <strong>proc</strong>(<em>atype</em>; <em>atype</em>)<em>atype</em>;<br>
  <em>sub</em>: <strong>proc</strong>(<em>atype</em>; <em>atype</em>)<em>atype</em><br>
  <strong>end</strong> </p>
<p>this is the signature of a type with four objects, called <em>x</em>, <em>y</em>, 
  <em>add</em> and <em>sub</em>. <em>x</em> and <em>y</em> are both values of 
  this type, and <em>add</em> and <em>sub</em> are procedures which take a pair 
  of values, and return a value. The name <em>atype</em> in brackets after the 
  word <strong>type</strong> is the name used to represent the type itself inside 
  the type signature. This type will match any of the following</p>
<p><strong>type</strong> (<em>t</em>) { Only the name has changed }<br>
  <em>x</em>, <em>y</em>: <em>t</em>;<br>
  <em>add</em>: <strong>proc</strong>(<em>t</em>; <em>t</em>)<em>t</em>;<br>
  <em>sub</em>: <strong>proc</strong>(<em>t</em>; <em>t</em>)<em>t</em><br>
  <strong>end </strong><br>
</p>
<p><strong>type</strong>
  (<em>atype</em>) { The objects are in a different order }<br>
  <em>sub</em>, <em>add</em>: <strong>proc</strong>(<em>t</em>; <em>t</em>)<em>t</em>;<br>
  <em>y</em>: <em>t</em>;<br>
  <em>x</em>: <em>t</em>;<br>
  <strong>end</strong><br></p>
<p><strong>type</strong>
  (<em>at</em>) { A subset }<br>
  <em>x</em>: <em>at</em>;<br>
  <em>add</em>: <strong>proc</strong>(<em>at</em>; <em>at</em>)<em>at</em><br>
  <strong>end</strong><br></p>
<p><strong>type</strong>
  (<em>atype</em>) { Another subset }<br>
  <em>add</em>: <strong>proc</strong>(<em>atype</em>; <em>atype</em>)<em>atype</em><br>
  <strong>end</strong><br></p>
<p><strong>type</strong> { Another subset - No need for an internal name }<br>
  <strong>end</strong></p>
<p>This last example is the empty type which matches any type. The text in curly 
  brackets is comment and ignored by the compiler.</p>

<h4>2.3.2 Type Marks and the Specifications of Values</h4>

<p>The function of the <strong>type mark</strong> is in the checking of the
  signatures of values.
  Each type has a distinct type mark which is used to identify values which
  have that type.
  The signature of a value is simply the type mark of the type to
  which it belongs.
  Checking the signatures of two values to see if they match reduces to
  seeing if they are the same type mark, there is no question of comparing
  the signatures of the types themselves.</p>
<p>The reason is that there may be many types with the same signature (short and 
  long precision integers may have the same set of operations, +, &#8211; etc. 
  but they are different types). The compiler produces type marks in various circumstances 
  so as to guarantee that two different types will always have different type 
  marks. The converse of this is that there are many circumstances in which two 
  types which are in fact identical may have different type marks, and values 
  associated with them will be incompatible. An expression which returns a type 
  always has a type mark which differs from any other, in particular if an existing 
  type is bound to a new name then they will have different type marks. Values 
  which have the old type have a different type mark from the new one and so are 
  incompatible, despite the types being in fact identical.</p>

<h4>2.3.3 Sets and Marks</h4>

<p>There are circumstances when one or other of the two ways of viewing a type 
  becomes more important. Some types are used only as collections of objects and 
  there are no values associated with them. The type mark for those types is irrelevant. 
  Equally there are occasions in which a type is used where the set of objects 
  is irrelevant. Any type matches the empty type "<strong>type</strong> <strong>end</strong>" 
  which has no objects in it. The type mark of the matching type is still there 
  and is used by the compiler.</p>
<p>This is important because of the matching rules for procedure parameters if 
  one or more is a type. A procedure which takes a type as a parameter may use 
  the formal parameter name in the signature of other parameters. For example 
  a procedure may have signature</p>
<p><em>aproc</em>: <strong>proc</strong>(<em>atype</em>: <strong>type</strong> 
  <strong>end</strong>; <em>x</em>: <em>atype</em>)<em>atype</em></p>
<p>This procedure takes two parameters, a type which may be any type, and a value 
  which has the same type as the <strong>actual</strong> parameter. Its result 
  also has this type. This kind of procedure is known as polymorphic. It can therefore 
  be applied to </p>
<p><em>aproc</em>(<em>integer</em>, 99)</p>
<p> in which case the result will have type <em>integer</em> or </p>
<p><em>aproc</em>(<em>string</em>, &quot;hello&quot;)</p>
<p>returning a string. This procedure might be the identity function which simply 
  returns its second parameter (the value) as its result. What is happening is 
  that the actual type parameter is matched to the formal parameter using the 
  matching rules for types (the formal parameter must be a subset of the actual 
  parameter), and then the type mark of the formal parameter is replaced with 
  the type mark of the actual parameter in the other parameters and the result. 
  The other parameters therefore match if they have the type mark of the actual 
  parameter. The signature of the result is obtained by replacing the formal parameter's 
  type mark by the actual parameter. It is also possible to obtain the type from 
  the type marks of values, and this is used to remove the need to explicitly 
  pass type parameters in many cases.</p>
<p>The reason for considering types both as sets and as marks is that it
  becomes possible to write polymorphic operations which make use of objects
  in types.
  For example a sorting procedure can be written which will work on any
  values provided they belong to a type whose values can be compared for
  ordering.
  How this is done will be described in detail in the section on procedures.</p>
<table width="600" border="1">
  <tr> 
    <td><strong>Syntax</strong></td>
  </tr>
  <tr> 
    <td><table width="600" border="0">
        <tr> 
          <td valign="top">&lt;type signature&gt;</td>
          <td valign="top">::=</td>
          <td><p><strong>type</strong> &lt;internal&nbsp;name&gt; &lt;signature&nbsp;list&gt; 
              <strong>end</strong></p></td>
        </tr>
        <tr> 
          <td valign="top">&lt;internal name&gt;</td>
          <td valign="top">::=</td>
          <td> &lt;empty&gt; | (&lt;identifier&gt;)</td>
        </tr>
        <tr> 
          <td valign="top">&lt;signature list&gt;</td>
          <td valign="top">::=</td>
          <td>&lt;empty&gt; | &lt;object list&gt;</td>
        </tr>
        <tr> 
          <td valign="top">&lt;object list&gt;</td>
          <td valign="top">::=</td>
          <td>&lt;object&gt; | &lt;object&gt;; &lt;object&nbsp;list&gt;</td>
        </tr>
        <tr> 
          <td valign="top">&lt;object&gt;</td>
          <td valign="top">::=</td>
          <td>&lt;identifier&nbsp;list&gt; : &lt;signature&gt;</td>
        </tr>
        <tr> 
          <td valign="top">&lt;identifier list&gt;</td>
          <td valign="top">::=</td>
          <td>&lt;identifier&gt; | &lt;identifier&gt;, &lt;identifier&nbsp;list&gt;</td>
        </tr>
      </table></td>
  </tr>
</table>
<p>
<h3>2.3.4. Exceptions</h3>
  
<p>The fourth kind of object in Poly is the exception. The mechanism of exceptions 
  is based on that of Standard ML.</p>
<table width="600" border="1">
  <tr> 
    <td><strong>Syntax</strong></td>
  </tr>
  <tr> 
    <td><table width="600" border="0">
        <tr> 
          <td valign="top">&lt;exception signature&gt;</td>
          <td valign="top">::=</td>
          <td><p><strong>exception</strong> &lt;implied&nbsp;parameters&gt; &lt;actual&nbsp;parameters&gt;</p></td>
        </tr>
      </table></td>
  </tr>
</table>

<h2>Chapter 3. Expressions and Values</h2>

<p>The basic element of a Poly program is the <strong>expression</strong>.
  An expression has a value and a signature which ensures that the
  value is correctly used.
  Expressions consist of identifiers and constructors
  and operations on them, either procedure applications or selections from
  types.</p>
  
<h3>3.1. Identifiers</h3>

<p>An <strong>identifier</strong> is a name which represents an object. The binding 
  of a name to a particular object is made by a <strong>declaration</strong>. 
  An identifier may be any string of alphanumeric characters starting with a letter, 
  or a string of one or more "special" characters. The underline character "_" 
  is considered as an alphanumeric. Each of the following are identifiers, separated 
  by spaces.</p>
<p><em>a</em> <em>Message</em> <em>integer</em> <em>j</em> + := &gt;&gt;&gt;&gt;&gt;&gt; 
  <em>L999a</em><br>
  <em>An_extremely_long_identifier</em></p>
<p>The "special" characters are often used for infix operators, but can be used 
  for anything. They are </p>
<p>! # %&amp; = - + * : &lt; &gt; / \ ? ~ ^ | . @</p>
<p>Certain words are <strong>reserved</strong> and cannot be used as identifiers 
  because they are used for special purposes. These are</p>

<table border="0">
  <tr> 
    <td width="14%"><strong>and</strong></td>
    <td width="14%"><strong>begin</strong> </td>
    <td width="14%"><strong>cand</strong></td>
    <td width="14%"><strong></strong> <strong>catch</strong> </td>
    <td width="6"><strong>cor</strong> </td>
    <td width="14%"><strong>do</strong> </td>
    <td width="14%"><strong>early</strong></td>
  </tr>
  <tr> 
    <td width="14%"><strong>else</strong> </td>
    <td width="14%"><strong>end</strong></td>
    <td width="14%"><strong>exception</strong></td>
    <td width="14%"><strong>extends</strong></td>
    <td><strong>if</strong></td>
    <td width="14%"><strong>infix</strong></td>
    <td width="14%"><strong>infixr</strong></td>
  </tr>
  <tr> 
    <td width="14%"><strong>inline</strong></td>
    <td width="14%"><strong>let</strong></td>
    <td width="14%"><strong>letrec</strong></td>
    <td width="14%"><strong>proc</strong></td>
    <td><strong>raise</strong></td>
    <td width="14%"><strong>record</strong></td>
    <td width="14%"><strong>struct</strong></td>
  </tr>
  <tr>
    <td width="14%"><strong>then</strong></td>
    <td width="14%"><strong>type</strong></td>
    <td width="14%"><strong>union</strong></td>
    <td width="14%"><strong>while</strong></td>
    <td><strong>:</strong></td>
    <td width="14%"><strong>==</strong></td>
    <td width="14%"><strong>.</strong></td>
  </tr>
</table>
<p>Identifiers written in different cases are regarded as distinct, except that 
  reserved words may be written in either or mixed case. In this manual reserved 
  words are always shown in bold font while identifiers are given in italics.</p>

<table width="600" border="1">
  <tr> 
    <td><strong>Syntax</strong></td>
  </tr>
  <tr> 
    <td><table width="600" border="0">
        <tr> 
          <td valign="top">&lt; identifier&gt;</td>
          <td valign="top">::=</td>
          <td><p>&lt;letter&gt; | &lt;identifier&gt;&lt;letter&gt;|&lt;identifier&gt;&lt;digit&gt;</p></td>
        </tr>
      </table></td>
  </tr>
</table>
<p>Comments in Poly are written between curly brackets "{" and "}". Any text in 
  the brackets is completely ignored and the whole comment is simply regarded 
  as a separator between words in the same way as a space or a new line. </p>
<h3>3.2. Selectors</h3>

<p>A selector selects an object from a type.</p>
<p><em>integer</em>$+ </p>
<p>selects the "+" operation from the type <em>integer</em>, while</p>
<p><em>string</em>$+ </p>
<p>selects "+" from <em>string</em>. </p>
<table width="600" border="1">
  <tr> 
    <td><strong>Syntax</strong></td>
  </tr>
  <tr> 
    <td><table width="600" border="0">
        <tr> 
          <td valign="top">&lt;selector&gt;</td>
          <td valign="top">::=</td>
          <td><p>&lt;identifier&gt;$&lt;identifier&gt;|&lt;selector&gt;$&lt;identifier&gt;</p></td>
        </tr>
      </table></td>
  </tr>
</table>

<h3>3.3. Constructors</h3>
<p><strong>Constructors</strong> make values from other values. There are general 
  constructors for procedures and types as well as three constructors which make 
  special kinds of types: <strong>records, unions, </strong> and <strong>structures</strong>. 
  There are also constructors for values which allow literal constants to be entered 
  in a program.
<p>1 999 &quot;hello&quot; 'A' 0xff 
<p>Literal constants are either numbers or strings of characters. Numbers are 
  strings of digits or letters starting with a digit, and strings are any sequence 
  of characters unclosed in quotation marks. By default numbers are converted 
  to type <strong>integer</strong> and strings to either <strong>char</strong> 
  if they are enclosed in single quotes ('), or <strong>string</strong> if they 
  are in double quotes (&quot;). </p>
<h3>3.4. Declarations</h3>

<p>The result of any expression can be bound to an identifier by a declaration. 
</p>
<p><strong>let</strong> <em>result</em> == 4+3* 2;</p>
<p>The identifier <em>result</em> can be used in place of the value that is bound 
  to it.</p>
<p>result+6</p>
<p>will yield the value 16. As well as taking the value from the expression, the 
  identifier also inherits its signature. The signature of <em>result</em> is 
  therefore <em>integer</em>. This works for any expression including those which 
  yield procedures or types. </p>
<p><strong>let</strong> <em>p</em> == <em>print</em>;</p>
<p>declares <em>p</em> to be the same as <em>print</em> so </p>
<p><em>p</em> 10;</p>
<p>will print the value 10.</p>
<p>An explicit signature may be given for an identifier.</p>
<p><strong>let</strong> <em>i</em>: <em>integer</em> == 10;</p>
<p>The result of the expression must have this signature for the compiler to allow 
  it. It is useful if a complex expression is being bound to an identifier to 
  check the signature of the result when it is being bound rather than when it 
  is used.</p>
<p>The identifier in an ordinary declaration is declared <strong>after</strong> 
  the expression is evaluated. </p>
<p><strong>let</strong> <em>i</em> == <em>i</em>+1</p>
<p> is valid provided <em>i</em> has been declared before. However when recursive 
  procedures or types are being declared a different kind of declaration is needed. 
</p>
<p><strong>letrec</strong> <em>p</em> == .... </p>
<p><strong>letrec</strong> introduces a recursive declaration, and the <em>p</em> 
  used in the expression will be the <em>p</em> that is being declared. Recursive 
  declarations can only be used for procedures or types and will be described 
  in more detail below.</p>
<p>Several declarations can be grouped together with <strong>and</strong>. </p>
<p><strong>let</strong> <em>a</em> == 1 <strong>and</strong> <em>b</em> == 2</p>
<p>This declares both <em>a</em> and <em>b</em>. Grouping declarations together 
  in this way is useful for mutually recursive declarations.</p>
<p><strong>letrec</strong> <em>p</em> == .... <strong>and</strong> <em>q</em> 
  == ....</p>
<table width="600" border="1">
  <tr> 
    <td><strong>Syntax</strong></td>
  </tr>
  <tr> 
    <td><table width="600" border="0">
        <tr> 
          <td valign="top">&lt;declaration&gt;</td>
          <td valign="top">::=</td>
          <td><p><strong>let</strong> &lt;binding&gt; <strong>and</strong> .... 
              <strong>and</strong> &lt;binding&gt; | <strong>letrec</strong> &lt;binding&gt; 
              <strong>and</strong> .... <strong>and</strong> &lt;binding&gt;</p></td>
        </tr>
        <tr>
          <td valign="top">&lt;binding&gt;</td>
          <td valign="top">::=</td>
          <td>&lt;identifier&gt; : &lt;signature&gt; == &lt;expression&gt; | &lt;identifier&gt; 
            == &lt;expression&gt;</td>
        </tr>
      </table></td>
  </tr>
</table>

<h3>3.5. Blocks</h3>
<p>Commands can be grouped by enclosing them in the bracketing symbols <strong>begin</strong> 
  and <strong>end</strong> or <strong>(</strong> and <strong>)</strong>. </p>
<p>2* (3+4);</p>
<p><strong>begin</strong> <em>print</em> &quot;Hello&quot;; <em>print</em> &quot; 
  again&quot; <strong>end</strong></p>
<p>A block can consist of several expressions separated by semicolons or just 
  one. While <strong>begin</strong> and <strong>end</strong> or round brackets 
  can be used in either case, it is usual to use <strong>begin</strong> and <strong>end</strong> 
  to group several expressions together, and round brackets to group parts of 
  an expression which are to be evaluated first. The value returned by the block 
  is the value of the last expression. All the other expressions must return values 
  with type <em>void</em>. Empty blocks are allowed and these return <em>void</em>.</p>
<p>Declarations may appear in the block as well as expressions. The identifier 
  is then available in any of the other expressions after its declaration.
<p><strong>begin</strong> <strong>let</strong> <em>x</em> == 2; <em>x</em> + 3 
  <strong>end</strong>
<p>This block returns the value 5. <em>x</em> is not available outside the block, 
  but it is available in inner blocks.
<p><strong>begin</strong><br>
  <strong>let</strong> <em>p</em> == <em>print</em>;<br>
  <strong>begin</strong><br>
  <strong>let</strong> <em>ten</em> == 10;<br>
  <em>p</em> <em>ten</em><br>
  <strong>end</strong><br>
  <strong>end</strong>
<p>An identifier declared in a block "hides" an identifier with the same name 
  in a outer block.

<table width="600" border="1">
  <tr> 
    <td><strong>Syntax</strong></td>
  </tr>
  <tr> 
    <td><table width="600" border="0">
        <tr> 
          <td valign="top">&lt;block&gt;</td>
          <td valign="top">::=</td>
          <td><p><strong>begin</strong> &lt;expressionlist&gt; catchphrase <strong>end</strong> 
              | <strong>(</strong> &lt;expressionlist&gt; &lt;catchphrase&gt; 
              <strong>)<strong> |</strong> ( )</strong> | <strong>begin</strong>&nbsp;<strong>end</strong></p></td>
        </tr>
        <tr> 
          <td valign="top">&lt;expressionlist&gt;</td>
          <td valign="top">::=</td>
          <td>&lt;expordec&gt;; ... ; &lt;expordec&gt;</td>
        </tr>
        <tr>
          <td valign="top">&lt;expordec&gt;</td>
          <td valign="top">::= </td>
          <td>&lt;expression&gt; | &lt;declaration&gt;</td>
        </tr>
      </table></td>
  </tr>
</table>
<h4>3.5.1. Conditionals</h4>
<p>An expression can return different results according to the value of a test.</p>
<p><strong>if</strong> 3 &gt; 4 <strong>then</strong> 1 <strong>else</strong> 
  2; </p>
<p>The result of the conditional is the expression following <strong>then</strong> 
  if the condition is <em>true</em> and the expression after <strong>else</strong> 
  if the expression is <em>false</em>. In this case the result will be 2, since 
  the condition is clearly false. The expression to be tested must have type <em>boolean</em> 
  which contains the two values <em>true</em> and <em>false</em>. The two expressions 
  returned by the then- and else-parts must be the same. The else-part may be 
  omitted if the then-part returns a <em>void</em> result. </p>
<p><strong>if</strong> <em>x</em> &gt; 3 <strong>then</strong> <em>print</em> 
  &quot;yes&quot;</p>
<p>Conditionals may return procedures or types but the then- and else-parts must 
  both return values with compatible signatures.</p>
<p><strong>if</strong> ... <strong>then</strong> <em>integer</em>$<em>pred</em> 
  <strong>else</strong> <em>integer</em>$<em>succ</em></p>
<p>The expression returns a procedure which takes an integer parameter and returns 
  an integer result.</p>
<table width="600" border="1">
  <tr> 
    <td><strong>Syntax</strong></td>
  </tr>
  <tr> 
    <td><table width="600" border="0">
        <tr> 
          <td valign="top">&lt;conditional&gt;</td>
          <td valign="top">::=</td>
          <td><p><strong>if</strong> &lt;expression&gt; <strong>then</strong> 
              &lt;expression&gt;<strong>else</strong> &lt;expression&gt; |<br>
              <strong>if</strong> &lt;expression&gt;<strong>then</strong> &lt;expression&gt;</p></td>
        </tr>
      </table></td>
  </tr>
</table>
<p>Related to the if-expression are <strong>cand</strong> and <strong>cor</strong>. 
  Syntactically they behave like infix operators of precedence -1 and -2 respectively 
  but they are actually reserved words. </p>
<p><em>x</em> = 1 <strong>cand</strong> <em>y</em> =2</p>
<p>is the same as </p>
<p><strong>if</strong> <em>x</em> = 1 <strong>then</strong> <em>y</em> = 2 <strong>else</strong> 
  <em>false</em></p>
<p>and </p>
<p><em>x</em> = 1 <strong>cor</strong> <em>y</em> =2 </p>
<p>is the same as</p>
<p><strong>if</strong> <em>x</em> = 1 <strong>then</strong> <em>true</em> <strong>else</strong> 
  <em>y</em> = 2</p>

<h4>3.5.2. Repetition</h4>
<p>An expression can be repeated while some condition holds. </p>
<p><strong>while</strong> @<em>x</em> &gt; 0 <strong>do</strong> <em>x</em> := 
  <em>pred</em>(@<em>x</em>) </p>
<p>decrements <em>x</em> until it is zero, by repeating the second expression 
  until the first returns <em>false</em>. The expression after the <strong>while</strong> 
  must have type <em>boolean</em> and the expression after <strong>do</strong> 
  must have type <em>void</em>. The result of a "while-loop" has type <em>void</em>.</p>
<p>The "while-expression" is sometimes convenient, but it is usually both clearer 
  and more efficient to use a recursive procedure. </p>
<table width="600" border="1">
  <tr> 
    <td><strong>Syntax</strong></td>
  </tr>
  <tr> 
    <td><table width="600" border="0">
        <tr> 
          <td valign="top">&lt;while loop&gt;</td>
          <td valign="top">::=</td>
          <td><p><strong>while</strong> &lt;expression&gt; <strong>do</strong> 
              &lt;expression&gt;</p></td>
        </tr>
      </table></td>
  </tr>
</table>


<h2>&nbsp;</h2>
<h2>Chapter 4. Procedures</h2>

<p>A procedure is an encapsulated piece of program which may take some
  parameters and returns a result.</p>
  
<h3>4.1. The Procedure Constructor</h3>

<p>A procedure is made by the <strong>procedure constructor</strong>, called a 
  lambda expression in some languages, which is a expression preceded by a <strong>procedure 
  header</strong>. The procedure header gives the names and signatures of the 
  parameters as they will be used in the expression and the signature of the result. 
</p>
<p><strong>proc</strong>(<em>i</em>: <em>integer</em>)<em>integer</em> . <em>i</em> 
  + 1</p>
<p>This is a procedure which takes a parameter called <em>i</em> in the block, 
  which is a value of type integer and it returns a result which is a value of 
  type integer. The expression returns a result which is one more than the parameter. 
  This expression is evaluated when the procedure is called and so it is equivalent 
  to the successor function for integer.</p>
<p>The procedure constructor is an expression which returns a procedure as its 
  result. It can be used directly in an expression, but usually it is bound to 
  an identifier. 
<p><strong>let</strong> <em>imax</em> == <strong>proc</strong>(<em>i</em>, <em>j</em>: 
  <em>integer</em>)<em>integer</em> . <strong>if</strong> <em>i</em> &gt; <em>j</em> 
  <strong>then</strong> <em>i</em> <strong>else</strong> <em>j</em> 
<p>The identifier is then used in an expression 
<p><em>imax</em>(<em>1</em>, imax(2, 3))</p>
<h3>4.2. Recursive Procedures</h3>
<p>Recursive procedures are declared using <strong>letrec</strong>. 
<p><strong>letrec</strong> <em>fact</em> ==<strong> proc</strong>(<em>i</em>: 
  <em>integer</em>)<em>integer</em> . <strong>if</strong> <em>i</em> = 1 <strong>then</strong> 
  1 <strong>else</strong> <em>fact</em>(<em>i</em>-1) * <em>i</em>
<p>This has made the usual recursive definition of the factorial function. Recursive 
  procedures are the preferred way of making loops and repeating expressions in 
  Poly.</p> 
<h3>4.3. Operators</h3>
<p>Procedures can be declared so that they can be used as infix operators. Infix 
  operators have a <strong>precedence</strong> which determines how tightly they 
  bind. For example, the expression 
<p>1* 2+3* 4
<p>would return 20 if it were evaluated strictly from left to right, but yields 
  14 if it is evaluated using the normal algebraic rules. In this case the multiplication 
  operator <em>* </em> is said to have a higher precedence than the addition operator 
  <em>+</em>. In Poly the precedence of an infix operator is given as a number 
  between 0 and 9, the higher the number the greater the precedence. 
<p><strong>let</strong> <em>rem</em> ==<br>
  <strong>proc</strong> <strong>infix</strong> 7 (<em>i</em>, <em>j</em>: <em>integer</em>)<em>integer</em> 
  . <em>i</em> - <em>i</em> <em>div</em> <em>j</em> * <em>j</em>
<p>This declares <em>rem</em> to return the remainder after dividing <em>i</em> 
  by <em>j</em>. 
<p>73 <em>rem</em> 4
<p>In this case <em>rem</em> has been given a precedence of 7, which is the same 
  as the multiplication and division operators. The precedence of the other operators 
  is given in the description of the standard definitions. Operators with the 
  same precedence declared with <em>infix</em> associate to the left. Operators 
  can be made right associative by using <em>infixr</em>. </p>
<h3>4.4. Polymorphic Procedures</h3>
<p>The <em>imax</em> procedure declared above takes integer values and returns 
  the larger of the two, which is of course also an integer. A similar procedure 
  can be written to return the greater of two strings (in alphabetical order). 
<p><strong>let</strong> <em>smax</em> == <strong>proc</strong>(<em>i</em>, <em>j</em>: 
  <em>string</em>)<em>string</em> . <strong>if</strong> <em>i</em> &gt; <em>j</em> 
  <strong>then</strong> <em>i</em> <strong>else</strong> <em>j</em>
<p><em>smax</em> is exactly the same as <em>imax</em> except for the change in 
  the names of the types. A similar procedure could be written for any type, provided 
  of course that values of the type can be compared with a <em>&gt;</em> operator. 
  In Poly a single procedure can be written to handle all these cases, such a 
  procedure is called <strong>polymorphic</strong>. 
<p><strong>let</strong> <em>pmax</em> == <strong>proc</strong>(<em>a_type</em>: 
  <strong>type</strong>(<em>t</em>) &gt; : <strong>proc</strong>(<em>t</em>;<em>t</em>)<em>boolean</em> 
  <strong>end</strong>; <em>i</em>, <em>j</em>: <em>a_type</em>)<em>a_type</em> 
  .<strong>if</strong> <em>i</em> &gt; <em>j</em> <strong>then</strong> <em>i</em> 
  <strong>else</strong> <em>j</em> 
<p>It works by requiring an extra parameter, <em>a_type</em>, which is the type 
  of the values (recall that types can be passed as parameters to procedures). 
  The important thing about this type is that it must have a <em>&gt;</em> operator 
  which compares two values of the type and returns a boolean value. The type 
  signature
<p><strong>type</strong>(<em>t</em>) &gt; : <strong>proc</strong>(<em>t</em>; 
  <em>t</em>)<em>boolean</em> <strong>end</strong>
<p>expresses this constraint. The other two parameters and the result must be 
  of this type. <em>pmax</em> can therefore be applied to any type which satisfies 
  the constraint, and a pair of values of the type.
<p><em>pmax</em>(<em>integer</em>, 1, 2)
<p>returns an integer result, while 
<p><em>pmax</em>(<em>string</em>, &quot;abc&quot;, &quot;abd&quot;)
<p>will return a string. However 
<p><em>pmax</em>(<em>integer</em>, 1, &quot;abc&quot;)<br>
  <em>pmax</em>(<em>string</em>, 3, 4)
<p>will be rejected by the compiler because the signatures do not match. 
<p>max(boolean, true, false)
<p>will also fail, because <em>boolean</em> does not possess a <em>&gt;</em> operator. </p>
<h3>4.5. Implied Parameters</h3>
<p>It is not very convenient to have to write an extra parameter when calling 
  polymorphic procedures, especially since it is just the type of the other parameters. 
  Poly allows a polymorphic procedure to be written so that the type parameters 
  need not be given explicitly but are passed implicitly. </p>
<p><strong>let</strong> <em>max</em> ==<br>
  <strong>proc</strong><strong>[</strong><em>a_type</em>: <strong>type</strong> 
  (<em>t</em>) &gt; : <strong>proc</strong>(<em>t</em>;<em>t</em>)<em>boolean</em> 
  <strong>end</strong><strong>]</strong>(<em>i</em>, <em>j</em>: <em>a_type</em>)<em>a_type</em> 
  . <strong>if</strong> <em>i</em> &gt; <em>j</em> <strong>then</strong> <em>i</em> 
  <strong>else</strong> <em>j</em><br>
</p>
<p>The type parameter in this case is enclosed in square brackets to indicate 
  that there will not be a corresponding actual parameter. </p>
<p><em>max</em>(3,4)</p>
<p>looks at the actual parameters, finds that they are integers and so passes 
  the type <em>integer</em> implicitly.</p>
<p><em>max</em>(&quot;abc&quot;, &quot;bcd&quot;)</p>
<p>passes the type <em>string</em>.</p>
<p><em>max</em>(3, &quot;abc&quot;)</p>
<p>is incorrect because the parameters must have the same type.</p>
<p>Implied parameters are a very powerful facility. All the operators such as 
  <em>+</em> and <em>&gt;</em> are polymorphic procedures which take the type 
  of their explicit parameters as an implied parameter. Their only action is to 
  select and apply the appropriate procedure from the type (This does not mean 
  that adding two integers together requires two procedure calls. These operations 
  are implemented as inline procedures and the compiler optimises it down to a 
  single "add" instruction.) For example, the definition of <em>+</em> in the 
  standard header is </p>
<p><strong>let</strong> + { addition } == <strong>proc</strong> <strong>early</strong> 
  <strong>inline</strong> <strong>infix</strong> 6 <strong>[</strong><em>inttype</em> 
  : <strong>type</strong> (<em>t</em>) + : <strong>proc</strong> (<em>t</em>; 
  <em>t</em>)<em>t</em> <strong>end</strong><strong>]</strong> (<em>x</em>, <em>y</em> 
  : <em>inttype</em>) <em>inttype</em>} . <em>x</em> <em>inttype</em>$+ <em>y</em></p>
<p>The words <strong>early</strong> and <strong>inline</strong> are directives 
  to the compiler. <strong>early</strong> tells the compiler that this procedure 
  should be evaluated as soon as possible. This usually means that the compiler 
  will attempt to execute it when it is compiled if its parameters are constants 
  (Since procedures can have side-effects the compiler must not attempt to evaluate 
  all procedures at compile-time. Consider, for example, a procedure which returns 
  the current date and time). <strong>inline</strong> tells the compiler to insert 
  the code for this procedure at the point of call rather than generate a procedure 
  call. Both <strong>early</strong> and <strong>inline</strong> are hints to the 
  compiler rather than instructions, and the compiler may choose to ignore either 
  or both. \syntax{&lt;procedure signature&gt; . &lt;expression&gt;} { &lt;procedure 
  constructor&gt; ::=&lt;procedure signature&gt; . &lt;expression&gt; } </p>
<table width="600" border="1">
  <tr> 
    <td><strong>Syntax</strong></td>
  </tr>
  <tr> 
    <td><table width="600" border="0">
        <tr> 
          <td valign="top">&lt;procedure constructor&gt;</td>
          <td valign="top">::=</td>
          <td><p>&lt;procedure signature&gt; . &lt;expression&gt;</p></td>
        </tr>
      </table></td>
  </tr>
</table>
<h2>&nbsp;</h2>
<h2>Chapter 5. Exceptions</h2>
<p>Normally expressions in a block are executed one after another until the end 
  of the block is reached. There are occasions, however, when an unusual case 
  occurs and an escape is needed. </p>
<p><strong>let</strong> <em>p</em> == <em>q</em> <em>div</em> <em>r</em></p>
<p>For example, a program containing a divide operation could possibly fail if 
  <em>r</em> were zero. Explicitly checking for zero before making the division 
  would be tedious and unnecessary in most cases, so what happens is that an <strong>exception</strong> 
  is generated. Exceptions are error conditions together with a string which identifies 
  the cause of the failure. Dividing by zero, for example, results in an exception 
  with the string <em>divideerror</em>. An exception can also be generated by 
  using <strong>raise</strong>. </p>
<p><strong>raise</strong> <em>an_error</em> </p>
<p>generates an exception with the name <em>an_error</em>.</p>
<p>Exceptions generated in a block may be caught by a <strong>handler</strong>. 
  A handler is given control when any exception in the block happens and either 
  returns a result or raises another exception. The handler is a procedure whose 
  parameter is a string, the exception name, and result must be compatible with 
  the result the block would return if the exception had not happened.</p>
<p><strong>begin</strong><br>
  <em>i</em> <em>div</em> <em>j</em><br>
  <strong>catch</strong> <strong>proc</strong> (<em>name</em>: <em>string</em>)<em>integer</em><br>
  <strong>begin</strong><br>
  <em>print</em>(&quot;Exception-&quot;);<br>
  <em>print</em>(<em>name</em>);<br>
  9999<br>
  <strong>end</strong><br>
  <strong>end</strong></p>
<p>This block returns the result of dividing <em>i</em> by <em>j</em> unless an 
  exception occurs. In that case it prints out <em>Exception-</em> followed by 
  the name of the exception, and returns the (large) value 9999.</p>
<p>The handling procedure can be any which has the correct signature, but frequently 
  it is written as a procedure constructor after the word <strong>catch</strong> 
  . Any exceptions raised by the handler are, of course, not caught by it, but 
  appear in the next block out. In addition, if the block contains declarations 
  they are not available to the handler. This is because an exception could occur 
  while the declarations were being made so the identifier would have no value.</p>
<p><strong>begin</strong><br>
  <strong>let</strong> <em>val</em> == <em>i</em> <em>div</em> <em>j</em>;<br>
  <strong>let</strong> <em>otherval</em> == <em>i</em>+1;<br>
  <strong>catch</strong> <strong>proc</strong> (<em>name</em>: <em>string</em>)...<br>
  <strong>begin</strong> { Cannot use val or otherval here }<br>
  <strong>end</strong><br>
  <strong>end</strong></p>
<p>If an exception is not caught in a block it automatically propagates to the 
  containing block. This in turn can handle it, or allow it to propagate to the 
  next block out. An exception raised in a procedure but not caught in it causes 
  the procedure to return and the exception appears at the point where the procedure 
  was called. The calling block will catch the exception if it has a handler or 
  it will propagate back further.</p>
<table width="600" border="1">
  <tr> 
    <td><strong>Syntax</strong></td>
  </tr>
  <tr> 
    <td><table width="600" border="0">
        <tr> 
          <td valign="top">&lt;raise expression&gt;</td>
          <td valign="top">::=</td>
          <td><p><strong>raise</strong> &lt;identifier&gt;</p></td>
        </tr>
        <tr>
          <td valign="top">&lt;catch phrase&gt;</td>
          <td valign="top">::=</td>
          <td><strong>catch</strong> &lt;expression&gt;</td>
        </tr>
      </table></td>
  </tr>
</table>
<p>&nbsp;</p>
<h2>Chapter 6. Specialised Type Constructors</h2>
<p>There are three specialised constructors which make different kinds of types. 
  They are normally used to provide the &quot;concrete&quot; type which implements 
  an abstract type. The development of abstract types will be described in the 
  next chapter.</p>
<h3>6.1. Records</h3>
<p>A <strong>record type</strong> allows objects composed of a group of values 
  to be put together and taken apart.</p>
<p> <strong>let</strong> <em>int_pair</em> == <strong>record</strong> (<em>first</em>, 
  <em>second</em>: <em>integer</em>) } makes a type with the operations for making 
  pairs of integers. The names <em>first</em> and <em>second</em> are known as 
  <strong>field names</strong> and the signature, in this case <em>integer</em> 
  is the <strong>field signature</strong>. The result of this declaration is a 
  type <em>int_pair</em> has three operations in it, <em>constr</em>, <em>first</em> 
  and <em>second</em>. </p>
<p>Every record has a <em>constr</em> procedure which takes objects with the field 
  signatures and makes them into a record value. The <em>constr</em> in <em>int_pair</em> 
  takes two integer values and packages them up as a value of the <em>int_pair</em> 
  type. </p>
<p><strong>let</strong> <em>pair_val</em> == <em>int_pair</em>$<em>constr</em>(1, 
  2); </p>
<p>The field names <em>first</em> and <em>second</em> are procedures called <strong>selectors</strong> 
  that take apart values of the <em>int_pair</em> type and return the first and 
  second values respectively. </p>
<p><em>int_pair</em>$<em>first</em>(<em>pair_val</em>)</p>
<p>will return 1 and</p>
<p><em>int_pair</em>$<em>second</em>(<em>pair_val</em>)</p>
<p>will return 2. Records can be made with elements of any signature and any number 
  of elements.</p>
<p><strong>let</strong> <em>prec</em> == <strong>record</strong> (<em>val</em>: 
  <em>integer</em>; <em>pr</em>: <strong>proc</strong> (<em>integer</em>)<em>integer</em>); 
</p>
<p>makes a record to hold a value and a procedure. A value of this type can be 
  made by </p>
<p><strong>let</strong> <em>prec_val</em> == <em>prec</em>$<em>constr</em>(1, 
  <em>integer</em>$<em>succ</em>)</p>
<p>and the selecting functions <em>val</em> and <em>pr</em> now return an integer 
  value and a procedure respectively.</p>
<p><em>prec</em>$<em>pr</em>(<em>prec_val</em>)(99) + <em>prec</em>$<em>val</em>(<em>prec_val</em>)</p>
<p>Note, however that each invocation of the record constructor, as with the other 
  constructors, yields a type with a new unique type mark. This means that two 
  record types with identical field names and signatures are regarded as different 
  types. A more convenient syntax for selection is available which allows</p>
<p><em>pair_val</em>.<em>first</em> <em>pair_val</em>.<em>second</em></p>
<p> to be used with exactly the same meaning as </p>
<p><em>int_pair</em>$<em>first</em>(<em>pair_val</em>) <em>int_pair</em>$<em>second</em>(<em>pair_val</em>)</p>
<p>This syntax is not restricted to record selection but can be used with any 
  procedure that is an object in a type and takes one argument of that type. The 
  meaning of <em>X.Y</em> is</p>
<p><em>X_type</em>$<em>Y</em>(<em>X</em>)</p>
<p>where <em>X_type</em> is the type to which <em>X</em> belongs. So for example, 
</p>
<p>99.<em>succ</em>.<em>print</em></p>
<p> is equivalent to </p>
<p><em>integer</em>$<em>print</em>(<em>integer</em>$<em>succ</em>(99))</p>
<table width="600" border="1">
  <tr> 
    <td><strong>Syntax</strong></td>
  </tr>
  <tr> 
    <td><table width="600" border="0">
        <tr> 
          <td valign="top">&lt;record constructor&gt;</td>
          <td valign="top">::=</td>
          <td><p><strong>record ( </strong>&lt;field list&gt; <strong>)</strong></p></td>
        </tr>
        <tr> 
          <td valign="top">&lt;field list&gt;</td>
          <td valign="top">::=</td>
          <td>&lt;field&gt; | &lt;field&gt;<strong>;</strong> &lt;field list&gt;</td>
        </tr>
        <tr> 
          <td valign="top">&lt;field&gt;</td>
          <td valign="top">::=</td>
          <td>&lt;identifier list&gt;<strong> :</strong> &lt;signature&gt;</td>
        </tr>
        <tr>
          <td valign="top">&lt;identifier list&gt;</td>
          <td valign="top">::=</td>
          <td>&lt;identifier&gt; | &lt;identifier&gt; <strong>, </strong>&lt;identifier 
            list&gt; </td>
        </tr>
      </table></td>
  </tr>
</table>

<h3> 6.2. Unions</h3>
<p>The record constructor makes types whose values are groups of objects. Another 
  constructor, the <strong>union</strong> constructor, makes types whose values 
  may have any of a set of signatures.</p>
<p><strong>let</strong> <em>int_or_str</em> == <strong>union</strong> (<em>int</em>: 
  <em>integer</em>; <em>str</em>: <em>string</em>)</p>
<p>This has created a type whose values can be either integers or strings. The 
  names before the colons (<em>int</em> and <em>str</em>) are called <strong>tags</strong> 
  and a tag and its signature (after the colon) is called a <strong>variant</strong>. 
  An integer or string may be converted into this type by <strong>injection</strong> 
  operations. </p>
<p><strong>let</strong> <em>int_form</em> == <em>int_or_str</em>$<em>inj_int</em>(99)<br>
  <strong>let</strong> <em>str_form</em> == <em>int_or_str</em>$<em>inj_str</em>("hello")</p>
<p>The names of the injection operations are made by prepending the word <em>inj_</em> 
  to the tags. The original string and integer values can be obtained by <strong>projecting</strong> 
  the union value.</p>
<p><em>int_or_str</em>$<em>proj_int</em>(<em>int_form</em>)<br>
  <em>int_or_str</em>$<em>proj_str</em>(<em>str_form</em>)</p>
<p>The names of these operations are made in a similar way to the injection operations 
  and return a value with the appropriate signature. Of course it is possible 
  to apply the wrong projection. </p>
<p><em>int_or_str</em>$<em>proj_str</em>(<em>int_form</em>)</p>
<p>Since <em>int_form</em> contains an integer it cannot be made to return a string, 
  and so this operation will cause an exception with the name <em>projecterror</em>. 
  To avoid getting exceptions, the union value can be tested to see if it is a 
  particular variant. </p>
<p><strong>if</strong> <em>int_or_str</em>$<em>is_str</em>(<em>int_form</em>) 
  <strong>then</strong> ... </p>
<p>will not execute the expression after <strong>then</strong> because the test 
  will return false. However</p>
<p><em>int_or_str</em>$<em>is_int</em>(<em>int_form</em>)</p>
<p>will return true. The alternative syntax for fields of records can be used 
  when projecting or testing unions.</p>
<p><em>int_form</em>.<em>proj_int</em><em><br>
  str_form</em>.<em>proj_str</em><em><br>
  int_form</em>.<em>is_int</em></p>
<p>As with records the variants may be procedures or types as well as values and 
  it is possible to have two variants with the same signature.</p>
<p><strong>let</strong> <em>a_union</em> == <strong>union</strong> (<em>one</em>, 
  <em>another</em>: <em>integer</em>; <em>p</em>: <strong>proc</strong> (<em>integer</em>)<em>integer</em>)</p>
<p>The two variants <em>one</em> and <em>another</em> are different, so</p>
<p><em>a_union</em>$<em>proj_one</em>(<em>a_union</em>$<em>inj_another</em>(99))</p>
<p>will result in an exception. </p>
<table width="600" border="1">
  <tr> 
    <td><strong>Syntax</strong></td>
  </tr>
  <tr> 
    <td><table width="600" border="0">
        <tr> 
          <td valign="top">&lt;union constructor&gt;</td>
          <td valign="top">::=</td>
          <td><p><strong>union ( </strong>&lt;field list&gt; <strong>)</strong></p></td>
        </tr>
      </table></td>
  </tr>
</table>
<h3>6.3. Structures</h3>
<p> The third built-in type constructor makes <strong>structure</strong> types. 
  Structures are very similar to records in that their values are composed of 
  groups of objects. The difference is that there is an additional value <em>nil</em> 
  in the type and there are operations to compare structure values. Structures 
  are mostly used in recursive declarations to create lists and trees. In fact 
  most structures can be represented using record and union constructors but they 
  are useful enough to be provided separately. </p>
<p><strong>letrec</strong> <em>int_list</em> == <strong>struct</strong> (<em>hd</em>: 
  <em>integer</em>; <em>tl</em>: <em>int_list</em>)</p>
<p>This has created a type which can construct lists of integers. It has five 
  operations together with the the <em>nil</em> value. <em>constr</em> can be 
  used to make <em>int_list</em> values. </p>
<p><strong>let</strong> <em>a_list</em> == <em>int_list</em>$<em>constr</em>(1, 
  <em>int_list</em>$<em>constr</em>(2, <em>int_list</em>$<em>nil</em>))</p>
<p>The <em>nil</em> value is used to end the list. Without it there would be no 
  way to construct a structure since a value of the type is needed before a node 
  can be made. The selector procedures, <em>hd</em> and <em>tl</em> are used to 
  select the parts of the structure in the same way as for a record.</p>
<p><em>int_list</em>$<em>hd</em>(<em>a_list</em>) <em>int_list</em>$<em>hd</em>(<em>int_list</em>$<em>tl</em>(<em>a_list</em>))</p>
<p>If a selector is applied to nil an exception <em>nilreference</em> is raised, 
  since there is no value that can be returned. There are two operations = and 
  <em>&lt;&gt;</em> which compare two structure values. = only returns <em>true</em> 
  if they the structures are <strong>identical</strong>, that is they were made 
  with the same call of <em>constr</em> or they are both <em>nil</em>. </p>
<p><strong>let</strong> <em>b_list</em> == <em>int_list</em>$<em>constr</em>(2, 
  <em>int_list</em>$<em>nil</em>)</p>
<p>has made a list with the same <em>hd</em> and <em>tl</em> values as the tail 
  of <em>a_list</em> but</p>
<p><em>b_list</em> = <em>a_list</em>.<em>tl</em></p>
<p>will return <em>false</em>. </p>
<table width="600" border="1">
  <tr> 
    <td><strong>Syntax</strong></td>
  </tr>
  <tr> 
    <td><table width="600" border="0">
        <tr> 
          <td valign="top">&lt;structure constructor&gt;</td>
          <td valign="top">::=</td>
          <td><p><strong>struct ( </strong>&lt;field list&gt; <strong>)</strong></p></td>
        </tr>
      </table></td>
  </tr>
</table>
<p>&nbsp;</p>
<h2>Chapter 7. Type Constructor</h2>
<p>As well as the using the constructors described above it is possible to make 
  a type by extending an existing one. This usually involves adding new procedures 
  or replacing existing ones. </p>
<p><strong>let</strong> <em>new_int</em> ==<br>
  <strong>type</strong> (<em>int</em>) <strong>extends</strong> <em>integer</em>;<br>
  <strong>let</strong> <em>sqr</em> == <strong>proc</strong> (<em>i</em>: <em>int</em>)<em>int</em> 
  . <em>i</em>*<em>i</em><br>
  <strong>end</strong></p>
<p> This declares <em>new_int</em> to be a type which is an <strong>extension</strong> 
  of the existing type <em>integer</em>. The name in brackets, <em>int</em>, is 
  used inside the constructor to represent the type being made. For instance the 
  parameter and result of <em>sqr</em> both have type <em>int</em>. The result 
  of this constructor is a type which has all the operations which <em>integer</em> 
  had, but in addition it has a <em>sqr</em> procedure which returns the square 
  of its parameter. This new type is different from <em>integer</em> so it cannot 
  be used directly on values with the integer type. The conversion operation <em>up</em> 
  must be used to make an <em>integer</em> value into a <em>new_int</em> one. 
</p>
<p><em>new_int</em>$<em>sqr</em>(<em>new_int</em>$<em>up</em>(99))</p>
<p>There is a similar operation <em>down</em> which will convert values in the 
  opposite direction </p>
<p>10 + <em>new_int</em>$<em>down</em>(<em>new_int</em>$<em>sqr</em>(<em>new_int</em>$<em>up</em>(11)))</p>
<p>These two operations are added to the new type when an old type is being extended 
  to allow conversion of values from the old to the new types. They can be redefined 
  if necessary or, as we shall see, "hidden" so that conversion of values is not 
  possible.</p>
<p>The above example shows how a new type can be made which is slightly
  different from an existing one.</p>
  
<h3>7.1. A New Type</h3>

<p>The same approach is used to construct a completely new type. We have already 
  seen that a record can be used to make a pair of integers and this pair can 
  be extended to make a double precision integer type. Suppose that the maximum 
  range of numbers which could be held in a single integer was from -9999 to 9999. 
  Then a double-precision number could be defined by representing it as a record 
  with two fields, a high and low order part, and the actual number would have 
  value (high)*10000 + (low). This can be implemented as follows.</p>
<p><strong>let</strong> <em>dp</em> ==<br>
  <strong>type</strong> (<em>d</em>) <strong>extends</strong> <strong>record</strong> 
  (<em>hi</em>, <em>lo</em>: <em>integer</em>);<br>
  <strong>let</strong> <em>succ</em> ==<br>
  <strong>proc</strong> (<em>x</em>:<em>d</em>)<em>d</em><br>
  <strong>begin</strong><br>
  <strong>if</strong> <em>x</em>.<em>lo</em> = 9999<br>
  <strong>then</strong> <em>d</em>$<em>constr</em>(<em>succ</em>(<em>x</em>.<em>hi</em>), 
  0)<br>
  <strong>else</strong> <strong>if</strong> <em>x</em>.<em>hi</em> &lt; 0&amp; 
  <em>x</em>.<em>lo</em> = 0<br>
  <strong>then</strong> <em>d</em>$<em>constr</em>(<em>succ</em>(<em>x</em>.<em>hi</em>), 
  ~9999)<br>
  <strong>else</strong> <em>d</em>$<em>constr</em>(<em>x</em>.<em>hi</em>, <em>succ</em>(<em>x</em>.<em>lo</em>))<br>
  <strong>end</strong>;<br>
  <strong>let</strong> <em>pred</em> ==<br>
  <strong>proc</strong> (<em>x</em>:<em>d</em>)<em>d</em><br>
  <strong>begin</strong><br>
  <strong>if</strong> <em>x</em>.<em>lo</em> = ~9999<br>
  <strong>then</strong> <em>d</em>$ <em>constr</em>(<em>pred</em>(<em>x</em>.<em>hi</em>), 
  0)<br>
  <strong>else</strong> <strong>if</strong> <em>x</em>.<em>hi</em> &gt; 0 &amp; 
  <em>x</em>.<em>lo</em> = 0<br>
  <strong>then</strong> <em>d</em>$<em>constr</em>(<em>pred</em>(<em>x</em>.<em>hi</em>), 
  9999)<br>
  <strong>else</strong> <em>d</em>$<em>constr</em>(<em>x</em>.<em>hi</em>, <em>pred</em>(<em>x</em>.<em>lo</em>))<br>
  <strong>end</strong>;<br>
  <strong>let</strong> <em>zero</em> == <em>d</em>$ <em>constr</em>(0,0);<br>
  <strong>let</strong> <em>iszero</em> == <strong>proc</strong> (<em>x</em>:<em>d</em>) 
  <em>boolean</em> . <em>x</em>.<em>hi</em> = 0 &amp; <em>x</em>.<em>lo</em> = 
  0<br>
  <strong>end</strong>; </p>
<p>This is sufficient to provide the basis of all the arithmetic operations, since 
  +, -, * etc. can all be defined in terms of <em>succ</em>, <em>pred</em>, <em>zero</em> 
  and <em>iszero</em>. Of course they can be included in the type if required.</p>
  
<h3>7.2. Information Hiding</h3>

<p>As it stands this type includes the operations <em>hi</em>, <em>lo</em> and 
  <em>constr</em> which were inherited from the record type as well as the new 
  operations. These old operations are a nuisance, they are not part of the double-precision 
  type as such and they provide a security risk since it would be possible for 
  someone to produce a value which appeared to be a double-precision number but, 
  for example, had a positive high order part and a negative low order part. Unwanted 
  operations can be masked out by giving an explicit signature which contains 
  only those operations which are actually required. 
<p><strong>let</strong> <em>dble</em>:<br>
  <strong>type</strong> (<em>d</em>)<br>
  <em>succ</em>, <em>pred</em>: <strong>proc</strong> (<em>d</em>)<em>d</em>;<br>
  <em>zero</em>: <em>d</em>;<br>
  <em>iszero</em>: <strong>proc</strong> (<em>d</em>)<em>boolean</em><br>
  <strong>end</strong><br>
  == <em>dp</em>;
<p>This has created a new type <em>dble</em> which takes objects from <em>dp</em> 
  but only takes those which are explicitly given in the type signature. It is 
  impossible to create a value of the <em>dble</em> type or take it apart except 
  with the given operations. An alternative would have been to have given the 
  explicit signature in the original declaration. 
<p><strong>let</strong> <em>dp</em>:<br>
  <strong>type</strong> (<em>d</em>)<br>
  <em>succ</em>, <em>pred</em>: <strong>proc</strong> (<em>d</em>)<em>d</em>;<br>
  <em>zero</em>: <em>d</em>;<br>
  <em>iszero</em>: <strong>proc</strong> (<em>d</em>)<em>boolean</em><br>
  <strong>end</strong><br>
  ==<br>
  <strong>type</strong> (<em>d</em>) <strong>extends</strong> ... { The body of 
  <em>dp</em> as before. }<br>
  <strong>end</strong>
<p>&nbsp;</p>
<h3>7.3. Conversions</h3>
<p>This double-precision type suffers from the problem that the only constant 
  value is <em>zero</em>. All other values have to be made by using <em>succ</em> 
  or <em>pred</em>. It would be convenient if other constants could be made. One 
  way would be to define a procedure inside the type constructor which would convert 
  an <em>integer</em> value into a <em>dble</em> one.</p>
<p><strong>let</strong> <em>make_double</em> ==<strong> proc</strong> (<em>int</em>: 
  <em>integer</em>)<em>d</em>. <em>d</em>$<em>constr</em>(0, <em>int</em>)</p>
<p>This assumes that no <em>integer</em> value is greater than 10000. If larger 
  <em>integer</em> values are possible then the body of the procedure would be 
</p>
<p><em>d</em>$<em>constr</em>(<em>int</em> <em>div</em> 10000, <em>int</em> <em>mod</em> 
  10000)</p>
<p><em>integer</em> values can now be made into <em>dble</em> ones.</p>
<p><em>dble</em>$<em>make_double</em>(42)</p>
<p>The maximum value is limited by the maximum possible <em>integer</em>, so very 
  large double-precision numbers still cannot be made. It would be nice to be 
  able to have large literal constants such as 12345678 in a program. A solution 
  to this is to convert literals directly from their string representations i.e. 
  from the string "12345678". This is done by defining a conversion procedure 
  with the name <em>convertn</em> inside the type. </p>
<p><strong>let</strong> <em>convertn</em> ==<br>
  <strong>proc</strong> (<em>rep</em>: <em>string</em>)<em>d</em><br>
  <strong>begin</strong><br>
  <strong>letrec</strong> <em>getch</em> ==<br>
  { Returns the result of converting the first <em>i</em> characters. }<br>
  <strong>proc</strong> (<em>i</em>: <em>integer</em>)<em>d</em><br>
  <strong>begin</strong><br>
  <strong>if</strong> <em>i</em> = 0<br>
  <strong>then</strong> <em>zero</em><br>
  <strong>else</strong><br>
  <strong>begin</strong><br>
  <strong>let</strong> <em>this_ch</em> == <em>rep</em> <em>sub</em> <em>i</em>; 
  { Obtains the ith. character }<br>
  <strong>if</strong> <em>this_ch</em> &lt; '0' | <em>this_ch</em> &gt; '9' { 
  Must be a digit }<br>
  <strong>then</strong> <strong>raise</strong> <em>conversionerror</em><br>
  <strong>else</strong><br>
  {Convert the first i-1 characters}<br>
  {then multiply by 10 and add in this digit}<br>
  <em>getch</em>(<em>i</em>-1)* <em>d</em>$ <em>make_value</em>(10) +<em> d</em>$ 
  <em>make_value</em>(<em>ord</em>(<em>this_ch</em>) - <em>ord</em>('0'))<br>
  <strong>end</strong><br>
  <strong>end</strong>;<br>
  <em>getch</em>(<em>string</em>$ <em>length</em>(<em>rep</em>))<br>
  <strong>end</strong></p>
<p>This procedure reads the string and converts it into the numeric value. If 
  any of the characters is not a digit then it raises the exception <em>conversionerror</em>. 
  We assume that + and <em>*</em> operations have been defined for the type.</p>
<p>With this operation it is possible to write expressions like</p>
<p><em>dble</em>$12345678 + <em>dble</em>$99999</p>
<p>The compiler automatically generates a call to <em>dble$convertn</em> when 
  it recognises these constants. It is usual to declare conversion routines as 
  <strong>early</strong> so that the compiler will do the conversion, rather than 
  leaving the conversion until the program is run. If a number is not preceeded 
  by a type name then the conversion used is the value of <em>convertn</em> which 
  is in scope. The standard header contains the binding</p>
<p><strong>let</strong> <em>convertn</em> == <em>integer</em>$ <em>convertn</em></p>
<p>so that numerical constants are converted to <em>integer</em> by default.</p>
<p>There are two other conversion operations, <em>convertc</em> for strings in 
  single quotes, and <em>converts</em> for strings in double quotes. These default 
  to <em>char$convertc</em> and <em>string$converts</em> respectively. </p>
<h3>7.4. Generic Types</h3>

<p>Types in Poly can be treated as ordinary values. We have already seen how the
  ability to pass types as parameters to a procedure allows polymorphic
  operations, we shall now see how being able to return a type can be useful.</p>
<p>A type which could be used to hold lists of <em>integer</em> values was described 
  above. It was defined as</p>
<p><strong>letrec</strong> <em>int_list</em> == <strong>struct</strong> (<em>hd</em>: 
  <em>integer</em>; <em>tl</em>: <em>int_list</em>)</p>
<p>A type for lists of strings would be almost identical.</p>
<p><strong>letrec</strong> <em>str_list</em> == <strong>struct</strong> (<em>hd</em>: 
  <em>string</em>; <em>tl</em>: <em>str_list</em>)</p>
<p> Indeed lists of any type could be defined in the same way. The signature of 
  the type in each case is basically the same.</p>
<p><strong>type</strong> (<em>list</em>)<br>
  <em>hd</em>: <strong>proc</strong> (<em>list</em>)<em>integer</em>;<br>
  <em>tl</em>: <strong>proc</strong> (<em>list</em>)<em>list</em>;<br>
  <em>constr</em>: <strong>proc</strong> (<em>integer</em>; <em>list</em>)<em>list</em>;<br>
  <em>nil</em>: <em>list</em>;<br>
  &lt;&gt;, = : <strong>proc</strong> (<em>list</em>; <em>list</em>)<em>boolean</em><br>
  <strong>end</strong> </p>
<p>We can define a list type for an arbitrary element type using a procedure.</p>
<p><strong>let</strong> <em>list</em> ==<br>
  <strong>proc</strong> (<em>element_type</em>: <strong>type</strong> <strong>end</strong>)<br>
  <strong>type</strong> (<em>list</em>)<br>
  <em>hd</em>: <strong>proc</strong> (<em>list</em>)<em>element_type</em>;<br>
  <em>tl</em>: <strong>proc</strong> (<em>list</em>)<em>list</em>;<br>
  <em>constr</em>: <strong>proc</strong> (<em>element_type</em>; <em>list</em>)<em>list</em>;<br>
  <em>nil</em>: <em>list</em>;<br>
  &lt;&gt;, = : <strong>proc</strong> (<em>list</em>; <em>list</em>)<em>boolean</em><br>
  <strong>end</strong> .<br>
  <strong>begin</strong><br>
  <strong>letrec</strong> <em>list_type</em> == <strong>struct</strong> (<em>hd</em>: 
  <em>element_type</em>; <em>tl</em>: <em>list_type</em>);<br>
  <em>list_type</em><br>
  <strong>end</strong></p>
<p>This procedure can be applied to any type, since any type matches the empty 
  type "<strong>type</strong> <strong>end</strong>". </p>
<p><strong>let</strong> <em>int_list</em> == <em>list</em>(<em>integer</em>);<br>
  <strong>let</strong> <em>str_list</em> == <em>list</em>(string);<br>
  <strong>let</strong> <em>dble_list</em> == <em>list</em>(<em>dble</em>);</p>
<p>The result is always a list with the same operations, but different signatures.</p>
<p><strong>let</strong> <em>a_list</em> == <em>int_list</em>$ <em>constr</em>(999, 
  <em>int_list</em>$ <em>nil</em>);<br>
  <strong>let</strong> <em>b_list</em> == <em>str_list</em>$ <em>constr</em>(&quot;hello&quot;, 
  <em>str_list</em>$ <em>nil</em>); </p>
<p>The list types are different types, so only operations of the correct type 
  are possible.</p>
<p><em>int_list</em>$ <em>hd</em>(<em>a_list</em>);<br>
  <em>str_list</em>$ <em>hd</em>(<em>b_list</em>) </p>
<p>are valid, but </p>
<p><em>int_list</em>$ <em>hd</em>(<em>b_list</em>);<br>
  <em>int_list</em>$ <em>tl</em>(<em>b_list</em>);<br>
  <strong>let</strong> <em>c_list</em> == <em>int_list</em>$ <em>constr</em>(999, 
  <em>b_list</em>)</p>
<p>are not.</p>
<table width="600" border="1">
  <tr> 
    <td><strong>Syntax</strong></td>
  </tr>
  <tr> 
    <td><table width="600" border="0">
        <tr> 
          <td valign="top">&lt;type constructor&gt;</td>
          <td valign="top">::=</td>
          <td><p><strong>type</strong> &lt;internal name&gt; &lt;declarations&gt;<br>
              &lt;extension&gt; &lt;declarations&gt; <strong>end</strong> </p></td>
        </tr>
        <tr> 
          <td valign="top">&lt;internal name&gt;</td>
          <td valign="top">::=</td>
          <td>(&lt;identifier&gt;) | &lt;empty&gt;</td>
        </tr>
        <tr> 
          <td valign="top">&lt;declarations&gt;</td>
          <td valign="top">::=</td>
          <td>&lt;dec list&gt; | &lt;empty&gt;</td>
        </tr>
        <tr> 
          <td valign="top">&lt;dec list&gt;</td>
          <td valign="top">::=</td>
          <td>&lt;declaration&gt; | &lt;dec list&gt;; &lt;declaration&gt;</td>
        </tr>
        <tr>
          <td valign="top">&lt;extension&gt;</td>
          <td valign="top">::=</td>
          <td><strong>extend</strong> &lt;expression&gt; | &lt;empty&gt;</td>
        </tr>
      </table></td>
  </tr>
</table>
<p>&nbsp;</p>
<h2>Chapter 8. Standard Definitions</h2>
<p>Poly is extremely flexible because much of the system is built
  on top of the language rather than built into it.
  It can be changed as required by redefining or adding new definitions.
  The standard definitions contain types and procedures which are likely
  to be of use to many programmers.
  For efficiency reasons some are written in assembly code or are handled
  specially by the code generator, but they all have signatures like
  ordinary definitions and can be redefined if required.</p>
  
<h3>8.1. Primitive Types</h3>
  
<h4>8.1.1. void</h4>

<p><em>void</em> is used as a form of place-holder when a type is expected. For 
  example, procedures which have side effects but no result are considered as 
  returning a value of type <em>void</em>. It has only one value <em>empty</em>, 
  and its signature is simply  </p>
<p><em>void</em> :<br>
  <strong>type</strong> (<em>void</em>)<br>
  <em>empty</em> : <em>void</em><br>
  <strong>end</strong> </p>
<h4>8.1.2. boolean</h4>

<p><em>Boolean</em> is the type used in tests. It has two values <em>true</em> 
  and <em>false</em>. The complete signature is
<p><em>boolean</em> :<br>
  <strong>type</strong> (<em>boolean</em>)<br>
  <em>true</em>, <em>false</em> : <em>boolean</em>;<br>
  &amp; : <strong>proc</strong> <strong>infix</strong> 4(<em>boolean</em>; <em>boolean</em>)<em>boolean</em>;<br>
  | : <strong>proc</strong> <strong>infix</strong> 3(<em>boolean</em>; <em>boolean</em>)<em>boolean</em>;<br>
  ~ : <strong>proc</strong> (<em>boolean</em>)<em>boolean</em>;<br>
  &lt;&gt;, = : <strong>proc</strong> <strong>infix</strong> 5(<em>boolean</em>; 
  <em>boolean</em>)<em>boolean</em>;<br>
  <em>repr</em> : <strong>proc</strong> (<em>boolean</em>)<em>string</em>;<br>
  <em>print</em> : <strong>proc</strong> (<em>boolean</em>)<br>
  <strong>end</strong>
<p>The <strong>&amp;</strong>, <em><strong>|</strong></em> and <em><strong>~</strong></em> 
  operations correspond to the normal <em>boolean</em> operations <strong>AND</strong> 
  (the result is <em>true</em> only if both the arguments are <em>true</em>), 
  <strong>OR</strong> (the result is <em>true</em> if either arguments are <em>true</em>) 
  and <strong>NOT</strong> (the result is <em>true</em> if the argument is <em>false</em> 
  and vice-versa). <em>&lt;&gt;</em> and <em>=</em> compare the two arguments 
  and can be regarded as exclusive-OR and exclusive-NOR respectively. <em>repr</em> 
  returns the string "true" if the argument is <em>true</em> and "false" if it 
  is <em>false</em>. <em>print</em> prints the string representation on the terminal. </p>
<h4>8.1.3. integer</h4>
<p>The type <em>integer</em> is the basic type used for numbers. Its signature 
  is </p>
<p><em>integer</em> :<br>
  <strong>type</strong> (<em>integer</em>)<br>
  <em>first</em>, <em>last</em>, <em>zero</em> : <em>integer</em>;<br>
  +, - : <strong>proc</strong> <strong>infix</strong> 6(<em>integer</em>; <em>integer</em>)<em>integer</em>;<br>
  <em>* </em>, <em>div</em>, <em>mod</em> : <strong>proc</strong> <strong>infix</strong> 
  7(<em>integer</em>; <em>integer</em>)<em>integer</em>;<br>
  <em>pred</em>, <em>succ</em>, <em>neg</em> : <strong>proc</strong> (<em>integer</em>)<em>integer</em>;<br>
  ~ : <strong>proc</strong> (<em>integer</em>)<em>integer</em>;<br>
  &lt;, &lt;=, &lt;&gt;, =, &gt;, &gt;= : <strong>proc</strong> <strong>infix</strong> 
  5(<em>integer</em>; <em>integer</em>)<em>boolean</em>;<br>
  <em>convertn</em> : <strong>proc</strong> (<em>string</em>)<em>integer</em>;<br>
  <em>repr</em> : <strong>proc</strong> (<em>integer</em>)<em>string</em>;<br>
  <em>print</em> : <strong>proc</strong> (<em>integer</em>);<br>
  <strong>end</strong></p>
<p><em>first</em> and <em>last</em> are the minimum and maximum values that an 
  <em>integer</em> can have. <em>last</em> is frequently one less than the negative 
  of <em>first</em>.</p>
<p>+ and <em>-</em> are the usual infix addition and subtraction operations. They 
  raise the exception <em>range</em> if the result is outside the valid range.</p>
<p><em>* </em> is the infix multiplication operator which also raises
  <em>range</em> is the result is out of range.</p>
<p><em>div</em> is the division operator and <em>mod</em> returns the remainder.
  They both generate <em>divide</em> if they are asked to divide by zero, and
  <em>div</em> may generate <em>range</em> when
  <em>first</em>
  is divided by minus
  one.</p>
<p><em>pred</em> and <em>succ</em> respectively subtract and add one to a number,
  raising <em>range</em> if the result is out of range.</p>
<p><em>neg</em> returns the negative, raising
  <em>range</em> if its argument is
  <em>first</em>.</p>
<p><em>~</em> is the same as <em>neg</em>.</p>
<p><em>&lt;</em>, <em>&lt;=</em>, <em>&lt;&gt;</em>, <em>=</em>, <em>&gt;</em> 
  and <em>&gt;=</em> are the
  usual infix comparison operations.</p>
<p><em>convertn</em> is the operation which converts literal constants into integers. 
  It recognises strings of digits as decimal (base 10) values unless the first 
  character is a '0' in which case it treats it as an octal value or hexadecimal 
  if it starts with '0x'. <em>conversion</em> is raised if the string does not 
  fit one of these forms or <em>rangeerror</em> if it is too large.</p>
<p><em>repr</em> performs the reverse of <em>convertn</em> by generating a string
  from a number.
  It is always generated as a decimal number.</p>
<p><em>print</em> prints the string representation on the terminal.</p>
<h4>8.1.4. long_integer</h4>
<p><em>long_integer</em> is very similar to <em>integer</em> but it allows larger 
  numbers to be handled. Its signature is
<p><em>long_integer</em> :<br>
  <strong>type</strong> (<em>long_integer</em>)<br>
  <em>first</em>, <em>last</em>, <em>zero</em> : <em>long_integer</em>;<br>
  +, - : <strong>proc</strong> <strong>infix</strong> 6(<em>long_integer</em>; 
  <em>long_integer</em>)<em>long_integer</em>;<br>
  <em>* </em>, <em>div</em>, <em>mod</em>: <strong>proc</strong> <strong>infix</strong> 
  7(<em>long_integer</em>; <em>long_integer</em>)<em>long_integer</em>;<br>
  <em>pred</em>, <em>succ</em>, <em>neg</em>: <strong>proc</strong> (<em>long_integer</em>)<em>long_integer</em>;<br>
  ~ : <strong>proc</strong> (<em>long_integer</em>)<em>long_integer</em>;<br>
  &lt;, &lt;=, &lt;&gt;, =, &gt;, &gt;= : <strong>proc</strong> <strong>infix</strong> 
  5(<em>long_integer</em>; <em>long_integer</em>)<em>boolean</em>;<br>
  <em>convertn</em> : <strong>proc</strong> (<em>string</em>)<em>long_integer</em>;<br>
  <em>repr</em> : <strong>proc</strong> (<em>long_integer</em>)<em>string</em>;<br>
  <em>print</em> : <strong>proc</strong> (<em>long_integer</em>);<br>
  <em>from_integer</em> : <strong>proc</strong> (<em>integer</em>)<em>long_integer</em>;<br>
  <em>to_integer</em> : <strong>proc</strong> (<em>long_integer</em>)<em>integer</em>;<br>
  <strong>end</strong>
<p>The signature is the same as that of integer with the addition of <em>from_integer</em> 
  and <em>to_integer</em> which convert between <em>integer</em> and <em>long_integer</em>. 
  <em>to_integer</em> generates a <em>rangeerror</em> exception if the value is 
  too large to fit into an integer. </p>
<h4>8.1.5. char</h4>
<p>The type <em>char</em> is the type of character values. It has signature
<p><em>char</em> :<br>
  <strong>type</strong> (<em>char</em>)<br>
  <em>first</em>, <em>last</em> : <em>char</em>;<br>
  &lt;, &lt;=, &lt;&gt;, =, &gt;, &gt;= : <strong>proc</strong> <strong>infix</strong> 
  5(<em>char</em>; <em>char</em>)<em>boolean</em>;<br>
  <em>convertc</em> : <strong>proc</strong> (<em>string</em>)<em>char</em>;<br>
  <em>pred</em>, <em>succ</em> : <strong>proc</strong> (<em>char</em>)<em>char</em>;<br>
  <em>repr</em> : <strong>proc</strong> (<em>char</em>)<em>string</em>;<br>
  <em>print</em> : <strong>proc</strong> (<em>char</em>);<br>
  <strong>end</strong> 
<p>Characters are regarded as being ordered according to the underlying character 
  code. The ordering will usually follow alphabetic order. <em>first</em> and 
  <em>last</em> are the smallest and largest characters and <em>pred</em> and 
  <em>succ</em> give the previous and succeeding characters according to the ordering. 
  <em>pred</em> and <em>succ</em> raise the <em>range</em> exception if a value 
  would be produced outside the range. The comparison operations compare values 
  according to the ordering. </p>
<h4>8.1.6. string</h4>
<p>Character strings have type <em>string</em>. 
<p><em>string</em> :<br>
  <strong><strong></strong>type</strong> (<em>string</em>)<br>
  <em>mk</em> : <strong>proc</strong> (<em>char</em>)<em>string</em>;<br>
  &lt;, &lt;=, &lt;&gt;, =, &gt;, &gt;= : <strong>proc</strong> <strong>infix</strong> 
  5(<em>string</em>; <em>string</em>)<em>boolean</em>;<br>
  <em>converts</em> : <strong>proc</strong> (<em>string</em>)<em>string</em>;<br>
  <em>length</em> : <strong>proc</strong> (<em>string</em>)<em>integer</em>;<br>
  <em>print</em> : <strong>proc</strong> (<em>string</em>);<br>
  <em>repr</em> : <strong>proc</strong> (<em>string</em>)<em>string</em>;<br>
  + : <strong>proc</strong> <strong>infix</strong> 6(<em>string</em>; <em>string</em>)<em>string</em>;<br>
  <em>sub</em> : <strong>proc</strong> <strong>infix</strong> 8(<em>string</em>; 
  <em>integer</em>)<em>char</em>;<br>
  <em>substring</em> : <strong>proc</strong> (<em>string</em>; <em>integer</em>; 
  <em>integer</em>)<em>string</em><br>
  <strong>end</strong>
<p><em>mk</em> converts a character into a single length string, while <em>sub</em> 
  selects a character at a particular position. The character positions are numbered 
  from 1 to the length of the string, returned by <em>length</em>. Selecting a 
  character outside this range results in a <em>subscript</em> exception. Subcripting 
  a zero length string will therefore always result in an exception. <em>substring</em> 
  extracts a string from another. It takes as parameters a string, an integer 
  which gives the starting position in the string, and a second integer which 
  gives the number of characters to select. 
<p><em>string</em>$<em>substring</em>(&quot;hello&quot;, 3,2); 
<p>results in the string "ll". If the first parameter is outside the string or 
  there are not enough characters in the string then <em>subscript</em> is raised. 
  Two strings can be concatenated by +. </p>
<h3>8.2. Variables and Vectors</h3>
<p>So far the language described has been purely applicative, that is
  procedures can be applied to values, but there is no way to change the
  value associated with an object.
  Variables and vectors can be created and used in Poly but they are not built
  into the type system.</p>
  
<h4>8.2.1. new</h4>
<p>Variables are created by the procedure <em>new</em> which has the following 
  signature. </p>
<p><em>new</em> : <strong>proc</strong> <strong>[</strong><em>base</em> : <strong>type</strong> 
  <strong>end</strong> <strong>]</strong> (<em>base</em>)<br>
  <strong>type</strong><br>
  <em>assign</em> : <strong>proc</strong> (<em>base</em>);<br>
  <em>content</em> : <strong>proc</strong> ()<em>base</em><br>
  <strong>end</strong></p>
<p><em>new</em> is a procedure which takes a value of any type and returns a type 
  with two operations <em>assign</em> and <em>content</em> as its result. For 
  example, </p>
<p><strong>let</strong> <em>v</em> == <em>new</em>(99); </p>
<p>declares <em>v</em> as a type with signature </p>
<p><em>v</em>: <strong>type</strong><br>
  <em>assign</em> : <strong>proc</strong> (<em>integer</em>);<br>
  <em>content</em> : <strong>proc</strong> ()<em>integer</em><br>
  <strong>end</strong> </p>
<p>The type is here being used as a way of packaging together a pair of procedures, 
  there is no such thing as a value of this type.</p>
<p>The parameter type of <em>assign</em> and the result of <em>content</em> were 
  found from the type of the original argument (99 has type <em>integer</em>). 
  The current value associated with the variable is found using the <em>content</em> 
  procedure. </p>
<p><em>v</em>$<em>content</em>()</p>
<p>will return 99, the initial value associated with it. The value can be changed 
  using <em>assign</em>. </p>
<p><em>v</em>$<em>assign</em>(<em>v</em>$<em>content</em>()+1); </p>
<p>sets the value to 100.</p>
<p>Variables can be passed as parameters and returned as results from procedures 
  like any other value. However, note that</p>
<p><strong>let</strong> <em>vv</em> == <em>v</em>; </p>
<p>makes <em>vv</em> the same value as <em>v</em> which means that it refers to 
  the same variable, and hence changes to <em>vv</em> will affect the value returned 
  from <em>v</em> and vice versa.</p>
<p>It is not necessary to write "$<em>content</em>()" after every variable name 
  in order to extract its value, the compiler will attempt to call the <em>content</em> 
  object of a type if it is given one when it expects an ordinary value. There 
  is also an infix assignment operator defined in the standard header which allows 
  use of the normal syntax for assignment. 
<p><em>v</em> := <em>v</em>+1
<p>is therefore equivalent to
<p><em>v</em>$<em>assign</em>(<em>v</em>$<em>content</em>()+1)

<h4>8.2.2. vector</h4>
<p><em>vector</em> is a procedure which creates an array of variables. </p>
<p><em>vector</em>: <strong>proc</strong> <strong>[</strong><em>base</em> : <strong>type</strong> 
  <strong>end</strong> <strong>]</strong> (<em>size</em>: <em>integer</em>; <em>initial_value</em>: 
  <em>base</em>)<br>
  <strong>type</strong><br>
  <em>sub</em>: <strong>proc</strong> (<em>integer</em>)<br>
  <strong>type</strong><br>
  <em>assign</em> : <strong>proc</strong> (<em>base</em>);<br>
  <em>content</em> : <strong>proc</strong> ()<em>base</em><br>
  <strong>end</strong>; <br>
  <em>first</em>, <em>last</em>: <em>integer</em><br>
  <strong>end</strong></p>
<p> It takes as parameters the size of the array (i.e. the number of variables) 
  and a value which is the initial value for each. </p>
<p><strong>let</strong> <em>v</em> == <em>vector</em>(10, &quot;init&quot;)</p>
<p>A particular variable is selected by applying the <em>sub</em> procedure to 
  a number between 1 and the size (the <strong>index</strong>). The result will 
  be a variable which can be assigned a value, or its value can be read. </p>
<p><em>v</em>$<em>sub</em>(4)<br>
  <em>v</em>$<em>sub</em>(5) := &quot;new string&quot;</p>
<p>Attempting to apply <em>sub</em> to a value outside the range causes a <em>subscript</em> 
  exception.</p>
<p><em>first</em> and <em>last</em>
  are two integer values that are set to the
  minimum and maximum index values (1 and the size respectively).
  If the size parameter given to <em>vector</em> is less than 1 it will raise
  a <em>range</em> exception.</p>
  
<h3>8.3. Iterators</h3>
<p>Many programs involve the processing of lists or sets of values processing 
  each one or searching for one which satisfies some condition. The standard header 
  contains definitions to make these easier. All of these work using a standard 
  interface, a type, called an <strong>iterator</strong> which represents an abstract 
  sequence of values. An iterator has the following signature. 
<p><strong>type</strong> (<em>iterator</em>)<br>
  <em>continue</em> : <strong>proc</strong> (<em>iterator</em>)<em>boolean</em>;<br>
  <em>init</em> : <strong>proc</strong> ()<em>iterator</em>;<br>
  <em>next</em> : <strong>proc</strong> (<em>iterator</em>)<em>iterator</em>;<br>
  <em>value</em> : <strong>proc</strong> (<em>iterator</em>)<em>base_type</em><br>
  <strong>end</strong>
<p>Values of the iterator type are elements of a sequence such that each has a 
  value of some base type associated with it and a way of getting to the next 
  element. They can be regarded as elements of a list, but equally they can be 
  a range of integer values. <em>init</em> generates the first element of the 
  sequence, and <em>continue</em> tests it to see if is a valid entry (the sequence 
  may be empty or exhausted). If it is valid then <em>value</em> may be used to 
  extract the associated value and <em>next</em> used to return the next element 
  in the sequence. To see how this works we will examine two procedures which 
  use iterators. </p>
<h4>8.3.1. for</h4>
<p>The <em>for</em> procedure is designed to apply a given procedure to every 
  member of a sequence. Its signature is
<p><em>for</em> : <strong>proc</strong> <strong>[</strong><em>base</em> : <strong>type</strong> 
  <strong>end</strong> <strong>]</strong><br>
  (<em>iterator</em> :<br>
  <strong>type</strong> (<em>iterator</em>)<br>
  <em>continue</em> : <strong>proc</strong> (<em>iterator</em>)<em>boolean</em>;<br>
  <em>init</em> : <strong>proc</strong> ()<em>iterator</em>;<br>
  <em>next</em> : <strong>proc</strong> (<em>iterator</em>)<em>iterator</em>;<br>
  <em>value</em> : <strong>proc</strong> (<em>iterator</em>)<em>base</em><br>
  <strong>end</strong>; <br>
  <em>body</em>: <strong>proc</strong> (<em>base</em>)) 
<p>It takes an iterator and applies the procedure <em>body</em> to each element 
  in turn. The body of <em>for</em> in Poly is 
<p><strong>begin</strong><br>
  <strong>letrec</strong> <em>successor</em> ==<br>
  { Loop until the condition is false }<br>
  <strong>proc</strong> <strong>inline</strong> (<em>counter</em>: <em>iterator</em>)<br>
  <strong>begin</strong><br>
  <strong>if</strong> <em>counter</em>.<em>continue</em><br>
  <strong>then</strong><br>
  <strong>begin</strong><br>
  <em>body</em>(<em>counter</em>.<em>value</em>);<br>
  <em>successor</em>(<em>counter</em>.<em>next</em>)<br>
  <strong>end</strong><br>
  <strong>end</strong> { successor }; <br>
  <em>successor</em>(<em>iterator</em>$<em>init</em>()) { The initial value of 
  the iterator. }<br>
  <strong>end</strong> { for }; 
<p>The <em>successor</em> loops generating elements of the sequence and applying 
  <em>body</em> to each value until the sequence is exhausted. </p>
<h4>8.3.2. first</h4>
<p>The other procedure which operates on iterators is <em>first</em> which searches 
  a sequence until a condition is found. It has signature </p>
<p><em>first</em> : <strong>proc</strong> <strong>[</strong><em>base</em>, <em>result</em>: 
  <strong>type</strong> <strong>end</strong> <strong>]</strong><br>
  (<em>iterator</em> :<br>
  <strong>type</strong> (<em>iterator</em>)<br>
  <em>continue</em> : <strong>proc</strong> (<em>iterator</em>)<em>boolean</em>;<br>
  <em>init</em> : <strong>proc</strong> ()<em>iterator</em>;<br>
  <em>next</em> : <strong>proc</strong> (<em>iterator</em>)<em>iterator</em>;<br>
  <em>value</em> : <strong>proc</strong> (<em>iterator</em>)<em>base</em><br>
  <strong>end</strong>;<br>
  <em>test</em>: <strong>proc</strong> (<em>base</em>)<em>boolean</em>;<br>
  <em>success</em>: <strong>proc</strong> (<em>base</em>)<em>result</em>;<br>
  <em>failure</em>: <strong>proc</strong> ()<em>result</em><br>
  )<em>result</em></p>
<p> As well as the iterator, <em>first</em> takes three other explicit parameters, 
  all procedures. The first is the test which is applied to each value. If it 
  succeeds (returns <em>true</em>) then the <em>success</em> procedure is called 
  with the value as its parameter. If the sequence is exhausted before the test 
  has succeeded the <em>failure</em> procedure is invoked. The result of <em>first</em> 
  is the result of either <em>success</em> or <em>failure</em>. </p>

<h2>Chapter 9. Compiler and Environment</h2>

<p>This part of the system is still under development and is not guaranteed to
  remain stable.
  Parts of it are also heavily UNIX dependent.</p>
<p>The current environment support provides facilities for compiling text files
  and remaking a system from its composite modules, compiling those which have
  been modified.
  There is a simple history mechanism for re-executing commands.</p>
<p>The system is used interactively with Poly expressions and declarations being
  typed in by the user and the reponses printed by the computer.
  Poly is used as a command language as well as a programming language, so all
  commands are simply Poly procedure calls and have their signatures checked
  by the compiler.
  Commands must either return values of type <em>void</em>, in which case they 
  are
  simply executed, or they must return values of a type which has a print
  operation so that the result can be printed.
  Variables and procedures with no parameters are allowed provided their results
  are void or can be printed.</p>
  
<h3>9.1. environ</h3>

<p><em>environ</em> is the type which is the nearest equivalent to a file directory
  in Poly.
  It has signature
  </p>
<p> <em>environ</em> :<br>
  <strong>type</strong> (<em>environ</em>)<br>
  <em>enter</em> : <strong>proc</strong> (<em>environ</em>; <em>string</em>; <em>declaration</em>);<br>
  <em>lookup</em> : <strong>proc</strong> (<em>environ</em>; <em>string</em>)<em>declaration</em>;<br>
  <em>delete</em> : <strong>proc</strong> (<em>environ</em>; <em>string</em>);<br>
  <em>print</em> : <strong>proc</strong> (<em>environ</em>);<br>
  <em>in</em> : <strong>proc</strong> (<br>
  <strong>type</strong><br>
  <em>enter</em> : <strong>proc</strong> (<em>string</em>; <em>declaration</em>);<br>
  <em>lookup</em> : <strong>proc</strong> (<em>string</em>)<em>declaration</em>;<br>
  <em>delete</em> : <strong>proc</strong> (<em>string</em>);<br>
  <em>over</em> : <strong>type</strong> (<em>iter</em>)<br>
  <em>continue</em> : <strong>proc</strong> (<em>iter</em>)<em>boolean</em>;<br>
  <em>init</em> : <strong>proc</strong> ()<em>iter</em>;<br>
  <em>next</em> : <strong>proc</strong> (<em>iter</em>)<em>iter</em>;<br>
  <em>value</em> : <strong>proc</strong> (<em>iter</em>)<em>declaration</em><br>
  <strong>end</strong><br>
  <strong>end</strong><br>
  )<em>environ</em>;<br>
  <em>out</em> : <strong>proc</strong> (<em>environ</em>)<br>
  <strong>type</strong><br>
  <em>enter</em> : <strong>proc</strong> (<em>string</em>; <em>declaration</em>);<br>
  <em>lookup</em> : <strong>proc</strong> (<em>string</em>)<em>declaration</em>;<br>
  <em>delete</em> : <strong>proc</strong> (<em>string</em>);<br>
  <em>over</em> : <strong>type</strong> (<em>iter</em>)<br>
  <em>continue</em> : <strong>proc</strong> (<em>iter</em>)<em>boolean</em>;<br>
  <em>init</em> : <strong>proc</strong> ()<em>iter</em>;<br>
  <em>next</em> : <strong>proc</strong> (<em>iter</em>)<em>iter</em>;<br>
  <em>value</em> : <strong>proc</strong> (<em>iter</em>)<em>declaration</em><br>
  <strong>end</strong><br>
  <strong>end</strong><br>
  <strong>end</strong></p>
<p><em>declaration</em> is a type which the compiler uses to represent objects 
  that it has created.</p>
<p>A value of the <em>environ</em> type is a set of procedures which
  map strings onto <em>declaration</em> values.
  The compiler uses the value of <em>current_env</em> as the environment in which
  to compile something.
  It uses the <em>lookup</em> procedure to find the value and signature of
  identifiers and calls <em>enter</em> to store the result of making declarations.
  A particular value of the environ type is made by using the <em>in</em> procedure
  to package up a type with the appropriate operations.
  The inverse operation <em>out</em> can be used to extract the type.</p>
<p>There is a procedure <em>mkenv</em> which can be used to create environ values.
  It has signature
  </p>
<p> <em>mkenv</em> : <strong>proc</strong> (<em>environ</em>)<em>environ</em></p>
<p>It returns an environment which can be seen as an extension of the environment 
  which was given as the parameter. New declarations result in entries in this 
  new environment and they can be found by using the identifier. However, looking 
  up an identifier which has not been declared in this environment results in 
  a search in the environment originally passed as the parameter. This can be 
  regarded in the same way as nested declarations in Poly where an identifier 
  is first looked up in the current block and if it is not found there the enclosing 
  blocks are searched. Typically <em>mkenv</em> is called with either the current 
  environment or the global environment as parameter. </p>
<p> <strong>let</strong> <em>new_env</em> == <em>mkenv</em>(<em>current_env</em>);<br>
  <em>current_env</em> := <em>newenv</em>;<br>
  <strong>let</strong> <em>new_env</em> == <em>mkenv</em>(<em>global_env</em>); 
</p>
<p>The global environment contains declarations such as integer which it is expected 
  that nearly all programs will require.</p>
<p>The computation involved when entering or looking up an identifier may be
  considerably more than just operating on a table.
  The <em>make</em> procedure, for example, uses an environment in which looking 
  up
  an identifier may involve recursive calls to the compiler to compile the
  object.</p>
  
<h3>9.2. ?</h3>

<p>? prints the signature of an object which has previously been declared. It 
  has signature </p>
<p> ? : <strong>proc</strong> (<em>string</em>)</p>
<p>For example, the statement </p>
<p> ? &quot;?&quot;;</p>
<p>prints </p>
<p> ? : <strong>proc</strong> (<em>string</em>)
<p> It is useful to be able to check the signature of an object before using it. </p>
<h3>9.3. #</h3>

<p># runs a text file through the compiler and executes the result. It has signature 
</p>
<p> \# : <strong>proc</strong> (<em>string</em>) 
<p>At present the string parameter it takes is an ordinary UNIX file name, without 
  any processing of wild-cards. </p>
<h3>9.4. sh</h3>
<p><em>sh</em> runs a line of text through the UNIX shell.
  It can be used to execute any command, including starting up interactive
  programs.
  It has signature
  </p>
<p> <em>sh</em> : <strong>proc</strong> (<em>string</em>)</p>
<p>For example, </p>
<p> <em>sh</em> &quot;emacs fred&quot;;
<p>will start up and run the "emacs" editor on a file called "fred". The Poly 
  system will wait until the process is finished before continuing. </p>
<h3>9.5. make</h3>
<p>The <em>make</em> command in Poly is similar in function to the "make" command
  under UNIX.
  It constructs a Poly object by recompiling only those parts of it which have
  changed since it was last made.</p>
<p>It is generally good programming practice to break a large program down into
  several parts, usually called modules, and develop each independently.
  A module usually provides several related functions and so can be represented
  in Poly as a "type".
  Such types may or may not have values belonging to them.
  For example, a module to construct stacks could be the type "stack" and all
  stacks would be of that type, but a module for a set of trigonometrical
  functions would be simply a set of related procedures.</p>
<p>A module may be complete in itself or require other modules to make it work.
  The latter case is represented in Poly by a procedure which takes some types
  as parameters and returns a type as the result.
  So, for example, a module for a parser may use modules for the symbols and for
  the parse tree.</p>
<p>An important point about these modules is that each can be compiled
  independently and then the program can be made by applying the modules which
  are procedures to their parameters.
  The process of applying a module to other modules is known as <em>binding</em>.
  Like any other procedure application in Poly it is subject to the normal rules
  for signature matching.</p>
<p>When a module is changed, for example to correct a bug, it must be recompiled
  and rebound.
  The purpose of the make procedure is to ensure that everything which must be
  recompiled has been and to rebind all the necessary modules.
  Note that a change to the signature of the module may require changes to
  other modules that use it, otherwise a signature fault may be generated by
  the compiler.
  A change of signature may not always require all the using modules to be
  recompiled.
  For example, a module which is a type may have several operations used by
  different using modules.
  Changing the signature of one of these operations will require changes
  only to those modules which actually use that operation.</p>
<p>The make procedure assumes that the source text of the modules is held in some
  UNIX text files in a set of related directories.
  As an example suppose we have a set of modules which are combined in the
  following fashion to make a program.
  </p>
<p> <strong>let</strong> <em>a</em> == <em>b</em>(<em>c</em>, <em>d</em>);<br>
  <strong>let</strong> <em>e</em> == <em>f</em>(<em>g</em>, <em>h</em>);<br>
  <strong>let</strong> <em>i</em> == <em>j</em>(<em>a</em>, <em>e</em>, <em>h</em>);<br>
  <strong>let</strong> <em>z</em> == <em>k</em>(<em>i</em>, <em>e</em>); </p>
<p><em>z</em> is the result of binding the modules together and is the final program. 
  The source text is arranged in a series of directories with the root directory 
  called <strong>z</strong>. </p>
<p><strong>z</strong> contains <strong>k</strong>, <strong>i</strong> and <strong>e</strong> 
  and <strong>h</strong>.<br>
  <strong>z/k</strong> is the source text for <em>k</em>.<br>
  <strong>z/i</strong> is a directory containing <strong>j</strong> and <strong>a</strong>.<br>
  <strong>z/i/j</strong> is the source text for <em>j</em>.<br>
  <strong>z/i/a</strong> is a directory containing source files <strong>b</strong>, 
  <strong>c</strong> and <strong> d</strong>. }<br>
  <strong>z/e</strong> is a directory containing source texts <strong>f</strong> 
  and <strong>g</strong>.<br>
  <strong>z/h</strong> is the source text for <em>h</em>.</p>
<p>In addition each directory has a file called <strong>poly_bind</strong> which 
  are the instructions for binding together the modules to make the result. </p>
<p> <strong>z/poly_bind</strong> contains "<strong>let</strong> <em>z</em> == 
  <em>k</em>(<em>i</em>, <em>e</em>);"<br>
  <strong>i/poly_bind</strong> contains "<strong>let</strong> <em>i</em> == <em>j</em>(<em>a</em>, 
  <em>e</em>, <em>h</em>);"<br>
  <strong>e/poly_bind</strong> contains "<strong>let</strong> <em>e</em> == <em>f</em>(<em>g</em>, 
  <em>h</em>);"<br>
  <strong>a/poly_bind</strong> contains "<strong>let</strong> <em>a</em> == <em>b</em>(<em>c</em>, 
  <em>d</em>);"</p>
<p>Supposing <strong>h</strong> has been modified and we wish to remake <em>z</em>.
  The command
  </p>
<p> <em>make</em> &quot;z&quot;; </p>
<p>looks for a file "<em>z</em>" and examines its access permission. It discovers 
  that it is a directory and so tries to compile the file "<em>z</em>/poly_bind". 
  This contains the command </p>
<p> <strong>let</strong> <em>z</em> == <em>k</em>(<em>i</em>, <em>e</em>);</p>
<p> For each identifier in the command it looks up a file with that name in the 
  current directory and only if that fails does it treat it as an ordinary identifier. 
  <strong>k</strong> is a text file so it compares the time that it was last modified 
  (kept by the operating system) with the time on which an identifier called <em>k</em> 
  was last declared (kept by the Poly system). It sees that the file has not been 
  modified since <em>k</em> was declared so it uses that declaration. If it had 
  found that the file was newer it would recompile <strong>k</strong> (by a recursive 
  call to the compiler) before returning the newly compiled version. It does not 
  perform any other consistency checks relying on the type checking to ensure 
  that <em>k</em> really is a procedure which can correctly be applied to <em>i</em> 
  and <em>e</em>.</p>
<p>It next encounters <em>i</em> which it discovers is a directory and so it executes
  the file <strong>z/i/poly_bind</strong>.
  <strong>j</strong> is treated in the same way as <strong>k</strong>, but <strong>a</strong> is again a directory.
  It recurses again to process <strong>a</strong> and checks <strong>b</strong>, <strong>c</strong> and <strong>d</strong>.
  Finding that all these are text files and are up to date and that <em>a</em> 
  is
  newer than each of them, it concludes that <em>a</em> is up to date and uses 
  its
  current value without rebinding.</p>
<p><strong>e</strong>, being a directory, is processed in the same way as <strong>a</strong>.
  <em>f</em> and <em>g</em> are both found to be up to date, but <strong>h</strong> is not 
  found in the
  directory.
  The directories are regarded as nested blocks so that if a file is not found
  in the current directory the make program looks in the immediately enclosing
  one (i.e. the parent directory).
  It fails to find <strong>h</strong> in <strong>i</strong> and so tries <strong>z</strong>.
  There it finds the source text for <em>h</em> and discovers that it has been
  modified and must be recompiled.
  It recompiles it, returning the newly compiled <em>h</em> as its result.
  <em>e</em> must now be rebound so the declaration is executed and the new value
  returned as the result.</p>
<p>The next identifier in the declaration of <em>i</em> is <em>h</em> itself.
  The program remembers that <em>h</em> has been checked and uses the new
  value, rather than repeating the check on when the files were modified.
  It does this whether it has recompiled the file or just checked that it does
  not need recompiling.
  It executes the declaration of <em>i</em> because <em>e</em> and <em>h</em> have 
  been remade
  and returns this as its result.</p>
<p>In the declaration of <em>z</em> the next identifier is <em>e</em>.
  Again it uses the fact that <em>e</em> has been checked to save processing the
  declaration of <em>e</em> again.
  Finally it can rebind <em>z</em> and the construction is complete.
  If make is rerun immediately after this it will simply check everything and
  not rebind any of the files.</p>
<p>Note that each file must be "in scope" when it is required.
  Because <strong>h</strong> is used by both <strong>i</strong> and <strong>e</strong> it must be in the path to 
  both
  of them i.e. in the <strong>z</strong> directory.</p>
  
<h3>9.6. Persistent Storage</h3>
<p>The Poly system runs under a persistent storage system, that is any declarations 
  of identifiers or values in variables can be retained from one session to the 
  next on permanent storage. The database is held on a file and objects are read 
  in from it as required. Once read in they are retained in store until the end 
  of the session when those which are to be retained are written out again. The 
  criterion for writing something out to the database is whether it is reachable 
  from the root procedure which is the one used when Poly is started up. In the 
  normal Poly system this essentially means that any declarations made in the 
  global environment will be retained. When the user exits normally from Poly 
  all the reachable objects are written back and the database is updated. The 
  database can also be written back by executing the procedure <em>commit</em>();<em> 
  </em>which writes back the database and exits from Poly. It is currently not 
  possible to write the database and continue. </p>
<h3>9.7. history</h3>

<p>The normal Poly system reads commands from the input stream, usually the
terminal, and compiles and executes them.
It also remembers the last few commands typed so that they can be re-executed
if necessary.
The commands in the table can be printed by the <em>history</em> procedure.
</p>
<p> <em>history</em>();</p>
<p>There are three procedures which execute commands from the history table. Each 
  command prints the command before executing it, and also enters the command 
  it will execute in the history table. The previous command can be executed by 
  the !!procedure. </p>
<p> !!(); </p>
<p>Another command can be executed using the <strong>!-</strong> procedure. It 
  has signature </p>
<p> !- : <strong>proc</strong> (<em>integer</em>) </p>
<p>The integer parameter is the number of the command counting back from the current 
  one, so </p>
<p> !- 1;</p>
<p> is equivalent to </p>
<p> !!(); </p>
<p> The third command <strong>!</strong> has signature </p>
<p> ! : <strong>proc</strong> (<em>string</em>)</p>
<p>The string is the first few characters of the command to be executed, so to 
  re-execute the last declaration, </p>
<p> ! "let";
<p>can be used. The command found is the first one whose characters match, working 
  from the last command back. 
</body>
