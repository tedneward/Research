title=Flapjax
tags=language, platform, browser, nodejs, events
summary=A new programming language designed around the demands of modern, client-based Web applications.
~~~~~~

Its principal features include:

* Event-driven, reactive evaluation
* An event-stream abstraction for communicating with web services
* Interfaces to external web services

Flapjax is easy to learn: it is just a JavaScript framework. Furthermore, because Flapjax is built entirely atop JavaScript, it runs on traditional Web browsers without the need for plug-ins or other downloads. It integrates seamlessly with existing JavaScript code and other frameworks.

[Website](http://www.flapjax-lang.org/) | [Source](https://www.github.com/brownplt/flapjax/) | ["Flapjax: A Programming Language for Ajax Applications"](http://www.cs.brown.edu/~sk/Publications/Papers/Published/mgbcgbk-flapjax/) (2009)

### From the Tutorial

### Introducing Behaviors
The easiest way to start programming in Flapjax is to use the templating syntax, which lets you embed Flapjax code in an HTML page. Here's a simple example:

```
<p>
The time is {! timerB(100) !}.
</p>
```

In this fragment, the {! (pronounced “curly-bang”) and !} surround an expression written in Flapjax. The expression's syntax looks remarkably similar to that of JavaScript, and this is no coincidence: Flapjax shares the syntax of JavaScript. You may not be sure of what it does, but you can probably guess: the function timerB probably returns the current system time. That is, the page probably prints the system time at the point when it was loaded. Let's check by running the program.

Hopefully what you saw is not just the current system time, but the time incrementing rapidly. The function timerB constructs something called a behavior, which is a value that changes over time. In the first part of this tutorial you'll learn quite a bit more about behaviors, which are central to Flapjax.

Returning to the example, the expression timerB(100) creates a timer behavior that returns a value every 100 milliseconds, i.e., ten times every second. What it returns, however, is a microsecond timer value, and all those extra digits are what make the timer appear to be updating madly. So to smooth it we should divide the value by 1000:

```
<p>
The time in seconds is {! Math.floor(timerB(100) / 1000) !}.
</p>
```

First, see how it runs. As you can see, this value updates more sedately, once every second.

Here's what is interesting about this example: the division and floor happened every time there was a new value for the timer! We didn't need to tell the program to recompute: when the value of timerB changed, the rest of the computation automatically noticed the change and updated itself. In other words, not only did the value of timerB(100) change over time, so did the value of timerB(100) / 1000 and, in turn, the value of Math.floor(timerB(100) / 1000). This points to an important rule: if an expression is a behavior, all expressions whose values depend on it also become behaviors. This automatic updating of the values of behaviors is central to Flapjax.

We don't actually have to write all expressions inside the HTML document: we're welcome to, and should, move more complex expressions into a script tag, where we can give them names that we can refer to later. Let's do this:

```
<script type="text/flapjax">
var timerB = timerB(100);
var secondsB = Math.floor(timerB / 1000);
var secsModTenB = Math.floor(secondsB % 10);
</script>
```

The script header tells the Flapjax compiler that the script code is in the Flapjax language. The compiler converts this into pure JavaScript code, so that it can run on standard browsers without any plugins. Notice how the definitions resemble regular JavaScript code, with the sole exception of the use of behaviors.

Having created such definitions, we can now use them in our pages. For instance, we could ask whether the current system time, in seconds, is even or odd:

```
<p>
The current system time is {! ((secondsB % 2 === 0) ? "even" : "odd") !}.
</p>
```

Or, suppose in a separate JavaScript script tag we had defined the function arrayToString. We could apply this function to a behavior inside Flapjax:

```
<p>
The list of time modulo 10 elements is
  {! arrayToString(oneToN(secsModTenB)) !}.
</p>
```

Again, see how it runs. Notice how arrayToString, even though written in JavaScript, automatically works over behaviors, and does the right thing: it recomputes a fresh array as the time changes every second. This process, of making a function written in JavaScript operate over behaviors, is called lifting: it ``lifts'' the function from operating over JavaScript values to operating over Flapjax behaviors. The Flapjax compiler performs lifting for you automatically, so you should rarely, if ever, have to encounter it yourself. If, however, you treat Flapjax simply as a JavaScript library (which is a mode of operation we support), you'll find yourself performing lifting explicitly.

The examples used in this introduction to behaviors warrant two disclaimers. First, you probably shouldn't rush to uselessly display such timers on your Web pages: they remind people of the worst abuses of JavaScript from the 1990s, and will make your site unpopular. Second, this tutorial has shown only excerpts of the full pages you see when you run the programs. There is some missing code that you must write and some that you should write. The must-write code creates a proper Web page and loads the Flapjax library. The should-write code provides meaningful messages when the Web browser has disabled (or does not support) JavaScript. You should read the annotated versions of the demos to understand these details.

At this point, you can either soldier on with the tutorial or you can stop to read the demos and create your own working Flapjax pages. We suggest you consider doing the latter. The joy of a programming language is that you can actually write programs in it. As the tutorial's examples get more complex, you'll find it helpful (if, occasionally, frustrating) to be able to not only see what we present but to also tweak the examples and see what impact your changes have.
