title=Scryer Prolog
tags=language, logic, prolog
summary=A free software ISO Prolog system intended to be an industrial strength production environment and a testbed for bleeding edge research in logic and constraint programming.
~~~~~~

[Website](https://www.scryer.pl)

Scryer Prolog is implemented in Rust (64%) and Prolog (36%).

- ISO standard compliant
- integrated Constraint Logic Programming (CLP) libraries
- supports Definite Clause Grammars (DCGs)
- coroutine support
- tabling and SLG resolution
- compact string representation
- network libraries (TCP sockets, HTTP server, HTTP client, ...)
- cryptography predicates
- WAM-based engine
- cross-platform
- implemented in Rust

To install, enter the following commands:

```bash
git clone https://github.com/mthom/scryer-prolog
cd scryer-prolog
curl https://sh.rustup.rs -sSf | sh # if cargo is not yet installed
cargo build --release
```

This creates the executable file `target/release/scryer-prolog`.
Define an alias like `scryerp` or just `scry` to make this easier to run.

To update your version of Scryer Prolog:

1. cd to the directory containing the cloned GitHub repository.
1. Enter `git pull`
1. Enter `cargo build --release`

To start a Scryer Prolog top level from a terminal, enter `scry`.

By default, Scryer Prolog only provides built-in predicates
that are defined in the ISO standard.
But it bundles many libraries that define non-ISO predicates that can
easily be made available with `:- use_module(library(library-name)).`

To specify configuration for all top level sessions,
create the file `$HOME/.scryerrc`.

This file often imports commonly used libraries.
For example:

```prolog
:- use_module(library(clpz)).
:- use_module(library(dcgs)).
:- use_module(library(format)).
:- use_module(library(lists)).
```

There is currently an {% aTargetBlank
"https://github.com/mthom/scryer-prolog/issues/1775", "issue" %}
where operators defined in modules that are loaded in `.scryerrc`
are not available in source files passed to the Scryer interpreter.
A workaround is to explicitly load the module in the source file
with `:- use_module(library(library-name)).`

#### Scryer Help

After entering a query, press "h" to get the following help:

```text
SPACE, "n" or ";": next solution, if any
RETURN or ".": stop enumeration
"a": enumerate all solutions
"f": enumerate the next 5 solutions
"h": display this help message
"w": write terms without depth limit
"p": print terms with depth limit
```

#### Scryer Common Errors

The following list describes some of the most commonly seen
error messages that are output by Scryer Prolog.

- <pre>Warning: <b>singleton variable</b> Name at line N of file-name.pl.</pre>

  This means that the variable `Name` either:

  - is an argument of a rule, but is not used by any rule body goal
  - appears in a rule body goal, but is not an argument
    and is not set in a previous goal

- <pre>error(<b>existence_error</b>(source_sink,"file-name.pl"),open/4).</pre>

  This error occurs when Scryer Prolog is started with a file path
  and the file is not found.

- <pre>error(syntax_error(inconsistent_entry),load/1).</pre>

  This error can occur when there is a typo in a compiler directive.

- <pre>error(permission_error(access,private_procedure,module_does_not_contain_claimed_export),load/1).</pre>

  This error means that a module is being defined and the list of exports
  contains a functor that is not defined in the file.
  Sadly, the error does not indicate which function is undefined.

- <pre>error(<b>permission_error</b>(modify,static_procedure,(',')/2),load/1).</pre>

  This error means that the source file contains a term with invalid syntax.
  Often the cause is a rule body that contains a goal which is
  not the last goal and is terminated by a period instead of a comma.

- <pre>error(<b>syntax_error</b>(incomplete_reduction),read_term/3:line-number).</pre>

  This error means that the source file contains a term with invalid syntax.
  Often the cause is
  a rule body whose last goal is terminated by a comma instead of a period or
  a rule body goal that is not the last one and is not followed by a comma.

  This error can also occur when a goal uses a non-built-in operator
  that has not been loaded.
  For example, using the `#=` requires loading the `clpz` library.

- <pre>error(<b>type_error</b>(list,6),must_be/2).</pre>

  This error can occur when a predicate argument is
  expected to be a list, but is some other type.
  For example, this happens when the second argument to `format` is not a list.
