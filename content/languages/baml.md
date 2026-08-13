title=BAML
tags=language, ai, typesafe, agent
summary=Basically A Made-up Language, for agent use.
~~~~~~

[Website](https://boundaryml.com/) | [Source](https://github.com/boundaryml/baml) | [Demos](https://github.com/boundaryml/baml-demos)

## Getting Started

macOS:
```
brew install baml
baml init
baml agent install
baml run main
baml ide install --code
```
## Part 1

### A better language[](https://boundaryml.com/explore#language)

BAML aims to be an agent-friendly language. In this overview, we'll start with the [syntax and type system decisions](https://boundaryml.com/explore#types) we made. Then explore the [agent-first cli tooling](https://boundaryml.com/explore#agent-tools).

As much as we want agents to write code, human trust is still a vital part of a healthy software system. The third section focuses on [tooling for humans](https://boundaryml.com/explore#human-tools), and the fourth shares how we made [BAML incrementally adoptable](https://boundaryml.com/explore#adoption), so you won't need to re-write your whole codebase in BAML.

And lastly, not only has the way we write code changed, but also the _kind_ of code we write as well. More and more code is agentic loops, created by LLMs on the fly, and probabilistic. We added a few syntax constructs to help [rein in the non-determinism](https://boundaryml.com/explore#agents).

## 1A type-system like TypeScript, but without type erasure[](https://boundaryml.com/explore#types)

BAML has a type system like TypeScript, but persists it at runtime. TypeScript [explicitly chose not to be sound](https://github.com/Microsoft/TypeScript/wiki/TypeScript-Design-Goals#non-goals), trading it away for productivity. That was the right move for humans, but it's the wrong default when agents are writing the code. It's not a coincidence there are 5 different schema validation libraries for TS: the type system doesn't mean enough.

BAML has no `any`, types are what the code says at runtime, and it includes advanced features like unions, generics, recursive types, and interfaces on day one.

```
class User {
  name: string,
  email: string,
}

function load(raw: unknown) -> string {
  if (raw is User) {
    return raw.email.to_lower_case();
  } else {
    // this fails!
    // there is no `as`, no `any`
    // `raw` must be proven to a `User`
    raw.email.to_lower_case();

    throw "failed!";
  }
}
```

### Match on types, or values [BEP-015↗](https://beps.boundaryml.com/beps/15)

Any of 'em work. No need for `instanceof` or `has` everywhere:

match.baml
```
function route(msg: Refund | Question | string) -> string {
  match (msg) {
    Refund => \`refund ${msg.id}\`,
    // with destructuring!
    Question { text } => \`answer: ${text}\`,
    string => \`text: ${msg}\`,
  }
}

// ...or match on VALUES, with guards
function grade(n: int) -> string {
  match (n) {
    100 => "perfect",
    let s if s >= 60 => "pass",
    _ => "fail",
  }

}

class Refund { id: string }
class Question { text: string }
```

## Error handling (it reads like match) [BEP-002↗](https://beps.boundaryml.com/beps/02)

TypeScript exceptions have no types, so catching the right one means ugly code. BAML reads every `throws` statement and tells you every single error a function can throw. Hover `fetch_page` below to see its full inferred error set. That live warning is the compiler proving the `ParseError` arm can never fire.

fetch.baml
```
function show(ok: bool) -> string {
  fetch\_page(ok: ok) catch (e) {
    NetError => "recovered: " + e.detail,
    ParseError => "unreachable",    
  }
}

// -- the rest is plumbing --
function fetch_page(ok: bool) -> string {
  if (!ok) { throw NetError { detail: "timeout" } };
  "<html>"
}

class NetError { detail: string }
class ParseError { detail: string }
```

### Green threads a.k.a 'async without async' [BEP-034↗](https://beps.boundaryml.com/beps/34)

Doing work in parallel is important. But we always hated having an `async` and non-async version of our code. We chose Go's approach to concurrency, but with a typescript feel.

BAML supports lightweight green threads via `spawn` and `await`. Run any function asynchronously without having to write `async function` in 10 other files everywhere. Easy to parallelize slow LLM http requests and tool calls.

spawn.baml
```
// Nothing marks this function async. spawn runs any
// call in parallel; await joins the result.
function main() -> int {
  let a: Future<int, null> = spawn { work(i: 1) };
  let b: Future<int, null> = spawn { work(i: 2) };
  let c: Future<int, null> = spawn { work(i: 3) };
  (await a) + (await b) + (await c)
}

// stands in for any slow task (LLM call, IO, ...)
function work(i: int) \-> int {
  i * i
}

test "spawn and await" {
  assert.equal(actual: main(), expected: 14);
}
```

BAML describe can help agents figure out which functions might run asynchronously, by inspecting the code.

## Tools for agents

BAML ships with various tools to make agents find, test and distribute code more easily.

### ls — the filesystem is the namespace structure[BEP-008↗](https://beps.boundaryml.com/beps/08)[](https://boundaryml.com/explore#namespaces)

AI agents spend too much time searching for things in large projects. In BAML the project structure is self-describing: an agent can `ls` a BAML project and know how it's laid out, because namespaces are just directories with a `ns_` prefix. There are no imports, since everything is referred to by its fully qualified name, like Go. Inside a namespace directory, all types, functions and objects are available in every file by default.

the filesystem is the mapreplay ↻

$ ls baml\_src/

ns\_catalog  ns\_orders

$ ls baml\_src/ns\_catalog/

product.baml

\# the layout of baml\_src/ is the layout

\# of the program. ls is a map of it.

ns\_orders/order.baml

```
1// baml_src/ns_orders/order.baml — referencing another namespace, unqualified2function line_item() -> Product {unresolved type: Product. Did you mean `root.catalog.Product`?3  Product { name: "Keyboard" }4}
```

ns\_orders/order.baml

```
1// there's a single fully qualified name, every time2function line_item() -> root.catalog.Product {3  root.catalog.Product { name: "Keyboard" }4}
```

This is also why constructing a Class in BAML requires always adding the name of the class — `MyClass { }`. There are no anonymous records.

## baml describe — a built-in AST-based grep, to find things faster

`describe` is easier for agents to use than an LSP, and more informative than grep. Agents writing BAML code don't need to search through 10 files to figure out how things work. Here's a transcript of an agent searching with grep, versus with baml describe:

agent with grep

agent without describereplay ↻

$ grep -rn "greet" baml\_src/

main.baml:5:function greet(name: string) -> Greeting {

main.baml:10:    greet("world").message

main.baml:14:    test "greets\_world" {

main.baml:18:        assert.equal(greet("bob").message, …

$ cat baml\_src/main.baml

class Greeting {

    message: string,

… 19 more lines read into context …

$ grep -rn "Greeting" baml\_src/

main.baml:1:class Greeting {

main.baml:5:function greet(name: string) -> Greeting {

main.baml:6:    Greeting { message: "hi, " + name }

\# 3 tool calls, a whole file in context — and the

\# caller list is still just text matches

agent with describe

agent with describereplay ↻

$ baml describe greet

function greet  baml\_src/main.baml:5-7

function greet(name: string) -> Greeting {

    Greeting { message: "hi, " + name }

}

dependencies:

  class  Greeting  baml\_src/main.baml:1

references (2):

  baml\_src/main.baml:10  greet("world").message

  baml\_src/main.baml:18  assert.equal(greet("bob")…

✓ baml describe gives you signature, deps, every reference

The reference list is the part grep can't give you: every call site, resolved — handy for spotting near-duplicates before writing a second copy of a function. We'll keep making improvements to this tool.

## 3baml run <function>[BEP-027↗](https://beps.boundaryml.com/beps/27)[](https://boundaryml.com/explore#run-fn)

BAML makes it easy for agents to run any function in your project as if it were a CLI command. Function parameters get parsed automatically and can be set with CLI flags.

baml run <function>replay ↻

$ baml run main

   Compiling 1 file(s)

    Compiled 1 file(s) in 1s

"hi, world"

$ baml run greet -- --name "hacker news"

Greeting { message: "hi, hacker news" }

$ baml run greet -- --help

function greet(name: string) -> Greeting

Options:

      --name <string>

\# any function is a target; its params become --flags

## 4baml run -e — run small baml programs inline[](https://boundaryml.com/explore#run-e)

Run small baml programs inline, without having to write to a file. Small simple feature, but great for agents writing/testing small baml scripts.

baml run -ereplay ↻

$ baml run -e '"a,b,c".split(",")'

   Compiling expression

     Running expression

\["a", "b", "c"\]

$ baml run -e '{ let t = 0; for (let i = 0; i < 5; i += 1) { t += i \* i; }; t }'

30

    Finished expression in 0s

\# no file, no project — paste, run, observe

## 5baml pack — ship a function as a tiny binary[](https://boundaryml.com/explore#pack)

BAML pack is a CLI that takes your baml program and auto-creates a CLI for you from the function signature. It can compile and run on any target architecture. Useful for agents creating shareable mini programs.

baml packreplay ↻

$ baml pack -f greet -f main -o greet-bin

   Packaging greet,main

    Finished greet-bin \[greet,main, aarch64-apple-darwin\] in 0s

$ ls -lah greet-bin

7.9M greet-bin

$ ./greet-bin greet --name "hacker news"

{"message":"hi, hacker news"}

$ ./greet-bin --help

Usage: greet-bin <COMMAND>

Commands:

  greet  function greet(name: string) -> Greeting

  main   function main() -> string

show the source — main.baml

main.baml

```
1function greet(name: string) -> Greeting {←name: string → --name <flag>2  Greeting { message: "hi, " + name }3}4​5function main() -> string {6  greet("world").message7}8​9class Greeting {10  message: string,11}
```

### The packed binary is 81% smaller than Bun's

Here's a comparison of BAML vs Bun in creating a compiled binary. The binary size is just 12.1 MB:

binary size

baml pack![](https://boundaryml.com/_next/image?url=%2Fbaml-sheep.png&w=64&q=75)12.1 MB _· 5.7 MB gzipped_

bun build --compile63.1 MB _· 23.5 MB gzipped_

Bun 1.3.14, BAML release toolchain, aarch64-apple-darwin. Bun embeds a whole JavaScript engine; the BAML runtime is 12.1 MB.

Part 3

## Tools for humans[](https://boundaryml.com/explore#human-tools)

We also built tools to keep humans in the loop. Even if most code isn't being read, these tools can help humans dive deep and iterate quickly when they need to.

## 1BAML Workflow View — navigate and understand your code[](https://boundaryml.com/explore#nav-viz)

Here's a fuller BAML project: an LLM “Heads Up” guessing game with an agent loop, a non-LLM binary search, classes, and a couple of testsets. The graph view is the visual counterpart to `baml describe`: a map you can click through instead of grepping. Open the graph tab and jump around.

game.baml

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

28

29

30

31

32

33

34

35

36

37

// Interactive demo: uses baml.io.input — run from the playground, not headless CI.

function GuessGameAgent() \-> GuessResponse {

    // comments

    let history: Message\[\] = \[\];

    //# set up system

    let famous\_person\_name = generate\_famous\_person\_name(\[\]);

    let user\_input = "Is it Marie Curie?";

    let guess\_response = take\_guess("", famous\_person\_name, history);

    //# update history

    history.push(Message { role: "user", content: user\_input });

    history.push(Message { role: "assistant", content: guess\_response.text });

    let max\_guesses = 10;

    while (!guess\_response.game\_won && max\_guesses \> 0) {

        if (guess\_response.game\_won) {

            break;

        } else {

            //# Bad Guess

            user\_input = simulate\_human\_guess(history);

            //# take guess

            guess\_response = take\_guess(user\_input, famous\_person\_name, history);

            log.info({ "user\_input": user\_input, "guess\_response": guess\_response.

            text });

            history.push(Message { role: "user", content: user\_input });

            history.push(Message { role: "assistant", content: guess\_response.

            text });

            max\_guesses = max\_guesses - 1;

        }

    }

    if (guess\_response.game\_won) {

        log.info({ "game\_won": true });

    } else {

        log.info({ "game\_won": false });

    }

1782845295

GuessGameAgent()

RunGraphTraceFlame

GuessGameAgent

set up system

LLMgenerate\_famous\_person\_name(\[\])

openai-responses/gpt-5.5

LLMtake\_guess("", famous\_person\_name, history)

openai-responses/gpt-5.5

update history

while (!guess\_response.game\_won && max\_guesses > 0)

+6

if (guess\_response.game\_won)

if (guess\_response.game\_won)

else

Press enter or space to select a node. You can then use the arrow keys to move the node around. Press delete to remove it and escape to cancel.

Press enter or space to select an edge. You can then press delete to remove it or escape to cancel.

↔

↵Wrap

ExpandZoomClickAll

## 2BAML Profiler[](https://boundaryml.com/explore#observability)

We also shipped a profiler to help you visualize flame graphs and see what's causing potential slowness. Agents can use this tool too, but humans can also visualize and dive into the nitty-gritty details.

![BAML playground Flame tab — a flame graph of a run with a per-function self-time table on the left.](https://boundaryml.com/_next/image?url=%2Fflamegraph-flame-view.png&w=3840&q=75)

Part 4

## Adopting BAML[](https://boundaryml.com/explore#usable)

Although we are still pre-1.0, BAML is ready to use today. Here's how we make it easier to use and trust in production.

## 1Drops into your existing stack[BEP-030↗](https://beps.boundaryml.com/beps/30)[](https://boundaryml.com/explore#adoption)

When we first made BAML 2 years ago we decided it had to be callable from other languages, with an amazing developer experience.

BAML can generate SDKs for your favorite language, and call your functions using these type-safe interfaces, even if they include generics or class methods. Think of an OpenAPI client generator, except the contract carries real business logic, not just data shapes. (For more details, check out our [talk at rust conf](https://www.youtube.com/watch?v=ve33hCLHbcg).)

baml\_src/functions, types, tests

→

baml generateone command

→

baml\_sdk/typed client + runtime inside

→

your appfrom baml\_sdk import b

The types come out native — a pydantic model in Python, a typed class in TypeScript — with your functions, methods, and generics intact. Pick a feature and a language to see the same BAML file generate each SDK:

FunctionsClasses / methodsGenerics

PythonTypeScriptGoin progressRustin progress

the baml file

resume.baml

```
1class Resume {2  name: string,3  email: string?,4}5​6function extract_resume(text: string) -> Resume {7  client: "openai/gpt-4o-mini"8  prompt: `Extract the resume. ${ctx.output_format}\n${text}`9}
```

generated sdk · python

baml\_sdk

```
1from baml_sdk import extract_resume, Resume2​3# typed call — or: await extract_resume_async(text=...)4resume: Resume = extract_resume(text="Jane Doe, jane@acme.com ...")5​6resume.name          # str7resume.email         # str | None8resume.model_dump()  # plain pydantic underneath
```

Every function generates a sync + async pair; Resume is a real pydantic v2 model.

## 2Recursive self-improvement[](https://boundaryml.com/explore#self-improvement)

To help keep BAML stable and improving over time, we're simulating thousands of agents writing BAML code to get feedback from agents themselves. We built [agent-tries-baml](https://boundaryml.com/atb) to recursively self-improve BAML and make it easier for agents to write. For example, we [test our BAML skill against agents](https://boundaryml.com/atb/arena) to figure out which set of instructions helps agents write BAML faster.

BAML is still < 1.0, but we're close to reaching full stability. Feel free to join our language experiments if you're curious about this process.

## 3No supply chain attacks[](https://boundaryml.com/explore#supply-chain)

Okay, to be fair, BAML doesn't _yet_ have a package manager. We're working on it! In the meantime, just make AI agents write all the code you need.

Part 5

## Building agents[](https://boundaryml.com/explore#agents)

Writing code is one thing, but in the future _every_ software program will interact with AI agents or non-deterministic AI code. Whilst BAML supports writing anything from a web-server to a data-processing library, our main focus is to provide primitives to help teams deal with nondeterminism. To do this we make sure BAML programs are observable, testable, and measurable.

one stochastic callReplay ↻

main()output can now vary

└─ load\_config()still deterministic

└─ run\_pipeline()output can now vary

└─ summarize()output can now vary

└─ llm.summarize\_chunk()⚡ same input → different output

**4 of 5 functions** can no longer be tested with `assert output == expected` — and nothing in the language marks them.

## 1Native LLM Functions — composable building blocks for agents and harnesses[](https://boundaryml.com/explore#llm-functions)

An LLM call in BAML is just a function: the prompt is the body, the return type is the schema. Because it's a real function, it can be evaluated, optimized, and tracked at runtime by observability platforms.

If you've used BAML in the last 2 years, you'll be happy to hear we still have our error-correcting JSON parser, which reliably coaxes structured output out of small language models.

BAML ships with tooling to observe LLM function inputs and outputs, like our workflow visualizer in VSCode. It's especially helpful when working with multimodal outputs, like images.

illustrate · LLM image pipelinesummarize · tally (runnable)analyze · parallel fan-out (runnable)

pipeline.baml

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

28

29

30

// the pipeline: generate an image, then have an LLM describe it

function illustrate() \-> string {

  let img = generate\_image("a purple lamb");

  describe(img)

}

function generate\_image(thing: string) \-> image {

  client: AiGatewayImagen

  prompt: \`

    Create an image from this prompt: ${thing}

    ${ctx.output\_format}

  \`

}

function describe(img: image) \-> string {

  client: "openai/gpt5.5"

  prompt: \`

    Describe this image in one vivid sentence.

    ${img}

    ${ctx.output\_format}

  \`

}

client AiGatewayImagen {

  provider: ai-gateway-images,

  options: {

    model: "google/imagen-4.0-fast-generate-001",

    api\_key: env.AI\_GATEWAY\_API\_KEY,

  }

}

1782845295

illustrate()

RunGraphTraceFlame

illustrate

LLMgenerate\_image("a purple lamb")

AiGatewayImagen

LLMdescribe(img)

openai/gpt5.5

Press enter or space to select a node. You can then use the arrow keys to move the node around. Press delete to remove it and escape to cancel.

Press enter or space to select an edge. You can then press delete to remove it or escape to cancel.

↔

↵Wrap

ExpandZoomClickAll

## 2Build harnesses, agents, or delegate to Claude Code[](https://boundaryml.com/explore#claude-code)

We're currently building our first-class standard library to build AI agents and harnesses, or call other kinds of agents (Claude Code). It will support anything from realtime voice agents to batched APIs. [Let us know](https://boundaryml.com/discord) if you're interested in an early preview!

## 3Write tests anywhere, or load them at runtime[BEP-023↗](https://beps.boundaryml.com/beps/23)[](https://boundaryml.com/explore#testing)

Write tests anywhere, in any file.

Create arbitrary groups and add tests dynamically — generate tests for each item in an array, create tests from a CSV file, or from S3:

from a CSV · run it herefrom S3, at collection time

csv\_tests.baml▶ Run

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

function classify(text: string) \-> string {

  let t: string  = text.to\_lower\_case();

  if (t.includes("love") || t.includes("great")) {

    "positive"

  } else {

    "negative"

  }

}

// testsets are code: loop over data and mint one

// test per row

testset "from a csv" {

  let rows: string\[\]  = "text,expect

loved it,positive

absolutely great,positive

worst purchase ever,negative".split("\\n");

  for (let row in rows.slice(1, rows.length())) {

    let cols: string\[\]  = row.split(",");

    test ("classify: " + cols\[0\]) {

      assert.equal(actual: classify(text: cols\[0\]), expected: cols\[1\]);

    }

  }

}

View tests in the Playground: in case a human needs to see things, we have nice utilities. Or just have agents run `baml test`.

Create evals — LLM-as-judge, statistical analysis, etc. In other frameworks that's a YAML schema and a hosted UI. In BAML, it's all just code. Pass a test when at least N% of runs do, using custom test runners:

evals.baml▶ Run

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

// the runner attaches with \`with\` -- this body runs

// 5 times per \`baml test\`, and 3 passes are enough

test "tolerates flaky runs" with quorum {

  assert.is\_true(condition: check\_inventory());

}

// stands in for a nondeterministic check (LLM call, ...)

function check\_inventory() \-> bool {

  true

}

// -- the runner ---------------------------------\---

// A custom test runner is just a function: it takes the

// base "run the test once" thunk and returns a new one.

// This one runs the body 5 times and passes on a quorum.

function quorum(base: testing.TestReportThunk) \-> testing.TestReportThunk {

  let run: testing.TestReportThunk = () -> testing.TestReport {

    let runs: testing.RunReport\[\] = \[\];

    let passed: int  = 0;

    for (let i: int  = 0; i < 5; i += 1) {

      let report: testing.TestReport  = run\_once(base: base);

      for (let r in report.runs) {

        runs.push(r);

Custom test runners go further: retries, uploading reports, running things in parallel or synchronously.

## 4eval(), but type-safe[](https://boundaryml.com/explore#eval)

Agents don't just call tools, they also write and run code. Twitter X calls it codemode.

In python, you would write `eval('print("hello world")')` to do codemode. But `eval` is unsafe and loses all type-safety and predictability.

BAML's reflection APIs give you eval, but with typed compiler errors. If the string has the wrong signature, you can get a runtime-compiler error that you can feed back to the agent so it can fix its code.

Coming soon: the reflection API below isn't available yet.

codemode.baml

```
1let raw = baml.reflect.new_package("my_package");2baml.package.set_file("virtual/path/to/file.baml", `3   function hello() -> string {4     "hello world"5   }6`)7let pkg = raw.build();8​9let cb = pkg.get<() -> string>("hello");10print(cb());11​12// and its typesafe!13let cb = pkg.get<() -> int>("hello") catch (e) {14    baml.reflect.CompilerTypeError => {15        print(`"hello" is not a function that returns int. ${e}`)16    }17};
```

## 5Sandboxing[BEP-058↗](https://beps.boundaryml.com/beps/58)[](https://boundaryml.com/explore#sandboxing)

Running code an agent just wrote is scary. We've started using machine sandboxing to isolate the code from the rest of the system, but what if we wanted to guarantee that the code doesn't make any network calls? We could just prompt it, but...

We can do a bit better. BAML supports mocking any function, whether it's in the standard library or in your own package. You can swap it out with another implementation, and it only works in a certain scope.

This doesn't replace the need for machine sandboxing. `mock` can't sandbox machine state (though vfs's are much simpler now). However, it does give you an option to not require machine sandboxing for every problem.

Coming soon: the mocking primitive below isn't available yet.

sandbox.baml

```
1// inside a mock scope, baml.http.fetch is whatever you say it is.2let net = baml.mock.new(baml.http.fetch);3net.replace((req: baml.http.Request) -> baml.http.Response {4  // lets ban fetch! so even if the llm uses it, we get an error5  throw baml.NotImplementedError { message: "fetch is disabled in this scope" };6});7​8let shell = baml.mock.new(baml.sys.shell);9shell.replace((command: string) -> baml.std.ShellOut {10  // lets ban shell! so even if the llm uses it, we get an error11  throw baml.NotImplementedError { message: "shell is disabled in this scope" };12});13​14​15baml.mock.scope([net, shell], () -> void {16  run_generated();   // every fetch/shell in here hits the stand-in17});18​19// out here, fetch and shell are the real thing again -- the scope undoes itself.
```

