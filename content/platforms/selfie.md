title=Selfie
tags=platform, language, library, native, linux, macos, windows
summary=An educational software system of a tiny self-compiling C compiler, a tiny self-executing RISC-V emulator, and a tiny self-hosting RISC-V hypervisor.
~~~~~~

[Website](http://selfie.cs.uni-salzburg.at/) | [Source](https://github.com/cksystemsteaching/selfie)

The Selfie Project provides an educational platform for teaching undergraduate and graduate students the design and implementation of programming languages and runtime systems. The focus is on the construction of compilers, libraries, operating systems, and even virtual machine monitors. The common theme is to identify and resolve self-reference in systems code which is seen as the key challenge when teaching systems engineering, hence the name.

## Installing Selfie

Selfie runs in the cloud and natively on Linux, macOS, and Windows machines and possibly other systems that have a terminal and a C compiler installed. However, even if there is no C compiler installed on your machine or you only have access to a web browser you can still run selfie.

There are at least three ways to install and run selfie, from real simple to a bit more difficult:

1. In the cloud: if you only have access to a web browser, just click [here](https://replit.com/new/github/cksystemsteaching/selfie). Alternatively, create a [github](https://github.com) account, unless you already have one, and fork [selfie](https://github.com/cksystemsteaching/selfie) into your github account. Then, create a [cloud9](https://c9.io) student account, connect it to your github account, verify your email address and set a password (important!), and finally clone your fork of selfie into a new cloud9 workspace.

2. In docker on your machine: if you have access to a Linux, macOS, or Windows machine download and install [docker](https://docker.com). Then, open a terminal window and type `docker run -it cksystemsteaching/selfie`. Besides simplicity, the key advantage of using docker is that you can run selfie out of the box on your machine but also on QEMU as well as on spike. Both emulators and the SMT solver boolector are pre-installed in the [selfie docker image](https://hub.docker.com/r/cksystemsteaching/selfie).

3. Natively on your machine: instead of using docker, you may also just download and unzip [selfie](https://github.com/cksystemsteaching/selfie/archive/main.zip), and then open a terminal window to run selfie natively on your machine. However, for this to work you need to have a C compiler installed on your machine. We recommend using [clang](https://clang.llvm.org) or [gcc](https://gcc.gnu.org) (with [cygwin](https://www.cygwin.com) on Windows).

At this point we assume that you have a system that supports running selfie. Below we use the `make` command assuming it is installed on your system which is usually the case. However, we also show the command invoked by `make` so that you can always invoke that command manually if your system does not have `make` installed.

The next step is to produce a selfie binary. To do that `cd` to the selfie folder in your terminal and then type `make`. With docker, the system will respond `make: 'selfie' is up to date` since there is already a selfie binary pre-installed. Without docker, `make` will invoke the C compiler on your machine or in the cloud9 workspace:

```bash
cc -Wall -Wextra -O3 -D'uint64_t=unsigned long' selfie.c -o selfie
```

and then compile `selfie.c` into an executable called `selfie` as directed by the `-o` option. The executable contains the C\* compiler, the mipster emulator, and the hypster hypervisor. The `-Wall` and `-Wextra` options enable all compiler warnings which is useful during further development of selfie. The `-O3` option instructs the compiler to generate optimized code. The `-D'uint64_t=unsigned long'` option is needed to bootstrap the code. It defines the data type `uint64_t` which would otherwise be undefined since C\* does not include the necessary definitions. If your system supports compiling and executing 32-bit binaries you may also try `make selfie-32` which will produce a 32-bit system that in turn generates and executes 32-bit binaries.

## Running Selfie

Once you have successfully compiled `selfie.c` you may invoke `selfie` without any arguments as follows:

```bash
$ ./selfie
./selfie { -c { source } | -o binary | [ -s | -S ] assembly | -l binary } [ ( -m | -d | -r | -y ) 0-4096 ... ]
```

In this case, `selfie` responds with its usage pattern.

The order in which the options are provided matters for taking full advantage of self-referentiality.

The `-c` option invokes the C\* compiler on the given list of `source` files compiling and linking them into RISC-U code that is stored internally. For example, `selfie` may be used to compile its own source code `selfie.c` as follows:

```bash
$ ./selfie -c selfie.c
```

The `-o` option writes RISC-U code produced by the most recent compiler invocation to the given `binary` file. For example, `selfie` may be instructed to compile itself and then output the generated RISC-U code into a RISC-U binary file called `selfie.m`:

```bash
$ ./selfie -c selfie.c -o selfie.m
```

The `-s` option writes RISC-U assembly of the RISC-U code produced by the most recent compiler invocation to the given `assembly` file while the `-S` option additionally includes approximate line numbers and the binary representation of the instructions. Similarly as before, `selfie` may be instructed to compile itself and then output the generated RISC-U code into a RISC-U assembly file called `selfie.s`:

```bash
$ ./selfie -c selfie.c -s selfie.s
```

The `-l` option loads RISC-U code from the given `binary` file. The `-o` and `-s` options can also be used after the `-l` option. However, in this case the `-s` option does not generate approximate source line numbers. For example, the previously generated RISC-U binary file `selfie.m` may be loaded as follows:

```bash
$ ./selfie -l selfie.m
```

The `-m` option invokes the mipster emulator to execute RISC-U code most recently loaded or produced by a compiler invocation. The emulator creates a machine instance with `0-4096` MB of memory. The `source` or `binary` name of the RISC-U code and any remaining `...` arguments are passed to the main function of the code. For example, the following invocation executes `selfie.m` using mipster:

```bash
$ ./selfie -l selfie.m -m 1
```

This is in fact semantically equivalent to executing `selfie` without any arguments:

```bash
$ ./selfie
```

The `-d` option is similar to the `-m` option except that mipster outputs each executed instruction, its approximate source line number, if available, and the relevant machine state. Alternatively, the `-r` option limits the amount of output created with the `-d` option by having mipster merely replay code execution when runtime errors such as division by zero occur. In this case, mipster outputs only the instructions that were executed right before the error occurred.

If you are using docker you can also execute `selfie.m` directly on spike and pk as follows:

```bash
$ spike pk selfie.m
```

which is again semantically equivalent to executing `selfie` without any arguments.

The `-y` option invokes the hypster hypervisor to execute RISC-U code similar to the mipster emulator. The difference to mipster is that hypster creates RISC-U virtual machines rather than a RISC-U emulator to execute the code. See below for an example.

### Self-compilation

Here is an example of how to perform self-compilation of `selfie.c` and then check if the RISC-U code `selfie1.m` generated for `selfie.c` by executing the `./selfie` binary is equivalent to the code `selfie2.m` generated by executing the just generated `selfie1.m` binary:

```bash
$ ./selfie -c selfie.c -o selfie1.m -m 2 -c selfie.c -o selfie2.m
$ diff -s selfie1.m selfie2.m
Files selfie1.m and selfie2.m are identical
```

Note that at least 2MB of memory is required for this to work.

### Self-execution

The following example shows how to perform self-execution of the mipster emulator. In this case we invoke mipster to invoke itself to execute `selfie`:

```bash
$ ./selfie -c selfie.c -o selfie.m -m 2 -l selfie.m -m 1
```

which is again semantically equivalent to executing `selfie` without any arguments but this time with `selfie` printing its usage pattern much slower since there is a mipster running on top of another mipster.

### Self-hosting

The previous example can also be done by running hypster on mipster. This is significantly faster and requires less memory since hypster does not create a second emulator instance on top of the first emulator instance. Instead, hypster creates a virtual machine to execute selfie that runs concurrently to hypster on the first emulator instance:

```bash
$ ./selfie -c selfie.c -o selfie.m -m 1 -l selfie.m -y 1
```

We may even run hypster on hypster on mipster which is still reasonably fast since there is still only one emulator instance involved and hypster itself does not add much overhead:

```bash
$ ./selfie -c selfie.c -o selfie.m -m 2 -l selfie.m -y 1 -l selfie.m -y 1
```

### Workflow

To compile any C\* source code and execute it right away in a single invocation of `selfie` without generating a RISC-U binary use:

```bash
$ ./selfie -c any-cstar-file.c -m 1 "arguments for any-cstar-file.c"
```

Equivalently, you may also use a selfie-compiled version of `selfie` and have the mipster emulator execute selfie to compile any C\* source code and then execute it right away with hypster on the same emulator instance:

```bash
$ ./selfie -c selfie.c -m 1 -c any-cstar-file.c -y 1 "arguments for any-cstar-file.c"
```

You may also generate RISC-U binaries both ways which will then be identical:

```bash
$ ./selfie -c any-cstar-file.c -o any-cstar-file1.m
$ ./selfie -c selfie.c -m 1 -c any-cstar-file.c -o any-cstar-file2.m
$ diff -s any-cstar-file1.m any-cstar-file2.m
Files any-cstar-file1.m and any-cstar-file2.m are identical
```

This can also be done in a single invocation of `selfie`:

```bash
$ ./selfie -c any-cstar-file.c -o any-cstar-file1.m -c selfie.c -m 1 -c any-cstar-file.c -o any-cstar-file2.m
$ diff -s any-cstar-file1.m any-cstar-file2.m
Files any-cstar-file1.m and any-cstar-file2.m are identical
```

The generated RISC-U binaries can then be loaded and executed as follows:

```bash
$ ./selfie -l any-cstar-file1.m -m 1 "arguments for any-cstar-file1.m"
```

#### Linking

To compile and link any C\* source code from multiple source files use:

```bash
$ ./selfie -c any-cstar-file1.c any-cstar-file2.c ... -m 1
```

For example, to make the source code of `selfie.c` available as library code in any C\* source code use:

```bash
$ ./selfie -c any-cstar-file.c selfie.c -m 1
```

Note that multiple definitions of symbols are ignored by the compiler with a warning.

#### Debugging

Selfie's console messages always begin with the name of the source or binary file currently running. The mipster emulator also shows the amount of memory allocated for its machine instance and how execution terminated (exit code).

As discussed before, RISC-U assembly for `selfie` and any other C\* file is generated as follows:

```bash
$ ./selfie -c selfie.c -s selfie.s
```

If the assembly code is generated from a binary generated by the compiler (and not loaded from a file) approximate source line numbers are included in the assembly file.

Verbose debugging information is printed with the `-d` option, for example:

```bash
$ ./selfie -c selfie.c -d 1
```

Similarly, if the executed binary is generated by the compiler (and not loaded from a file) approximate source line numbers are included in the debug information.

