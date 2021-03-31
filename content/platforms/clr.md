title=CLR
tags=clr, platform, vm
summary=A stack-based bytecode virtual machine.
~~~~~~

The CLR platform.

CLR/CLI Language lists: [CLI Languages - Wikipedia, the free encyclopedia](http://en.wikipedia.org/wiki/CLI_Languages) | [List of CLI languages - Wikipedia, the free encyclopedia](http://en.wikipedia.org/wiki/List_of_CLI_languages) | [.NET Powered](https://bitbucket.org/brianritchie/wiki/wiki/.NET%20Languages)

CLR/CLI Specifications: [ECMA-335 Specification page](https://www.ecma-international.org/publications/standards/Ecma-335.htm) | [PDF](https://www.ecma-international.org/publications/files/ECMA-ST/ECMA-335.pdf)

.NET Core repositories: [Runtime](https://github.com/dotnet/runtime) | [Roslyn](https://github.com/dotnet/roslyn) | [F#](https://github.com/dotnet/fsharp) | [WinForms](https://github.com/dotnet/winforms) | [SDK](https://github.com/dotnet/sdk) | [CLI](https://github.com/dotnet/cli) | [ASP.NET Core](https://github.com/dotnet/aspnetcore) | [WPF](https://github.com/dotnet/wpf) | [EFCore](https://github.com/dotnet/efcore) | [Tye](https://github.com/dotnet/tye) | [C#](https://github.com/dotnet/csharplang)

There used to be multiple CLR implementations, but all have more or less fallen into disuse and disrepair. CoreCLR and the Windows CLR are the only ones left standing.

### Related posts
[Open-source CLR Instrumentation Engine](https://www.poppastring.com/blog/open-source-clr-instrumentation-engine) (and on [Github](https://github.com/microsoft/CLRInstrumentationEngine))

[.NET Memory Performance Analysis](https://github.com/Maoni0/mem-doc/blob/master/doc/.NETMemoryPerformanceAnalysis.md)



--- 
# CLR-to-X interoperability

## CLR-to-JVM
[IKVM](https://www.ikvm.net/): IKVM.NET is an implementation of Java for Mono and the Microsoft .NET Framework.

### CLR-native bindings/libraries/tools
[CppAst](https://github.com/xoofx/CppAst): a .NET library providing a C/C++ parser for header files powered by Clang/libclang with access to the full AST, comments and macros; also see [CppAst.CodeGen](https://github.com/xoofx/CppAst.CodeGen)
