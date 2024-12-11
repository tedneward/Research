title=Foreign Function Interfaces (FFI)
tags=language, reading, windows, macos, linux, android, ios
summary=A collection of links and research on how various languages/vms handle interoperability with their host environment.
~~~~~~

The concept of an FFI is fairly straightforward: How does a language/platform "bind" (in other words, be able to call) to underlying APIs of the host environment? Examples include Java code, running on top of the JVM, being able to "call out to" native C code, such as operating system APIs or native libraries; game engines being able to call out to libraries that aren't a part of the game engine itself; and so on.

Most of the time this requires several pieces of knowledge:

* How to dynamically load a library at runtime on the host environment (operating system)
* How to understand the "signature" and calling convention of the host/OS library or API
* How to "marshal" parameters and return values from one environment to the other, which requires knowing information about both the caller and the target's choice of binary representation of values

## Dynamically loading libraries

Most FFIs (particularly those of VM-based languages) use dynamic loading of libraries, so as to reduce the need to statically-link new executables each time a new FFI invocation is needed/desired. 

Lots of this material is covered in [linking and loading](../linking-loading) reading. Typically the two-step process is to:

1. Load the library. Asking the OS to bring the library up into the process' space and make it available.
2. Request the address of a given exported symbol by name. In other words, look up the function by its name, returning either the address (which we can then coerce somehow into a callable reference--function pointer, if you will) or NULL if no such name is found.

## Call signatures

How do we name the exported entry point? Does the entry point have any metadata describing the parameters and/or return type?

#### [C](/languages/c)

C generally mapped the name of a function directly to the exported ABI name, usually with a prefixed `_`. (Not sure of the reason for that prefix, to be honest.) "an identifier beginning with an underscore followed by a capital letter is a [reserved identifier](https://en.wikipedia.org/wiki/Reserved_word) in C, so conflict with user identifiers is avoided"

#### [C++](/languages/cplusplus)

... was where things got *really* interesting. (*Inside the C++ Object Model* had/has a lot of details on this.) In order to support function overloading (same name, different parameters), C++ generated C-style function names with the parameters encoded as part of the name; example:

```
int  f () { return 1; }
int  f (int)  { return 0; }
void g () { int i = f(), j = f(0); }
```

... could produce ...

```
int  __f_v () { return 1; }
int  __f_i (int)  { return 0; } 
void __g_v () { int i = __f_v(), j = __f_i(0); }
```

and it got even more interesting for classes:

```
namespace wikipedia 
{
   class article 
   {
   public:
      std::string format ();  // = _ZN9wikipedia7article6formatEv

      bool print_to (std::ostream&);  // = _ZN9wikipedia7article8print_toERSo

      class wikilink 
      {
      public:
         wikilink (std::string const& name);  // = _ZN9wikipedia7article8wikilinkC1ERKSs
      };
   };
}
```

... depending on the precise name-mangling convention for that C++ compiler:

