title=MicroQuickJS
tags=language, ecmascript
summary=A JavaScript engine targeted at embedded systems.
~~~~~~

[Source](https://github.com/bellard/mquickjs)

It compiles and runs JavaScript programs using as little as 10 kB of RAM. The whole engine requires about 100 kB of ROM (ARM Thumb-2 code) including the C library. The speed is comparable to QuickJS. MQuickJS only supports a subset of JavaScript close to ES5. It implements a stricter mode where some error prone or inefficient JavaScript constructs are forbidden. Although MQuickJS shares much code with QuickJS, it internals are different in order to consume less memory. In particular, it relies on a tracing garbage collector, the VM does not use the CPU stack and strings are stored in UTF-8.

