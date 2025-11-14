title=Ciao Prolog
tags=language, logic, prolog, web assembly
summary=A modern Prolog implementation that builds up from a logic-based simple kernel designed to be portable, extensible, and modular.
~~~~~~

[Website](https://ciao-lang.org) | [Website](https://github.com/ciao-lang/ciao)

A modern Prolog implementation that builds up from a logic-based simple kernel designed to be portable, extensible, and modular.

Ciao is implemented in Prolog (72%) and C (23%).

To install:

1. Install emacs. In macOS, this can be done by entering `brew install emacs`
1. Enter `curl https://ciao-lang.org/boot -sSfL | sh`
1. Create an alias to the executable. For example:

   ```bash
   alias ciao="$HOME/.ciaoroot/v1.22.0-m5/build/bin/ciao"
   ```

To start a Ciao top level from a terminal, enter `ciao`.

Includes a WebAssembly compilation target based on Emscripten. Ciao Prolog is a modern Prolog implementation designed to be portable, extensible and modular. Check the playground [here](https://ciao-lang.org/playground).
