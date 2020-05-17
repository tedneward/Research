title=The Witchcraft Compiler Collection  
summary=A collection of compilation tools to perform binary black magic on the GNU/Linux and other POSIX platforms.
tags=tool, language, library, native, linux, windows, elf, pe
~~~~~~

[User manual](https://github.com/endrazine/wcc/wiki)

wld: The Witchcraft Linker
    - wld takes an ELF executable as an input and modifies it to create a shared library.

wcc: The Witchcraft Compiler
    - The wcc compiler takes binaries (ELF, PE, ...) as an input and creates valid ELF binaries as an output. It can be used to create relocatable object files from executables or shared libraries.

wsh: The Witchcraft shell
    - The witchcraft shell accepts ELF shared libraries, ELF ET_DYN executables and Witchcraft Shell Scripts written in Punk-C as an input. It loads all the executables in its own address space and makes their API available for programming in its embedded interpreter. This provides for binaries functionalities similar to those provided via reflection on languages like Java.

wldd: print shared libraries compilation flags

wcch: generate C headers from binaries

[Github](https://github.com/endrazine/wcc)
