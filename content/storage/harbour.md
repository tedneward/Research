title=Harbour
tags=language, storage, native
summary=Portable, xBase compatible programming language and environment.
~~~~~~

Harbour consists of a compiler and runtime libraries with multiple UI and database backends, its own make system and a large collection of libraries and interfaces to many popular APIs.

[Website](https://harbour.github.io/) | [Source](https://github.com/harbour/core) | [Wiki](https://harbour.wiki/)

Last stable release (3.0.0), in 2011.

Transpiles to C, but also has a runtime that can execute embedded code/instructions ("PCODE"), which can be either in a binary format or a source format.

## FAQ

#### What is Harbour?
Harbour is an open-source implementation of a xBase computer language, that is compatible on any platforms supporting C based applications, meaning MS Windows, Mac OS, Linux, Unix,  iOS, and can generate 32-bit and 64-bit applications and libraries.
xBase is the generic term for all programming languages that derive from the original dBASE programming language and database formats (https://en.wikipedia.org/wiki/XBase) that was first released in 1979. Harbour is classified as a 4GL language since its compiler generates pure C source code. Harbour-generated applications are self-contained, meaning they do not require external runtime libraries. Harbour programs can be compiled to use an embedded VM (virtual machine including in final EXE), or without any VM (could run faster but bigger executable). Harbour has an embedded “stand-by” compiler that is similar to VFP’s macros.
Harbour can be classified as an object-oriented, functional and data-centric language that also supports procedures and functions. Harbour can also generate multi-threaded applications, such as web and socket servers. Virtually any C libraries can be embedded with Harbour.

#### Where does it come from?
The original Harbour implementation was started in 1999 as a 100% clone of Clipper, a defunct language that was a compiler version of dBase. During the last 20 years, Harbour went through majors changes, in part due to a forked version called xHarbour. Most features of xHarbour, a commercial fork, are now re-implemented in Harbour, for the exception of a form builder (closer to FoxPro for Windows than VFP). Most of the development of Harbour was done by a handful of extremely skilled C developers. All the source code and contributor information can be found on GitHub at https://github.com/harbour/core

#### What could Harbour be used for?
Since Harbour generates pure C code and has a powerful preprocessor, any other C code and libraries can be merged in. You can even write C code inside your PRG files.

Harbour can be used to create Desktop apps, Web apps, COM objects (32-bit and 64-bit), and device-drivers. I even saw someone compile Harbour with Objective-C and create a native iOS app, and another person created a WebAssembly.

#### How does Harbour work?
Harbour is a language and a series of tools. Its syntax is originally from Clipper but has evolved to include all other modern language features like OOP, Hash Arrays (Python Dictionaries), UTF8 support, multi-threading, multi-OS support. Harbour has its root in C, which means that most of the C tooling is also in Harbour. It has a preprocessor, a compiler, a make tool (optional) and a debugger (replaceable). It does not have a CLI, but Visual Code can be used to facilitate rapid prototyping and debugging.

## Examples

Hello world

```
// Typical welcome message

PROCEDURE Main()

   ? "Hello, world!"

   RETURN
```

Interesting example using two (!) console windows simultaneously

```
/*
 * demonstration/test code for using more then one console window.
 *    It needs GT driver which supports such functionality, i.e.
 *    GTWVT in MS-Windows or GTXWC in XWindow.
 *
 * Copyright 2008 Przemyslaw Czerpak <druzus / at / priv.onet.pl>
 *
 */

#include "box.ch"

#ifdef __PLATFORM__WINDOWS
   #if ! defined( __HBSCRIPT__HBSHELL )
      REQUEST HB_GT_WVT_DEFAULT
   #endif
   #define THREAD_GT "WVT"
#else
   REQUEST HB_GT_STD_DEFAULT
   #define THREAD_GT "XWC"
#endif

proc main()
   local pGT, pGT1, pGT2

#if defined( __HBSCRIPT__HBSHELL )
   #if defined( __PLATFORM__WINDOWS )
      hbshell_gtSelect( "GTWVT" )
   #elif defined( __PLATFORM__UNIX )
      hbshell_gtSelect( "GTXWC" )
   #endif
#endif

   ? "This is small test for using more then one console window."
   ? "It needs GT which supports such functionality i.e. GTWVT in"
   ? "MS-Windows or GTXWC in XWindow"
   wait

   ? "Create two new GTs:"
   pGT1 := hb_gtCreate( THREAD_GT )
   ? "1 =>", pGT1
   pGT2 := hb_gtCreate( THREAD_GT )
   ? "2 =>", pGT1

   pGT := hb_gtSelect( pGT1 )
   SetColor( "W+/R" )
   DispBox( 10, 10, 20, 50, HB_B_DOUBLE_UNI + " " )
   ?? "This test is shown in 1-st GT window"

   hb_gtSelect( pGT2 )
   SetColor( "W+/B" )
   DispBox( 15, 30, 20, 70, HB_B_DOUBLE_UNI + " " )
   ?? "This test is shown in 2-nd GT window"

   hb_gtSelect( pGT )
   ? "New console window should be visible now"
   wait

   ? "Destroy 1-st window..."
   pGT1 := NIL
   ?? "done"
   wait

   ? "Destroy 2-nd window..."
   pGT2 := NIL
   ?? "done"

   wait "Press any key to exit"

return
```

## Other sources

* [Wiki](https://harbour.wiki/): A collection of articles on Harbour and surrounds

