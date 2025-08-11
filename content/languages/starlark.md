title=Starlark (formerly known as Skylark)
tags=language
summary=A language intended for use as a configuration language.
~~~~~~

[Source](https://github.com/bazelbuild/starlark) | [Specification](spec.md) | [Multiple implementations](https://github.com/laurentlb/awesome-starlark)

Starlark (formerly known as Skylark) is a language intended for use as a
configuration language. It was designed for the [Bazel](https://bazel.build/)
build system, but may be useful for other projects as well.

Starlark is a dialect of [Python](https://www.python.org/). Like Python, it is a
dynamically typed language with high-level data types, first-class functions
with lexical scope, and garbage collection. Independent Starlark threads execute
in parallel, so Starlark workloads scale well on parallel machines. Starlark is
a small and simple language with a familiar and highly readable syntax. You can
use it as an expressive notation for structured data, defining functions to
eliminate repetition, or you can use it to add scripting capabilities to an
existing application.

A Starlark interpreter is typically embedded within a larger application, and
the application may define additional domain-specific functions and data types
beyond those provided by the core language. For example, Starlark was originally
developed for the Bazel build tool. Bazel uses Starlark as the notation both for
its BUILD files (like Makefiles, these declare the executables, libraries, and
tests in a directory) and for its macro language, through which Bazel is
extended with custom logic to support new languages and compilers.

## Design Principles

*   **Deterministic evaluation**. Executing the same code twice will give the
    same results.
*   **Hermetic execution**. Execution cannot access the file system, network,
    system clock. It is safe to execute untrusted code.
*   **Parallel evaluation**. Modules can be loaded in parallel. To guarantee a
    thread-safe execution, shared data becomes immutable.
*   **Simplicity**. We try to limit the number of concepts needed to understand
    the code. Users should be able to quickly read and write code, even if they
    are not experts. The language should avoid pitfalls as much as possible.
*   **Focus on tooling**. We recognize that the source code will be read,
    analyzed, modified, by both humans and tools.
*   **Python-like**. Python is a widely used language. Keeping the language
    similar to Python can reduce the learning curve and make the semantics more
    obvious to users.

## Tour

The code provides an example of the syntax of Starlark:

```python
# Define a number
number = 18

# Define a dictionary
people = {
    "Alice": 22,
    "Bob": 40,
    "Charlie": 55,
    "Dave": 14,
}

names = ", ".join(people.keys())  # Alice, Bob, Charlie, Dave

# Define a function
def greet(name):
    """Return a greeting."""
    return "Hello {}!".format(name)

greeting = greet(names)

above30 = [name for name, age in people.items() if age >= 30]

print("{} people are above 30.".format(len(above30)))

def fizz_buzz(n):
    """Print Fizz Buzz numbers from 1 to n."""
    for i in range(1, n + 1):
        s = ""
        if i % 3 == 0:
            s += "Fizz"
        if i % 5 == 0:
            s += "Buzz"
        print(s if s else i)

fizz_buzz(20)
```

If you've ever used Python, this should look very familiar. In fact, the code
above is also a valid Python code. Still, this short example shows most of the
language. Starlark is indeed a very small language.

For more information, see [Why Starlark was created](https://blog.bazel.build/2017/03/21/design-of-skylark.html)

## Build API

The first use-case of the Starlark language is to describe builds: how to
compile a C++ or a Scala library, how to build a project and its dependencies,
how to run tests. Describing a build can be surprisingly complex, especially as
a codebase mixes multiple languages and targets multiple platforms.

In the future, this repository will contain a complete description of the build
API used in Bazel. The goal is to have a clear specification and precise
semantics, in order to interoperate with other systems. Ideally, other tools
will be able to understand the build API and take advantage of it.

[Source](https://github.com/bazelbuild/starlark) | [Specification](https://github.com/bazelbuild/starlark/blob/master/spec.md)

# Starlark implementations, tools, and users

## Implementations

The implementations below are not fully compliant to the specification yet. We aim to remove the differences and provide a [common test suite](https://github.com/bazelbuild/starlark/tree/master/test_suite).

*   in Go: https://github.com/google/starlark-go/
*   in Java: https://github.com/bazelbuild/bazel/tree/master/src/main/java/net/starlark/java
*   in Rust: https://github.com/facebookexperimental/starlark-rust

## Tools

* [Buildifier](https://github.com/bazelbuild/buildtools): Code formatter & linter. It can also apply automated fixes (e.g. remove unused loads).
* [Stardoc](https://skydoc.bazel.build/): Documentation generator.
* [Starlark Playground](https://github.com/qri-io/starpg): Starlark Playground is a web-based starlark editor. It uses the golang implementation of starlark running on a server to present a monaco editor set to python syntax.
* [Moonlark](https://github.com/obazl/moonlark): Starlark parser in C with Lua bindings.

## IDEs

Some IDEs have a [plugin for Bazel](https://docs.bazel.build/versions/master/ide.html). Otherwise, consider using a Python mode.

## Users

*  [Bazel](/tools/bazel) is a fast, scalable, multi-language and extensible build system. Starlark has been designed for Bazel.
*  [Buck](https://buckbuild.com/) is a build system from Facebook, using Starlark in a similar way as Bazel.
*  [Caddy](https://caddyserver.com/) is a fast, cross-platform HTTP/2 web server with automatic HTTPS.[Starlark is used](https://github.com/caddyserver/caddy/tree/v2#json-is-declarative-what-if-i-need-more-programmability-ie-imperative-syntax) in Caddy 2 to extend the JSON configuration and add some logic.
*  [Copybara](https://github.com/google/copybara) is a tool for transforming and moving code between repositories. It embeds Starlark to configure the workflow.
*  [Delve](https://github.com/go-delve/delve) is a debugger for the Go programming language, aiming to provide a simple, full featured debugging tool for Go. [Delve uses Starlark](https://github.com/go-delve/delve/blob/master/Documentation/cli/starlark.md) as a a scripting language.
*  [Drone](https://drone.io) is a self-service Continuous Delivery platform. It supports [Starlark scripting](https://docs.drone.io/starlark/overview/) as an alternate to yaml configurations.
*  [Isopod](https://github.com/cruise-automation/isopod) created by Cruise Automation is a DSL framework for Kubernetes configuration. It renders Kubernetes objects as Protocol Buffers.
*  [lucicfg](https://chromium.googlesource.com/infra/luci/luci-go/+/refs/heads/master/lucicfg/doc/README.md) from Chromium CI is a tool for generating low-level configuration files from Starlark.
*  [qri](http://qri.io/) is versioned, scriptable, exportable, collaborative datasets. It uses Starlark to [describe transformations](https://qri.io/docs/reference/starlark_syntax/).
*  [Skycfg](https://github.com/stripe/skycfg) is a library for Starlark to generate Protocol Buffer messages.
*  [starlark-go-nethttp](https://github.com/pcj/starlark-go-nethttp) is a wrapper around a minimal subset of `net/http package` for use within starlark-go.
*  [Starlight](https://github.com/starlight-go/starlight) is a wrapper around the Starlark interpreter in Go.
*  [Tilt](https://tilt.dev/) manages local development instances for teams that deploy to Kubernetes. [Tilt files](https://docs.tilt.dev/tiltfile_concepts.html) are written in Starlark.
*  [ytt](https://get-ytt.io/) is a templating tool, built on top of Starlark, that understands YAML structure allowing you to focus on your data instead of how to properly escape it. Read also [IBM's blog post](https://developer.ibm.com/blogs/yaml-templating-tool-to-simplify-complex-configuration-management/) about it.

