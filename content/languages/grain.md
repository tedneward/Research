title=Grain
tags=language, functional, web assembly
summary=Aims to modernize innovative features from functional and academic programming languages and bring them to the masses.
~~~~~~

[Website](https://grain-lang.org/) | [Source](https://github.com/grain-lang/grain)

Installs via homebrew: `brew install --no-quarantine --cask grain-lang/tap/grain`

### Hello, World
The code for this program is fairly straightforward and should feel familiar from other languages.

The module header is the first line of the file and it is mandatory for every module. Although it is recommended to name the module the same as the file, it is not strictly necessary. Module names must begin with a capital letter.

```
module Hello

print("Hello, world!")
```

### Running the Program
To compile and run the program, we can use the Grain CLI: `grain hello.gr`

Alternatively, to compile and run the program in separate steps:

```
grain compile hello.gr # outputs the compiled binary to `hello.gr.wasm`
grain run hello.gr.wasm
```

Basically Grain is a Haskell but with more humane syntax.
