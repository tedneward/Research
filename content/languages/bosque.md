title=Bosque
tags=language, research, nodejs
summary=A language rethinking intermediate representation/bytecode to be more tool-friendly.
~~~~~~
"The Bosque Programming Language project is a ground up language & tooling co-design effort focused on is investigating the theoretical and the practical implications of:

* Explicitly designing a code intermediate representation language (or bytecode) that enables deep automated code reasoning and the deployment of next-generation development tools, compilers, and runtime systems.
* Leveraging the power of the intermediate representation to provide a programming language that is both easily accessible to modern developers and that provides a rich set of useful language features for developing high reliability & high performance applications.
* Taking a cloud-development first perspective on programming to address emerging challenges as we move into a distributed cloud development model based around microservices, serverless, and RESTful architectures.

"In the Bosque project we ask the question of what happens if the IR is designed explicitly to support the rich needs of automated code reasoning, IDE tooling, etc. With this novel IR first perspective we are exploring a new way to think about and build a language intermediate representation and tools that utilize it. Our initial experiments show that this empowers a range of next-generation experiences including symbolic-testing, enhanced fuzzing, soft-realtime compilation with stable GC support, API auto-marshaling, and more!

"The Bosque Programming Language builds on the strengths of classical Functional Programming,  modern TypeScript/Node.js, and the power of the new IR. The result is a language that simultaneously supports the kind of high productivity development experience available to modern developers while also providing a resource efficient and predictable runtime, scaling from small IoT up to heavily loaded cloud services. In addition to bringing all the expressive power expected from a modern language, the Bosque language also introduces several novel features like Typed Strings and API Types, that directly address challenges faced by developers working in a distributed cloud based world."

Bosque is an open-source project focused on developing a new Programming Language and Development Tooling Stack. The foundation of this project is the view that mechanization and automated reasoning, along with human and AI agents that leverage them, are the ideas that will define the next era of software development. The foundation of the Bosque language and stack is a carefully constructed core calculus and computation model that are uniquely amenable to automated reasoning. Building on top of this core calculus the Bosque language, as seen by a developer, is a hybrid of functional programming design, ergonomic block & assignment-based syntax, and a number of new features designed to simplify and support writing high reliability code.

Bosque started out as a MSR project, then graduated to a public GitHub repository under its own name.

