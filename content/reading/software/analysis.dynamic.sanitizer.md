title=Dynamic Analysis Sanitizers reading
tags=reading, language, tool, library, native, llvm
summary=Readings on software sanitizers.
~~~~~~

- Sanitizers: AddressSanitizer, ThreadSanitizer, MemorySanitizer
	- https://github.com/google/sanitizers
	- https://github.com/google/sanitizers/wiki

- Compilers
	- Clang
		- AddressSanitizer - https://clang.llvm.org/docs/AddressSanitizer.html
		- DataFlowSanitizer - https://clang.llvm.org/docs/DataFlowSanitizer.html
		- Hardware-assisted AddressSanitizer Design Documentation - https://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html
		- LeakSanitizer - https://clang.llvm.org/docs/LeakSanitizer.html
		- MemorySanitizer - https://clang.llvm.org/docs/MemorySanitizer.html
		- SanitizerCoverage - https://clang.llvm.org/docs/SanitizerCoverage.html
		- SanitizerStats - https://clang.llvm.org/docs/SanitizerStats.html
		- Sanitizer special case list - https://clang.llvm.org/docs/SanitizerSpecialCaseList.html
		- ThreadSanitizer - https://clang.llvm.org/docs/ThreadSanitizer.html
		- UndefinedBehaviorSanitizer - https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html

	- GCC
		- https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Options.html
		- Address and Thread Sanitizers in GCC
			- https://developers.redhat.com/blog/2014/12/02/address-and-thread-sanitizers-gcc/
		- Useful GCC address sanitizer checks not enabled by default
			- https://kristerw.blogspot.com/2018/06/useful-gcc-address-sanitizer-checks-not.html

- Adding Clang Sanitizers to a CMake Build
	- https://genbattle.bitbucket.io/blog/2018/01/05/Dev-Santa-Claus-Part-1/
		- https://old.reddit.com/r/cpp/comments/7qzqlg/dev_santa_claus_pt1_adding_clang_sanitizers_to_a/

- Creating an LLVM Sanitizer from Hopes and Dreams
	- https://blog.trailofbits.com/2019/06/25/creating-an-llvm-sanitizer-from-hopes-and-dreams/
	- llvm-sanitizer-tutorial and documentation
		- https://github.com/trailofbits/llvm-sanitizer-tutorial

- GWP-ASan: Sampling heap memory error detection in-the-wild
	- 2019; Vlad Tsyrklevich
	- https://sites.google.com/a/chromium.org/dev/Home/chromium-security/articles/gwp-asan

- Kernel Concurrency Sanitizer (KCSAN)
	- https://github.com/google/ktsan/wiki/KCSAN
	- Concurrency bugs should fear the big bad data-race detector
		- part 1: https://lwn.net/Articles/816850/
		- part 2: https://lwn.net/Articles/816854/

- Kernel Thread Sanitizer (KTSAN)
	- https://github.com/google/ktsan
	- https://github.com/google/ktsan/wiki

#### Research

- A Preliminary Study on Open-Source Memory Vulnerability Detectors
	- International Conference on Software Analysis, Evolution, and Reengineering (SANER), ERA track, 2020
	- Yu Nong and Haipeng Cai
	- http://chapering.github.io/pubs/saner20-a.pdf
	- AddressSanitizer, CBMC, DrMemory, MemorySanitizer, Valgrind
	- Research questions:
		- RQ1: How effective are these detectors in terms of precision, recall, and accuracy?
		- RQ2: How efficient are the detectors in terms of their cost for detecting vulnerabilities?
		- RQ3: How do these detectors compare in terms of their detection accuracy?
- AddressSanitizer: A Fast Address Sanity Checker
	- 2012 USENIX Annual Technical Conference (ATC)
	- Konstantin Serebryany, Derek Bruening, Alexander Potapenko, Dmitry Vyukov
	- https://www.usenix.org/conference/atc12/technical-sessions/presentation/serebryany
	- https://research.google/pubs/pub37752/
- CastSan: Efficient Detection of Polymorphic C++ Object Type Confusions with LLVM
	- European Symposium on Research in Computer Security (ESORICS) 2018
	- Muntean P., Wuerl S., Grossklags J., Eckert C.
	- https://link.springer.com/chapter/10.1007/978-3-319-99073-6_1
	- https://www.docdroid.net/INWYBF7/castsan-esorics18.pdf
- CUP: Comprehensive User-Space Protection for C/C++
	- AsiaCCS 2018
	- Nathan Burow, Derrick McKee, Scott A. Carr, Mathias Payer
	- https://hexhive.github.io/publications/files/18AsiaCCS.pdf
	- https://github.com/HexHive/CUP
- DangSan: Scalable Use-after-free Detection
	- European Conference on Computer Systems (EuroSys) 2017
	- Erik van der Kouwe, Vinod Nigade, Cristiano Giuffrida
	- http://www.cs.vu.nl/~giuffrida/papers/dangsan_eurosys17.pdf
	- https://github.com/vusec/dangsan
- EffectiveSan: Type and Memory Error Detection using Dynamically Typed C/C++
	- PLDI 2018
	- Gregory J. Duck, Roland H. C. Yap
	- https://arxiv.org/abs/1710.06125
	- https://github.com/GJDuck/EffectiveSan
	- https://pldi18.sigplan.org/event/pldi-2018-papers-effectivesan-type-and-memory-error-detection-using-dynamically-typed-c-c-
