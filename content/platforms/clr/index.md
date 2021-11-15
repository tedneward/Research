title=CLR
tags=clr, platform, vm
summary=A stack-based bytecode virtual machine.
~~~~~~

The CLR platform. [VM Specifications](/vms/clr/specifications) | [Interoperability](clr/interoperability)

CLR/CLI Language lists: [CLI Languages - Wikipedia, the free encyclopedia](http://en.wikipedia.org/wiki/CLI_Languages) | [List of CLI languages - Wikipedia, the free encyclopedia](http://en.wikipedia.org/wiki/List_of_CLI_languages) | [.NET Powered](https://bitbucket.org/brianritchie/wiki/wiki/.NET%20Languages)

Source repositories for various parts of the CLR platform:

* [C#](https://github.com/dotnet/csharplang): mainstream OO language
* [F#](https://github.com/dotnet/fsharp): object/functional hybrid language
* [WinForms](https://github.com/dotnet/winforms): "legacy" (Win32-based) UI framework for Windows
* [ASP.NET Core](https://github.com/dotnet/aspnetcore): a server-side Web framework
* [WPF](https://github.com/dotnet/wpf): Windows Presentation Foundation
* [EFCore](https://github.com/dotnet/efcore): Entity Framework Core, an O/R-M
* [MAUI](https://github.com/dotnet/maui): NET Multi-platform App UI, a framework for building native device applications spanning mobile, tablet, and desktop

There used to be multiple CLR implementations, but all have more or less fallen into disuse and disrepair. [.NET Core (CoreCLR)](../dotnetcore) and the Windows CLR are the only ones left standing, though Mono is technically still a "thing" with its incorporation as part of Microsoft it's hard to see how it will remain independent of the CoreCLR for long. See the [CoreCLR VM page](/vms/coreclr) for implementation details.

[.NET Micro Framework Interpreter](https://github.com/NETMF/netmf-interpreter); part of [a larger set of NETMF repos](https://github.com/NETMF) that includes an (old?) set of [LLVM bindings for .NET](https://github.com/NETMF/Llvm.NET) which has since moved to [Ubiquity.NET](https://github.com/UbiquityDotNET/Llvm.Net)

[Ubiquity.NET](https://github.com/UbiquityDotNET): Building .NET support for ubiquitous computing devices

## Performance
[Open-source CLR Instrumentation Engine](https://www.poppastring.com/blog/open-source-clr-instrumentation-engine) (and on [Github](https://github.com/microsoft/CLRInstrumentationEngine))

[.NET Memory Performance Analysis](https://github.com/Maoni0/mem-doc/blob/master/doc/.NETMemoryPerformanceAnalysis.md); part of a larger [document about .NET memory analysis and diagnostics](https://github.com/Maoni0/mem-doc)

[Infographics](https://leveluppp.ghost.io/net-infographics/): Collection of "isn't this surprising" infographics about .NET

## Tools
[PowerUp](https://github.com/badamczewski/PowerUp): Decompilation Tools and High Productivity Utilities. The purpose of this library is to provide productivity utilities and tools such as: Live IDE Watcher. JIT Dissasembler. IL Compiler. Quick Benchmark. Console with rich formatting.

[realmon](https://github.com/maoni0/realmon): A monitoring tool that tells you when GCs happen in a process and some characteristics about these GCs