[Website](https://www.microsoft.com/en-us/research/project/bosque-programming-language/) | [Source](https://github.com/BosqueLanguage/BosqueCore) | [Original Github](https://github.com/Microsoft/BosqueLanguage)

#### Publications
[Regularized Programming with the Bosque Language](https://www.microsoft.com/en-us/research/uploads/prod/2019/04/beyond_structured_report_v2.pdf): "The rise of Structured Programming and Abstract Data Types in the 1970’s represented a major shift in programming languages. These methodologies represented a move away from a programming model that reflected incidental features of the underlying hardware architecture and toward a model that emphasized programmer intent more directly. This shift simultaneously made it easier and less error prone for a developer to convert their mental model of a system into code and led to a golden age of compiler and IDE tooling development. This paper takes another step on this path by further lifting the model for iterative processing away from low-level loop actions, enriching the language with algebraic data transformation operators, and further simplifying the problem of reasoning about program behavior by removing incidental ties to a particular computational substrate and indeterminate behaviors. We believe that, just as structured programming did years ago, this regularized programming model will lead to massively improved developer productivity, increased software quality, and enable a second golden age of developments in compilers and developer tooling."

------
*(From the project's README, as of 5 June 2021)*

## The Bosque Project
The Bosque Programming Language project is a ground up language & tooling co-design effort focused on investigating the theoretical and the practical implications of:

1. Explicitly designing a code intermediate representation language (bytecode) that enables deep automated code reasoning and the deployment of next-generation development tools, compilers, and runtime systems.
2. Leveraging the power of the intermediate representation to provide a programming language that is both easily accessible to modern developers and that provides a rich set of useful language features for developing high reliability & high performance applications.
3. Taking a cloud-development first perspective on programming to address emerging challenges as we move into a distributed cloud development model based around microservices, serverless, and RESTful architectures.

### The Role of Intermediate Representations

Compiler intermediate representations (IRs) are traditionally thought of, and designed with, a specific source language (or languages) in mind. Their historical use has primarily been as an intermediate step in the process of lowering a source language program, with all of the associated syntactic sugar, into a final executable binary. However, over time they have become increasingly important in supporting program analysis and IDE tooling tasks. In these scenarios choices which did not matter in the context of the compilation workflow can have major negative impacts.

In the Bosque project we ask the question of what happens if the IR is designed explicitly to support the rich needs of automated code reasoning, IDE tooling, etc. With this novel IR first perspective we are exploring a new way to think about and build a language intermediate representation and tools that utilize it. Our initial experiments show that this empowers a range of next-generation experiences including symbolic-testing, enhanced fuzzing, soft-realtime compilation with stable GC support, API auto-marshaling, and more!

### Regularized Programming

Many features that make the Bosque IR amenable for automated reasoning involve simplifying and removing sources of irregularity in the semantics. These regularizations also simplify the task of understanding and writing code for the human developer. Inspired by this idea the Bosque project is building a new regularized programming language that takes advantage of the features of the IR.

The Bosque Programming Language builds on the strengths of classical Functional Programming,  modern TypeScript/Node.js, and the power of the new IR. The result is a language that simultaneously supports the kind of high productivity development experience available to modern developers while also providing a resource efficient and predictable runtime, scaling from small IoT up to heavily loaded cloud services. In addition to bringing all the expressive power expected from a modern language, the Bosque language also introduces several novel features like Typed Strings and API Types, that directly address challenges faced by developers working in a distributed cloud based world.

### Cloud First Development
The move into cloud based development, with architectures based around microservices, serverless functions, and RESTful APIs, brings new challenges for development. In this environment an program may interoperate with many other (remote) services which are maintained by different teams (and maybe implemented in different languages). This forces APIs to use least-common denominator types for interop and creates the need for extensive serialize/deserialize/validate logic. Further, issues like cold-service startups, 95% response times, resiliency and diagnostics, all become critical but have not been design considerations in most traditional languages.

The Bosque project takes a cloud and IoT first view of programming languages. Thus, it includes features like API Types to simplify the construction and deployment of REST style APIs. Application initialization design provides 0-cost loading for lighting fast (cold) startup. Choices like fully determinized language semantics, keys and ordering, and memory behavior result in a runtime with minimal performance variability and enable ultra-low overhead tracing.

### Powering the Future of Programming
An overarching theme of the Bosque project is increasing the ability of automated tools to reason about and transform code. This mechanization is a foundational part of unlocking the future of using AI and Synthesis in the development pipeline. The ability to mechanically reason about the semantics of a program via symbolic means is a key enabler to synthesizing novel and useful code components using examples or conditions. Bosque’s fully determinized and loop free design can also help facilitate the development and application of automated program differentiation. These are open problems but, just as we saw how Bosque unlocks value in classical tooling/compilation scenarios, we are excited to see what it can do to power the AI and Synthesis programming revolution.

## Documentation

Small samples of code and unique Bosque tooling are below in the [Code Snippets](#Code-Snippets) and [Tooling](#Tooling) sections. A rundown of notable and/or unique features in the Bosque language is provided in the [language overview section 0](docs/language/overview.md#0-Highlight-Features).
For a look at how the language works and flows _in the large_ please see the code for a [simple tic-tac-toe](impl/src/test/apps/tictactoe/main.bsq) program.

Detailed Documentation, Tutorials, and Technical Information:
* [Language Docs](docs/language/overview.md)
* [Library Docs](docs/libraries/overview.md)
* Tutorials - _Coming Eventually!_
* [Technical Papers](docs/papers/publist.md)
* [Contribution guidelines](CONTRIBUTING.md)

## Code Snippets

**Add 2 numbers:**

```none
function add2(x: Int, y: Int): Int {
    return x + y;
}

add2(2, 3)     //5
add2(x=2, y=3) //5
add2(y=2, 5)   //7
```

**All positive check using rest parameters and lambda:**

```none
function allPositive(...args: List<Int>): Bool {
    return args.allOf(fn(x) => x >= 0);
}

allPositive(1, 3, 4) //true
```

**Tuples and Records:**

```none
function doit(tup: [Int, Bool], rec: {f: String, g: Int}): Int {
    return tup.0 + rec.g;
}

doit([1, false], {f="ok", g=3}) //4
```

**Sign (with optional argument):**

```none
function sign(x?: Int): Int {
    var y: Int;

    if(x == none || x == 0) {
        y = 0;
    }
    else {
        y = (x > 0) ? 1 : -1;
    }

    return y;
}

sign(5)    //1
sign(-5)   //-1
sign()     //0
```

**Nominal Types Data Invariants:**
```
concept WithName {
    invariant $name != "";

    field name: String;
}

concept Greeting {
    abstract method sayHello(): String;

    virtual method sayGoodbye(): String {
        return "goodbye";
    }
}

entity GenericGreeting provides Greeting {
    const instance: GenericGreeting = GenericGreeting@{};

    override method sayHello(): String {
        return "hello world";
    }
}

entity NamedGreeting provides WithName, Greeting {
    override method sayHello(): String {
        return String::concat("hello", " ", this.name);
    }
}

GenericGreeting@{}.sayHello()         //"hello world"
GenericGreeting::instance.sayHello()  //"hello world"

NamedGreeting@{}.sayHello()           //type error no value provided for "name" field
NamedGreeting@{name=""}.sayHello()    //invariant error
NamedGreeting@{name="bob"}.sayHello() //"hello bob"
```

**Validated and Typed Strings:**
```
typedef Letter = /\w/;
typedef Digit = /\d/;

function fss(s1: SafeString<Digit>): Bool {
    return s1.string() == "3";
}

Digit::accepts("a"); //false
Digit::accepts("2"); //true

fss("1234")                         //type error String is not a SafeString
fss(SafeString<Letter>::from("a"))  //type error incompatible SafeString types
fss(Digit'a')                       //type error 'a' is incompatible with Digit 
fss(SafeString<Digit>::from("a"))   //runtime error 'a' is incompatible with Digit
fss(SafeString<Digit>::from("3"))   //true
```

```
entity StatusCode provides Parsable {
    field code: Int;
    field name: String;

    override static tryParse(name: String): Result<StatusCode, String> {
        return switch(name) {
            case "IO"      => ok(StatusCode@{1, name})
            case "Network" => ok(StatusCode@{2, name})
            case _         => err("Unknown code")
        };
    }
}

function isIOCode(s: StringOf<StatusCode>): Bool {
    return s == StatusCode'IO';
}

isIOCode("IO");                               //type error not a StringOf<StatusCode>
isIOCode(StatusCode'Input')                   //type error not a valid StatusCode string
isIOCode(StringOf<StatusCode>::from("Input")) //runtime error not a valid StatusCode string

isIOCode(StatusCode'Assert')               //false
isIOCode(StringOf<StatusCode>::from("IO")) //true

let ec: StatusCode = StatusCode@'IO';
assert(ec.code == 1); //true
```

**Structural, Nominal, and Union Types (plus optional arguments)**
```
entity Person {
    field name: String; 
}

function foo(arg?: {f: Int, n?: String} | String | Person): String {
    if(arg == none) {
        return "Blank";
    }
    else {
        return switch(arg) {
            type Record => arg.n ?| "Blank"
            type String => arg
            type Person => arg.name
        };
    }
}

foo()                    //"Blank"
foo(none)                //Type error - none not allowed
foo("Bob")               //Bob
foo(Person@{name="Bob"}) //Bob
foo({f=5})               //"Blank"

foo({f=1, n="Bob"})      //"Bob"
foo({g=1, n="Bob"})      //Type error - Missing f property
```

**Pre/Post Conditions**
```
entity Animal {
    invariant $says != "";

    field says: String;
}

function createAnimal(catchPhrase: String): Animal
{
    return Animal@{says=catchPhrase};
}

function createAnimalPre(catchPhrase: String): Animal
    requires catchPhrase != "";
{
    return Animal@{says=catchPhrase};
}

function createAnimalPreSafe(catchPhrase: String): Animal
    requires release catchPhrase != "";
{
    return Animal@{says=catchPhrase};
}

typedef ErrData = {msg: String, data?: Any};

entrypoint function getSays(animal: String, catchPhrase: String): Result<String, ErrData?>
    validate animal != "" or return err({ msg="Invalid animal" });
    validate catchPhrase != "" or return err({ msg="Invalid catchPhrase" });
{
    return ok(String::concat("The ", animal, " says ", createAnimal(catchPhrase).says));
}

createAnimal("woof woof") //ok always
createAnimal("")          //fails invariant in debug
createAnimalPre("")       //fails precondition in debug *but not* release
createAnimalPreSafe("")   //fails precondition in all build flavors

getSays("dog", "woof") //Ok<String, ErrData>@{value="The dog says woof"}
getSays("", "woof") //Err<String, ErrData>@{error={ msg="Invalid animal" }}
getSays("dog", "") //Err<String, ErrData>@{error={ msg="Invalid catchPhrase" }}
```

**API Types**

[TODO]

## Tooling

**Symbolic Testing**

Bosque provides a powerful new way to test your applications. Unit-testing is a great way to ensure that code works as expected and to prevent accidental changes to behavior when adding new features or fixing bugs. However, writing and maintaining large numbers of tests can be a tedious and time consuming task. To help with this Bosque provides a *symbolic testing* harness that augments unit-testing and provides high coverage for bugs that result in runtime failures -- arising either as builtin language errors or from failed user provided pre/post/invariant/assert conditions.

The **symtest** tool implements the symbolic testing algorithm and works as follows. Given the application shown below:
```
namespace NSMain;

global ops: Set<String> = Set<String>@{
    "negate",
    "add",
    "sub"
};

function checkIntBounds(arg: Int?): Bool {
    //our calculator is for small numbers -- maybe use BigInt later
    return arg == none || ((-100 <= arg) && (arg <= 100)); 
}

entrypoint function processOp(op: String, arg1: Int, arg2: Int?): Int 
    requires release NSMain::ops.has(op);
    requires release checkIntBounds(arg1) && checkIntBounds(arg2);
    //requires release (op == "add" || op == "sub") ==> arg2 != none;
{
    if(op == "negate") {
        return -arg1;
    }
    else {
        assert(arg2 != none);

        if(op == "add") {
            return arg1 + arg2;
        }
        else {
            return arg1 - arg2;
        }
    }
}
```

Assuming this code is in a file called `process_op.bsq` then we can run the following command to check for errors:
```
> node bin\runtimes\symtest\symtest.js process_op.bsq
```
Which will report that an error is possible.

Re-running the symbolic tested with model generation on as follows:
```
> node bin\runtimes\symtest\symtest.js -m division.bsq
```
Will report that an error is possible when `op == "negate"` and `arg2 == none`. Note that the tester was aware of the precondition `requires _ops.has(op)` and so did not generate any *spurious* failing test inputs (such as `op=""`).

Un-commenting the second requires line tells the tester that this, and similar errors are excluded by the API definition, and re-running the tester will now report that the code has been verified up to the bound.

Note: we recommend specifying preconditions as always checked, `requires release`, on entrypoint functions to ensure that these externally exposed API endpdoints are not misused.

More details on this symbolic checker can be found in the [readme](./impl/src/runtimes/symtest/README.md).

**Ahead-of-Time Compilation**

To provide the best performance Bosque supports the generation of standalone command-line executables via the `ExeGen` tool. This tool, and the design of the Bosque runtime, are designed to provide:

1. Fast cold start response time by precompiling startup logic directly into constant values whenever possible and minimizing the number of operations required to start handling user input.
2. Stable execution behavior over time and possible inputs. 
    - The GC is a novel reference counting with eager free implementation to minimize memory footprint and prevent any indeterminate GC jitter. 
    - The runtime itself uses sorted container implementations for Sets/Maps so that the variance between average and worst case costs of operations is minimized and to protect against pathological behaviors (like extreme hash-code collisions).
3. Safe recursion is available with the [TODO] flag. This compiles recursive functions into a CPS form that uses constant stack space, eliminating any possible Out-of-Stack issues, and allows us to preserve the full call-stack in all debug builds. 

A simple example use is to create a file called "max.bsq" with the following code:
```
namespace NSMain;

entrypoint function main(x: Int, y: Int): Int {
    return (x > y) ? x : y;
}
```
Then run the following command to produce the `max.exe` (on Windows executable) which can then be invoked with:
```
> node impl\bin\runtimes\exegen\exegen.js -o max.exe max.bsq
```
Which will create an executable named `max.exe` in the current directory.

Running this executable:
```
> max.exe 1 5
```
Will output `5`.

More details on the `exeGen` tool can be found in the [readme](./impl/src/runtimes/exegen/README.md).
