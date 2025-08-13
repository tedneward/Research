title=Scrapscript
tags=language, functional, hashable
summary=Scrapscript is best understood through a few perspectives: "it's JSON with types and functions and hashed references"; "it's tiny Haskell with extreme syntactic consistency"; "it's a language with a weird IPFS thing".
~~~~~~

[Website](https://scrapscript.org/) | [Source](https://github.com/scrapscript)

Any chunk of the language can be replaced with a hash. These chunks are called "scraps". Scraps are stored/cached/named/indexed in global distributed "scrapyards".

Scrapscript rejects traditional package-management. Instead, "scrapyards" combine features from Smalltalk, Hackage, IPFS, GitHub, and StackOverflow. This new paradigm empowers devs to safely collaborate in live environments.

Every scrap carries its own immutable dependencies.

The language itself forms merkle trees; VCS tools like git are optional. Every expression is independently version-controlled through the global namespace.

Every expression in the ecosystem can be independently spliced and "time-travelled".

To avoid giant updates, scrapscript tooling can incrementally upgrade your code. Any chunk of code can be pinned independently to upgrade at a later time.

Easily inspect code regressions. Execute code with dependencies from a specific point in time.

Scrapscript is a full programming language designed to be sent over the wire with type-safety in mind.

## Implementations

* Python: [Source](https://github.com/tekknolagi/scrapscript) ([Browser REPL](https://scrapscript.fly.dev/repl))

## Guide
# guide

<ol id="table-of-contents" style="column-count: auto; column-width: 8rem;"></ol>

## introduction

Scrapscript is a tiny programming language and messaging notation. Use it to make small programs and share them with others! Our [community](https://scrapscript.discourse.group) celebrates connectedness, correctness, and compression.

Scrapscript is still in early development! Throughout this guide, you'll see "proposals". If you have any opinions, feel free to [post in Discourse](https://scrapscript.discourse.group) or email [Taylor](https://taylor.town).

## numbers

Scrapscript offers conventional integers and floats.

```{.language-haskell}
1 + 1
```

```{.language-haskell .result}
2
```

```{.language-haskell}
1.0 + 1.0
```

```{.language-haskell .result}
2.0
```

You cannot mix-and-match integers with [floats](https://en.wikipedia.org/wiki/Floating-point_arithmetic).

```{.language-haskell}
1 + 1.0
```

```{.language-bash .result}
type error
```

Use `to-float`, `round`, `ceil`, and `floor` to convert between integers and floats.

```{.language-haskell}
1.0 + to-float 1
```

```{.language-haskell .result}
2.0
```

## text

In scrapscript, text is called "text" instead of "strings".

```{.language-haskell}
"hello" ++ " " ++ "world"
```

```{.language-haskell .result}
"hello world"
```

Text preserves newlines.

```{.language-haskell}
"hello" ++ "
" ++ "world"
```

```{.language-haskell .result}
"hello
world"
```

Emojis are text too!

```{.language-haskell}
"🐸"
```

```{.language-haskell .result}
"🐸"
```

There's nice syntax for embedding text inside text.

```{.language-haskell}
"hello` "🐸" `frog"
```

```{.language-haskell .result}
"hello🐸frog"
```

## bytes

Encode arbitrary data in scrapscript using [Base64](https://en.wikipedia.org/wiki/Base64). This is helpful for human manipulation and debugging, but don't worry -- we can send it over the wire as raw bytes using [flat scraps](#flatscraps).

```{.language-haskell}
bytes/to-utf8-text ~~aGVsbG8gd29ybGQ=
```

```{.language-haskell .result}
"hello world"
```

You can also express individual bytes in hexadecimal.

```{.language-haskell}
bytes/to-utf8-text <| ~~aGVsbG8gd29ybGQ= +< ~21
```

```{.language-haskell .result}
"hello world!"
```

## hole

> Thirty spokes share the hub of a wheel;  
> yet it is its center that makes it useful.
>
> You can mould clay into a vessel;  
> yet, it is its emptiness that makes it useful.
>
> Cut doors and windows from the walls of a house;  
> but the ultimate use of the house will depend on that part where nothing
> exists.
>
> Therefore, something is shaped into what is; but its usefulness comes from
> what is not.
>
> -- _Tao Te Ching_

You may see this thing around: `()`. In scrapscript, we call it "hole" because it looks like a gaping hole.

```{.language-haskell}
()
```

```{.language-haskell .result}
()
```

Emptiness is what makes a hole useful!

## variables

Compared to most other modern programming languages, scrapscript is written "backwards".

You can read the following statement as "`x` where `x` equals 100":

```{.language-haskell}
x ; x = 100
```

```{.language-haskell .result}
100
```

You can use where-statements as expressions:

```{.language-haskell}
200 + (x ; x = 150)
```

```{.language-haskell .result}
350
```

Scrapscript doesn't nitpick over blankspace, so you can chain multiple clauses on different lines:

```{.language-haskell}
a + b + c
; a = 1
; b = 2
; c = 3
```

```{.language-haskell .result}
6
```

<!--
There is an additional where operator that has stronger operator precedence
(you'll see why later in this guide):

```{.language-haskell}
a + b + c
; a = 1
; b = x + y
  , x = 1
  , y = 1
; c = 3
```

```{.language-haskell .result}
6
```

--->

Writing "backwards" makes parsing slower in some cases, so why does scrapscript elect to make things slower and more confusing?

Scrapscript is written "backwards" for a few reasons:

- **Wishful Thinking**: Write your program as if you had a magic wand, and then recursively implement missing logic. This practice (1) naturally prevents [YAGNI](https://en.wikipedia.org/wiki/You_aren%27t_gonna_need_it) mistakes, (2) produces more intuitive API boundaries in large programs, and (3) makes code quickly testable with placeholder logic.
- **Next-Gen Autocomplete**: With most programming languages, Github Copilot surveys the elements of the workspace to guess what the author wants to make. Unfortunately, the boilerplate code at the beginning is annoying to type and difficult to extrapolate. With scrapscript, AI completion tools can take your goal and generate its boilerplate. Furthermore, AI tools can use contextual type information to make even better guesses.
- **Interactive Code**: No more "variable not found" errors in the REPL! Scrapscript can recursively add additional where-clauses until all variables in your program are defined.

## lists

```{.language-haskell}
[1, 2, 3] +< 4
```

```{.language-haskell .result}
[1, 2, 3, 4]
```

Unlike JS and Python, everything in a list must have the same exact type.

```{.language-haskell}
["1", 1, 1.0]
```

```{.language-bash .result}
type error
```

## records

Sometimes you want to store heterogeneous data like a `customer` or an `account`.

```{.language-haskell}
rec.a
; rec = { a = 1, b = "x" }
```

```{.language-haskell .result}
1
```

You can use an existing record to "fill in" the values of a new record:

```{.language-haskell}
{ ..g, a = 2, c = ~FF }
; g = { a = 1, b = "x", c = ~00 }
```

```{.language-haskell .result}
{ a = 2, b = "x", c = ~FF }
```

But you cannot change the type of a record:

```{.language-haskell}
{ ..g, a = "y" }
; g = { a = 1, b = "x" }
```

```{.language-bash .result}
type error
```

<!--
todo: explain when you might want a dict instead
--->

## operators

Scrapscript's operators are mostly [copied from Elm](https://elm-lang.org/docs/syntax#operators). Consider using Elm if you want to make delightful web experiences with a great community!

<!--
|              |                |
| -----------: | -------------- |
|           >> | compose-right  |
|           << | compose-left   |
|            ^ | raise          |
|           \* | multiply       |
|            / | divide         |
|           // | integer divide |
|            % | modulo         |
|            + | add            |
|            - | subtract       |
|      &#124;. | parse-toss     |
|           ++ | concatenate    |
|           +< | append         |
|      &#124;= | parse-keep     |
|           >+ | prepend        |
|           == | equals         |
|           /= | does-not-equal |
|            < | is-lt          |
|            > | is-gt          |
|           <= | is-lte         |
|           >= | is-gte         |
|           && | logical-and    |
| &#124;&#124; | logical-or     |
|      &#124;> | pipe-right     |
|      <&#124; | pipe-left      |
--->

## functions

```{.language-haskell}
f 1 2
; f = a -> b -> a + b
```

```{.language-haskell .result}
3
```

<!-- TODO: explain currying --->

Use functions to pattern-match on inputs. The code will try each case sequentially until it finds a match. Don't worry -- the compiler will ensure that you don't forget any cases!

Fun fact: this is the only method of control-flow in scrapscript!

```{.language-haskell}
f "b"
; f =
  | "a" -> 1
  | "b" -> 2
  | "c" -> 3
  |  x  -> 0
```

```{.language-haskell .result}
2
```

Remember that scrapscript doesn't care about blankspace, so you can throw everything on one line:

```{.language-haskell}
f "b"
; f = | "a" -> 1 | "b" -> 2 | "c" -> 3 | x -> 0
```

```{.language-haskell .result}
2
```

Scrapscript's functions are greedy -- they grab code until they hit a `.` or matching `)`. Scrapscript doesn't care about whitespace, so indentation won't help you.

```{.language-haskell}
(f >> (x -> x) >> g) 7
; f = | 7 -> "cat"
      | 4 -> "dog"
      | _ -> "shark"
; g = | "cat" -> "kitten"
      | "dog" -> "puppy"
      |   a   -> "baby " ++ a
```

```{.language-haskell .result}
"kitten"
```

Unevaluated functions are values too!

```{.language-haskell}
(x -> x) (y -> y)
```

```{.language-haskell .result}
y -> y
```

You can match on ints, but you can't match on floats:

```{.language-haskell}
| -1 -> "negative one"
|  0 -> "zero"
|  1 -> "one"
|  n -> "something else"
```

```{.language-haskell}
| ~00 -> ~00
| ~FF -> ~FF
|   n -> n
```

You can also match on text and bytes, along with their leading content:

```{.language-haskell}
| "hey" -> ""
| "hello " ++ name -> name
| _ -> ""
```

```{.language-haskell}
| ~~8J+QuA== ++ x -> x
| x -> x
```

There are many ways to match lists:

```{.language-haskell}
| [ x, y, z ] ++ tail -> ()
| first >+ second >+ tail -> ()
| [ x ] -> ()
| head >+ tail -> ()
| [] -> ()
```

You can match on records as long as you keep the argument types consistent:

```{.language-haskell}
| { ..x, a = 1, b = 2, c = 3 } -> ()
| { ..x, a = 1, b = b        } -> ()
| {      a = 1, b = 2        } -> ()
| { ..x,               c = c } -> ()
```

All destructuring is nestable:

```{.language-haskell}
| { a = [ 3, 4 ]
  , b = "howdy"
  }

  -> "howdy"

| { a = [ x ]
  , b = "hi " ++ name
  }

  -> "not right now, " ++ name

| _

  -> "..."
```

You can pattern match on functions of any arity:

```{.language-haskell}
| 1 -> 1 -> 1
| 1 -> 2 -> 3
| 3 -> 5 -> 8
| 5 -> 8 -> 12
| a -> b -> a + b
```

## types

If you want to define multiple alternatives, use a custom type:

```{.language-haskell}
scoop::chocolate
; scoop :
  #vanilla
  #chocolate
  #strawberry
```

This is how `true` and `false` are impemented in scrapscript:

```{.language-haskell}
#true #false
```

Alternatives can "carry" their own data, if defined that way:

```{.language-haskell}
c::radius 4
; c : #radius int
```

```{.language-haskell .result}
(#radius int)::radius 4
```

If you want to use alternatives in multiple contexts, you can make types generic
with functions:

```{.language-haskell}
point::3d 1.0 "A" ~2B
; point : x => y => z =>
  #2d { x : x, y : y        }
  #3d { x : x, y : y, z : z }
```

Functions have types too!

```{.language-haskell}
typ::fun (n -> x * 2)
; typ : #fun (int -> int)
```

Use pattern matching to grab the contents of each alternative:

```{.language-haskell}
hand::left 5 |>
  | #l n -> n * 2
  | #r n -> n * 3
; hand :
  #l int
  #r int
```

```{.language-haskell .result}
10
```

If it gets too confusing, break things into local types:

```{.language-haskell}
t
; t :
  #a a
  #b int
  #c byte
; a :
  #x
  #y
  #z
```

You can also nest and unnest in your matches:

```{.language-haskell}
| #a { x = #l 0 } -> ()
| #a { x =  _   } -> ()
| #b { x = #l 1 } -> ()
| #b { x =  _   } -> ()
| #c { x = #l 2 } -> ()
| #c { x =  -   } -> ()
| _               -> ()
```

## CLI

_Scrapscript is still in active development. The CLI is not available yet, but here's a preview of what we're building. Feel free to [complain with the community](https://scrapscript.discourse.group)._

To evaluate scrapscript, pipe it into `scrap eval`.

```{.language-bash}
$ echo '1 + 2' | scrap eval
```

```{.language-haskell .result}
3
```

```{.language-bash}
$ scrap eval < hello-world.ss
```

```{.language-haskell .result}
"hello world"
```

You can manipulate input with `scrap eval apply`:

```{.language-bash}
$ echo '0' \
  | scrap eval apply 'n -> n + 1' \
  | scrap eval apply 'n -> n + 1' \
  | scrap eval apply 'n -> n + 1'
```

```{.language-haskell .result}
3
```

## rocks

A "rock" is a "rock-bottom" unit of scrapscript. These are the building blocks
out of which everything in scrapscript is implemented.

```{.language-haskell}
$$add 1 2
```

```{.language-haskell .result}
3
```

```{.language-haskell}
(#a $$int)::a 0
```

```{.language-haskell .result}
(#a $$int)::a 0
```

Rocks make scrapscript portable. By implementing the limited number of
scrapscript rocks in your host systems, you get the rest of the scrapscript
ecosystem for free!

A complete list of rocks is coming soon!

## scrapyards

_Note: Scrapscript's tooling obviates the need for direct interaction with
scrapyards. This section is mostly for fun and curiosity._

In scrapscript, any expression can be replaced with a cryptographic hash:

```{.language-haskell}
fib 31
; fib =
  | 0 -> 1
  | 1 -> 1
  | n -> fib (n - 1) + fib (n - 2)
```

```{.language-haskell .result}
1346269
```

```{.language-haskell}
fib 31
; fib = $sha1~~e4caecf0d6f84d4ad72e228adce6c2b46a0328f9
```

```{.language-haskell .result}
1346269
```

A scrapyard is a key-value store of hashes and scraps. The storage medium
doesn't matter -- scrapyards only need to adhere to either the filesystem API or
the HTTP API to be accessed by the compiler.

The scrapscript team hosts a giant public scrapyard at
[yard.scrap.land](https://yard.scrap.land) for everybody, but you can also
configure your CLI to read from additional scrapyards:

```{.language-bash}
$ cat ~/.config/scrapscript/config.ss \
  | scrap eval apply \
    'config -> { ..config, yards = [ "https://yard.scrap.land", "/var/my-scrapyard" ] }' \
  > ~/.config/scrapscript/config.ss
```

You can create a local scrapyard and upload scraps to it:

```{.language-bash}
$ scrap yard init /var/my-scrapyard
$ echo '123' | scrap flat | scrap yard push /var/my-scrapyard
```

```{.language-bash .result}
$sha1~~3efce6ae1ebf7fef7c7bdd8c270d76da5b079438
```

You can also make a local scrapyard accessible via a network:

```{.language-bash}
$ scrap yard listen /var/my-scrapyard :8080
```

```{.language-bash}
$ curl http://localhost:8080/#sha1~~3efce6ae1ebf7fef7c7bdd8c270d76da5b079438
```

```{.language-bash .result}
123
```

## scrap map

Nobody wants ugly hashes in their elegant programs. Civilized folk use names for
things!

If a scrapyard is a giant pile of scraps, a scrap map gives each hash a name and
version.

```{.language-bash}
$ cat ~/.config/scrapscript/config.ss \
  | scrap eval apply \
    'config -> { ..config, maps = [ "https://map.scrap.land", "/var/my-scrapmap" ] }' \
  > ~/.config/scrapscript/config.ss
```

No need to `import` or `require` anything -- if a variable is not found in your
program, it searches through available maps:

```{.language-haskell}
connie2036/fib
```

```{.language-haskell .result}
fib
; fib =
  | 0 -> 1
  | 1 -> 1
  | n -> fib (n - 1) + fib (n - 2)
```

Be default, scrapscript uses the latest version of scraps, but you can specify
previous versions:

```{.language-haskell}
pair connie2036/planets@0 connie2036/planets@1
```

```{.language-haskell .result}
pair
[ "Pluto", "Neptune", "Uranus", "Saturn", "Jupiter", "Mars", "Earth", "Venus", "Mercury" ]
[ "Neptune", "Uranus", "Saturn", "Jupiter", "Mars", "Earth", "Venus", "Mercury" ]
```

You can also use the time-travel interpreter to choose versions based on time:

```{.language-bash}
$ echo 'list/first connie2036/planets' \
  | scrap eval --t="2005-01-01"
```

```{.language-bash .result}
just "Pluto"
```

```{.language-bash}
$ echo 'list/first connie2036/planets' \
  | scrap eval --t="2006-12-31"
```

```{.language-bash .result}
just "Neptune"
```

<!--
In case you're interested, here's the general structure of a scrap map:

```scrapscript
dict scrapname scraprefs
; scrapname = text
; scraprefs = list (pair timestamp (maybe scraphash))
  , timestamp = int
  , scraphash = bytes
```
--->

You can add scraps to maps and yards:

```{.language-bash}
$ echo '() -> "hello"' \
  | scrap flat  \
  | scrap map commit connie2036/greet \
  | scrap pass sign ~/.ssh/id_rsa \
  | scrap map push /var/my-scrapmap
```

```{.language-bash .result}
connie2036/greet@44
```

Signatures needn't be enforced for local maps, but they're essential for
preventing tomfoolery in public maps!

## platforms

<!-- consider moving this section earlier so that they can see pragmatic scrapscript -->

The `scrap eval` command is useful for manipulating data, but it doesn't permit
any real interaction with the "outside" world. Scrapscript instead uses
["managed effects"](https://blog.testdouble.com/posts/2022-02-16-interview-eric-newbury/)
(like Elm and Roc) to maintain a small yet extensible surface area.

In other words, scrapscript acts as an algebra for performant "platforms". Use
platforms to control robots, interact with filesystems, create user interfaces,
etc.

Here's what a simple web-server platform might look like:

```{.language-haskell}
| "/home" -> q -> res::success <| "<p>howdy " ++ get-name q ++ "</p>"
| "/contact" -> _ -> res::success "<a href="mailto:hello@example.com">email</a>"
| _ -> _ -> res::notfound "<p>not found</p>"
; res = #success text #notfound text
; get-name = maybe/default "partner" << dict/get "name"
```

```{.language-bash}
$ scrap platform connie2036/server < my-server.ss
```

The platform SDK is not finished yet, but we aim to make effortless building
materials in languages like Rust and Go.

Stay tuned!

## flat scraps

Use `scrap flat` to make a minimized version of the scrap:

```{.language-bash}
$ echo '3 * 5' | scrap eval | scrap flat | hexdump -C
```

```{.language-haskell .result}
0F
```

Flat scraps are compressed into a compact byte format like
[msgpack](https://msgpack.org).

More details coming soon!

## sending scraps

Send flat scraps via HTTP using the `application/scrap` MIME type:

```{.language-bash}
$ brew install httpie
$ echo '"hello"' \
  | scrap eval \
  | scrap flat \
  | http -b POST connie2036.com/echo \
      Content-Type: application/scrap \
      Accept: application/scrapscript
```

```{.language-bash .result}
"hello"
```

If you're using a platform that supports it (e.g. `remote`), you can also use do
this:

```{.language-bash}
$ echo '"hello"' \
  | scrap platform remote apply '@connie2036/echo'
```

```{.language-haskell .result}
(result text remote/error)::ok "hello"
```

If a platform doesn't know what to do with the remote type, it'll just treat it
like any other type:

```{.language-bash}
$ echo '"hello"' | scrap eval apply '@connie2036/echo'
```

```{.language-haskell .result}
@connie2036/echo "hello"
```

In the following example, `connie2036/echo` defines a contract between the
systems. Note that the server expects `text` as its request and response types.
If the server sends a different response type than expected, the scrapscript
runtime will fail gracefully on your behalf.

```{.language-bash}
connie2036/echo
```

```{.language-bash .result}
{ location = remote/http-post "https://connie2036.com/echo"
, request = scrap/type:text
, response = scrap/type:text
}
```

```{.language-bash}
$ echo '123567' | scrap platform remote apply '@connie2036/echo'
```

```{.language-bash .result}
remote type error
```

In these examples, `@connie2036/echo` is syntactic sugar for building
`(remote text text):remote`.

```{.language-bash}
$ echo 'remote/fetch ((remote text text)::remote connie2036/echo "goodbye")' | scrap platform remote
```

```{.language-haskell .result}
(result text remote/error)::ok "goodbye"
```

## scrap passes

Scrap maps are public real-estate. Without authentication, bad actors could
wreak all kinds of havoc in our precious namespaces.

To claim a chunk of the namespace, submit a claim to the map maintainers.

```{.language-bash}
$ scrap map claim connie2036 connie.fun@yahoo.com \
  | scrap pass sign ~/.ssh/id_rsa \
  | scrap map push https://map.scrap.land
```

If your claim is accepted, you'll be able to push arbitrary scraps to your
namespace in the map.

```{.language-bash}
$ echo '() -> "hello"' \
  | scrap flat  \
  | scrap map commit connie2036/greet \
  | scrap pass sign ~/.ssh/id_rsa \
  | scrap map push https://map.scrap.land
```

Because all the scraps are cryptographically signed, anybody can verify
authorship even if the scrap map database is somehow compromised.

To prevent squatting and mooching, map maintainers will likely require payment for "premium" namespaces and/or storing large amounts of data.

## scrapbooks

```{.language-bash}
$ scrap book init /var/my-scrapbook
```

Scrapbooks store and sync scraps. Use them to manage personal snippets and collaborate.

Coming from `git`, you can treat a scrapbook as a living development branch.

As a bonus, scrapbooks hook into text editors to provide a live "Google Docs" experience for teams.

## smel shell

You may have noticed lots of Bash in this guide. Well, Bash is crusty, and a
scrapscript-based shell called "smel shell" is in the early design phases.

Stay tuned!

## scrawl

Scrapscript was designed from the ground-up to have a smalltalk/hypercard-like editor/browser experience. There's a huge opportunity to change your text-editing tools based on platform (e.g. "Arduino mode", "parser mode", "VR-dev mode").
