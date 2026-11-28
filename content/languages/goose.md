title=Goose
tags=language, native
summary=A memory-safe systems language with no heap allocator, garbage collector, or lifetime annotations.
~~~~~~

[Source](https://github.com/aardappel/goose) | [Tutorial](https://github.com/aardappel/goose/blob/master/docs/tutorial.md) | [Reference](https://github.com/aardappel/goose/blob/master/docs/reference.md) | [Specification](https://github.com/aardappel/goose/blob/master/docs/goose_spec.md) | [Command line](https://github.com/aardappel/goose/blob/master/docs/command_line.md) | [Packages](https://github.com/aardappel/goose/blob/master/docs/packages.md) | [Samples](https://github.com/aardappel/goose/blob/master/samples/README.md) | [Benchmarks](https://github.com/aardappel/goose/blob/master/bench/results.md) | [Standard library](https://github.com/aardappel/goose/blob/master/docs/stdlib.md)

Goose has syntax familiar to C and Rust programmers, but there is no heap. Every dynamic value lives inline on data stacks managed by the compiler. Growth advances a pointer, and memory is freed when its scope ends. The language's type and lifetime rules make this memory model safe to use.

## Why Goose

-   **Faster than C++ and than safe Rust, while memory safe.** Over sixteen benchmarks Goose runs at 3.3x the speed of idiomatic C++, 1.16x hand-optimized C++ and 1.12x the best safe Rust, and uses 1.9x, 1.3x and 1.2x less memory ([results](https://github.com/aardappel/goose/blob/master/bench/results.md)). These gains come from Goose's data layouts and memory model.
-   **No allocator, no GC, no reference counting, no destructors.** Memory is a handful of data stacks that the compiler assigns statically. Freeing a structure with a million elements takes a single store, no matter how deeply it is nested.
-   **Growth preserves references.** A reference into a growing array stays valid for as long as the array does. In the corresponding benchmarks, Goose keeps typed references where C++ must call `reserve` and safe Rust uses `u32` indices.
-   **Memory safe with zero annotations.** There is no lifetime syntax, there are no aliasing or exclusivity rules, and there is no `unsafe`. The compiler infers what every reference is rooted at and rejects references that could outlive their owners.
-   **Nested data stays inline.** A string, an array of strings, a record with variable-size fields and an array of those records are each stored as one contiguous block that contains no pointers. A example record that takes 160 bytes and one allocation in C++ takes 29 bytes and no allocations in Goose.
-   **Variable sized Enums.** Variable-mode ADTs store each value at the size of its own variant rather than that of the largest variant. On the benchmark that exercises this, they use 4x less memory than a Rust `enum` and run at 2x its speed.
-   **Links narrower than pointers.** A relative reference stores a typed, checked link as a 1, 2 or 4-byte offset. Structures built from them are position independent, so a data structure can be written to a file as is. Saving it is a single write, and loading it is a single read followed by a verification pass that rejects malformed or hostile data.
-   **Everything is built in place, guaranteed.** A value is constructed at its final destination through any depth of calls. `items.push(parse(line))` writes the parsed record directly into the array, and returning a growable array by value does not copy it.
-   **Returns across multiple calls.** `return err from load` returns from a function any number of frames up the call stack. It is checked statically, and needs no unwinder, no `Result` type and no `?` on every call.
-   **Threads with no shared memory.** A worker is compiled as a separate program with its own memory, and flat values are passed between threads through typed queues with a `memcpy`. Data races, locks, atomics and memory orderings do not exist in the language.
-   **Generics and higher-order functions with no overhead.** An untyped parameter is generic. Function values are compile-time entities, so `xs.filter() { it > 0 }` compiles to what the handwrittend loop would looks like and builds its result directly in its destination.
-   **Compiles to C and can call C.** Goose compiles to one C file, so it runs wherever a C compiler does and calls C directly through `extern fn`. The bundled TinyCC backend compiles and runs a program in-process, with no build step.

### One memory model: data stacks freed at scope exit

A program has the native call stack, static data and N data stacks, where the compiler works out N. A data stack is a large address-space reservation with a bump pointer, and there is no other memory. At most one resizable value is live per stack and it is always on top, so growth never moves anything and never checks a capacity. All of this is proved at compile time; the runtime tracks only the bump pointers.

```
for round in 3 {
    var scratch: u8[>..] = [];                        // grow-only: growth is a pointer bump
    for i in 100000 { scratch.push((i % 256) as! u8); }
    print("round ", round, ": ", scratch.len, " bytes");
}                                                     // the free: one store to the stack top
```

### Memory never moves, so references survive growth

```
struct Item { id: i32, weight: f32 }

var items: Item[>..] = [];
let first .= items.push(Item { 1, 0.5 });             // a reference to element 0
for i: i32 in 2..1000001 { items.push(Item { i, 0.0 }); }
first.weight = 99.5;                                  // still valid, a million pushes later
```

`push` returns a reference to the new element, so a program can link elements while building the array. A `vector<T>` or `Vec<T>` may reallocate and cannot provide this guarantee. Stable references account for several benchmark gains.

### Safe references, no annotations

Every reference and slice has a static _root_: the variable that bounds its target's lifetime. A reference must not outlive the variable that owns its target or access that target through an incompatible type. The compiler infers roots and specializes functions for them, so no annotations are needed. There are no aliasing or exclusivity rules. When a lifetime check fails, the error names the reference's root and its destination:

```
fn longest(a: u8[:], b: u8[:]) -> u8[:] { if a.len >= b.len { a } else { b } }

var outer: u8[>..] = [];
var w = outer[..];
{
    var inner: u8[>..] = [];
    format(inner, "inner text");
    w = longest(outer, inner);     // error: storing a reference rooted at inner,
}                                  //        which does not outlive the destination (§9.2)
```

A slice `T[:]` lets a function accept a range from any array kind without copying its elements. For example, `split` returns slices into its input, and a dictionary keyed by `u8[:]` stores views of strings rather than copies.

### Nested data stays inline

There is no single array type. Instead there is a family of array types that differ only in how their size can change. Every member is laid out as `[metadata][elements...]`, inline and packed, never as a pointer to a separate block of elements:

| Type | What it is |
| --- | --- |
| `T[k]` | fixed size, known at compile time |
| `T[]`, `T[varint]` | sized at construction, frozen after; a fixed or variable-width length |
| `T[..k]`, `T[..]` | capacity inline; grows and shrinks within it |
| `T[>..]` | **grow-only**: the most commonly used kind; references into it stay valid |
| `T[>..<]` | **grow-shrink**: stacks, queues, heaps |

Strings are `u8` arrays: `u8[>..]` is a builder, `u8[]` a finished string stored inline in whatever holds it, `u8[..16]` a small string inside a struct, `u8[:]` a view. A struct may contain variable-size parts, which are stored inline in declaration order, so a record is a sequence of bytes with no indirection in it:

```
struct Item  { sku: u8[varint], qty: varint, cents: varint }
struct Order { id: varint, customer: u8[varint], items: Item[varint] }

var book: Order[>..] = [];
book.push(Order { id: 1001, customer: "alice",
                  items: [Item { sku: "SKU-441", qty: 2, cents: 1999 },
                          Item { sku: "SKU-7", qty: 1, cents: 500 }] });
```

That order is **29 bytes and 0 allocations**. As C++ `std::string` + `std::vector<Item>` it is 160 bytes and 1 allocation, and as Rust `String` + `Vec<Item>` it is 153 bytes and 4 allocations. An entire order book is a single array, so reading it streams through the cache. The trade-off is that an array of variable-size elements is sequential: you can iterate it but not index it (unless you keep a second array of references into it as an index).

### Enums in two sizes

Algebraic data types are the only form of dynamic polymorphism; there is no inheritance and there are no vtables. Every ADT can be stored in two ways, chosen at the point of use. Fixed mode (`Shape`) stores a tag plus room for the largest payload, so values can be indexed and overwritten. Variable mode (`Shape..`) gives each value exactly the size of its variant. An array of such values becomes sequential and a value never changes variant, but in exchange you may take references _into_ a payload:

```
enum Shape { Circle { r: f64 }, Rect { w: f64, h: f64 }, Dot }

var packed: Shape..[>..] = [];                 // 9, 17 and 1 bytes, not 17 each
packed.push(Shape.Circle { r: 1.0 });
packed.push(Shape.Rect { w: 2.0, h: 3.0 });
packed.push(Shape.Dot);
for s in packed {
    match s { Rect &r => { r.w += 1.0; }, _ => {} }   // edits the payload in place, inside the array
}
```

_Case functions_ provide another way to dispatch on a variant: define one overload per variant. Calls dispatch on the tag through a jump table, and the compiler checks that the overloads cover every variant:

```
fn area(s: Shape.Circle) -> f64 { 3.14159 * s.r * s.r }
fn area(s: Shape.Rect) -> f64   { s.w * s.h }
fn area(s: Shape.Dot) -> f64    { 0.0 }

for s in packed { print(s, " area ", area(s)); }
```

### Links narrower than pointers

A `T&` is a machine address: it takes eight bytes and never dangles. A _relative reference_ is the same link stored as a narrow offset. A `T&<u32>` is measured from the field itself to a target in the same array, so the structure is position independent. A `T&<u32 in pool>` is measured from the base of a named pool, so other arrays can link into the pool. `T&<u32>?` uses offset 0 as null. Here is a binary search tree in one grow-only array, with 12-byte nodes:

```
struct Node { key: i32, left: Node&<u32>?, right: Node&<u32>? }   // 12 bytes, links included

fn insert(pool: Node[>..]&, key: i32) {
    if pool.len == 0 { pool.push(Node { key: key }); return; }
    var cur .= pool[0];                             // .= binds a reference; = would copy the node
    loop {
        if key == cur.key { return; }
        let next = if key < cur.key { cur.left } else { cur.right };
        if next { cur .= next; continue; }          // narrowed by `if`: next is a Node&
        if key < cur.key { cur.left .= pool.push(Node { key: key }); }
        else             { cur.right .= pool.push(Node { key: key }); }
        return;
    }
}
```

References are transparent (there is no `*` or `->`). `.=` binds or retargets a reference, and `Node?` is a nullable reference that `if`, `guard` and `assert` narrow. The insert is one push and one store, and the push cannot invalidate `cur`. When lifetimes are not nested, the standard library's [`slot_pool<T>`](https://github.com/aardappel/goose/blob/master/docs/stdlib.md#slot_pool) pairs a grow-only `items` array with a freelist. `alloc_ref` reuses a free slot or pushes a new one, and `free` returns a slot to the pool. Since a slot's memory is never actually freed, a stale slot reads a _different value of the correct type_ rather than corrupting memory.

[`slice_pool<T>`](https://github.com/aardappel/goose/blob/master/docs/stdlib.md#slice_pool) provides contiguous runs with allocation, free and resize operations. The language features `reusable` and `reusable[]` are **deprecated** in favor of these pool types. They remain available for existing code and the [remaining migration gaps](https://github.com/aardappel/goose/blob/master/docs/design/root_structs.md#separate-follow-up-reusable-pools-in-the-stdlib); removal is a later step.

### Saving and loading data as bytes

```
var image: u8[>..] = tree.to_bytes();           // a framed byte image of the whole array
var loaded, ok = from_bytes<Node[>..]>(image);  // verified before it becomes a value
image[image.len - 3] = 200;                     // tamper with a link ...
var bad, bok = from_bytes<Node[>..]>(image);    // ... and it is false and an empty array
```

The tree's links are self-relative, so the tree means the same thing wherever it is stored. Saving it writes its bytes and loading it reads them back, with no serializer, no schema and no pointer fixups. `from_bytes` checks the framing, every tag, every length and every link before the bytes become a value, so a corrupt or hostile file makes it return `false`, never a wild reference.

### In-place construction

The copy-free construction guarantee ([spec §4.3](https://github.com/aardappel/goose/blob/master/docs/goose_spec.md#43-the-in-place-construction-guarantee)) says a constructed value is always built at its final location, which is passed down through calls. A function returning a grow-only array by value writes its elements directly into the caller's variable, or into a field of the record being built inside another array, so out-parameters are rarely needed.

```
words.push(str("word", i));                    // formatted straight into the new element
let evens = xs.filter() { it % 2 == 0 };       // built straight into `evens`: no temporary
book.push(Order { id: 1001, customer: "alice", items: parse_items("SKU-441:2:1999;SKU-7:1:500") });
```

### Returning errors across calls

```
struct User { name: u8[..16], age: i32 }

fn load(text: u8[:]) -> User[>..], u8[] {
    var users: User[>..] = [];
    each_split(text, '\n') { users.push(parse_user(it)); };
    return users, "";
}

fn parse_user(line: u8[:]) -> User {              // returns a User: no Result, no error parameter
    let comma = find(line, ",");
    guard comma >= 0 else { return [], str("expected name,age: ", line) from load; }
    let age, ok = parse_int(line[comma + 1..]);
    guard ok else { return [], str("bad age: ", line) from load; }
    let name = trim(line[..comma]);
    return User { name: name, age: age as i32 };
}
```

`return E from f` returns `E` as the result of the innermost active call of `f`, however many frames up that call is. Every function in between keeps its plain signature. The construct is checked statically: every call of `parse_user` must lie inside a `load` call, so nothing can go uncaught at runtime. It is implemented as a hidden discriminant checked in each frame rather than as an unwinder, and the message is built directly where `load`'s caller wants it. The parsers in the samples use it for every syntax error.

### Generics and function blocks

```
fn twice(x) { x + x }                              // an untyped parameter is a generic one

fn each_pair<T, F>(xs: T[:]) {                     // F is a function value: a compile-time entity
    for i in 0..xs.len - 1 { F(xs[i], xs[i + 1]); }
}

fn first_gap(xs: i64[:]) -> i64 {
    each_pair(xs) { a, b => if b - a > 1 { return a; } };   // returns from first_gap, not each_pair
    return -1;
}

let evens = xs.filter() { it % 2 == 0 };
let total = fold(xs, 0) { acc, x => acc + x };
sort(xs) { a, b => a > b };
```

Everything is monomorphized. Type arguments are inferred from argument types; type parameters that do not appear in those types can be supplied explicitly. Function values are passed as generic parameters. Every call of a function value is direct and can be inlined, function values cannot escape, and there are no closure objects or function pointers, so a higher-order function compiles to exactly the loop it looks like. A block may `return` from its lexically enclosing function, and nested functions can use the enclosing function's locals.

### Threads with no shared memory

```
thread_fn worker() {                                // a separate program with its own memory
    loop {
        let job = qget<Job>();                      // blocks on the typed queue for Job
        guard job.n >= 0 else { break; }            // -1 means stop
        qput(Result { n: job.n, digits: count_digits(job.n) });
    }
}

for i in n { ids.push(thread_spawn(worker)); }
```

There is no shared mutable memory. A `thread_fn` and everything it calls is compiled as its own program with its own data stacks and its own copies of the globals. Values are passed between threads through typed queues, one per type, and must be _flat_, with no references at any depth. Passing them is cheap because a flat Goose value is contiguous: a job or a result can carry real data, such as pixels, and passing it is a single `memcpy`.

A failed check or `abort` in a worker started with `thread_spawn_contained` ends only that worker. Its message goes to whoever waits for it, not to stderr, so a supervisor can log it and start another:

```
var why: u8[>..] = [];
while !thread_wait(thread_spawn_contained(serve, attempt), why) {
    log(why);                                       // "assert failed (serve.goose:12)"
    why.clear();
    attempt++;
}
```

The first `thread_wait(id, msg)` for a worker takes the message; a caller that doesn't ask for it loses it.

### Compiling to and calling C

[](https://github.com/aardappel/goose#compiling-to-and-calling-c)

```
extern fn hypot(x: f64, y: f64) -> f64;             // straight from libm
extern fn crc32_bytes(s: const u8[:]) -> u32;       // a slice crosses as { data, len }
extern fn stats_of(xs: i32[:], out: Stats&);        // a struct filled through a pointer
```

An `extern fn` binds a Goose signature to a C symbol. The `math` and `os` modules use this interface. Only types with supported C representations may cross the boundary; unsupported signatures are rejected at the declaration. The compiler emits one C file for the whole program. The bundled TinyCC backend can compile and run that C inside the Goose compiler's process.

### Where the speed comes from

Much of the speed comes from the memory model: no heap allocation or per-object teardown, contiguous data, narrow links, and enums sized for the variant they contain. Every index is bounds-checked, and the compiler removes checks it can prove unnecessary. An `assert` on a slice length often lets the compiler remove the remaining checks in a kernel, so that the kernel can be vectorized. `--bce-lines` reports the checks that remain. `checkfree fn` rejects a kernel if any bounds check remains in it; index types let graph edges keep the validation done while the graph was built. Benchmark measurements use whole-process wall-clock time, including teardown.

| Geometric mean over 16 benchmarks | vs idiomatic C++ | vs hand-optimized C++ | vs best safe Rust |
| --- | --- | --- | --- |
| speed, MSVC backend | 3.51x | 1.24x | 1.13x |
| speed, clang backend | 3.54x | 1.26x | 1.19x |
| peak memory | 1.95x less | 1.32x less | 1.25x less |

The [summary](https://github.com/aardappel/goose/blob/master/bench/summary.md) explains the gains and losses; [results.md](https://github.com/aardappel/goose/blob/master/bench/results.md) has every measurement, and [design.md](https://github.com/aardappel/goose/blob/master/bench/design.md) explains what the suite tests.

### Limitations

-   You have to think about where data lives: who owns it, and how long its scope lasts. Usually the owner is the function that builds the data, which needs no extra work; when it is not, use a `slot_pool` or `slice_pool`.
-   Recursive functions cannot keep growable data across a recursive call. Scratch data must end before the call, and data that outlives the call is passed in as a pool.
-   Arrays of variable-size elements can be iterated but not indexed (unless you keep an index of references beside them). A fixed-mode enum cannot be pointed into, and a variable-mode one cannot be overwritten. You make this choice per container.
-   There are no escaping closures, no function pointers and no dynamic dispatch beyond ADT tags, and only whole-program compilation is supported.
-   A slot that was returned to a pool but is still referenced reads whatever its next owner put there. That is a logic bug, but never memory corruption.

[Tutorial §18](https://github.com/aardappel/goose/blob/master/docs/tutorial.md#18-limitations) is the full list.