- HexType: Efficient Detection of Type Confusion Errors for C++
	- ACM Conference on Computer and Communication Security (CCS) 2017
	- Yuseok Jeon, Priyam Biswas, Scott A. Carr, Byoungyoung Lee, and Mathias Payer.
	- Slides (PDF): http://nebelwelt.net/publications/files/1734c3-presentation.pdf
	- Paper (PDF): https://nebelwelt.net/publications/files/17CCS.pdf
	- 34C3 (2017)
		- https://media.ccc.de/v/34c3-8848-type_confusion_discovery_abuse_and_protection
		- https://www.youtube.com/watch?v=jbglFfkRYQs
	- HexType: Efficient Detection of Type Confusion Errors for C++
		- https://github.com/HexHive/HexType
- HexVASAN: Venerable Variadic Vulnerabilities Vanquished
	- Usenix Security Symposium 2017
	- Priyam Biswas, Alessandro Di Federico, Scott A. Carr, Prabhu Rajasekaran, Stijn Volckaert, Yeoul Na, Michael Franz, and Mathias Payer.
	- https://nebelwelt.net/publications/files/17SEC.pdf
	- https://nebelwelt.net/publications/files/17SEC-presentation.pdf
	- https://github.com/HexHive/HexVASAN
- MemorySanitizer: fast detector of uninitialized memory use in C++
	- Code Generation and Optimization (CGO) 2015
	- Evgeniy Stepanov and Konstantin Serebryany
	- https://research.google.com/pubs/archive/43308.pdf
- PartiSan: Fast and Flexible Sanitization via Run-time Partitioning
	- Research in Attacks, Intrusions and Defenses (RAID) 2018
	- Julian Lettner, Dokyung Song, Taemin Park, Stijn Volckaert, Per Larsen, Michael Franz
	- https://arxiv.org/abs/1711.08108
- TypeSanitizer: Practical Type Confusion Detection
	- Computer and Communications Security (CCS) 2016
	- Istvan Haller, Yuseok Jeon, Hui Peng, Mathias Payer, Herbert Bos, Cristiano Giuffrida, Erik van der Kouwe
	- https://nebelwelt.net/publications/files/16CCS2.pdf
	- TypeSan checks casts in C++ code - code released for CCS 2016
		- https://github.com/vusec/typesan

### Projects

- QASan: QEMU-AddressSanitizer
	- https://github.com/andreafioraldi/qasan
	- Sanitized Emulation with QASan
		- https://andreafioraldi.github.io/articles/2019/12/20/sanitized-emulation-with-qasan.html
- sanitizers-cmake: CMake modules to help use sanitizers
	- https://github.com/arsenm/sanitizers-cmake
- TypeART: LLVM-based type and memory allocation tracking sanitizer
	- https://github.com/tudasc/TypeART
	- Compiler-aided Type Tracking for Correctness Checking of MPI Applications
		- International Workshop on Software Correctness for HPC Applications (Correctness) 2018
		- Alexander Hück, Jan-Patrick Lehr, Sebastian Kreutzer, Joachim Protze, Christian Terboven, Christian Bischof, Matthias S. Müller
		- https://doi.org/10.1109/Correctness.2018.00011
		- https://correctness-workshop.github.io/2018/papers/lehr.pdf

### Talks

- AddressSanitizer, ThreadSanitizer and MemorySanitizer -- Dynamic Testing Tools for C++
	- GTAC 2013; Kostya Serebryany
	- https://www.youtube.com/watch?v=Q2C2lP8_tNE
- Address and Thread Sanitizer in GCC: State of the Onion
	- GNU Tools Cauldron 2013; Dodji Seketeli
	- https://gcc.gnu.org/wiki/cauldron2013?action=AttachFile&do=view&target=asan.pdf
	- https://www.youtube.com/watch?v=41_WZk6AePY 
- C++ Sanitizers
	- C++ Weekly; Ep. 84 (2017)
	- https://www.youtube.com/watch?v=MB6NPkB4YVs
- Debugging with LLVM: A quick introduction to LLDB and LLVM sanitizers
	- FOSDEM 2020
	- Andrzej Warzynski; Graham Hunter
	- https://fosdem.org/2020/schedule/event/debugging_with_llvm/
- Finding races and memory errors with LLVM instrumentation
	- 2011 LLVM Developers’ Meeting; Konstantin Serebryany
	- https://www.youtube.com/watch?v=sJqQTUtV6GY
- Finding races and memory errors with compiler instrumentation: AddressSanitizer, ThreadSanitizer
	- GNU Tools Cauldron 2012; Konstantin Serebryany, Dmitry Vyukov
	- https://gcc.gnu.org/wiki/cauldron2012?action=AttachFile&do=get&target=kcc.pdf
	- https://gcc.gnu.org/wiki/cauldron2012#Finding_races_and_memory_errors_with_GCC_instrumentation_.28AddressSanitizer.29
- MemorySanitizer, ThreadSanitizer: Scalable run-time detection of uninitialized memory reads and data races with LLVM instrumentation
	- 2012 LLVM Developers’ Meeting; Kostya Serebryany
	- https://www.youtube.com/watch?v=HDgttiIvMxA
- News from Sanitizers
	- GNU Tools Cauldron 2014; Evgeniy Stepanov, Kostya Serebryany
	- https://docs.google.com/presentation/d/1QG2qlzpxlsdDsX4uHhTLWAoUmbzbhedFMoMvviud0Us
	- https://www.youtube.com/watch?v=Ek7z_oC0dak
- The Type Sanitizer: Free Yourself from -fno-strict-aliasing
	- 2017 LLVM Developers’ Meeting; Hal Finkel
	- https://www.youtube.com/watch?v=vAXJeN7k32Y
- ThreadSanitizer APIs for external libraries
	- 2017 LLVM Developers’ Meeting; Kuba Mracek
	- https://www.youtube.com/watch?v=-J9bMpqfc7A

