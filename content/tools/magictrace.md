title=Magic-trace
tags=tool
summary=High-resolution traces of what a process is doing
~~~~~~

[Website](https://magic-trace.org/) | [Source](https://github.com/janestreet/magic-trace)

magic-trace only supports Linux. It relies on perf, which is Linux specific. We do not think this is a fundamental limitation of magic-trace, and would welcome patches to support other operating systems.

magic-trace relies on Intel Processor Trace, which only really starts to be functional on relatively recent Intel CPUs. That means it doesn't support ARM, and it doesn't support AMD.

