title=Foreign Function Interfaces (FFI)
tags=language, reading, windows, macos, linux, android, ios
summary=A collection of links and research on how various languages/vms handle interoperability with their host environment.
~~~~~~

The concept of an FFI is fairly straightforward: How does a language/platform "bind" (in other words, be able to call) to underlying APIs of the host environment? Examples include Java code, running on top of the JVM, being able to "call out to" native C code, such as operating system APIs or native libraries; game engines being able to call out to libraries that aren't a part of the game engine itself; and so on.

Most of the time this requires several pieces of knowledge:

* How to dynamically load a library at runtime on the host environment (operating system)
* How to understand the "signature" and calling convention of the host/OS library or API
* How to "marshal" parameters and return values from one environment to the other, which requires knowing information about both the caller and the target's choice of binary representation of values

### Dynamically loading libraries

Lots of this material is covered in [linking and loading](../linking-loading) reading.

### Call signatures and calling conventions

### 

---

# Bash

- ctypes.sh: a foreign function interface for bash
	- https://github.com/taviso/ctypes.sh

---

# Stata

- Stata commands for inline C++ code in do-files
	- https://github.com/robertgrant/statacpp
