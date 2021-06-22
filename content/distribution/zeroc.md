title=ZeroC
tags=distribution, library
summary=Comprehensive RPC framework with support for C++, C#, Java, JavaScript, Python and more.
~~~~~~

[Website](https://zeroc.com/downloads/ice) | [Source](https://github.com/zeroc-ice/ice) | [Manual](https://doc.zeroc.com/ice/3.7/) ([PDF](https://zeroc.com/download/Ice/3.7/Ice-3.7.1.pdf))

Binary object-RPC-ish framework for cross-platform distributed object scenarios:

> The Internet Communications Engine (Ice) is an object-oriented RPC framework that helps you build distributed applications with minimal effort. Ice allows you to focus your efforts on your application logic, and it takes care of all interactions with low-level network programming interfaces. With Ice, there is no need to worry about details such as opening network connections, serializing and deserializing data for network transmission, or retrying failed connection attempts.

? The main design goals of Ice are:

> * Provide an object-oriented RPC framework suitable for use in heterogeneous environments.
> * Provide a full set of features that support development of realistic distributed applications for a wide variety of domains.
> * Avoid unnecessary complexity, making the platform easy to learn and to use.
> * Provide an implementation that is efficient in network bandwidth, memory use, and CPU overhead.
> * Provide an implementation that has built-in security, making it suitable for use over insecure public networks.

> In simpler terms, the Ice design goals could be stated as "Let's build a powerful middleware platform that makes the developer's life easier."

IDL-based workflow (write an IDL definition, generate client-side and server-side proxies/stubs from the IDL) using "Slice" language for the IDL:

```
module Demo
{
    interface Printer
    {
        void printString(string s);
    }
}
```

Definition-only still, though it supports `structs` (pass-by-value) and `class` (pass-by-reference) user-defined types.