Compiler | `void h(int)` | `void h(int, char)` | `void h(void)`
-------- + ----------- + ----------------- + ------------
Intel C++ 8.0 for Linux, HP aC++ A.05.55 IA-64, IAR EWARM C++, GCC 3.x and higher, Clang 1.x and higher | `_Z1hi` | `_Z1hic` | `_Z1hv`
GCC 2.9.x, HP aC++ A.03.45 PA-RISC | `h__Fi` | `h__Fic` | `h__Fv`
Microsoft Visual C++ v6-v10 ([mangling details](https://en.wikiversity.org/wiki/Visual_C%2B%2B_name_mangling)), Digital Mars C++ | `?h@@YAXH@Z` | `?h@@YAXHD@Z` | `?h@@YAXXZ`
Borland C++ v3.1 | `@h$qi` | `@h$qizc` | `@h$qv`
OpenVMS C++ v6.5 (ARM mode) | `H__XI` | `H__XIC` | `H__XV`
OpenVMS C++ v6.5 (ANSI mode) | | `CXX$__7H__FIC26CDH77` | `CXX$__7H__FV2CB06E8`
OpenVMS C++ X7.1 IA-64 | `CXX$_Z1HI2DSQ26A` | `CXX$_Z1HIC2NP3LI4` | `CXX$_Z1HV0BCA19V`
SunPro CC | `__1cBh6Fi_v_` | `__1cBh6Fic_v_` | `__1cBh6F_v_`
Tru64 C++ v6.5 (ARM mode) | `h__Xi` | `h__Xic` | `h__Xv`
Tru64 C++ v6.5 (ANSI mode) | `__7h__Fi` | `__7h__Fic` | `__7h__Fv`
Watcom C++ 10.6 | `W?h$n(i)v` | `W?h$n(ia)v` | `W?h$n()v`

**Readings**

- Measuring Mangled Name Ambiguity in Large C / C++ Projects
	- SQAMIA 2017
	- Richárd Szalay, Zoltán Porkoláb, Dániel Krupp
	- https://www.researchgate.net/publication/320923382_Measuring_Mangled_Name_Ambiguity_in_Large_C_C_Projects
	- http://ceur-ws.org/Vol-1938/paper-sza.pdf
- Towards Better Symbol Resolution for C/C++ Programs: A Cluster-Based Solution
	- Source Code Analysis and Manipulation (SCAM) 2017
	- Richárd Szalay, Zoltán Porkoláb, Dániel Krupp
	- http://ieeexplore.ieee.org/document/8090143/
	- https://www.researchgate.net/publication/320832497_Towards_Better_Symbol_Resolution_for_CC_Programs_A_Cluster-Based_Solution

**Software**

- [c++filtjs](https://d.fuqu.jp/c++filtjs/) ([Source](https://github.com/nattofriends/c-filtjs)): c++filt in JavaScript with Emscripten
- [C++ Itanium ABI demangler](https://github.com/whitequark/binja_itanium_cxx_abi/blob/master/demangler.py): C++ demangler in Python that converts the mangled name into an AST
- [cppmangle](https://github.com/AVGTechnologies/cppmangle): A library for demangling and mangling Visual Studio C++ names
- [cpp_demangle](https://github.com/gimli-rs/cpp_demangle): A crate for demangling C++ symbols
- [Demangler](https://github.com/avast-tl/demangler): A C++ library and tools for demangling mangled C++ names
	- https://github.com/avast-tl/retdec/tree/master/src/demangler
	- https://github.com/avast-tl/retdec/tree/master/tests/demangler
- [demumble](https://github.com/nico/demumble): A better c++filt and a better undname.exe, in one binary. demumble demangles both POSIX and Visual Studio symbols. It runs on both POSIX and Windows.
- [GCC and MSVC C++ Demangler](http://demangler.com/)

**Talks**

- C++ Weekly - Ep 8 C++ Name Demangling - https://www.youtube.com/watch?v=uX99t7GmuDc


#### [Obj-C](/languages/objc)

Two forms of method in Objective-C, the class ("static") method, and the instance method. A method declaration in Objective-C is of the following form:

```
+ (return-type) name0:parameter0 name1:parameter1 ...
– (return-type) name0:parameter0 name1:parameter1 ...
```

Class methods are signified by +, instance methods use -. A typical class method declaration may then look like:

```
+ (id) initWithX: (int) number andY: (int) number;
+ (id) new;
```

With instance methods looking like this:

```
- (id) value;
- (id) setValue: (id) new_value;
```

Each of these method declarations have a specific internal representation. When compiled, each method is named according to the following scheme for class methods:

```
_c_Class_name0_name1_ ...
```

and this for instance methods:

```
_i_Class_name0_name1_ ...
```

The colons in the Objective-C syntax are translated to underscores. So, the Objective-C class method `+ (id) initWithX: (int) number andY: (int) number;`, if belonging to the Point class would translate as `_c_Point_initWithX_andY_`, and the instance method (belonging to the same class) `- (id) value;` would translate to `_i_Point_value`.

Each of the methods of a class are labeled in this way. However, in order to look up a method that a class may respond to would be tedious if all methods are represented in this fashion. Each of the methods is assigned a unique symbol (such as an integer). Such a symbol is known as a selector. In Objective-C, one can manage selectors directly — they have a specific type in Objective-C — `SEL`.

During compilation, a table is built that maps the textual representation, such as `_i_Point_value`, to selectors. Managing selectors is more efficient than manipulating the textual representation of a method. Note that a selector only matches a method's name, not the class it belongs to — different classes can have different implementations of a method with the same name. Because of this, implementations of a method are given a specific identifier too, these are known as implementation pointers, and are also given a type, `IMP`.

Message sends are encoded by the compiler as calls to the `id objc_msgSend (id receiver, SEL selector, ...)` function, or one of its cousins, where receiver is the receiver of the message, and SEL determines the method to call. Each class has its own table that maps selectors to their implementations — the implementation pointer specifies where in memory the actual implementation of the method resides. There are separate tables for class and instance methods. Apart from being stored in the `SEL` to `IMP` lookup tables, the functions are essentially anonymous.

The SEL value for a selector does not vary between classes. This enables polymorphism.

The Objective-C runtime maintains information about the argument and return types of methods. However, this information is not part of the name of the method, and can vary from class to class.

Since Objective-C does not support namespaces, there is no need for the mangling of class names (that do appear as symbols in generated binaries).

#### Swift

Swift keeps metadata about functions (and more) in the mangled symbols referring to them. This metadata includes the function's name, attributes, module name, parameter types, return type, and more. For example:

The mangled name for a method `func calculate(x: int) -> int` of a `MyClass` class in module `test` is `_TFC4test7MyClass9calculatefS0_FT1xSi_Si`, for 2014 Swift. [The components and their meanings](https://mikeash.com/pyblog/friday-qa-2014-08-15-swift-name-mangling.html) are as follows:

* _T: The prefix for all Swift symbols. Everything will start with this.
* F: Non-curried function.
* C: Function of a class, i.e. a method
* 4test: Module name, prefixed with its length.
* 7MyClass: Name of class the function belongs to, prefixed with its length.
* 9calculate: Function name, prefixed with its length.
* f: The function attribute. In this case ‘f’, which means a normal function.
* S0: Designates the type of the first parameter (namely the class instance) as the first in the type stack (here MyClass is not nested and thus has index 0).
* _FT: This begins the type list for the parameter tuple of the function.
* 1x: External name of first parameter of the function.
* Si: Indicates builtin Swift type Swift.Int for the first parameter.
* _Si: The return type: again Swift.Int.

Mangling for versions since Swift 4.0 is [documented officially](https://github.com/apple/swift/blob/main/docs/ABI/Mangling.rst).

## Calling conventions

An implementation-level (low-level) scheme for how subroutines receive parameters from their caller and how they return a result. Differences in various implementations include where parameters, return values, return addresses and scope links are placed (registers, stack or memory etc.), and how the tasks of preparing for a function call and restoring the environment afterwards are divided between the caller and the callee.

Calling conventions may differ in:

* Where parameters, return values and return addresses are placed (in registers, on the call stack, a mix of both, or in other memory structures)
* For parameters passed in memory, the order in which actual arguments for formal parameters are passed (or the parts of a large or complex argument)
* How a (possibly long or complex) return value is delivered from the callee back to the caller (on the stack, in a register, or within the heap)
* How the task of setting up for and cleaning up after a function call is divided between the caller and the callee
* Whether and how metadata describing the arguments is passed
* Where the previous value of the frame pointer is stored, which is used to restore the frame pointer when the routine ends (in the stack frame, or in some register)
* Where any static scope links for the routine's non-local data access are placed (typically at one or more positions in the stack frame, but sometimes in a general register, or, for some architectures, in special-purpose registers)
* How local variables are allocated can sometimes also be part of the calling convention (when the caller allocates for the callee)

In some cases, differences also include the following:

* Conventions on which registers may be directly used by the callee, without being preserved
* Which registers are considered to be volatile and, if volatile, need not be restored by the callee

#### x86

Due to the small number of architectural registers, and historical focus on simplicity and small code-size, many x86 calling conventions pass arguments on the stack. The return value (or a pointer to it) is returned in a register. Some conventions use registers for the first few parameters which may improve performance, especially for short and simple leaf-routines very frequently invoked (i.e. routines that do not call other routines).

Example caller:
```
push EAX            ; pass some register result
push dword [EBP+20] ; pass some memory variable (FASM/TASM syntax)
push 3              ; pass some constant
call calc           ; the returned result is now in EAX
```

Example callee (`calc`): 
```
calc:
push EBP            ; save old frame pointer
mov EBP,ESP         ; get new frame pointer
sub ESP,localsize   ; reserve stack space for locals

; perform calculations, leave result in EAX

mov ESP,EBP         ; free space for locals
pop EBP             ; restore old frame pointer
ret paramsize       ; free parameter space and return.
```
Some conventions leave the parameter space allocated, using plain `ret` instead of `ret imm16`. In that case, the caller could `add esp,12` in this example, or otherwise deal with the change to ESP.

#### ARM (A32)

The standard 32-bit ARM calling convention allocates the 15 general-purpose registers as:

* r15: Program counter (as per the instruction set specification).
* r14: Link register. The BL instruction, used in a subroutine call, stores the return address in this register.
* r13: Stack pointer. The Push/Pop instructions in "Thumb" operating mode use this register only.
* r12: Intra-Procedure-call scratch register.
* r4 to r11: Local variables.
* r0 to r3: Argument values passed to a subroutine and results returned from a subroutine.

If the type of value returned is too large to fit in r0 to r3, or whose size cannot be determined statically at compile time, then the caller must allocate space for that value at run time, and pass a pointer to that space in r0.

Subroutines must preserve the contents of r4 to r11 and the stack pointer (perhaps by saving them to the stack in the function prologue, then using them as scratch space, then restoring them from the stack in the function epilogue). In particular, subroutines that call other subroutines must save the return address in the link register r14 to the stack before calling those other subroutines. However, such subroutines do not need to return that value to r14—they merely need to load that value into r15, the program counter, to return.

The ARM calling convention mandates using a full-descending stack. ([Reference](https://github.com/ARM-software/abi-aa/blob/2bcab1e3b22d55170c563c3c7940134089176746/aapcs32/aapcs32.rst))

This calling convention causes a "typical" ARM subroutine to:

* In the prologue, push r4 to r11 to the stack, and push the return address in r14 to the stack (this can be done with a single STM instruction);
* Copy any passed arguments (in r0 to r3) to the local scratch registers (r4 to r11);
* Allocate other local variables to the remaining local scratch registers (r4 to r11);
* Do calculations and call other subroutines as necessary using BL, assuming r0 to r3, r12 and r14 will not be preserved;
* Put the result in r0;
* In the epilogue, pull r4 to r11 from the stack, and pull the return address to the program counter r15. This can be done with a single LDM instruction.

#### ARM (A64)

The [AArch 64 calling convention](https://developer.arm.com/documentation/den0024/a/The-ABI-for-ARM-64-bit-Architecture/Register-use-in-the-AArch64-Procedure-Call-Standard/Parameters-in-general-purpose-registers) allocates the 31 general-purpose registers as:

* x31 (SP): Stack pointer or a zero register, depending on context.
* x30 (LR): Procedure link register, used to return from subroutines.
* x29 (FP): Frame pointer.
* x19 to x29: Callee-saved.
* x18 (PR): Platform register. Used for some operating-system-specific special purpose, or an additional caller-saved register.
* x16 (IP0) and x17 (IP1): Intra-Procedure-call scratch registers.
* x9 to x15: Local variables, caller saved.
* x8 (XR): Indirect return value address.
* x0 to x7: Argument values passed to and results returned from a subroutine.

All registers starting with x have a corresponding 32-bit register prefixed with w. Thus, a 32-bit x0 is called w0.

Similarly, [the 32 floating-point registers are allocated](https://developer.arm.com/documentation/den0024/a/The-ABI-for-ARM-64-bit-Architecture/Register-use-in-the-AArch64-Procedure-Call-Standard/Parameters-in-NEON-and-floating-point-registers) as:

* v0 to v7: Argument values passed to and results returned from a subroutine.
* v8 to v15: callee-saved, but only the bottom 64 bits need to be preserved.
* v16 to v31: Local variables, caller saved.

## Known calling conventions

References:


#### "cdecl"

#### "Pascal" style

#### Windows "stdcall"

#### macOS ABI

[Outdated: OS X ABI Function Call Guide](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/LowLevelABI/000-Introduction/introduction.html) covers 32-/64-bit PowerPC, and [IA-32](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/LowLevelABI/130-IA-32_Function_Calling_Conventions/IA32.html) / [x86-64](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/LowLevelABI/140-x86-64_Function_Calling_Conventions/x86_64.html) calling conventions

## Application Binary Interfaces (ABI) in general

- `[[trivial_abi]]` 101
	- https://quuxplusone.github.io/blog/2018/05/02/trivial-abi-101/
- ABI Breaks: Not just about rebuilding
	- https://www.reddit.com/r/cpp/comments/fc2qqv/abi_breaks_not_just_about_rebuilding/
- ABI Policy and Guidelines - The GNU C++ Library Manual
	- https://gcc.gnu.org/onlinedocs/libstdc++/manual/abi.html
- ABIs, linkers and other animals - Stephen Kell (2014)
	- https://www.cl.cam.ac.uk/~srk31/research/talks/kell14abis-slides.pdf
- Binary Compatibility Examples
	- https://community.kde.org/Policies/Binary_Compatibility_Examples
- Binary Compatibility Issues With C++
	- https://community.kde.org/Policies/Binary_Compatibility_Issues_With_C%2B%2B
- Binary Compatibility of Shared Libraries Implemented in C++ on GNU/Linux Systems
	- SYRCoSE 2009; Pavel Shved, Denis Silakov
	- http://syrcose.ispras.ru/2009/files/02_paper.pdf
	- http://static.coldattic.info/restricted/science/syrcose09/cppbincomp.pdf
- Binary-compatible C++ Interfaces - https://chadaustin.me/cppinterface.html
- ["The C Language Calling Sequence"](https://www.bell-labs.com/usr/dmr/www/clcs.html)
- C++ Standards Committee Papers
	- ABI breakage - summary of initial comments
		- 2019; Roger Orr
		- http://wg21.link/P1654
	- What is ABI, and What Should WG21 Do About It?
		- 2020; Titus Winters
		- http://wg21.link/P2028
	- Extending the Type System to Provide API and ABI Flexibility
		- P2123R0; 2020-03-04; Hal Finkel, Tom Scogland
		- http://wg21.link/p2123
- C++: Under the Hood (March 1994) by Jan Gray
	- http://files.rsdn.org/4539/cud94.htm
	- https://blogs.msdn.microsoft.com/xiangfan/2012/02/06/c-under-the-hood/
	- https://www.openrce.org/articles/files/jangrayhood.pdf
- Calling conventions for different C++ compilers and operating systems
	- http://www.agner.org/optimize/calling_conventions.pdf
- Describing the MSVC ABI for Structure Return Types
	- http://blog.aaronballman.com/2012/02/describing-the-msvc-abi-for-structure-return-types/
- How C array sizes become part of the binary interface of a library
	- https://developers.redhat.com/blog/2019/05/06/how-c-array-sizes-become-part-of-the-binary-interface-of-a-library/
- Itanium C++ ABI
	- https://itanium-cxx-abi.github.io/cxx-abi/
	- https://github.com/itanium-cxx-abi/cxx-abi
- Lessons from the Unix stdio ABI: 40 Years Later
	- https://fingolfin.org/blog/20200327/stdio-abi.html
- Some thoughts on binary compatibility - http://blog.qt.io/blog/2009/08/12/some-thoughts-on-binary-compatibility/
- Some thoughts on calling convention - http://blog.qt.io/blog/2009/08/15/some-thoughts-on-calling-convention/
- The Importance of Calling Conventions - http://blog.aaronballman.com/2011/04/the-importance-of-calling-conventions/
- The value of passing by value - https://www.macieira.org/blog/2012/02/the-value-of-passing-by-value/
- X86-64 System V Application Binary Interface
	- https://github.com/hjl-tools/x86-psABI/wiki/X86-psABI

#### Software

- ABI Compliance Checker (ABICC)
	- A tool for checking backward API/ABI compatibility of a C/C++ library
	- https://lvc.github.io/abi-compliance-checker/
	- https://github.com/lvc/abi-compliance-checker
	- http://ispras.linuxbase.org/index.php/ABI_compliance_checker
	- How to check for ABI changes with abi compliance checker - https://fedoraproject.org/wiki/How_to_check_for_ABI_changes_with_abi_compliance_checker
- ABI Dumper
	- A tool to dump ABI of an ELF object containing DWARF debug info
	- https://github.com/lvc/abi-dumper
- ABIGAIL: Application Binary Interface Generic Analysis and Instrumentation Library
	- abidiff - compares the Application Binary Interfaces (ABI) of two shared libraries in ELF format
		- https://sourceware.org/libabigail/manual/abidiff.html
	- abidw - reads a shared library in ELF format and emits an XML representation of its ABI to standard output
		- https://sourceware.org/libabigail/manual/abidw.html
	- abicompat - checks that an application that links against a given shared library is still ABI compatible with a subsequent version of that library
		- https://sourceware.org/libabigail/manual/abicompat.html
	- Comparing ABIs for Compatibility with libabigail – Part 1 - https://developers.redhat.com/blog/2014/10/23/comparing-abis-for-compatibility-with-libabigail-part-1/
	- Comparing ABIs for Compatibility with libabigail – Part 2 - https://developers.redhat.com/blog/2014/10/28/comparing-abis-for-compatibility-libabigail-part-2/
	- Pruning Dynamic Rebuilds With libabigail
		- https://engineering.mongodb.com/post/pruning-dynamic-rebuilds-with-libabigail
		- https://github.com/acmorrow/abilink-demo
	- Talk: Libabigail: How semantic analysis of C and C++ ELF binaries can be used to analyze ABI changes (openSUSE Conference 2017)
		- https://media.ccc.de/v/1234-libabigail-how-semantic-analysis-of-c-and-c-elf-binaries-can-be-used-to-analyze-abi-changes
		- https://www.youtube.com/watch?v=wxVBuZK8Dl0
- abimap: A helper for library maintainers to use symbol versioning
	- https://github.com/ansasaki/abimap
	- Don't break your users: keep your API/ABI stable!
		- DevConf.CZ 2020; Anderson Sasaki
		- https://www.youtube.com/watch?v=tFuFO_bDke0
- pexcheck: Pexcheck is a command-line tool for checking the binary compatibility of public interfaces.
	- https://github.com/AVGTechnologies/pexcheck

#### Talks

- Analyzing changes to the binary interface exposed by the Kernel to its modules
	- Kernel Recipes 2019; Dodji Seketeli, Matthias Männich, Jessica Yu
	- https://kernel-recipes.org/en/2019/talks/analyzing-changes-to-the-binary-interface-exposed-by-the-kernel-to-its-modules/
- API & ABI versioning
	- Meeting C++ 2017; Mathieu Ropert
	- https://www.youtube.com/watch?v=k9PLRAnnEmE
- Binary compatibility for library developers
	- C++Now 2013; Thiago Macieira
	- https://www.youtube.com/watch?v=PHrXGHDd9no
	- https://github.com/boostcon/cppnow_presentations_2013/blob/master/tue/binary_compat_for_cpp_devs.pdf?raw=true
- Easy Binary Compatible C++ Interfaces Across Compilers
	- C++Now 2013; John Bandela
	- https://www.youtube.com/watch?v=BbbqBJ94-_E
	- PDF: https://github.com/boostcon/cppnow_presentations_2013/blob/master/tue/easy_binary_compat.pdf?raw=true
	- PPT: https://github.com/boostcon/cppnow_presentations_2013/blob/master/tue/easy_binary_compat.ppt?raw=true
	- https://jrb-programming.blogspot.com/2012/12/easy-binary-compatible-interfaces.html
	- https://github.com/jbandela/cppcomponents
	- https://github.com/jbandela/cross_compiler_call
- How to break an ABI and keep your users happy
	- CppCon 2017; Gennadiy Rozental
	- https://www.youtube.com/watch?v=NzaYUlAw93k
	- https://abseil.io/blog/20171023-cppcon-breaking-abi
- Linux User/Kernel ABI: the realities of how C and C++ programs really talk to the OS
	- ACCU 2018; Greg Law
	- https://www.youtube.com/watch?v=4CdmGxc5BpU
- Reversing C++
	- Black Hat USA 2007; Paul Vincent Sabanal, Mark Vincent Yason
	- https://www.blackhat.com/presentations/bh-dc-07/Sabanal_Yason/Presentation/bh-dc-07-Sabanal_Yason.pdf
	- https://www.blackhat.com/presentations/bh-dc-07/Sabanal_Yason/Paper/bh-dc-07-Sabanal_Yason-WP.pdf
	- Videos:
		- https://archive.org/details/2007_BlackHat_Vegas-V72-Yason-Sabanal-Reversing_C
		- https://www.youtube.com/watch?v=oJ3mOzD7rC8
		- 00: https://www.youtube.com/watch?v=Vy0z1baCh8s
		- 01: https://www.youtube.com/watch?v=1wZ615YlMFs
		- 02: https://www.youtube.com/watch?v=dcoNjUn_ACI
		- 03: https://www.youtube.com/watch?v=JZ8_QM-XM1k
- The ABI challenge
	- C++Now 2019; Arvid Norberg
	- https://www.youtube.com/watch?v=ncyQAjTyPwU
- The C++ ABI From the Ground Up
	- CppCon 2019; Louis Dionne
	- https://www.youtube.com/watch?v=DZ93lP1I7wU
- What's an ABI and why is it so complicated?
	- ACCU 2015; Jonathan Wakely
	- https://accu.org/content/conf2015/JonathanWakely-What%20Is%20An%20ABI%20And%20Why%20Is%20It%20So%20Complicated.pdf


---

# Bash

- ctypes.sh: a foreign function interface for bash
	- https://github.com/taviso/ctypes.sh

---

# Stata

- Stata commands for inline C++ code in do-files
	- https://github.com/robertgrant/statacpp
