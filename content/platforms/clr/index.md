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

[Silhouette](https://github.com/kevingosse/Silhouette):

Reading: [Creating a .NET CLR profiler using C# and NativeAOT with Silhouette](https://andrewlock.net/creating-a-dotnet-profiler-using-csharp-with-silhouette/), https://minidump.net/writing-a-net-profiler-in-c-part-5/

## Tools
[PowerUp](https://github.com/badamczewski/PowerUp): Decompilation Tools and High Productivity Utilities. The purpose of this library is to provide productivity utilities and tools such as: Live IDE Watcher. JIT Dissasembler. IL Compiler. Quick Benchmark. Console with rich formatting.

[realmon](https://github.com/maoni0/realmon): A monitoring tool that tells you when GCs happen in a process and some characteristics about these GCs

## Reading

### Articles
.NET Internals:
- [A brief introduction to the .NET muxer (dotnet.exe)](https://www.stevejgordon.co.uk/a-brief-introduction-to-the-dotnet-muxer)
- [How dotnet.exe resolves and loads the hostfxr library – Exploring the .NET muxer](https://www.stevejgordon.co.uk/how-dotnet-muxer-resolves-and-loads-the-hostfxr-library)

[Exploring the .NET Boot Process via host tracing](https://andrewlock.net/exploring-the-dotnet-boot-process-via-host-tracing/)

Exploring the .NET 10 Preview:
- Part 8: [Supporting platform-specific .NET tools on old .NET SDKs](https://andrewlock.net/exploring-dotnet-10-preview-features-8-supporting-platform-specific-dotnet-tools-on-old-sdks/)
- Part 9: [Easier Reflection with UnsafeAccessorType in .NET 10](https://andrewlock.net/exploring-dotnet-10-preview-features-9-easier-reflection-with-unsafeaccessortype/)

[Using Named Pipes in C# for Interprocess Communication](https://dev.to/volkanalkilic/using-named-pipes-in-c-for-interprocess-communication-4kp1): 

- Named Pipe server:

    ```c#
    using (var server = new NamedPipeServerStream("my_pipe_name"))
    {
        Console.WriteLine("Waiting for client connection...");
        server.WaitForConnection();
        Console.WriteLine("Client connected.");

        // Read and write data through the pipe
    }
    ```

- Client:

    ```c#
    using (var client = new NamedPipeClientStream(".", "my_pipe_name", PipeDirection.InOut))
    {
        Console.WriteLine("Connecting to server...");
        client.Connect();
        Console.WriteLine("Connected to server.");

        // Read and write data through the pipe
    }
    ```

[Programmatically Convert HTML to PDF in .NET Core C# Without Dependencies](https://dev.to/grapecity/programmatically-convert-html-to-pdf-in-net-core-c-without-dependencies-76f): "... we will learn about the new GcHtml package, tips for migrating from the old to the new GcHtml package, and finally, explore how to use the new GcHtml package for converting HTML to PDF. GcHtml uses a Chrome or Edge browser (already installed in the current system or downloaded from a public website) in headless mode and interacts with it using the WebSocket protocol."

["Track your coding progress on GitHub with a .NET Worker Service"](https://dev.to/sannae/track-my-coding-progress-on-github-with-a-net-worker-service-49g4)
