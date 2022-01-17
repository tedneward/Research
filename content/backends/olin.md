title=Olin
tags=backend, distribution, wasm
summary=Olin is like the JVM for WebAssembly. It wraps WebAssembly with a set of functions to access the outside world and keeps track of things like how many instructions were used, how many syscalls were made and how much memory was used.
~~~~~~

[Source](https://github.com/Xe/olin)

> Very frequently, I end up needing to write applications that basically end up waiting forever to make sure things get put in the right place and then the right code runs as a response. I then have to make sure these things get put in the right places and then that the right versions of things are running for each of the relevant services. This doesn't scale very well, not to mention is hard to secure. This leads to a lot of duplicate infrastructure over time and as things grow. Not to mention adding in tracing, metrics and log aggreation.

> I would like to make a prescriptive environment kinda like Google Cloud Functions or AWS Lambda backed by a durable message queue and with handlers compiled to webassembly to ensure forward compatibility. As such, the ABI involved will be versioned, documented and tested. Multiple ABI's will eventually need to be maintained in parallel, so it might be good to get used to that early on.

