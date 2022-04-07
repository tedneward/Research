title=CoreCLR
tags=vm, clr
summary=The VM implementation of .NET Core
~~~~~~

[Source](https://github.com/dotnet/runtime)

[SSCLI Essentials](../sscli-essentials) is a good place to start to understand the CLR itself.

["Book of the Runtime"](https://github.com/dotnet/coreclr/tree/master/Documentation/botr): Guides to the internals of .NET Core. Anything in here that conflicts with SSCLI Essentials should be considered the more accurate of the two.

[corehost.exe runtime assembly resolution](https://github.com/dotnet/cli/blob/rel/1.0.0/Documentation/specs/corehost.md) (Note that the `cli` repo has been pulled into the `sdk` repo now, so it's not clear how accurate this link is at this point)

## List of blog posts that provide a 'deep-dive' into the CoreCLR source code

- ["How the `dotnet` CLI runs your code"](https://mattwarren.org/2016/07/04/How-the-dotnet-CLI-tooling-runs-your-code/): Great breakdown of how the `dotnet` tool works, particular emphasis to the environment variables mentioned (`COREHOST_TRACE` and `DOTNET_CLI_CAPTURE_TIMING`)

### Posts that take a high-level overview of releases

- [Corestart 2.0: What's new for performance in .NET Core 2.0](https://www.ageofascent.com/2017/11/05/perfromance-dotnet-core-2-corestart-conference/)
- [Performance improvements in .NET Core 2.0](https://devblogs.microsoft.com/dotnet/performance-improvements-in-net-core/)
- [Performance improvements in .NET Core 2.1](https://devblogs.microsoft.com/dotnet/performance-improvements-in-net-core-2-1/)
- [Performance improvements in .NET Core 3.0](https://devblogs.microsoft.com/dotnet/performance-improvements-in-net-core-3-0/)
- [Performance improvements in .NET 5](https://devblogs.microsoft.com/dotnet/performance-improvements-in-net-5/)

### Posts that take a high-level look at the entire source:

- [A Hitchhikers Guide to the CoreCLR Source Code](http://mattwarren.org/2017/03/23/Hitchhikers-Guide-to-the-CoreCLR-Source-Code/)
- [The 68 things the CLR does before executing a single line of your code](http://mattwarren.org/2017/02/07/The-68-things-the-CLR-does-before-executing-a-single-line-of-your-code/)
- [Research papers in the .NET source](http://mattwarren.org/2016/12/12/Research-papers-in-the-.NET-source/)

### Posts that reference specific parts of the source:

- [A look at the internals of 'boxing' in the CLR](http://mattwarren.org/2017/08/02/A-look-at-the-internals-of-boxing-in-the-CLR/)
- [Memory Usage Inside the CLR](http://mattwarren.org/2017/07/10/Memory-Usage-Inside-the-CLR/)
- [How the .NET Runtime loads a Type](http://mattwarren.org/2017/06/15/How-the-.NET-Rutime-loads-a-Type/)
- [Adding a new Bytecode Instruction to the CLR](http://mattwarren.org/2017/05/19/Adding-a-new-Bytecode-Instruction-to-the-CLR/) (Peter Drayton did this back in the first release of Rotor, and did several conference talks on it; unfortunately his materials were sort of lost to the world when he went into hiding inside Microsoft)
- [Arrays and the CLR - a Very Special Relationship](http://mattwarren.org/2017/05/08/Arrays-and-the-CLR-a-Very-Special-Relationship/)
- [The CLR Thread Pool 'Thread Injection' Algorithm](http://mattwarren.org/2017/04/13/The-CLR-Thread-Pool-Thread-Injection-Algorithm/)
- [The .NET IL Interpreter](http://mattwarren.org/2017/03/30/The-.NET-IL-Interpreter/)
- [How do .NET delegates work?](http://mattwarren.org/2017/01/25/How-do-.NET-delegates-work/)
- [Why is reflection slow?](http://mattwarren.org/2016/12/14/Why-is-Reflection-slow/)
- [Preventing .NET Garbage Collections with the TryStartNoGCRegion API](http://mattwarren.org/2016/08/16/Preventing-dotNET-Garbage-Collections-with-the-TryStartNoGCRegion-API/)
- [GC Pauses and Safe Points](http://mattwarren.org/2016/08/08/GC-Pauses-and-Safe-Points/)
- [Strings and the CLR - a Special Relationship](http://mattwarren.org/2016/05/31/Strings-and-the-CLR-a-Special-Relationship/)


