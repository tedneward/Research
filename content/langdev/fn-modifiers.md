title=Function modifier implementation
tags=langdev, reading
summary=Notes and links on the topic of "colored" functions.
~~~~~~

This seems to be related to [effects](./effects) at a high conceptual level.

## Articles

[StackExchange: "Colored vs uncolored functions"](https://langdev.stackexchange.com/questions/3430/colored-vs-uncolored-functions)

**Q**: I've heard people say "colored" functions (e.g. async functions, or functions marked with throws) are bad because they pollute your code base, as every direct or indirect caller of a colored function becomes colored as well. Examples of languages which don't have colored functions are Go and Elixir. However, is it wrong to think of these languages without colored functions as simply marking all functions as colored? For example, how is Go fundamentally different from C# with every function marked async?

**A**: I think that "colored functions are bad" is the wrong conclusion to come away from that article with. As mentioned by the other answers, the original source of the "color" analogy for functions is https://journal.stuffwithstuff.com/2015/02/01/what-color-is-your-function/.

For those who haven't read it, I'll summarize here. Imagine a hypothetical programming language where every function must be marked (at declaration time) with a color. Every function is either red or blue. And red and blue functions are intentionally designed asymmetrically. Red functions can do whatever they please, but blue functions are locked in and can, generally speaking, only call other blue functions. In principle, you should always make your functions blue, because then blue and red callers can use it, but the standard library of our clever little nonexistent language has marked some of its functions as red. So if you need to use those functions, you're stuck in the red as well.

The author of the article was using "red" as a stand-in for `async` in Javascript and "blue" for non-async, but it turns out that the analogy works in several places.

* Javascript and Python both define async functions (red) and non-async ones (blue).
* Haskell requires you to distinguish between IO-bound functions (red) and those that are pure (blue).
* Rust forces you to mark unsafe functions (red) and assumes all others are safe (blue).
* Java requires checked exceptions to be marked in the return type (red), and assumes all functions which do not have a throws clause do not throw checked exceptions (blue).

In each of these cases, there are escape hatches of varying utility.

* A non-`async` function in Javascript can start up a web worker or some other asynchronous technique that doesn't block the current worker.
* Haskell has `unsafePerformIO`, an extremely blunt force instrument that can be used very carefully to perform IO effects in otherwise pure contexts.
* Rust allows blocks of code within a function to be marked as unsafe, allowing a blue function to masquerade as red for a moment without actually becoming red.
* Java lets you wrap checked exceptions in an unchecked one like RuntimeException, which can slip right through the throws declaration.

The point of the red-blue analogy isn't "Colored functions are bad and we should avoid them". The point is "We should be conscious of the distinctions we define in our languages". If Java didn't have `RuntimeException`, people would hate checked exceptions even more than they already do. If Rust didn't let you assert your dominance to the compiler with `unsafe { ... }` blocks, then lots of basic functions (such as those on a benign data structure like Vec) would have to be red on principle.

If you omit the colored distinction, all your functions are blue. If you let things get out of hand, then all your functions are red. And you certainly don't want to end up in a situation where all of your users are marking their functions red simply because it's too much of a pain to prove blue-ness. If they start doing that, then all you have is a colorless language with a couple of annoying keywords that do nothing.

But when done correctly, and when done sparingly, we can get tangible benefits.

* Stackless coroutines with explicit async give us some nice performance benefits over Lua-style or Go-style stackful coroutines (see this related question for more discussion on that topic)
* Explicit marking of impure effects in Haskell allows us to reason about our code in a way that many other languages can't do.
* Rust's safety guarantees (which apply to any part of the code not marked unsafe) prevent a lot of bugs, and often isolate those that occur to the (hopefully small) red part of your program.
* While people hate on Java's checked exceptions, the principle that exceptional code should be marked and ignoring it should be a compiler error is actually a really good one. We see a more refined approach to this in Rust (Result types) and Haskell (error monads).

So the color problem isn't really a problem, in the same way that the law of gravity isn't a problem for an airline pilot. It's something we should be aware of, and something that can provide us some real tangible benefits when applied correctly. But it's not an evil to be smited.

---

**A**: One way to interpret "color" is just another term for **effect** [^1]. An effect is a specific attribute a function may have which propagates to its callers. Async and `throws` are effects, but so are "does IO", non-determinism, and even potential non-termination (if a function has the potential to infinitely recurse, it can't be used to prove things via the [Curry–Howard correspondence](https://en.wikipedia.org/wiki/Curry%E2%80%93Howard_correspondence)). A function which calls an async function must be async and a function which calls a `throws` function must be `throws`, similarly a function which calls an IO-capable function is itself IO-capable, etc. [^2].

I'd argue that **every language has functions with multiple colors**. It's just that in some languages like C and JavaScript the colors are implicit, in some languages like Haskell the colors are explicit in the function signature (monads like `IO`, `Future`, `State`), and some languages like C++ and Java some colors (`async`, `const` member function, `throws`) are explicit and the rest are implicit. Even in Go which don't have async, some functions are entirely single-threaded and others spawn goroutines, you just can't tell by the signature; similarly in JavaScript some functions will never throw exceptions and others may, and in Java some methods won't mutate `this` and others will, but you can't tell by the function signatures. Go is fundamentally different from C# in that both support asynchronous functions, but Go's functions are defined and called no differently than synchronous ones, while C#'s asynchronous functions must be prefixed async and called with await (or explicitly handled with something like .GetAwaiter().GetResult()).

You can argue that **the syntax of languages without explicit colors/effects is less polluted**. In Go, you don't have to denote all of your async functions with extra syntax, and in JavaScript, you don't have to put throws IOException after every function which invokes IO (or spam `try { ... } catch (e) { throw new RuntimeException(e); }`). In fact, this is probably a big reason why languages where every effect must be explicit haven't caught on, because it would be a big pain to write signatures like `async nondeterministic nonterminating ioperforming FooBar(arg: int, arg2: string) throws IOException, TimeoutException, BazException` (and there are plenty of reasonable, small functions which would have many types of effects).

However, languages "without" colored functions (without explicit effects) are no less "polluted" than those with them, because every language has colored functions, those languages are just hiding the pollution :). In fact, **languages without explicit syntax usually have more effects**, because programmers can't hide unreasonable side-effects from their API, and class signatures may disallow unreasonable effects. For example, [Java's `URL.equals` performs DNS resolution, and the result can be different depending on whether or not you are connected to the internet or if a server's IP address changed](https://news.ycombinator.com/item?id=21765788). If Java was forced to denote that Object.equals could potentially access the internet, more people may be dissuaded from using Java; or more likely, the developers of Java may have figured out a more reasonable solution (like, not using DNS resolution to compare URLs).

[^1]: "What color is your function", which I believe is the origin of "color", defines colors a different way: pure functions are blue, functions which perform an effect are red. Here, pure functions are colorless or grayscale, and different effects correspond to different colors.

The terminology "color" is used because it helps to show effects by highlighting functions with each effect in their specific color, like the article does. If you have multiple effects, each may correspond to a different color (green, orange, blue), then a function with multiple effects would have to have multiple colors.

[^2]: Unless the function uses an **effect handler**, which effectively consumes the effect so it's no longer observable to the outside world. Ex: calling an `async` function with `.GetAwaiter().GetResult()` to simply block until it returns, calling a `throws` function within a `try` block to catch the exception, calling an IO-capable function on a virtual filesystem, calling a non-deterministic function with a seeded random, or calling a potentially non-terminating function but only running a finite number of steps and then "giving up" if it doesn't terminate.

