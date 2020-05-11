title=Build tools and research
tags=tool, reading
summary=A collection of links around building, build systems, and build performance optimization
~~~~~~
[Autotools](autotools.html) | [Bazel](bazel.html) | [Boost.Build](boostbuild.html) | [build2](build2.html) | [CMake](cmake.html) | [FASTBuild](fastbuild.html) | [Gradle](gradle.html) | [Make and GNUMake](make.html) | [Meson](meson.html) | [Ninja](ninja.html) | 

- [Tundra](#tundra)
- [Tup](#tup)
- [Visual Studio](#visual-studio):
	- [MSBuild](#msbuild)
- [Xcode](#Xcode)
- [xmake](#xmake)

# Readings

- Build Systems à la Carte
	- Microsoft Research 2018
	- Andrey Mokhov, Neil Mitchell, Simon Peyton Jones
	- https://www.microsoft.com/en-us/research/publication/build-systems-la-carte/
	- https://github.com/snowleopard/build
	- https://blogs.ncl.ac.uk/andreymokhov/the-task-abstraction/
	- https://blogs.ncl.ac.uk/andreymokhov/build-systems-a-la-carte/
	- https://icfp18.sigplan.org/event/icfp-2018-papers-build-systems-a-la-carte
	- https://www.youtube.com/watch?v=BQVT6wiwCxM
	- Build Systems à La Carte: Theory and Practice
		- Journal of Functional Programming 30 (2020)
		- Andrey Mokhov, Neil Mitchell, Simon Peyton Jones
		- https://doi.org/10.1017/S0956796820000088
- Build System Rules and Algorithms
	- Mike Shal (2009)
	- http://gittup.org/tup/build_system_rules_and_algorithms.pdf
	- Build System Partial Updates - http://gittup.org/blog/2014/09/11-build-system-partial-updates/
- Clobber Builds - Mike Shal
	- Part 1 - Missing Dependencies - http://gittup.org/blog/2014/03/6-clobber-builds-part-1---missing-dependencies/
	- Part 2 - Fixing Missing Dependencies - http://gittup.org/blog/2014/05/7-clobber-builds-part-2---fixing-missing-dependencies/
	- Part 3 - Other Clobber Causes - http://gittup.org/blog/2014/06/8-clobber-builds-part-3---other-clobber-causes/
	- Part 4 - Fixing Other Clobber Causes - http://gittup.org/blog/2015/03/13-clobber-builds-part-4---fixing-other-clobber-causes/
- Correct, Efficient, and Tailored: The Future of Build Systems
	- IEEE Software, vol. 35, no. 2, 2018
	- G. Maudoux and K. Mens
	- https://doi.ieeecomputersociety.org/10.1109/MS.2018.111095025
- The C++ Build Process Explained
	- https://github.com/green7ea/cpp-compilation

## Caching

- Caching Function Calls Using Precise Dependencies
	- Programming Language Design and Implementation (PLDI) 2000
	- Allan Heydon, Roy Levin, Yuan Yu
	- http://www.vestasys.org/doc/pubs/pldi-00-04-20.pdf
	- Vesta Configuration Management System - http://www.vestasys.org/#publications
- cHash: Detection of Redundant Compilations via AST Hashing
	- USENIX Annual Technical Conference 2017
	- Christian Dietrich, Valentin Rothberg, Ludwig Füracker, Andreas Ziegler, Daniel Lohmann
	- https://www.usenix.org/conference/atc17/technical-sessions/presentation/dietrich
	- cHash Compiler Plugins and related tools - https://github.com/luhsra/chash

## Correctness

- Detecting Incorrect Build Rules
	- International Conference on Software Engineering (ICSE) 2019
	- Nandor Licker, Andrew Rice
	- https://2019.icse-conferences.org/details/icse-2019-Technical-Papers/82/Detecting-Incorrect-Build-Rules
	- https://www.repository.cam.ac.uk/handle/1810/288468
	- mkcheck: Incremental Build Verification
		- https://github.com/nandor/mkcheck
- Oops, My Tests Broke the Build: An Explorative Analysis of Travis CI with GitHub
	- Mining Software Repositories (MSR) 2017
	- M. Beller, G. Gousios, A. Zaidman
	- http://www.gousios.gr/pub/tests-broke-build-explorative-analysis-travis-ci-github.pdf
	- https://www.slideshare.net/inventitech/oops-my-tests-broke-the-build-an-explorative-analysis-of-travis-ci-with-github
- Programmers’ Build Errors: A Case Study (at Google)
	- International Conference on Software Engineering (ICSE) 2014
	- Hyunmin Seo, Caitlin Sadowski, Sebastian Elbaum, Edward Aftandilian, Robert Bowdidge
	- https://research.google.com/pubs/pub42184.html

## Dependencies

- Automatic Object Linkage, with Include Graphs (Source code sharing without static libraries)
	- 2018; Thomas Young
	- https://upcoder.com/19/automatic-object-linkage-with-include-graphs
- Build Predictor: More Accurate Missed Dependency Prediction in Build Configuration Files
	- Computer Software and Applications Conference (COMPSAC 2014)
	- Bo Zhou, Xia Xin, David Lo, Xinyu Wang
	- http://www.mysmu.edu/faculty/davidlo/papers/compsac14-dependency.pdf
	- https://www.semanticscholar.org/paper/Build-Predictor%3A-More-Accurate-Missed-Dependency-in-Zhou-Xia/a4d4b05c8594fc7358a89f0afffb7e405b65fa0d
- Program Repository
	- LLVM with Program Repository Support
			- https://github.com/SNSystems/llvm-project-prepo
	- Program Repository: What’s the Idea?
		- https://github.com/SNSystems/llvm-project-prepo/wiki
	- Early Overview
		- https://github.com/SNSystems/llvm-project-prepo/wiki/Early-Overview
	- Toy programming demo of a repository for statically compiled programs
		- 2016 US LLVM Developers' Meeting; Paul Bowen-Huggett
		- https://llvm.org/devmtg/2016-11/Slides/Bowen-Hugett-ToyProgrammingDemo.pdf
		- https://youtu.be/-pL94rqyQ6c
	- Targeting a statically compiled program repository with LLVM
		- 2019 EuroLLVM Developers’ Meeting; Phil Camp , Russell Gallop 
		- https://www.youtube.com/watch?v=mlQyEBDnDJE 
		- http://llvm.org/devmtg/2019-04/slides/Lightning-Camp-Program_Repo.pdf
	- LLVM Build Times Using a Program Repository
		- https://www.snsystems.com/technology/tech-blog/llvm-build-times-using-a-program-repository
	- Compile Faster with the Program Repository and ccache
		- 2020 European LLVM Developers Meeting; Ying Yi, Paul Bowen-Huggett
		- http://www.llvm.org/devmtg/2020-04/talks.html#LightningTalk_51
- mtime comparison considered harmful
	- "tl;dr: Rebuilding a target because its mtime is older than the mtimes of its dependencies, like make does, is very error prone. redo does it better, and so can you."
	- https://apenwarr.ca/log/20181113
- Non-recursive Make Considered Harmful
	- Proceedings of the 9th International Symposium on Haskell, 2016
	- Andrey Mokhov, Neil Mitchell, Simon Peyton Jones, Simon Marlow
	- https://www.microsoft.com/en-us/research/publication/non-recursive-make-considered-harmful/
	- https://simonmar.github.io/bib/shake-2016_abstract.html
- Recursive Make Considered Harmful 
	- Journal of AUUG Inc, 19(1):14–25, 1998
	- Peter Miller
	- http://aegis.sourceforge.net/auug97.pdf
	- http://sites.e-advies.nl/nonrecursive-make.html

## Distributed

- Build in the Cloud
	- Accessing Source Code: http://google-engtools.blogspot.com/2011/06/build-in-cloud-accessing-source-code.html
	- How the Build System works: http://google-engtools.blogspot.com/2011/08/build-in-cloud-how-build-system-works.html
	- Distributing Build Steps: http://google-engtools.blogspot.com/2011/09/build-in-cloud-distributing-build-steps.html
	- Distributing Build Outputs: http://google-engtools.blogspot.com/2011/10/build-in-cloud-distributing-build.html
- CloudBuild: Microsoft’s Distributed and Caching Build Service
	- International Conference on Software Engineering (ICSE) 2016
	- Hamed Esfahani, Jonas Fietz, Qi Ke, Alexei Kolomiets, Erica Lan, Erik Mavrinac, Wolfram Schulte, Newton Sanches, Srikanth Kandula
	- https://dl.acm.org/citation.cfm?id=2889222
	- https://www.microsoft.com/en-us/research/publication/cloudbuild-microsofts-distributed-and-caching-build-service/
- From Laptop to Lambda: Outsourcing Everyday Jobs to Thousands of Transient Functional Containers
	- 2019 USENIX Annual Technical Conference
	- Sadjad Fouladi, Francisco Romero, Dan Iter, Qian Li, Shuvo Chatterjee, Christos Kozyrakis, Matei Zaharia, Keith Winstein
	- https://www.usenix.org/conference/atc19/presentation/fouladi
	- Outsourcing Everyday Jobs to Thousands of Cloud Functions with gg
		- https://www.usenix.org/system/files/login/articles/login_fall19_02_fouladi.pdf
	- gg: The Stanford Builder
		- https://github.com/stanfordsnr/gg

## Incremental Building

- A Sound and Optimal Incremental Build System with Dynamic Dependencies
	- SPLASH 2015 OOPSLA
	- Sebastian Erdweg, Moritz Lichter, Manuel Weiel
	- https://www.youtube.com/watch?v=QsgLSDMLLTo
	- https://2015.splashcon.org/event/oopsla2015-a-sound-and-optimal-incremental-build-system
- Bringing Incremental Builds to Continuous Integration
	- SaTToSE (Seminar Series on Advanced Techniques & Tools for Software Evolution) 2017
	- Guillaume Maudoux and Kim Mens
	- https://dial.uclouvain.be/pr/boreal/object/boreal:189543
	- http://sattose.wdfiles.com/local--files/2017:schedule/SATToSE_2017_paper_3.pdf
- Constructing Hybrid Incremental Compilers for Cross-Module Extensibility with an Internal Build System
	- ‹Programming› 2020
	- Jeff Smits, Gabriël Konat, Eelco Visser
	- https://2020.programming-conference.org/details/programming-2020-papers/16/Constructing-Hybrid-Incremental-Compilers-for-Cross-Module-Extensibility-with-an-Inte
- Scalable Incremental Building with Dynamic Task Dependencies
	- Automated Software Engineering (ASE) 2018
	- Gabriël Konat, Sebastian Erdweg, Eelco Visser
	- https://doi.org/10.1145/3238147.3238196
	- https://eelcovisser.org/post/306/scalable-incremental-building-with-dynamic-task-dependencies
	- https://www.student.informatik.tu-darmstadt.de/~xx00seba/publications/pie-scalable-incremental-build.pdf

## Reproducibility

- An introduction to deterministic builds with C/C++
	- https://blog.conan.io/2019/09/02/Deterministic-builds-with-C-C++.html
- Automated Localization for Unreproducible Builds
	- ICSE 2018
	- Zhilei Ren, He Jiang, Jifeng Xuan, Zijiang Yang
	- https://arxiv.org/abs/1803.06766
	- https://blog.acolyer.org/2018/06/22/automated-localization-for-unreproducible-builds/
- Deterministic builds with Clang and LLD
	- http://blog.llvm.org/2019/11/deterministic-builds-with-clang-and-lld.html
- Reproducible Builds — a set of software development practices that create an independently-verifiable path from source to binary code
	- https://reproducible-builds.org/

---

# Build Performance

## Build Performance Readings

- 2 tips to make your C++ projects compile 3 times faster
	- Tip #1: Distributing compilation load
	- Tip #2: Using a distcc server container
	- https://developers.redhat.com/blog/2019/05/15/2-tips-to-make-your-c-projects-compile-3-times-faster/
- 30% faster Windows builds with clang-cl and the new `/Zc:dllexportInlines-` flag
	- http://blog.llvm.org/2018/11/30-faster-windows-builds-with-clang-cl_14.html
- Anders Schau Knatten
	- Another Reason to Avoid #includes in Headers
		- https://blog.knatten.org/2012/11/09/another-reason-to-avoid-includes-in-headers/
	- How to avoid includes in headers
		- https://blog.knatten.org/2012/11/30/how-to-avoid-includes-in-headers/
- Aras Pranckevičius
	- Unreasonable Effectiveness of Profilers (profiling the build system) - http://aras-p.info/blog/2017/08/08/Unreasonable-Effectiveness-of-Profilers/
	- Forced Inlining Might Be Slow - https://aras-p.info/blog/2017/10/09/Forced-Inlining-Might-Be-Slow/
	- Best unknown MSVC flag: d2cgsummary - https://aras-p.info/blog/2017/10/23/Best-unknown-MSVC-flag-d2cgsummary/
	- Slow to Compile Table Initializers - https://aras-p.info/blog/2017/10/24/Slow-to-Compile-Table-Initializers/
	- Investigating compile times, and Clang -ftime-report - http://aras-p.info/blog/2019/01/12/Investigating-compile-times-and-Clang-ftime-report/
	- Another cool MSVC flag: /d1reportTime
		- http://aras-p.info/blog/2019/01/21/Another-cool-MSVC-flag-d1reportTime/
		- Reports where the compiler frontend spends time.
		- Passing /d1reportTime to the MSVC compiler (cl.exe) will make it print:
			- Which header files are included (hierarchically), with time taken for each,
			- Which classes are being parsed, with time taken for each,
			- Which functions are being parsed, with time taken for each.
- Big Project Build Times–Chromium
	- https://randomascii.wordpress.com/2020/03/30/big-project-build-times-chromium/
- C++ Compilation Speed
	- Walter Bright - DDJ, August 17, 2010
	- https://digitalmars.com/articles/b54.html
	- http://www.drdobbs.com/cpp/c-compilation-speed/228701711
- C++ Compilation: Fixing It
	- http://virtuallyrandom.com/c-compilation-fixing-it/
- Faster C++ builds
	- http://www.bitsnbites.eu/faster-c-builds/
- Identifying and Understanding Header File Hotspots in C/C++ Build Processes
	- Automated Software Engineering, Vol. 23, No. 4, 2016
	- Shane McIntosh, Bram Adams, Meiyappan Nagappan, Ahmed E. Hassan
	- http://rebels.ece.mcgill.ca/journalpaper/2015/07/08/identifying-and-understanding-header-file-hotspots-in-c-cpp-build-processes.html
- Improving C++ Builds with Split DWARF
	- https://www.productive-cpp.com/improving-cpp-builds-with-split-dwarf/
- Improving Compilation Time of C/C++ Projects
	- https://interrupt.memfault.com/blog/improving-compilation-times-c-cpp-projects
- Investigating C++ compile times
	- My journey investigating slow compile times in C++
		- https://metanokid.github.io/coding-scars/investigating-cpp-compile-times-0
	- Useful tools to investigate C++ compile times
		- https://metanokid.github.io/coding-scars/investigating-cpp-compile-times-1
	- Understanding MSBuild to create flame graphs
		- https://metanokid.github.io/coding-scars/investigating-cpp-compile-times-2
	- Improving C++ compile times using flame graphs
		- https://metanokid.github.io/coding-scars/investigating-cpp-compile-times-3
	- Getting data from C++ Build Insights SDK
		- https://metanokid.github.io/coding-scars/investigating-cpp-compile-times-4
- Physical Design of The Machinery
	- http://ourmachinery.com/post/physical-design/
- Reducing Build Time through Precompilations for Evolving Large Software
	- International Conference on Software Maintenance (ICSM) 2005
	- Yu, Yijun; Dayani-Fard, Homayoun; Mylopoulos, John and Andritsos, Periklis 
	- http://www.cs.toronto.edu/%7Eperiklis/pubs/icsm05.pdf
	- http://oro.open.ac.uk/6944/
- To Unify or Not to Unify: A Case Study on Unified Builds (in WebKit)
	- Compiler Construction (CC) 2019
	- Takafumi Kubota, Yusuke Suzuki, and Kenji Kono
	- https://doi.org/10.1145/3302516.3307347

## Build Performance Software

- Cotire (compile time reducer)
	- a CMake module that speeds up the build process of CMake based build systems by fully automating techniques as precompiled header usage and single compilation unit builds for C and C++.
	- https://github.com/sakra/cotire

### Benchmarking and Profiling

- C++ Compile Health Watchdog
	- Benchmark and accountability tool for C++ compile-time overhead / compile-time health.
	- https://github.com/Philip-Trettner/cpp-compile-overhead
	- Results: https://artificial-mind.net/projects/compile-health/
- Clang -ftime-trace and ftime-trace-granularity=N
	- http://releases.llvm.org/9.0.0/tools/clang/docs/ReleaseNotes.html#new-compiler-flags
	- Clang Time Trace Feature
		- https://www.snsystems.com/technology/tech-blog/clang-time-trace-feature
	- Clang Build Analyzer
		- Clang build analysis tool using -ftime-trace
		- https://github.com/aras-p/ClangBuildAnalyzer
		- https://aras-p.info/blog/2019/09/28/Clang-Build-Analyzer/
		- time-trace: timeline / flame chart profiler for Clang
			- https://aras-p.info/blog/2019/01/16/time-trace-timeline-flame-chart-profiler-for-Clang/
- CTMark (Compile Time Mark)
	- https://github.com/llvm-mirror/test-suite/tree/master/CTMark
- Metabench: A simple framework for compile-time microbenchmarks
	- http://metaben.ch/
	- https://github.com/ldionne/metabench
- Templight: Template Instantiation Profiler and Debugger
	- a Clang-based tool to profile the time and memory consumption of template instantiations and to perform interactive debugging sessions to gain introspection into the template instantiation process
	- https://github.com/mikael-s-persson/templight
	- Use templight and Templar to debug C++ templates
		- https://baptiste-wicht.com/posts/2016/02/use-templight-and-templar-to-debug-cpp-templates.html
	- Templight: A Clang Extension for Debugging and Profiling C++ Template Metaprograms
		- 2015 EuroLLVM Developers’ Meeting, Zoltan Porkolab
		- https://llvm.org/devmtg/2015-04/slides/EuroLLVM2015Templight.pdf
		- https://www.youtube.com/watch?v=djAPtopWhRU
- Visual C++
	- vcperf: A build analysis tool for the MSVC toolchain
		- https://github.com/microsoft/vcperf
	- MSBuild Flame Graph: Turns MSBuild executions into flame graphs
		- https://github.com/MetanoKid/msbuild-flame-graph
	- C++ Build Insights
		- Get started with C++ Build Insights
			- https://docs.microsoft.com/en-us/cpp/build-insights/get-started-with-cpp-build-insights
		- Introducing C++ Build Insights
			- https://devblogs.microsoft.com/cppblog/introducing-c-build-insights/
		- Analyze your builds programmatically with the C++ Build Insights SDK
			- https://devblogs.microsoft.com/cppblog/analyze-your-builds-programmatically-with-the-c-build-insights-sdk/
		- Finding build bottlenecks with C++ Build Insights
			- https://devblogs.microsoft.com/cppblog/finding-build-bottlenecks-with-cpp-build-insights/

### Caching

- ccache: A Fast C/C++ Compiler Cache
	- https://ccache.samba.org
- distcc: A free distributed C/C++ compiler system
	- https://github.com/distcc/distcc
- icecream: Distributed compiler with a central scheduler to share build load
	- https://github.com/icecc/icecream
- sccache - Shared Compilation Cache
	- https://github.com/mozilla/sccache

### Dependencies Analysis and Optimization

- cpp-dependencies: Tool to check C++ #include dependencies (dependency graphs created in .dot format)
	- https://github.com/tomtom-international/cpp-dependencies
- Header Hero: optimizing C++ codebase header #include dependencies
	- A tool for optimizing C++ header files and reducing build times.
	- https://bitbucket.org/bitsquid/header_hero
	- https://bitsquid.blogspot.com/2011/10/caring-by-sharing-header-hero.html
	- https://aras-p.info/blog/2018/01/17/Header-Hero-Improvements/
- include-what-you-use
	- A tool for use with clang to analyze #includes in C and C++ source files
	- https://include-what-you-use.org/
	- https://github.com/include-what-you-use/include-what-you-use

## Build Performance Talks

- Common-sense acceleration of your MLOC build
	- CppCon 2014; Matt Hargett
	- https://www.youtube.com/watch?v=t4M3yG1dWho
- Compiling C++ is slow - let's go faster
	- StockholmCpp 2020; Tobias Hieta
	- https://www.youtube.com/watch?v=X4pyOtawqjg
	- https://gist.github.com/tru/ad677ba2b1d543e238b0e09eb3aad3ac
- LLVM Compile-Time: Challenges. Improvements. Outlook.
	- 2017 LLVM Developers’ Meeting; Michael Zolotukhin
	- https://www.youtube.com/watch?v=bYHMwyyZ6Mk
- Optimizing builds on Windows
	- 2019 LLVM Developers’ Meeting; Alexandre Ganea
	- https://www.youtube.com/watch?v=usPL_DROn4k
	- https://llvm.org/devmtg/2019-10/slides/Ganea-OptimizingBuildesOnWindows.pdf
- Optimizing compilation times with Templates
	- CppCon 2017: Eddie Elizondo
	- https://www.youtube.com/watch?v=NPWQ7xKfIHQ
	- https://github.com/eduardo-elizondo/cppcon2017
- Practical Techniques for Improving C++ Build Times
	- CppCon 2017; Dmitry Panin
	- https://www.youtube.com/watch?v=h8UoYG4dvH8
- The Hitchhiker's Guide to Faster Builds
	- Viktor Kirilov
	- slides: https://slides.com/onqtam/faster_builds
	- CppOnSea 2019 - https://www.youtube.com/watch?v=anbOy47fBYI
	- C++ Russia 2019 - https://www.youtube.com/watch?v=5rRLHRRqg5A
	- code::dive 2018
		- Part 1: https://www.youtube.com/watch?v=WSFbNhCbdJM
		- Part 2: https://www.youtube.com/watch?v=9-Y5JnJlypM
- Visual Studio
	- clcache.py - a compiler cache for Microsoft Visual Studio
		- https://github.com/frerich/clcache
	- CompileTimer: Set of tests to benchmark the compile time of C++ constructs
		- https://github.com/janwilmans/CompileTimer
	- Make VC++ Compiles Fast Through Parallel Compilation
		- https://randomascii.wordpress.com/2014/03/22/make-vc-compiles-fast-through-parallel-compilation/
	- Visual Studio 2017 Throughput Improvements and Advice
		- https://blogs.msdn.microsoft.com/vcblog/2018/01/04/visual-studio-2017-throughput-improvements-and-advice/

---

# Software

- Build System Shootout: Comparison of build program expressive power
	- https://github.com/ndmitchell/build-shootout
- TraceCode: Trace a build to find out which source files are built in a binary
	- https://github.com/nexB/tracecode-toolkit
	- Debug your build by tracing and reversing: stracing your build from sources to binaries
		- https://fosdem.org/2018/schedule/event/debugging_tools_stracing_build/

---

# Talks

## 2019

- Behind the Scenes of a C++ Build System
	- CppCon 2019; Jussi Pakkanen
	- https://www.youtube.com/watch?v=34KzT2yvQuM
	- https://github.com/CppCon/CppCon2019/tree/master/Presentations/behind_the_scenes_of_a_cpp_build_system
- Building Modules
	- CppCon 2019; Michael Spencer 
	- https://www.youtube.com/watch?v=L0SHHkBenss

## 2018

- Build Systems: a Simple Solution to a Complicated Problem
	- CppCon 2018; Peter Bindels
	- https://www.youtube.com/watch?v=mWOmkwv8N_U
- Creating the Complete Build Package
	- CppCon 2018
	- Panelists: Boris Kolpackov, Titus Winter, Robert Schumacher, Paddy McDonald, Manuel Klimek
	- https://www.youtube.com/watch?v=TjdCxXdjaSA
- Don't package your libraries, write packagable libraries!
	- CppCon 2018; Robert Schumacher
	- https://www.youtube.com/watch?v=sBP17HQAQjk
- What to Expect from a Next-Generation C++ Build System
	- CppCon 2018; Boris Kolpackov
	- https://www.youtube.com/watch?v=cJP7SSLjvSI

## 2016

- A New Architecture for Building Software
	- 2016 LLVM Developers’ Meeting; Daniel Dunbar
	- https://www.youtube.com/watch?v=b_T-eCToX1I
	- http://www.llvm.org/devmtg/2016-11/#talk10
	- llbuild: A low-level build system, used by Xcode and the Swift Package Manager
		- https://github.com/apple/swift-llbuild

## 2017

- Building C++ Modules
	- CppCon 2017; Boris Kolpackov
	- https://www.youtube.com/watch?v=E8EbDcLQAoc
- There Will Be Build Systems: I Configure Your Milkshake
	- CppCon 2017; Isabella Muerte
	- https://www.youtube.com/watch?v=7THzO-D0ta4
