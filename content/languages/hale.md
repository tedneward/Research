title=Hale
tags=language, distribution, cloud
summary=A concurrent systems language with a model-checked, GC-free runtime — typed message-bus concurrency, data-race-free by design.
~~~~~~

[Website](https://hale-lang.org/) | [Source](https://github.com/hale-lang/hale)

## Getting Started
Create a file `hello.hl`:

```
fn main() {    println("Hello from Hale.");}
```

Run it:

Terminal window

```
hale run hello.hl
```

```
Hello from Hale.
```

`hale run` compiles your program and runs it in one step — it’s the same native code `hale build` produces, just executed immediately and not left on disk. When you want the artifact to keep and ship, build it:

Terminal window

```
hale build hello.hl./hello
```

Same compiler, same output: `run` is the fast inner-loop shape, `build` is for the binary you deploy. There’s no separate interpreter, so anything that runs under `build` runs identically under `run`.

### What’s here

[Section titled “What’s here”](https://hale-lang.org/docs/getting-started/first-run/#whats-here)

-   **`fn main()`** is the entry point, the same as it is in C, Go, or Rust. A Hale program starts by calling it.
-   **`println(...)`** prints its arguments followed by a newline. It takes _any number_ of arguments and concatenates them — there’s no format string:
    
    ```
    fn main() {    let name = "Hale";    println("Hello from ", name, ".");}
    ```
    
-   **Statements end with `;`.** Newlines are just whitespace — they don’t end statements. Source is ASCII outside of string literals and comments.

Comments are C-style:

```
// a line comment/* a block comment */
```

That’s the whole surface you need to start. The next chapter introduces variables and the value types — the vocabulary every Hale program is built from.

> **`hale run` and imports.** A single file’s `import "..." as ...;` directives are resolved by `hale run` just as `hale build` resolves them. The one gap is the ad-hoc _directory_ form (`hale run ./dir`), which bundles the directory’s files without cross-seed import resolution — use `hale build ./dir` for a multi-file project that imports libraries.

### Build modes, diagnostics, and debugging

[Section titled “Build modes, diagnostics, and debugging”](https://hale-lang.org/docs/getting-started/first-run/#build-modes-diagnostics-and-debugging)

A few switches worth knowing from day one:

-   **The rest of the loop:** `hale fmt` keeps your code canonical (zero config), `hale test` runs `*_test.hl`, `hale verify` is `check` with teeth (any advisory fails — what CI runs), and `hale doc` renders API references from `///` comments. Agent hosts without a shell get all of it via `hale mcp`.
-   **Faster iteration:** `hale build --dev` (or `HALE_DEV=1`) uses a lighter optimization pipeline — noticeably quicker builds while you’re in an edit-run loop. Release builds default to `-O3` tuned for your CPU.
-   **Where did the build time go?** `HALE_TIME=1 hale build app.hl` prints per-phase wall times.
-   **Editor & agent integration:** `hale lsp` is a stdio Language Server — point any LSP-speaking editor (or agent harness) at it and you get live diagnostics: type errors as errors, the advisory analyses (unbounded-alloc survey, hot-path lint, placement warnings) as warnings, re-checked whole-program on every keystroke because the check runs in ~10 ms. Hover shows signatures with their contracts (fallibility, `@hot`/`@budget` status, a topic’s routing key), completion covers `self.` members, the `std::` surface, and your seed’s symbols, go-to-definition and references work across the seed, and the custom requests `hale/busGraph`, `hale/placement`, and `hale/allocSummary` return the pub/sub topology, the thread/pool map, and the allocation survey’s leak sites. No configuration. Prefer plain JSON? `hale check app.hl --json` emits one object per diagnostic (file, line, col, severity, message) on stdout — a save-hook is all a minimal integration needs.
-   **Real debugging:** binaries carry full DWARF by default — `gdb ./app`, `break app.hl:42`, backtraces with real file:line, `info locals` / `print x` with typed values (Strings print their text), and ASAN reports that point at the exact source line. Zero runtime cost; opt out with `LOTUS_NO_DEBUGINFO=1`.

## A chat room, in Hale

```
type Msg { room: String; user: String; text: String; }

topic Posted    { payload: Msg; keyed_by room; }   // routed by room name
topic Broadcast { payload: Msg; }

locus Room {
    params { name: String = "lobby"; }
    bus {
        subscribe Posted as on_post where key == self.name;
        publish   Broadcast;               // fan it out to everyone here
    }

    fn on_post(m: Msg) {
        Broadcast <- m;                    //  <-  sends on the bus
    }
}
```

Every phrase from the description has a home, in the order you thought it:

-   _"a chat room"_ → `locus Room`
-   _"each message posted to it"_ → `subscribe Posted as on_post`
-   _"in the room"_ (only this room's traffic) → `keyed_by room` + `where key == self.name` — the bus itself is the routing table, so a message for `"lobby"` is delivered only to the lobby `Room`, and the handler body never filters
-   _"relays it out to everyone"_ → `publish Broadcast` / `Broadcast <- m`, and the bus fans it out to every subscriber

No connection registry, no member list to lock, no broadcast loop, no `async`/`await`, no lifecycle wiring — and no dispatch code either: with ten rooms, a posted message costs one delivery, not ten filtered ones. You wrote down the idea; the idea is the program. (Rooms here are wired at startup; a lobby that mints brand-new rooms at runtime still declares them — dynamic subject creation is on the roadmap.)

## A more serious example - Build a job queue

In about thirty minutes, you’ll build a small **job queue** and watch it descend the four altitudes — from a throwaway script to a service split across processes — changing almost nothing but `main` at the very end. The first three stages run in the browser at the [playground](https://play.hale-lang.org/) (no install); to follow along locally, drop each program in a `.hl` file and `hale run` it.

We’ll keep the “work” trivial — squaring a number stands in for whatever a real job does — so the shape of the program stays in focus.

### 1\. A job, and the work

[Section titled “1. A job, and the work”](https://hale-lang.org/docs/tutorial/job-queue/#1-a-job-and-the-work)

Start with the data and the work, as a plain script. A `type` is pure data; a `fn` does something with it.

```
type Job { id: Int; work: Int; }
fn process(j: Job) -> Int {
    return j.work * j.work;
}
fn main() {
    let j: Job = Job { id: 1, work: 7 };
    println("job ", j.id, " -> ", process(j));
}
```

```
job 1 -> 49
```

This is Hale as a small, clean scripting language — no ceremony, no runtime to think about. One job, processed.

### 2\. A queue that holds the jobs

A queue needs to _hold_ jobs. In Hale a collection is a locus with a `@form` annotation — no `Vec<T>` to import or parameterize. `@form(vec)` synthesizes `push`, `get`, `pop`, `len`, and `is_empty` on the locus; `get`/`pop` are fallible (out of range), so you address them at the call site with `or`.

```
type Job { id: Int; work: Int; }
@form(vec)locus Queue {
    capacity { heap jobs of Job; }
}
fn process(j: Job) -> Int { return j.work * j.work; }
fn main() {
    let q = Queue { };
    q.push(Job { id: 1, work: 7 });
    q.push(Job { id: 2, work: 3 });
    q.push(Job { id: 3, work: 9 });
    println("queued: ", q.len());
    for j in q.items {        
        println("job ", j.id, " -> ", process(j));    
    }
}
```

```
queued: 3
job 1 -> 49
job 2 -> 9
job 3 -> 81
```

This is the everyday altitude — loci as plain objects that hold state and expose behavior. Still a single program, run start to finish.

### 3\. Make it a service: the typed bus

A real queue doesn’t drain itself in a loop — work _arrives_, and workers react. That’s the typed message bus. Declare the channels as `topic`s, and wire loci to them: a `Worker` subscribes to `Jobs`, does the work, and publishes a `Result`; a `Reporter` subscribes to `Results`; a `Submitter` publishes jobs.

```
type Job    { id: Int; work: Int; }type Result { id: Int; out: Int; }
topic Jobs    { payload: Job; }topic Results { payload: Result; }
locus Worker {    
    bus {        
        subscribe Jobs as on_job;        
        publish   Results;    
    }
    fn on_job(j: Job) {
        let out: Int = j.work * j.work;
        Results <- Result { id: j.id, out: out };    
    }
}
locus Reporter {
    bus { subscribe Results as on_result; }
    fn on_result(r: Result) { println("job ", r.id, " done -> ", r.out); }
}
locus Submitter {
    bus { publish Jobs; }
    birth() {
        Jobs <- Job { id: 1, work: 7 };
        Jobs <- Job { id: 2, work: 3 };
        Jobs <- Job { id: 3, work: 9 };
    }
}
fn main() {
    Worker { };
    Reporter { };
    Submitter { };
}
```

```
job 1 done -> 49
job 2 done -> 9
job 3 done -> 81
```

> **Run it:** this exact program is live in the [example gallery](https://hale-lang.org/play/?example=jobqueue) — no install. Or paste it into the [playground](https://play.hale-lang.org/) and edit as you go.

Notice what you _didn’t_ write. The `Submitter` never calls the `Worker` — it publishes to a topic, and whoever subscribes gets the message. There’s no mutex, no channel type to choose, no `async`/`await` colouring a single function. This is the concurrent-services altitude, and the cardinality is emergent: add a second `Worker { };` in `main` and both receive jobs — the topic is many-to-many.

So far the bus has been running in-process (the default transport — an in-memory queue). The loci don’t know or care. That’s the seam we pull on next.

### 4\. Deploy it: change only `main`

The loci above never mention threads or transports. You wire _those_ in `main` — `placement { }` says where loci run, and `bindings { }` says how each topic travels. None of the `Worker` / `Reporter` / `Submitter` code changes; you give them a new `main` per deployment.

To run the worker as its own process — listening for jobs over a Unix socket, on its own cooperative pool — that’s a `main` locus:

```
// worker.hl — the worker as its own binary. Import the shared Job/Result
// types, the Jobs/Results topics, and the Worker/Reporter loci from §3;
// only this `main` is new.
main locus WorkerNode {
    params {
        worker:   Worker   = Worker { };
        reporter: Reporter = Reporter { };
    }
    placement {
        worker: cooperative(pool = jobs); // its own pool / OS thread
    }
    bindings {
        Jobs: unix("/run/jobs.sock", role: listen);
    }
}
```

The job _source_ becomes a second binary whose `main` instantiates the `Submitter` and binds the same topic with `role: connect` (`Jobs: unix("/run/jobs.sock", role: connect);`). Same `Jobs` topic, same typed payload — now crossing a process boundary instead of an in-memory queue. Swap `unix(...)` for `udp://host:port` or a broker adapter and the loci still don’t change; only `main` does. (Add a `codec(...)` on the binding to put JSON or protobuf on the wire so a non-Hale peer can read it.)

For the full multi-binary picture — sharing the loci across files, picking transports, and supervising the workers — see [Across binaries](https://hale-lang.org/docs/services/multi-binary) and [Concurrency & placement](https://hale-lang.org/docs/services/concurrency).

### What you built

The same `Job` / `Worker` / topic definitions carried you from a script to a distributed service. Each altitude added exactly what it needed and nothing more:

| Altitude | What appeared |
| --- | --- |
| **Script** | `type`, `fn` — data and the work |
| **Everyday** | a `@form(vec)` locus that holds the jobs |
| **Concurrent** | `topic`s + the bus; workers react instead of being called |
| **Systems** | `main` chooses placement and transports — the loci untouched |

That last row is the point: a Hale program is a _design_ of loci and topics; where and how it runs is a binding you change in one place. From here, the [concurrent services](https://hale-lang.org/docs/services/lifecycle) chapters go deeper on lifecycle, failure, and supervision — or open the [playground](https://play.hale-lang.org/) and run the bus version in your browser.

