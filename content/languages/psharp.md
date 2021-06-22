title=P#
type=page
tags=clr, language
status=published
summary=A statically-compiled research language from Microsoft around explicit state machine management.
~~~~~~

Research language from Microsoft. Related to [P](/languages/p). [Github](https://github.com/p-org/PSharp). Deprecated and now moved to [Coyote](/languages/coyote).

From the Github repo:

The P# framework provides:

* An actor-based programming model for building event-driven asynchronous applications. The unit of concurrency in P# is an asynchronous communicating state-machine, which is basically an actor that can create new machines, send and receive events, and transition to different states. Using P# machines, you can express your design and code at a higher level that is a natural fit for many cloud services.
* An efficient, lightweight runtime that is build on top of the Task Parallel Library (TPL). This runtime can be used to deploy a P# program in production. The P# runtime is very flexible and can work with any communication and storage layer.
* The capability to easily write safety and liveness specifications (similar to TLA+) programmatically in C#.
* A systematic testing engine that can control the P# program schedule, as well as all declared sources of nondeterminism (e.g. failures and timeouts), and systematically explore the actual executable code to discover bugs (e.g. crashes or specification violations). If a bug is found, the P# testing engine will report a deterministic reproducible trace that can be replayed using the Visual Studio Debugger.
