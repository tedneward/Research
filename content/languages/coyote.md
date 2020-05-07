title=Coyote
tags=clr, language, research, static, compiled
summary=A statically-compiled research language from Microsoft around explicit state machine management.
~~~~~~

A set of libraries and tools for building reliable asynchronous software. [Website](https://microsoft.github.io/coyote/). [Github](https://github.com/microsoft/coyote/). Evolution of [P#](psharp.html). Part of [Microsoft Research](/places/msr.html).

#### Publications
[Reliable State Machines: A Framework for Programming Reliable Cloud Services](https://arxiv.org/abs/1902.09502): "Building reliable applications for the cloud is challenging because of unpredictable failures during a program’s execution. This paper presents a programming framework called Reliable State Machines (RSMs), that offers fault-tolerance by construction. Using our framework, a programmer can built an application as several (possibly distributed) RSMs that communicate with each other via messages, much in the style of actor-based programming. Each RSM is additionally fault-tolerant by design and offers the illusion of being “always-alive”. An RSM is guaranteed to process each input request exactly once, as one would expect in a failure-free environment. The RSM runtime automatically takes care of persisting state and rehydrating it on a failover. We present the core syntax and semantics of RSMs, along with a formal proof of failure-transparency.

We provide an implementation of the RSM framework and runtime on the .NET platform for deploying services to Microsoft Azure. We carried out an extensive performance evaluation on micro-benchmarks to show that one can build high-throughput applications with RSMs. We also present a case study where we rewrote a significant part of a production cloud service using RSMs. The resulting service has simpler code and exhibits production-grade performance."

