title=GCC
tags=tool, native, windows, macos, linux, ios, android
summary=A C/C++ (and other languages) compiler toolchain. g++, gcc, objdump, nm
~~~~~~

[Website](https://gcc.gnu.org/)

[C++ Status](https://gcc.gnu.org/projects/cxx-status.html)

[Static analyzer options](/tools/gcc/static-analyzer)

[GCC Front-end HOWTO](https://tldp.org/HOWTO/GCC-Frontend-HOWTO.html): How to build a GCC front-end (so GCC can take care of the rest)

## Viewing exported symbols from executables

### `readelf`


```
$ readelf -s lib.so
Symbol table '.dynsym' contains 8 entries:
   Num:    Value          Size Type    Bind   Vis      Ndx Name
     0: 0000000000000000     0 NOTYPE  LOCAL  DEFAULT  UND 
     1: 0000000000000000     0 NOTYPE  WEAK   DEFAULT  UND _ITM_deregisterT[...]
     2: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND puts@GLIBC_2.2.5 (2)
     3: 0000000000000000     0 NOTYPE  WEAK   DEFAULT  UND __gmon_start__
     4: 0000000000000000     0 NOTYPE  WEAK   DEFAULT  UND _ITM_registerTMC[...]
     5: 0000000000000000     0 FUNC    WEAK   DEFAULT  UND [...]@GLIBC_2.2.5 (2)
     6: 000000000000111f    22 FUNC    GLOBAL DEFAULT   12 lib_exported2
     7: 0000000000001109    22 FUNC    GLOBAL DEFAULT   12 lib_exported1
...
```

### `objdump`

```
$ objdump -T lib.so
lib.so:     file format elf64-x86-64
DYNAMIC SYMBOL TABLE:
0000000000000000  w   D  *UND*	0000000000000000  Base        _ITM_deregisterTMCloneTable
0000000000000000      DF *UND*	0000000000000000  GLIBC_2.2.5 puts
0000000000000000  w   D  *UND*	0000000000000000  Base        __gmon_start__
0000000000000000  w   D  *UND*	0000000000000000  Base        _ITM_registerTMCloneTable
0000000000000000  w   DF *UND*	0000000000000000  GLIBC_2.2.5 __cxa_finalize
000000000000111f g    DF .text	0000000000000016  Base        lib_exported2
0000000000001109 g    DF .text	0000000000000016  Base        lib_exported1
```

Does not demangle C++ names unless passed the `--demangle`` flag.

### `nm`

```
$ nm -D --demangle lib.so
                 w __cxa_finalize@GLIBC_2.2.5
                 w __gmon_start__
                 w _ITM_deregisterTMCloneTable
                 w _ITM_registerTMCloneTable
                 U puts@GLIBC_2.2.5
0000000000001109 T lib_exported1()
000000000000111f T lib_exported2()
```

Does not demangle C++ names unless passed `--demangle`` flag.
