title=F#
tags=clr, functional, object, metaobject, fuzzy logic
summary=An object/functional hybrid language.
~~~~~~

"F# is a mature, open source, cross-platform, functional-first programming language. It empowers users and organizations to tackle complex computing problems with simple, maintainable and robust code."

[Website](https://fsharp.org/) | [Source](https://github.com/fsharp) | [Foundation](http://fsharp.org/) | [Official Docs](https://learn.microsoft.com/en-us/dotnet/fsharp/) ([PDF](https://learn.microsoft.com/en-us/dotnet/opbuildpdf/fsharp/toc.pdf?branch=live))

[Language Overview](http://tomasp.net/articles/fsharp-i-introduction/article.pdf) |  [Language Specification](https://fsharp.org/specs/language-spec/): [4.1](https://fsharp.org/specs/language-spec/4.1/FSharpSpec-4.1-latest.pdf) [4.0](https://fsharp.org/specs/language-spec/4.0/FSharpSpec-4.0-final.pdf) [3.1](https://fsharp.org/specs/language-spec/3.1/FSharpSpec-3.1-final.pdf) [3.0](https://fsharp.org/specs/language-spec/3.0/FSharpSpec-3.0-final.pdf) | Syntax Cheat Sheet: [HTML](http://dungpa.github.io/fsharp-cheatsheet/) [PDF](https://github.com/dungpa/fsharp-cheatsheet/raw/gh-pages/fsharp-cheatsheet.pdf)

Originally from [Microsoft Research](/places/msr).

F# was originally a CLR-based variant of [OCaml](../ocaml). Since F# 3.0, it has relaxed some of the direct compatibility with OCaml in favor of a friendlier syntax, but still very much holds to its roots.

[Wikibook](https://en.wikibooks.org/wiki/F_Sharp_Programming)

#### Uses

- [F# Companies](https://github.com/fsprojects/fsharp-companies)

#### Areas of use
[Cloud](https://fsharp.org/guides/cloud/): Cloud and SOA are places where F# has made some strong plays. | [Azure functions](https://blog.tamizhvendan.in/blog/2016/09/19/scale-up-azure-functions-in-f-number-using-suave/) | [Fog](https://github.com/dmohl/Fog) for creating Azure apps

[Web](https://fsharp.org/guides/web): There's a collection of different web frameworks for F#. Some are more recent than others.

* [Fable](../fable): A compiler powered by Babel designed to make F# a first-class citizen of the JavaScript ecosystem. See [The Elmish Book](https://zaid-ajaj.github.io/the-elmish-book/#/) for a practical guide on using Fable.

* [Sutil](https://github.com/davedawkins/Sutil):
    [Using Sutil to develop a real world application](https://hashset.dev/article/16_using_sutil_to_develop_a_real_world_application)

* [Suave](/libraries/suave)

[Mobile](https://fsharp.org/guides/mobile-apps): Most of this centers around Xamarin; lots of the links on the F#.org site are old (2013-era).

[Enterprise](https://fsharp.org/guides/enterprise): Mostly links about why F# is good in enterprise development. A few nuggets of goodness mixed in. [Domain Modeling and DDD in F#](http://fsharpforfunandprofit.com/ddd/), [Domain-Driven Design (DDD) With F# and EventStore](http://gorodinski.com/blog/2013/02/17/domain-driven-design-with-fsharp-and-eventstore/). 

[Data access](https://fsharp.org/guides/data-access/): Type providers are seriously powerful: [Accessing loosely structured data from F# and C#](http://tomasp.net/blog/goto-loosely-structured-data.aspx/index.html) [XML](http://fsharp.github.io/FSharp.Data/library/XmlProvider.html), [JSON](http://fsharp.github.io/FSharp.Data/library/JsonProvider.html), [SQL](http://msdn.microsoft.com/en-us/library/hh361033.aspx). Agents and message queues: [An Introduction To F# Agents](http://www.developerfusion.com/article/139804/an-introduction-to-f-agents/) | [Agents](http://fsharpforfunandprofit.com/posts/concurrency-actor-model/)

* [Data mining](http://fdatamining.blogspot.com/2012/12/a-reading-list-on-languages-in-ml-family.html)

Tools:

* [FAKE](https://fake.build/): Build tool DSL
* [PerfAvore](https://github.com/MokoSan/PerfAvore): Rule based performance analysis and monitoring tool for dotnet.

Games:

* [Nu game engine](https://github.com/bryanedds/Nu)

[Intellifactory](http://www.intellifactory.com/): Building functional, reactive, full-stack F# applications; [their blogs](https://intellifactory.com/blogs)

---

[Donald](https://github.com/pimbrouwers/Donald): A succinct F# DSL for ADO.NET.

[F# For Fun and Profit](https://fsharpforfunandprofit.com/) articles:

* [Parsing command-line arguments](https://fsharpforfunandprofit.com/posts/pattern-matching-command-line/)
* [Domain-Driven Design](https://fsharpforfunandprofit.com/ddd/)
* [Functional Programming Patterns](https://fsharpforfunandprofit.com/fppatterns/)
* [O-O Patterns from a Functional Perspective](http://gorodinski.com/blog/2013/09/18/oop-patterns-from-a-functional-perspective/)

[F# for Component Design Guidelines](https://fsharp.org/specs/component-design-guidelines/fsharp-design-guidelines-v14.pdf) | [Functional Design Patterns](https://www.slideshare.net/ScottWlaschin/fp-patterns-buildstufflt) | [Continuation Passing](http://www.fssnip.net/Z) | [F# and Design Patterns for C# Developers](https://www.microsoftpressstore.com/articles/article.aspx?p=2224057&seqNum=2)

[Domain modeling with types](https://blog.ploeh.dk/2016/11/28/easy-domain-modelling-with-types/) [Video](https://vimeo.com/97507575)

Some fuzzy logic examples:

* [Fuzzy Advisor](https://www.codeproject.com/Articles/30798/FuzzyAdvisor-A-Simple-Fuzzy-Logic-Expert-System-in)
* [Fuzzy Logic in F#](http://techneilogy.blogspot.com/2010/08/fuzzy-logic-in-f-now-more-functional.html)
* [Fuzzy Logic in F#, Example 1](http://techneilogy.blogspot.com/2010/08/fuzzy-logic-in-f-example-1.html)
* [Fuzzy Logic Experiments](http://techneilogy.blogspot.com/2010/08/fuzzy-logic-experiments-in-f.html)
* [Conjunctive Fuzzy Logic Rules in F#](http://techneilogy.blogspot.com/2010/08/conjunctive-fuzzy-logic-rules-in-f.html)

[FsharpX](https://www.developerfusion.com/article/136179/an-introduction-to-fsharpx/) | [F# PowerPack](https://archive.codeplex.com/?p=fsharppowerpack) | [fsxplat](https://archive.codeplex.com/?p=fsxplat)

[fsharpsamples (Archive)](https://archive.codeplex.com/?p=fsharpsamples)

[CarParking](https://github.com/serjKim/CarParking): A "real" web app written on F#.

