title=Tracing (in software) reading
tags=native, linux, windows, reading
summary=A collection of links and resources on tracing through programs in assistance of debugging.
~~~~~~

[Debug your programs like they're closed source! (strace, ltrace)](https://jvns.ca/blog/2014/04/20/debug-your-programs-like-theyre-closed-source/)

[Hidden in Plain Sight](https://queue.acm.org/detail.cfm?id=1117401): ACM Queue 4(1) (2006); Bryan Cantrill
 
[Multi-scale navigation of large trace data: A survey](https://publications.polymtl.ca/2980/)
	- Concurrency and Computation: Practice and Experience, 29(10) 2017
	- Ezzati-Jivan, N. & Dagenais, M. R

[Survey and Analysis of Kernel and Userspace Tracers on Linux: Design, Implementation, and Overhead](https://dl.acm.org/citation.cfm?id=3158644)
	- ACM Computing Surveys (CSUR) Volume 51 Issue 2, March 2018
	- Mohamad Gebai, Michel R. Dagenais

[SynchroTrace](https://github.com/VANDAL/SynchroTrace-gem5):
	- http://vlsi.ece.drexel.edu/index.php?title=SynchroTrace
	- https://sites.tufts.edu/tcal/current-research-projects/synchrotrace/
	- Synchronization-Aware Architecture-Agnostic Traces for Lightweight Multicore Simulation of CMP and HPC Workloads
		- 2018 ACM Transactions on Architecture and Code Optimization (TACO) 15(1)
		- http://vlsi.ece.drexel.edu/images/b/b1/ST_2018.pdf
	- SynchroTrace: Synchronization-aware Architecture-agnostic Traces for Light-Weight Multicore Simulation
		- 2015 IEEE International Symposium on Performance Analysis of Systems and Software (ISPASS)
		- http://dpac.ece.drexel.edu/wp-content/uploads/2013/04/SynchroTrace.pdf

## Hardware Assistance / Processor Tracing

- Hardware-assisted instruction profiling and latency detection
	- The Journal of Engineering, Volume 2016, Issue 10
	- Suchakrapani Datt Sharma, Michel Dagenais
	- https://digital-library.theiet.org/content/journals/10.1049/joe.2016.0127
- Hardware-assisted software event tracing
	- Concurrency and Computation: Practice and Experience, 29(10) 2017
	- Vergé, A., Ezzati-Jivan, N. & Dagenais, M. R.
	- https://publications.polymtl.ca/2981/
- Hardware trace reconstruction of runtime compiled code
	- Software: Practice and Experience 2018
	- Sharma, S.D. & Dagenais, M.R.
	- https://doi.org/10.1002/spe.2567
- Hardware Tracing for Fast and Precise Performance Analysis
	- 2015; Suchakra Sharma
	- https://thenewstack.io/hardware-tracing-fast-precise-performance-analysis/
- In-Depth System Analysis Using Hardware-Assisted Tracing
	- https://www.sigarch.org/in-depth-system-analysis-using-hardware-assisted-tracing/
- Low-Impact System Performance Analysis Using Hardware Assisted Tracing Techniques
	- 2017 PhD thesis; Sharma, S. D.
	- https://publications.polymtl.ca/2485/
	- https://publications.polymtl.ca/2485/1/2017_SuchakrapaniDattSharma.pdf
- Low Overhead Hardware-Assisted Virtual Machine Analysis and Profiling
	- 2016 IEEE Globecom Workshops
	- Sharma, S. D., Bastien, G., Nemati, H. & Dagenais, M.
	- https://publications.polymtl.ca/2975/1/2016_Sharma_Low_overhead_hardware-assisted_virtual_machive.pdf
- libbts.c: minimal BTS tracing wrapper for Linux Perf
	- https://gist.github.com/pkhuong/1ce34e33c6df4b9be3bc9beb22415a47
- Andi Kleen's Intel Processor Trace resources
	- http://halobates.de/blog/p/406
	- http://web.archive.org/http://halobates.de/blog/p/406
	- Cheat sheet for Intel Processor Trace with Linux perf and gdb
		- https://halobates.de/blog/p/410
		- http://web.archive.org/http://halobates.de/blog/p/410
	- Simple-PT: Simple Intel CPU processor tracing on Linux
		- https://github.com/andikleen/simple-pt
- Intel Processor Trace
	- Enhance performance analysis with Intel Processor Trace - https://easyperf.net/blog/2019/08/23/Intel-Processor-Trace
	- Better debugging experience - https://easyperf.net/blog/2019/08/30/Intel-PT-part2
	- Analyzing performance glitches - https://easyperf.net/blog/2019/09/06/Intel-PT-part3
	- Better profiling experience - https://easyperf.net/blog/2019/09/13/Intel-PT-part4
- Failure Sketches: A Better Way to Debug
	- HotOS 2015
	- Baris Kasikci, Benjamin Schubert, Cristiano Pereira, Gilles Pokam, Madan Musuvathi, George Candea 
	- https://www.usenix.org/conference/hotos15/workshop-program/presentation/kasikci
	- http://dslab.epfl.ch/pubs/failure-sketches.pdf
	- https://web.eecs.umich.edu/~barisk/public/fs-slides.pdf
- Failure Sketching: A Technique for Automated Root Cause Diagnosis of In-Production Failures
	- Symposium on Operating Systems Principles (SOSP) 2015
	- Baris Kasikci, Benjamin Schubert, Cristiano Pereira, Gilles Pokam, George Candea
	- https://www.youtube.com/watch?v=99hXVFe33w8
	- http://dslab.epfl.ch/proj/gist/
	- http://dslab.epfl.ch/pubs/gist.pdf
	- https://web.eecs.umich.edu/~barisk/public/gist-slides.pdf
	- https://blog.acolyer.org/2015/10/12/failure-sketching-a-technique-for-automated-root-cause-diagnosis-of-in-production-failures/
- Fuzzing
	- Internals of Hongfuzz - Intel PT
		- https://tunnelshade.in/blog/2018/09/hongfuzz-intel-pt-instrumentation/
	- PTrix: Efficient Hardware-Assisted Fuzzing for COTS Binary
		- 2019 Asia Conference on Computer and Communications Security (AsiaCCS)
		- Yaohui Chen, Dongliang Mu, Jun Xu, Zhichuang Sun, Wenbo Shen, Xinyu Xing, Long Lu, Bing Mao
		- https://arxiv.org/abs/1905.10499
		- https://github.com/junxzm1990/afl-pt
	- WinAFL Intel PT mode
		- https://github.com/googleprojectzero/winafl/blob/master/readme_pt.md
- Intel PT Micro Tutorial - MICRO-48 (2015)
	- https://sites.google.com/site/intelptmicrotutorial/
- libipt - an Intel(R) Processor Trace decoder library
	- https://github.com/01org/processor-trace
	- https://github.com/intel/libipt
- Linux perf Documentation: Intel Processor Trace
	- https://github.com/torvalds/linux/blob/master/tools/perf/Documentation/intel-pt.txt
- Inferring Fine-grained Control Flow Inside SGX Enclaves with Branch Shadowing
	- https://arxiv.org/abs/1611.06952
	- https://www.usenix.org/conference/usenixsecurity17/technical-sessions/presentation/lee-sangho
	- "Table 1: Measuring branch misprediction penalty with RDTSCP, Intel PT CYC packet, and LBR elapsed cycle (10,000 times). We put 120 NOP instructions at the fall-through path. The LBR elapsed cycle is less noisy than RDTSCP and Intel PT."
- POMP: Postmortem Program Analysis with Hardware-Enhanced Post-Crash Artifacts
	- USENIX Security 2017
	- Jun Xu, Dongliang Mu, Xinyu Xing, Peng Liu, Ping Chen, Bing Mao
	- https://www.usenix.org/conference/usenixsecurity17/technical-sessions/presentation/xu-jun
	- https://github.com/junxzm1990/pomp
- Processor-Tracing Guided Region Formation in Dynamic Binary Translation
	- ACM Transactions on Architecture and Code Optimization (TACO) 15(4):52 (2018)
	- Ding-Yong Hong, Jan-Jan Wu, Yu-Ping Liu, Sheng-Yu Fu, Wei-Chung Hsu
	- https://dl.acm.org/citation.cfm?id=3281664
	- paper: https://www.iis.sinica.edu.tw/papers/wuj/22203-F.pdf
	- slides: https://www.iis.sinica.edu.tw/papers/wuj/22189-A.pdf
- SATT Software Analyze Trace Tool
	- Experimental Linux SW tool to trace, process and analyze full stack SW traces utilizing Intel HW tracing block Intel PT (Intel Processor Trace).
	- https://github.com/01org/satt
- Towards Production-Run Heisenbugs Reproduction on Commercial Hardware
	- USENIX Annual Technical Conference (ATC) 2017
	- Shiyou Huang, Bowen Cai, Jeff Huang
	- https://www.usenix.org/conference/atc17/technical-sessions/presentation/huang
- WinIPT: Windows Library for Intel Process Trace
	- https://github.com/ionescu007/winipt
- Windows Intel PT Support
	- This driver implements the Intel Processor Trace functionality in Intel Skylake architecture for Microsoft Windows.
	- https://github.com/intelpt/WindowsIntelPT
	- Harnessing Intel Processor Trace on Windows for Vulnerability Discovery
		- Richard Johnson - http://moflow.org/
		- http://moflow.org/Presentations/Harnessing%20Intel%20Processor%20Trace%20on%20Windows%20for%20Vulnerability%20Discovery%20-%20rjohnson.pdf
		- HITB2017AMS
		- https://www.youtube.com/watch?v=r8lzui24Cdw
		- http://conference.hitb.org/hitbsecconf2017ams/materials/D1T1%20-%20Richard%20Johnson%20-%20Harnessing%20Intel%20Processor%20Trace%20on%20Windows%20for%20Vulnerability%20Discovery.pdf

---

# Software

- barectf: Generator of ANSI C tracers which output CTF
	- a command-line generator of ANSI C tracers which output Common Trace Format packets natively
	- https://github.com/efficios/barectf
- Drltrace: library calls tracer for Windows and Linux applications
	- https://github.com/mxmssh/drltrace
	- https://www.slideshare.net/MaximShudrak/tricky-sample-hack-it-easy-applying-dynamic-binary-inastrumentation-to-lightweight-malware-behaviour-analysis
- DTrace
	- Awesome DTrace - http://awesome-dtrace.com/
	- DTrace Safety - http://dtrace.org/blogs/bmc/2005/07/19/dtrace-safety/
	- DTrace Internals: Digging into DTrace
		- BSDCan 2017; Arun Thomas
		- https://www.youtube.com/watch?v=Vstwq5l_dwY
		- http://www.bsdcan.org/2017/schedule/events/793.en.html
	- DTrace for Linux
		- https://github.com/dtrace4linux/linux
		- FOSDEM 2018; Tomáš Jedlička
			- https://fosdem.org/2018/schedule/event/debugging_tools_dtrace/
	- DTrace on Windows
		- https://github.com/opendtrace/opendtrace/tree/windows
		- https://github.com/microsoft/DTrace-on-Windows
		- https://techcommunity.microsoft.com/t5/Windows-Kernel-Internals/DTrace-on-Windows/ba-p/362902
	- DTrace Review
		- Google Tech Talks; August 15, 2007; Bryan Cantrill 
		- https://www.youtube.com/watch?v=TgmA48fILq8
		- https://www.youtube.com/watch?v=6chLw2aodYQ
- minitrace: Simple C/C++ library for producing JSON traces suitable for Chrome's built-in trace viewer (about:tracing)
	- https://github.com/hrydgard/minitrace
- Phosphor: High performance event tracing
	- http://couchbase.github.io/phosphor/
	- https://github.com/couchbase/phosphor
- PIEtrace: Platform Independent Executable Trace
	- https://sites.google.com/site/pitprj12/

## Software: Viewers

- Babeltrace
	- The Babeltrace project provides trace read and write libraries, as well as a trace converter. Plugins can be created for any trace format to allow its conversion to/from another trace format.
	- http://diamon.org/babeltrace/
	- https://github.com/efficios/babeltrace
	- Common Trace Format
		- https://diamon.org/ctf/
- FlameGraph: Stack trace visualize
	- https://github.com/brendangregg/FlameGraph
	- http://www.brendangregg.com/flamegraphs.html
- LTTng Scope
	- a trace viewer and analyzer for CTF traces, with a focus on LTTng kernel and user space traces.
	- https://github.com/lttng/lttng-scope
	- https://lttng.org/blog/2018/03/21/lttng-scope-0.3-a-basic-tutorial/
- rgat: An instruction trace visualisation tool for dynamic program analysis
	- https://github.com/ncatlin/rgat
- Trace Compass: an open-source (EPL-licensed) trace viewer and analyzer
	- http://tracecompass.org/
	- https://github.com/tracecompass
	- https://wiki.eclipse.org/Trace_Compass

## Software: Linux

- Linux tracing systems & how they fit together
	- https://jvns.ca/blog/2017/07/05/linux-tracing-systems/
- KUtrace
	- Low-overhead tracing of all Linux kernel-user transitions, for serious performance analysis. Includes kernel patches, loadable module, and post-processing software. Output is HTML/SVG per-CPU-core timeline that you can pan/zoom down to the nanosecond.
	- https://github.com/dicksites/KUtrace
	- KUTrace: Where have all the nanoseconds gone?, Richard Sites
		- Tracing Summit 2017; Richard Sites
		- https://www.youtube.com/watch?v=UYwWollxzAk
		- https://tracingsummit.org/wiki/TracingSummit2017KUTrace
		- https://tracingsummit.org/w/images/3/30/TS17-kutrace.pdf
	- Benchmarking "Hello, World!"
		- Six different views of the execution of "Hello, World!" show what is often missing in today's tools
		- ACM Queue 16, 5 (2018); Richard L. Sites
		- https://queue.acm.org/detail.cfm?id=3291278
	- KUtrace 2020
		- Stanford EE380 Computer Systems Colloquium (2020); Dick Sites
		- https://www.youtube.com/watch?v=2HE7tSZGna0
		- https://ee.stanford.edu/event/seminar/ee380-computer-systems-colloquium-presents-kutrace-2020
- ltrace: Debugging program to track runtime library calls in dynamically linked programs
	- ltrace intercepts and records dynamic library calls which are called by an executed process and the signals received by that process. It can also intercept and print the system calls executed by the program.
	- http://ltrace.org/
	- https://gitlab.com/cespedes/ltrace
	- How does ltrace work? - https://blog.packagecloud.io/eng/2016/03/14/how-does-ltrace-work/
- StackTrack — Linux Call graph visualization and execution tracking
	- https://stacktrack.github.io/
- uftrace: Function (graph) tracer for user-space
	- https://github.com/namhyung/uftrace
	- Understanding the runtime behaviors of C++ programs using uftrace tool
		- CppCon 2017; Honggyu Kim 
		- https://www.youtube.com/watch?v=s0B8hV2O8ps

### Software: Linux - BCC/BPF

#### Software: Linux - BCC/BPF - Readings

- Dive into BPF: a list of reading material
	- https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/
- The BSD Packet Filter
	- USENIX Winter 1993; Steven McCanne and Van Jacobson
	- https://www.usenix.org/conference/usenix-winter-1993-conference/presentation/bsd-packet-filter-new-architecture-user-level-
	- PWL 2017 talk by Suchakra Sharma
		- https://speakerdeck.com/tuxology/the-bsd-packet-filter
		- http://step.polymtl.ca/~suchakra/PWL-Jun28-MTL.pdf
		- Notes on BPF & eBPF - https://jvns.ca/blog/2017/06/28/notes-on-bpf---ebpf/
- BPF and XDP Reference Guide
	- http://docs.cilium.io/en/stable/bpf/
- Brendan D. Gregg
	- Linux Enhanced BPF (eBPF) Tracing Tools - http://www.brendangregg.com/ebpf.html
	- BPF Performance Tools: Linux System and Application Observability
		- http://www.brendangregg.com/bpf-performance-tools-book.html
		- https://github.com/brendangregg/bpf-perf-tools-book
- Ferris Ellis
	- eBPF, part 1: Past, Present, and Future - https://ferrisellis.com/content/ebpf_past_present_future/
	- eBPF, part 2: Syscall and Map Types - https://ferrisellis.com/content/ebpf_syscall_and_maps/
- Linux Tracing Workshops Materials - Sasha Goldshtein
	- https://github.com/goldshtn/linux-tracing-workshop

#### Software: Linux - BCC/BPF - Software

- BPFtrace: High-level tracing language for Linux eBPF
	- https://github.com/iovisor/bpftrace
	- http://www.brendangregg.com/blog/2018-10-08/dtrace-for-linux-2018.html
- BCC - Tools for BPF-based Linux IO analysis, networking, monitoring, and more
	- http://iovisor.github.io/bcc/
	- https://github.com/iovisor/bcc
	- https://www.iovisor.org/technology/bcc
	- https://github.com/iovisor/bcc/blob/master/LINKS.md
- uBPF: Userspace eBPF VM
	- https://github.com/iovisor/ubpf
- ply: Dynamic Tracing in Linux
	- A light-weight dynamic tracer for Linux that leverages the kernel's BPF VM in concert with kprobes and tracepoints to attach probes to arbitrary points in the kernel. 
	- https://wkz.github.io/ply/
	- https://github.com/iovisor/ply

#### Software: Linux - BCC/BPF - Talks

- Tools and mechanisms to debug BPF programs
	- FOSDEM 2020; Quentin Monnet
	- https://fosdem.org/2020/schedule/event/debugging_bpf/

### Software: Linux - ftrace

- Ftrace - https://alex.dzyoba.com/blog/ftrace/
- Ftrace: The hidden light switch - https://lwn.net/Articles/608497/
- ftrace: Where modifying a running kernel all started
	- Kernel Recipes 2019; Steven Rostedt
	- https://www.youtube.com/watch?v=93uE_kWWQjs
- Debugging realtime application with Ftrace
	- FOSDEM 2018; Pierre Ficheux
	- https://fosdem.org/2018/schedule/event/debugging_tools_ftrace/
- Hooking Linux Kernel Functions
	- Part 1: Looking for the Perfect Solution - https://www.apriorit.com/dev-blog/544-hooking-linux-functions-1
	- Part 2: How to Hook Functions with Ftrace - https://www.apriorit.com/dev-blog/546-hooking-linux-functions-2
	- Part 3: What Are the Main Pros and Cons of Ftrace? - https://www.apriorit.com/dev-blog/547-hooking-linux-functions-3
	- ftrace-hook: Linux kernel module demonstrating usage of ftrace framework for function hooking
		- https://github.com/ilammy/ftrace-hook
- KernelShark
	- http://rostedt.homelinux.com/kernelshark/
	- Using KernelShark to analyze the real-time scheduler - https://lwn.net/Articles/425583/
	- KernelShark 1.0; What’s new and what’s coming - https://kernel-recipes.org/en/2018/talks/kernelshark-1-0-whats-new-and-whats-coming/
- perf-tools: Performance analysis tools based on Linux perf_events (aka perf) and ftrace
	- https://github.com/brendangregg/perf-tools
- Tracing the Linux kernel with ftrace
	- https://embeddedbits.org/tracing-the-linux-kernel-with-ftrace/
- Understanding the Linux Kernel via Ftrace - Kernel Recipes 2017 - Steven Rostedt
	- https://kernel-recipes.org/en/2017/talks/understanding-the-linux-kernel-via-ftrace/
	- https://www.youtube.com/watch?v=2ff-7UTg5rE
- See what your computer is doing with Ftrace utilities
	- linux.conf.au 2019; Steven Rostedt
	- https://www.youtube.com/watch?v=68osT1soAPM
	- https://2019.linux.conf.au/schedule/presentation/130/

### Software: Linux - LTTng

- LTTng: Linux Trace Toolkit Next Generation
	- an open source tracing framework for Linux
	- https://lttng.org/
	- https://github.com/lttng
- LTTng analyses: Analyses scripts for LTTng kernel and user-space traces
	- https://github.com/lttng/lttng-analyses
- LTTng live streaming example
	- http://pavelmakhov.com/2017/01/lttng-streaming

### Software: Linux - ptrace

- ptrace - process trace - http://man7.org/linux/man-pages/man2/ptrace.2.html
- Adventures into ptrace(2) Hell - https://www.cyphar.com/blog/post/20160703-remainroot-ptrace-hell
- DetTrace: A Reproducible Container Abstraction
	- A determinizing tracer using Ptrace
	- https://github.com/dettrace/dettrace
	- Reproducible Containers
		- Architectural Support for Programming Languages and Operating Systems (ASPLOS) 2020
		- Omar S. Navarro Leija, Kelly Shiptoski, Ryan G. Scott, Baojun Wang, Nicholas Renner, Ryan R. Newton, Joseph Devietti
		- https://doi.org/10.1145/3373376.3378519
		- https://gatowololo.github.io/resources/publications/dettrace.pdf  
		- https://www.youtube.com/watch?v=YkmS-vf12nE
- Hiding Call To Ptrace - https://github.com/yellowbyte/analysis-of-anti-analysis/blob/master/research/hiding_call_to_ptrace/hiding_call_to_ptrace.md
- Intercepting and Emulating Linux System Calls with Ptrace - http://nullprogram.com/blog/2018/06/23/
- Ptrace-burrito: A plugin style wrapper around ptrace on Linux.
	- https://github.com/brainsmoke/ptrace-burrito
- Using Ptrace For Fun And Profit
	- https://eklitzke.org/ptrace
	- https://eklitzke.org/ptrace-continued
	- Using ptrace(2) To Call a Userspace Function: Example of how to use the ptrace(2) system call to call a userspace method.
		- https://github.com/eklitzke/ptrace-call-userspace

### Software: Linux - strace

- strace - the linux syscall tracer
	- https://github.com/strace/strace
- Strace little book
	- https://github.com/NanXiao/strace-little-book
	- https://nanxiao.gitbooks.io/strace-little-book/
- Julia Evans
	- A zine about strace
		- https://jvns.ca/blog/2015/04/14/strace-zine/
		- https://wizardzines.com/zines/strace/
	- strace posts: https://jvns.ca/categories/strace/
- How does strace work?
	- https://blog.packagecloud.io/eng/2016/02/29/how-does-strace-work/
- My Favourite Secret Weapon – strace
	- https://zwischenzugs.com/2011/08/29/my-favourite-secret-weapon-strace/
- Strace -- The Sysadmin's Microscope
	- https://blogs.oracle.com/ksplice/strace-the-sysadmins-microscope
- strace cheat sheet
	- https://blog.packagecloud.io/eng/2015/11/15/strace-cheat-sheet/
- Strace: The Lost Chapter
	- http://price.mit.edu/blog/2010/08/strace-the-lost-chapter/

#### Software: Linux - strace - Talks

- strace talks
	- https://github.com/strace/strace-talks
- Modern strace
	- DevConf.CZ 2019; Dmitry Levin
	- https://www.youtube.com/watch?v=cwDFpzQuWSU
	- https://devconfcz2019.sched.com/event/JchD
- Postmodern strace
	- FOSDEM 2020; Dmitry Levin
	- https://fosdem.org/2020/schedule/event/debugging_strace_modern/
- strace --seccomp-bpf: a look under the hood
	- FOSDEM 2020; Paul Chaignon
	- https://fosdem.org/2020/schedule/event/debugging_strace_bpf/
	- https://pchaigno.github.io/strace/2019/10/02/introducing-strace-seccomp-bpf.html
- Strace: Monitoring The Kernel-User-Space Conversation
	- NDC TechTown 2018; Michael Kerrisk
	- https://www.youtube.com/watch?v=oFt6V56BOlo
	- http://man7.org/conf/ndctechtown2018/system_call_tracing_with_strace-NDC-TechTown-Kerrisk.pdf
- strace: new features
	- FOSDEM 2018; Dmitry Levin
	- https://fosdem.org/2018/schedule/event/debugging_tools_strace_features/

## Software: Windows

- ATrace: a tool for tracing execution of binaries on Windows
	- https://github.com/K2/EhTrace
- Branch Monitoring Project
	- Branch Monitor is an alternative for runtime process monitoring on modern (Windows) systems. Our approach makes use of Branch Trace Store (BTS) from Intel's processors to implement a dynamic, transparent framework. The framework provide many analysis facilities, such as function call tracing and Control Flow Graph (CFG) reconstruction.
	- https://github.com/marcusbotacin/BranchMonitoringProject
- DIMCT: Dirty Inter Module Calls Tracer
	- Allows tracing inter module calls for a specific module within a Windows process.
	- https://github.com/amossys/dimct
- libptrace: An event driven multi-core process debugging, tracing, and manipulation framework
	- https://github.com/immunityinc/libptrace
- MemTrace: Memory Tracing Software
	- https://github.com/deplinenoise/ig-memtrace
- tiny_tracer: A Pin Tool for tracing API calls and transition between sections of the traced module 
	- https://github.com/hasherezade/tiny_tracer
	- Tracing executables with a Pin Tool (tiny_tracer) - https://www.youtube.com/watch?v=kurzaoWuSHA
- tracectory: a tool to analyze and visualize x86 instruction traces
	- https://bitbucket.org/oebeling/tracectory/wiki/Home
	- https://bling.kapsi.fi/blog/x86-memory-access-visualization.html
- WinIPT: The Windows Library for Intel Process Trace
	- https://ionescu007.github.io/winipt/
	- https://github.com/ionescu007/winipt

### Software: Windows - ETW

- ETW Central
	- https://randomascii.wordpress.com/2015/09/24/etw-central/
- etrace: Command-line tool for ETW tracing on files and real-time events
	- https://github.com/goldshtn/etrace
- EtwConsumerNT
	- Simple project that demonstrates how an ETW consumer can be created just by using NTDLL
	- https://github.com/wbenny/EtwConsumerNT
- KrabsETW: a modern C++ wrapper and a .NET wrapper around the low-level ETW trace consumption functions
	- https://github.com/microsoft/krabsetw
- LiveStacks: Collect, aggregate, and display live stack traces for ETW events, including CPU sampling, of native and .NET processes.
	- https://github.com/goldshtn/LiveStacks
- Hidden Treasure: Detecting Intrusions with ETW
	- Derbycon 2017; Zac Brown
	- http://www.irongeek.com/i.php?page=videos/derbycon7/t208-hidden-treasure-detecting-intrusions-with-etw-zac-brown
- UIforETW: User interface for recording and managing ETW traces
	- https://randomascii.wordpress.com/2015/04/14/uiforetw-windows-performance-made-easier/
	- https://github.com/google/UIforETW
- wtrace: Command line tracing tool for Windows, based on ETW
	- https://github.com/lowleveldesign/wtrace
	- https://lowleveldesign.org/2017/10/25/wtrace-2-2/

---

# Talks

- Tracing Summit - http://tracingsummit.org/

## 2017

- Now You See Me Too: Visual Tooling for Advanced System Analysis
	- LISA 2017; Suchakrapani Sharma
	- Video: https://www.youtube.com/watch?v=ihauGhgWZgQ
	- Slides (Speaker Deck): https://speakerdeck.com/tuxology/visual-tooling-for-advanced-systems-analysis
	- Slides (PDF): http://step.polymtl.ca/~suchakra/LISA-Nov2-SF.pdf

## 2016

- Designing Tracing Tools
	- Sysdig CCWFS 2016; Brendan Gregg
	- https://www.youtube.com/watch?v=uibLwoVKjec
	- http://www.slideshare.net/brendangregg/designing-tracing-tools-67693476
- Give me 15 minutes and I'll change your view of Linux tracing
	- USENIX/LISA 2016; Brendan Gregg
	- https://www.youtube.com/watch?v=GsMs3n8CB6g
- Low-Level Tracing for Latency Analysis: From Baremetal to Hardware Tracing Blocks
	- Tracing Summit 2016
	- Suchakrapani Datt Sharma (Ecole Polytechnique Montreal)
	- https://www.youtube.com/watch?v=D1nggb9OgD0
	- http://tracingsummit.org/wiki/TracingSummit2016LowLevelTracing
	- https://hsdm.dorsal.polymtl.ca/system/files/Suchakra-tracingsummit2016.pdf
- Using Linux tracing tools
	- O'Reilly Velocity Conference 2016; Sasha Goldshtein
	- https://www.oreilly.com/learning/using-linux-tracing-tools

## 2014

- What is That Process Doing?
	- Greg Price
	- http://price.mit.edu/tracing-w2014/
	- Open Source Bridge 2013 - https://www.youtube.com/watch?v=kYIDMIekgyU
