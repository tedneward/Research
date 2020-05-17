title=injectdso
summary=A collection of tools for injecting DSOs in processes under various operating systems.
tags=tool, native, windows, macos, android
~~~~~~

It currently consists of injectdll (for Microsoft Windows), injectdylib (for MacOS X) and injectoid (for Android). Support for Linux (injectso) is planned for the near future as well.

injectdso may be useful for tasks like:

* Discovering and testing sandbox escape exploits

* Testing properties of heap allocators on closed source applications

* Hooking higher-level programming language runtimes

...and probably many more.

[Github](https://github.com/huku-/injectdso)
