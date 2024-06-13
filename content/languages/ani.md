title=ANI
tags=language, concurrency, archived
summary=Concurrent-by-default programming language.
~~~~~~

[Website](https://code.google.com/p/anic/) (Should be considered dead)

## Implementation article
*(from the website)*

This article is here to answer one key question: How do ANI programs work?

Let's forget about the other programming paradigms out there for a second and take a look at the approach that ANI takes. ANI programs are clean and simple to understand (and even easier to write!), but work quite differently from those in other languages; for example, there is no explicit sequential ordering to your code -- the compiler sequences the contol flow automatically, and usually in parallel! This friendly tutorial is designed to help get you acquainted with these new concepts and get started with programming in ANI. So, let's jump right in!

#### Pipes
ANI programs are made up of pipes though which data flows. The data in question is encapsulated in objects; ANI is a pure object-oriented language in that everything, without any exceptions, is an object. Computation involves objects flowing forward through a pipe, and along the way, interacting with other objects. Objects can come to a rest at certain points, and be flushed down the drain at others. And most importantly, objects flow through pipes in parallel.

All of this seems complicated, I know. But it's actually much, much more intuitive than any traditional imperative programming language you know! I'll prove it. This is Hello, World:

```
"Hello, World!" ->std.out
```

What's happening here? Well, the string object, "Hello, World!", is sent using the -> operator to the standard output, std.out. Thus, you see "Hello, World!" on your screen.

Note, we could put a ; at the end of this line, like in other languages, but we don't need to. In ANI, ; is the pipe termination operator, which throws away whatever is currently in a pipe, and thus whatever comes after this is the beginning of a new pipe.

"Whoa, whoa, whoa", you might say... "when did the notion "pipes" come into play? I see no "pipes" here! What is a "pipe", anyway?"

Well, that Hello, World program above is actually a program consisting of a single pipe. To illustrate pipes better, let's write a program using several of them:

```
s = [string\]; \s ->std.out; "Hello, World!" ->s;
```

Let's try to ignore the novel-looking syntax for a moment. This program will print the same thing as the first one, but it does it using three pipes. To a programmer coming from an imperative language, the above program might not make a whole lot of sense; we seem to be sending (->) something (\s) to std.out (like we did before), but what is this \s? Surely it's not the "Hello, World!" that's written in the following "statement"? Indeed, it is, even though it seems to appear after the place where we use it!

This shows an important difference between ANI and a lot of other languages. The reason that writing the program like this works is that pipes are not statements, and pipes have no specific ordering. In fact, the way pipes work, all of them flow at the same time. What this means for ANI programs is that if you write:

```
A; B;
```

then A and B happen at the same time, not one after the other! Further, if a pipe isn't ready to continue just yet (in this case, the second line), then it automatically waits until the time is right to do so. The language handles all of this for you, which gives it a lot of power and makes programming much simpler, but it might require re-thinking your notion of how programs run if you're used to a strictly top-down paradigm like that of most imperative languages.

With these insights, let's look at the program above once again, this time trying to understand what exactly is going on.

#### Latches
The first line in out above program is a special kind of pipe called a latch pipe, which is a little like (but not the same as) a variable in other languages. How can we tell that it's a latch pipe? Because of the `[string\]`.

The notation `[T]` is used in ANI to create an anonymous object of type T. In this case, the type is string\. The string part is obvious, and it's pretty clear that the s = part is giving the object a binding, but why is the \ there?

In ANI, \ means "latch". Basically, a latch is a place where you can "hold on to" an object of the specified type. A latch is like a box that you can put things in to, take things out of, and peek at what's inside.

But a latch is not the same thing as a variable, in that different parts of code cannot "hold onto" (references to) the same object at the same time. If two pieces of code need to share an object, they need to do so by by taking the object out of its box when it's needed, using it, and then putting it (or a replacement) back into the box when done. The only exception is if you don't need to "use" an object, but only "peek" at it without changing or moving it -- in this case, the object can be examined in-place.

That's a whole lot of analogy without practical application, so let's apply it. The third line of the program does the same kind of send we saw before, but this time the send is directed towards s, our string\ (string latch) object. So it looks like in ANI, we send objects to objects. Does this mean std.out as we used it before is actually an object? Yessir, you bet! As we've already mentioned, everything in ANI is an object!

Since s is a latch object, sending to it will put the "Hello, World!" string into the (initially empty) box that s represents. Great, but now what? Well, the second line remains unanalysed. What does it do? The \s gives a hint.

Basically, what \s is doing is unlatching the current contents of s and placing them into the current pipe; the important thing to note here is that if it turns out that there is nothing in s yet, the pipe will implicitly wait until there is! This is where we see the notion of implicit program sequencing in ANI: data dependencies are implied naturally by the code, and the compiler automatically figures out the necessary sequencing and synchronization on its own.

To give a more concrete example of this concept, let's walk through what exactly is happening with s: We define s in line 1, delatch it on line 2, and place a string object into it on line 3. As mentioned, if the program tries to delatch s (line 2) before there's anything latched there, it will implicitly wait until there is. That's why it doesn't matter which order we specify these pipes in; the pipe on line 3 must flow before the one on line 2 can proceed, and this dependency is implied in the code.

Even more crazily, we could just as well have put the declaration of s (line 1) after the other two pipes, and the compiler would still make the appropriate bindings! This illustrates an important point in ANI programming: the language avoids making you jump around the code as you're writing. In most cases, you can write a program top-to-bottom like a shell script, and any ordering issues will be resolved (and parallelized) automatically by the compiler.

Streams
So, latches allow us to move data across pipes, but they seem static and limited. What if, for example, we wanted to do something slightly more elaborate like print "Hello, World!" 10 times? The answer to this is an extension of the latch concept called a stream. Think of a stream as an infinite FIFO queue of latches that we put things into on one end, and take things out of at the other. To illustrate this concept, here is a program that prints "Hello, World!" 10 times, as promised:

index = [int\\] <- {0,1,2,3,4,5,6,7,8,9}; \\index ("Hello, World #" + .. + "!\n") ->std.out;

We already know that the first line declares an object of type int\\ called index, but what exactly does int\\ mean? In ANI, just like \ means latch, then \\ means "stream". So int\\ is a stream of integers. In case it's not intuitive from the syntax, the optional suffix to the int\\ instantiation (<- {0,1,2,3,4,5,6,7,8,9}), initializes the stream with a list of integers from 0 to 9 (worth noting: in ANI, we index integers from 0 like in most languages).

Moving on to line 2, we have \\index, a similarly near-familiar thing that looks almost like a delatch. You might have already guessed that this is the stream-equivalent of a delatch; in ANI, we call it a destream, flush or stream injection. The behaviour of a destream is basically a continuous delatching of the stream's contents. In some ways, it is like the definition of an event handler in other languages. Whenever an "event" (object) arrives at the stream, it is placed into wherever the corresponding destream occurs.

Thus, when we say \\index, we mean "whenever we have an object in index, take it out of index and place it here". So, \\index in this case will inject the 10 integers we initialized index with into the pipe, one at a time. For each one, we execute the next part of the pipe, ("Hello, World #" + .. + "!\n"). This is just an example of a string concatenation expression, which you've probably seen before, but what is ".."?

In ANI, ".." is the recall identifier, which is just a fancy way of saying it's an identifier referencing the object that was last placed into this pipe. What is the last object placed into the pipe in this case? Why, it's our integer coming from index, of course! Thus, this string concatenation labels each "Hello, World!" with a unique integer taken from index, and the result is sent to the standard output (->std.out), like we've seen many times before.

We can do better than this program, though. In particular, the need to include the initilizer list for index seems silly; surely there must be a better way to express these kinds of iterations. There is, indeed: there is a special object in the standard library called std.gen that we can use to more cleanly get the same effect:

\\[std.gen]<-10 ("Hello, World #" + .. + "!") ->std.out;

Pretend that the std.gen object is "magic" for now (it's not, and it's actually very simple to implement such an object yourself, but we'll get to that in a minute). All you need to know is that if you put an integer n into it (via initialization or otherwise), you get a stream containing the integers from 0 to (n-1) inclusive. Destreaming this stream thus gives the same results as destreaming index, like we did earlier.

As an interesting aside, we can now understand what the type of std.out is (all ANI objects, even built-in ones like std.out have well-defined types -- there's no magic here!). The type of std.out is simply [node\\], which is a stream of arbitrary objects (which in ANI are called nodes). That's it! Simple, isn't it?

Expressions
We've already seen a few expressions in our ANI code, so it might seem silly to introduce them at this point. Yet there are several points to be made about how expressions are different from other parts of ANI code if we are to tone down the surprise when reading the upcoming programs.

Expressions in ANI are always enclosed in regular braces like (), and anything inside them is treated very much like an expression in any other language you may be familiar with. In particular, almost all of the C/C++-style operators are available for usage within ANI expressions, and they work exactly how you would expect. For example:

(2+3*4) ->std.out; // prints 14

and

("Result is: " + (2 + (3/3) + 4*5)) ->std.out; // prints Result is: 23

As you can see, expressions can be nested within each other, they follow all of the standard C-style operator precedence rules, and they are fully type-checked (hence we can concatenate integers onto strings with +, for example).

Expressions in ANI do have two notable differences from C expressions, however. The first is a bonus feature that isn't present in C, and that's the notion of de-latching latches within expressions.

s = [string\] <- "This is string #1."; (\s + " This is string #2") ->std.out; // delatching string latch s inside an expression

This works in exactly the way you'd expect; you should just keep in mind that this is allowed, and is legal.

The one other deviation from C expressions is that you cannot perform "assignment" inside expressions (you cannot do this anywhere in ANI, as a matter of fact!), nor can you perform ANI-style sends inside expressions. For example, the following is not allowed:

s = [string\]; ("Hello, " + "World!" ->s); // send inside expression: illegal; will generate compiler error \s ->std.out;

The reason for this is that it invites extremely confusing flows of data that are not obvious from the structure of the code; ANI strives to be simple, and one means to this end is disallowing confusing code that could easily be written in a non-confusing way.

Altogether, none of these points should be surprising in their own right, but we should keep in mind that expressions definitely are quite different from the other syntactical constructs in ANI. Anywhere besides expressions, the assumptions we make about expressions don't necessarily apply:

2+3*4 ->std.out; // prints 20, NOT 14!

As demonstrated by the above example, operator precedence (among other things) does not exist outside of expressions; everything that's not part of an expression is always evaluated left-to-right! This might seem shocking and maybe even plain silly, but it upholds the language's consistency: things always flow left-to-right, and when we desire the exceptional C-style behavior, we confine it to the bracketed expression syntax.

The reason for this will become obvious once we explore the notion of filters in ANI in the next section. It's about time we learn about filters, too; we've been using them throughout most of the tutorial without even realizing it!

Filters
You might be surprised to find out that all of the normal operators, such as +, -, and so on are actually filters in ANI! Filters get their name from a very intuitive parallel to filters in the physical world: they take in objects from pipes on one end (the left) and produce resulting objects on the other (the right). What comes out of a filter depends both on what the filter does, and what gets fed into it. To a certain extent, filters can be considered ANI's analog of functions/procedures, though conceptual differences mean that the analogy should be taken with a grain of salt.

So how does one use filters in ANI, anyway? Very simply:

6,7 + ->std.out; // uses the + filter to add 6 and 7 and get 13

You might now (rightly) be puzzled, because up to this point, we have been writing the above kind of program in the following style instead:

6 + 7 ->std.out; // uses the + filter to add 6 and 7 and get 13

So which one is correct? They both are! In fact, under the hood, the second case always boils down to the first; the second case's syntax is provided just because it's easier on the eyes and more intuitive to reason with.

Up until this point, you might not have realized it, but + is actually a filter that takes in two integer arguments and returns an integer latch. Expressed in ANI syntax, the type of + is [int, int --> int\], which by now you should be able to infer the meaning of.

In ANI, when we come across a filter that takes more than one argument, we compound multiple arguments together before feeding them through the filter, and then we invoke the filter by simply typing its name; the result of the filter comes out on the other side. To be more concrete, in the first example above, when we write 6,7, we are compounding the two integers 6 and 7, and then when we write +, we are feeding the 6,7 tuple through the + filter, which produces the result (13) on the right hand side; this result is then sent to the standard output.

The compiler is clever enough to figure out that the second example should automatically be converted into the first; + is a specially-designated infix filter, which means it can be potentially placed in between its two operands, as well as after them. Thus, when the compiler sees 6 +, it thinks to itself: "Okay, I have a 6 flowing into a +, which isn't valid since + is supposed to take two integers, not one. However, + is an infix operator, which means if the thing following the + is an integer object, then I'm allowed to reshuffle things to become the first example. Indeed, the 7 following the + is an integer, so I can just rewrite the second example into the first, and continue on!".

By this point, you might be wondering how you can define and use your own custom filters (and objects, in general). Doing so is the fundamental way of adding procedural abstraction to ANI programs, and we would like to be able to cleanly write larger pieces of code, so now would be an excellent time to cover the topic!

Custom Filter Objects
Recall that using a construct like the following, you can instantiate objects and bind them to specific identifiers:

x = [int\];

What we are doing above is essentially making a new clone of the int object and binding it to the identifier x. Yet in ANI, we are not limited to creating objects that are clones of other (pre-defined) objects. We can define our own objects from scratch like this:

twoInts = [int\ x, int\ y]; 3,5 ->twoInts; ("First int: " + \twoInts.x + ", second int: " + \twoInts.y) ->std.out;

In ANI, the syntax [t1 x1, t2 x2, ...] means "create a new anonymous object that has fields x1 of type t1, x2 of type t2, etc...".

Thus, twoInts is defined as a new kind of object that is made up of two integer latch fields, called x and y, which externally are known as twoInts.x and twoInts.y. Note how we simultaneously latched the integers 3 and 5 into twoInts on line 2, and separately extracted and printed the component fields on line 3.

This might not seem a powerful construct as used in the above example, but watch how we can adapt it to define our own custom-behavior filters, as promised:

addFive = [int\ x --> int] { \x + 5 -->; }; 12 addFive ->std.out; // prints 17

Here, we are defining an object that not only has fields, but also a return value of type int (signified by --> int). Further, the object has special custom behavior that is specified by the pipes enclosed in the subsequent curly brackets, {}. In this case, the custom behavior consists of only one pipe that delatches the first (and only) int\ field of the addFive object (which we called x), then adds 5 to it, and sends the result of doing so to the return value of the filter: in ANI, the operator --> is used to send the current value of the pipe to the return value of the object defined by the enclosing curly-braces.

Thus, writing 12 addFive ->std.out will take the integer 12 and feed it through the addFive filter, which will, after some internal processing, output the integer 17 as its return value on its right side, which subsequently gets sent to the standard output. Easy, right?

Note, however, that we're by no means limited to what we can do inside the definition of an object; the pipes inside the curly-braces are completely arbitrary and can do anything that any pipe anywhere else would be able to do!

For example, here is a program using a custom filter object that is capable of printing an arbitrary string an arbitrary number of times:

multiPrint= [string\ s, int\ times] { \\[std.gen] <- \times s ->std.out; }; "Hello, World!\n", 10 ->multiPrint;

As an exercise, try to figure out what exactly the above program will output. Looking back at previous examples might help (hint: std.gen is covered in the Streams section).

You might have noticed that in the above program, we are referring to the string-latch s without delatching it. This is not a mistake; it's very much deliberate, and if we added a \ in front of the s like we usually would, the program would not work as expected (it would print "Hello, World!" once, then terminate). To understand this subtlety, we'll need to delve a little deeper into ANI's type system.

We have thus far familiarized ourselves with ANI's latches and streams, but in truth there is another dimension on which ANI objects can differ: namely, some objects are constants and others are not, and effectively using ANI requires an understanding of both and the way they interact.

Constant Latches
Constant objects are actually the easiest of all objects to understand; the following piece of code instantiates i as a constant object (of type [int]:

i = [int] <- 72;

Note that [int] is quite different from [int\] - i is not a latch - it's simply an integer constant. This means, among other things, that we cannot delatch i or use it in contexts where we expect an integer latch. For example, the following usages of i would all result in compiler errors:

\i ->std.out; // ILLEGAL; can't delatch something that's not a latch 73 ->i; // ILLEGAL; can't send to something that's not a latch x = [int\]; i ->x; // ILLEGAL; can't put a constant into a latch myFilter = [int\ x] { x ->std.out; }; i myFilter; // ILLEGAL; myFilter expects an integer latch, not an integer

So what can we do with constants? Well, we can still compute with them by using filters that take in constants - and conveniently, all of the standard arithmetic and logical operator filters take in constants, not latches. Recall that the type of +, for example, is [int, int --> int\]. That means that the following is perfectly legal:

i = [int] <- 72; i + 5 ->std.out; // + accepts two [int] (not [int\]) arguments!

However, you might be surprised that the following program, in which i is declared to be of type [int\] (integer latch), does the exact same thing:

i = [int\] <- 72; // [int\], not [int] this time i + 5 ->std.out;

You might now assume that latches can simply be used in place of constants, and that constants are an essentially useless part of the language. However, you would also be very wrong: when you use latches, you are probably implicitly using constants without knowing it - and further, if it weren't for constants, the language would be a nightmare to use!

Latches are ANI's all-in-one fundamental building block of data-safe concurrency, but their power would normally come at the price of the programmer having to de-latch and re-latch them whenever they want to use the data contained in them, and unfortunately, having to do this every time you wanted to access data would bog down ANI programs to the point of near incomprehensibility. However, ANI constants save the day: any latch can be turned into a constant that doesn't need to be latched/delatdhed - and any real-world ANI program is bound to be doing this all over the place!

So how do we turn latches into constants? It's completely intuitive:

i = [int\] <- 72; myFilter = [int x] { x ->std.out; }; i myFilter; // constant usage of i

Simply put, if x has type T\, then you can delatch it using \x (which has type T\, and has the additional effect of emptying the x latch), or you can implicitly use it as a constant by simply usingx (which has type T and leaves the x laqtch as it is).

Also note that the language will implicitly down-convert latches to streams for you (just not the other way around). For example, the following program does the same thing as the one immediately above:

i = [int\] <- 72; myFilter = [int x] { x ->std.out; }; \i myFilter; // DELATCH i rather than using a consant reference to it; implicit conversion

Of course, you cannot modify constant verisons of anything, but this restriction allows the language to otherwise give you free reign with constants without you needing to specify how the data is going to be kept consistent (via latching and delatching). Thus you get the best of both worlds: data-safe concurrency that's actually usable.

Naturally, this raises the question of what might be the result of applying the same concept of constants to streams. For the curious, the answer is that a constant reference to a stream results in an immutable array of constants - but we'll save that discussion for when we better understand how to write more active ANI programs.

In particular, now that we understand ANI's type system a little bit better, we are ready to delve into the specifics of how one would implement some more practical real-world algorithms in ANI - the hybrid parallel clock/calculator example on the main page, for example. If we wanted to write such a dynamic program ourselves, where would we start?

Recursion
Fundamental to ANI's algorithms and data structures is the notion of using streams to recurse over data in a feedback loop. We will illustrate this idea by going back to our 10-time "Hello, World!" program and rewriting it using recursive streaming:

n = [int\\] <- 0; \\n < 10 ? { ("Hello, World #" + .. + "!\n") ->std.out; (.. + 1) ->n; };

The first line should be obvious by now. The second destreams n, and then does something we haven't seen before: a conditional execution. However, to a programmer familiar with C's ternary ?: operator, the syntax should make it rather clear what's going on: simply put, if the destreamed instance of n is less then 10, then we flow though into the pipes contained within the {} braces (like in other languages, a set of pipes delimited by such curly-braces is called a block).

The first of the two pipes in the conditional block is nearly identical to one we saw in the previous "Hello, World!" program; keep in mind that the recall identifier, .., still refers to the last thing placed into the pipe, which in this case is the element that we destreamed from n.

The second is the core of what gives this solution its recursive flavor. The expression (.. + 1) does the intuitive thing: it takes the element we destreamed from n and adds 1 to it; the result of this operation then gets fed back into n. But we already specified by \\n that whenever an element is available from n, it is to be taken out and placed where the \\n occurs. So what (.. + 1) ->n is fundamentally doing is triggering the next iteration of a tail-recursive loop! Note that the recursion ends implicitly when we send 10 to n, at which point the condition \\n < 10 will fail and nothing more will be done.

Real-time Parallel Clock/Calculator
We will now apply all of the ideas we've learned by building a real-time calculator/clock hybrid application; it will have a real-time clock counting (to the millisecond) the amount of time elapsed since the program started, while concurrently calculating the results of simple binary expressions, such as "2*5", typed by the user on the keyboard.

Real-time Clock
We'll build the clock module first, since it's simpler (we can do it in one line -- really!).

0 { clock => [int ms] { "\r" + (ms/1000.0) ->std.out; 1 std.delay (ms+1) clock; } }

Okay, so we're getting ahead of ourselves. The above code does actually produce a fully-working console clock application, but it's hardly "clean", and not the kind of thing we want in production code (or in a language tutorial). However, the following multiline version of the same program will be shockingly intuitive in just a moment:

``` clock = [int milliseconds] { ("\r" + (milliseconds/1000.0)) ->std.out; 1 std.delay (milliseconds+1) clock; };

[clock] <- 0; ```

Note that there really isn't anything in the above program that we haven't already seen before! Don't worry, though; we'll walk through it piece-by-piece just in case it's not all 100% clear yet.

First, let's examine the first line. The clock = part introduces a binding, as we've seen before, and the [int milliseconds] ... defines an object, which gets bound to clock, as expected. In this case, the object has one input called milliseconds (of type int), and no outputs.

Inside the curly-brackets, we have two pipes that define the behavior of the clock object. The first involves creating an object from the simple expression ("\r" + (milliseconds/1000.0)) and sending it to the standard output. A programmer coming from any of hundreds of programming languages will easily recognize that this expression represents a string consisting of the "\r" character concatenated to a representation of the value milliseconds divided by 1000; in other words, the number of seconds elapsed! The result of prefixing this with "\r" (the carriage-return) is that we return to the beginning of the line before we do the output, resulting in refreshing the count of seconds elapsed on the screen.

The line below this controls the cyclical refreshing of the clock; starting with the literal integer object 1, we feed it through the standard delay filter, std.delay, which takes as input a number of milliseconds and simply delays execution of the pipe for that amount of time. Thus, by saying 1 std.delay, we are delaying the execution of the rest of the line by 1 millisecond!

You might be able to figure out the last two terms of the line yourself. As previously mentioned, milliseconds is an integer argument given to the clock object; here we are simply adding one to the count of milliseconds and recursively feeding the result back into the clock object. Thus, in the next iteration, milliseconds will refer to an integer one greater than that of the previous iteration; the combined behavior of the two lines culminates in the desired clock functionality.

Yet unless we include the last line ([clock] <- 0;), this program will do nothing because although we have defined our clock object, we aren't doing anything with it yet. This last line, as you might be able to infer yourself, creates a new clock object and passes it the initial argument 0, which is bound to milliseconds and initiates the recursion. That's all there is to it!

Flow-through Declarations
As an aside, we could have written the above program in a slightly more compact fashion:

0 { clock => [int milliseconds] { // note the => instead of = ("\r" + (milliseconds/1000.0)) ->std.out; 1 std.delay (milliseconds+1) clock; } };

This might seem a little strange at first, but this example shows that we can initialize objects implicitly through an incoming argument if we change the = to => (the parallel to the -> operator is not a coincidence!). Defining clock in this way is called a flow-through declaration because the input arguments implicitly flow through into the body of the declaration -- and you can rest assured that yes, flow-through declarations are fully type-safe.

While this doesn't necessarily improve the quality of the code in the above example, the same construct allows us to concisely write our multi-Hello, World! program in inline style without any explicit streaming at all!

0 { loop => { < 10 ? { ("Hello, World #" + .. + "!")->std.out; (..+1) loop; } } }

...and now that we know what => means, the compacted version of the clock program isn't mysterious at all anymore.

0 { clock => [int ms] { "\r" + (ms/1000.0) ->std.out; 1 std.delay (ms+1) clock; } }

Parallel Calculator
So now we have our real-time clock working; the second part we'll need to write is the calculator that will run in parallel with our clock. Yet since ANI is a fully implicit parallel language, we don't need to go back and modify the clock component to make it work gracefully with our calculator -- the compiler will ensure that this is the case. Adding additional functionality to ANI programs is really just a matter of tacking on additional lines of code! So, what code will we need to add?

First, our calculator will need to remember the numbers and operators that the user types. For this purpose, we'll define some latches:

a = [int\] <- 0; op = [char\] <- ' '; b = [int\] <- 0; r = [int\] <- 0;

In this case, a will be our left operand, op will be our infix operator, b will be our right operand, and r will be the result of the operation. Note the zero values that they are all initialized with.

Most of the syntax above should be very familiar by this point. We haven't yet seen char (character) types or single-quoted char literals (' ') in ANI code up to this point, but they function exactly as you would expect them to in countless other programming languages.

So we have our latches defined, and now we would like to populate them with user input. If sending to std.out (standard output) is the primary way of outputting data from an ANI program, it only makes sense that delatching from std.in (standard input) is the way we usually take input -- this is indeed the case.

The following simple recursive pipe will thus sequentially and repeatedly read a left operand, an operator, and a right operand from standard input:

inLoop => { \std.in->a \std.in->op \std.in->b inLoop };

Note the lack of semicolons in between the delatches - this implies that the input will be taken sequentially. Also note that we end the pipe with a recursive feedback into the inLoop object - this means that we will keep on taking input forever until the user manually terminates the program.

Finally, we will need some code that will do the actual computation on behalf of the calculator. The following will do just that:

\\op ?? { '+': (\a + \b) '-': (\a - \b) '*': (\a * \b) '/': (\a / \b) : 0 } <->r;

Understanding the above block of code requires two simple insights:

The first it the fact that ANI's ?? construct works very similarly to C's switch statement (except that ?? returns a value).

The second is that <-> is the swap operator in ANI: essentially, it's just shorthand for swapping the object currently in the pipe with the object latched in the named latch. An equivalent way of understanding <-> would be a delatch followed by a send, both applied to the same latch.

Thus this block does the intuitive thing: it checks which operator the user typed in on the keyboard, performs the appropriate arithmetic on the operands a and b, and r is updated to be the result of the operation.

We have now implemented all of the functionality needed to make the calculator component of our program work. All that's left is to change the line that does our output (from the clock portion of the program) so that it persistently outputs the user's input and the corresponding result (via constant references to the latches) so that we can see the program working on the screen:

0 { clock => [int ms] { ("\r" + ms/1000.0 + ":" + a + op + b + "=" + r) ->std.out; 1 std.delay (ms+1) clock} };

...and we're done! Putting everything together, this is how our completed program will look like:

```
a = [int\] <- 0; op = [char\] <- ' '; b = [int\] <- 0; r = [int\] <- 0; 0 { clock => [int ms] { ("\r" + ms/1000.0 + ":" + a + op + b + "=" + r) ->std.out; 1 std.delay (ms+1) clock } }; inLoop => { \std.in->a \std.in->op \std.in->b inLoop }; \\op ?? { '+': (\a+\b) '-': (\a-\b) '*': (\a*\b) '/': (\a/\b) : 0 } <->r;
```

#### Generalized Custom Objects
Up to now we've seen latches, streams, constants, and filter objects. But how would one compose these into more general (and more complex) data structures -- trees, for example? Although it turns out that the subset of ANI we've seen up to this point is Turing complete (in fact, you don't even need filters!), luckily ANI provides a clean object-oriented model for dealing with these more complicated data structures naturally.

As usual, we will introduce the concept via example: how would one implement an integer-labeled binary tree in ANI?

```
binTree = { = [int\ id, binTree\ left, binTree\ right] { \id ->binTree.id; \left ->binTree.left; \right ->binTree.right; }; id = [int\]; left = [tree\]; right = [tree\]; };
```

The most immediately puzzling thing about this definition of binTree is what that nameless internal = [binTree\ left, binTree\ right] { ... definition represents. The answer, quite simply, is that it's a constructor for the binTree object!

In ANI, any declaration without a name is considered a constructor for the enclosing object literal (delimited by {} curly braces). In fact, the presence of constructors in {} blocks of ANI code is what defines objects and separates them syntactically from filters. To make things clearer, all constructors of an object must come before any other intra-object definitions and/or code; thus, for example, defining left before the constructor in this case would be syntactically invalid.

The implications of this are that yes, ANI fully supports overloaded constructors, but it also means that all constructors must be explicit in the code; there is no notion of "default constructors" in the language, and if you don't provide any constructors for your object, then you are effectively defining a null filter (an object of type [null --> null]) instead. However, to a large extent, ANI treats filters and objects the same: it makes a degree of sense to think of objects as overloaded filters! The syntax for using and instantiating objects makes this plainly obvious:

```
binTree = { = [int\ id, binTree\ left, binTree\ right] { // first constructor \id ->binTree.id; \left ->binTree.left; \right ->binTree.right; }; = [int\ id] { // second constructor \id ->binTree.id; // leave left and right subtrees empty }; id = [int\]; left = [tree\]; right = [tree\]; }; myTree1 = [binTree\] <- { // construct a multi-level binary tree. 1 [binTree\] <- 2, [binTree\] <- { 3, [binTree\] <- 4, [binTree\] <- 5 } };
```

