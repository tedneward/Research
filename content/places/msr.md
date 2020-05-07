title=Microsoft Resarch (MSR)
tags=website, research
summary=Microsoft's collection of research projects.
~~~~~~

Some notable things that have come from MSR:
* [F#](/languages/fsharp.html)
* [Cω](https://www.microsoft.com/en-us/research/project/comega/) ("C-omega"):"A strongly typed, data oriented programming language that bridges the gap between between semi-structured hierarchical data (XML), relational data (SQL), and the .NET Common Type System (CTS). In Cω, the seemingly different worlds of XML, SQL and CTS are bridged and connected through generalization, not specialization. Besides data integration, Cω extends the C# programming language with new asynchronous concurrency abstractions, based on the join calculus. The language presents a simple and powerful model of concurrency which is applicable both to multithreaded applications running on a single machine and to the orchestration of asynchronous, event-based applications communicating over a wide area network." Research halted. Served as the principal predecessor to LINQ in C#, which is a shame, because the XML- and SQL-based types were the vastly more interesting part of the language. Downloads don't appear to be available anywhere anymore.
* [Boogie](https://www.microsoft.com/en-us/research/project/boogie-an-intermediate-verification-language/) ([Github](https://github.com/boogie-org/boogie)): "Boogie is an intermediate verification language, intended as a layer on which to build program verifiers for other languages. Several program verifiers have been built in this way, including the VCC and HAVOC verifiers for C and the verifiers for Dafny, Chalice, and Spec#. A previous version of the language was called BoogiePL. The current language (version 2) is currently known as just Boogie, which is also the name of the verification tool that takes Boogie programs as input. Boogie is also the name of a tool. The tool accepts the Boogie language as input, optionally infers some invariants in the given Boogie program, and then generates verification conditions that are passed to an SMT solver."

Some current things to watch:
* [Bosque](/languages/bosque.html)
* [Coyote](/languages/coyote.html)
* [Checked C](/languages/checkedc.html)
* [Uncertain](/libraries/uncertainty.html)


