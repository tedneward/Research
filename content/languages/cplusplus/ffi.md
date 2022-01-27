title=C++ FFI
tags=language, native, windows, macos, linux, llvm
summary=Some notes and details on how C++ can call native bindings.
~~~~~~

- C++ Language Interface Foundation (CLIF)
	- https://github.com/google/clif
- libffi: A portable foreign-function interface library
	- http://sourceware.org/libffi
	- https://github.com/libffi/libffi
- SWIG: Simplified Wrapper and Interface Generator
	- http://www.swig.org/
- C handler wrapping in C++ - https://arekmd.github.io/wrapping-c-handlers/
- CppCon 2014: Lisa Lippincott "How to call C libraries from C++"
	- https://www.youtube.com/watch?v=3ZO0V4Prefc
	- https://github.com/CppCon/CppCon2014/tree/master/Presentations/How%20to%20call%20C%20libraries%20from%20C%2B%2B
	- Code and slides from Lisa Lippincott's “How to Call C libraries from C++” presentation from Cppcon 2014
	- https://github.com/jfirebaugh/PlusPlus
- Cross-language interfaces between C and C++ - https://gustedt.wordpress.com/2017/08/08/cross-language-interfaces-between-c-and-c/
- DragonFFI: C Foreign Function Interface and JIT using Clang/LLVM
	- DragonFFI is a C Foreign Function Interface (FFI) library written in C++ and based on Clang/LLVM. It allows any language to call C functions thought the provided APIs and bindings.
	- https://github.com/aguinet/dragonffi/
	- FOSDEM 2018 - https://fosdem.org/2018/schedule/event/dragonffi/
	- DragonFFI: FFI/JIT for the C language using Clang/LLVM - http://blog.llvm.org/2018/03/dragonffi-ffijit-for-c-language-using.html
- ffi-overhead: comparing the C FFI (foreign function interface) overhead for various programming languages
	- https://github.com/dyu/ffi-overhead
- Hourglass Interfaces for C++ APIs - CppCon 2014
	- https://www.slideshare.net/StefanusDuToit/cpp-con-2014-hourglass-interfaces-for-c-apis
	- https://www.youtube.com/watch?v=PVYdHDm0q6Y
	- https://github.com/CppCon/CppCon2014/tree/master/Presentations/Hourglass%20Interfaces%20for%20C%2B%2B%20APIs
- Skip the FFI: Embedding Clang for C Interoperability 
	- 2014 LLVM Developers' Meeting
	- Jordan Rose, John McCall
	- https://llvm.org/devmtg/2014-10/#talk18
- The Salami Method
	- The Salami Method finely distinguishes between the different aspects and layers required for exposing platform-independent C++ on different “specific” platforms. At its extreme it strives to create a single, thin, transparent layer for each such aspect so that each layer is more easily built, tested, debugged, managed and maintained.
	- http://videocortex.io/2017/salami-method/
	- The Salami Method: multiplatform C++ development - Adi Shavit, CoreCpp IL Meetup, April 2018
		- https://www.youtube.com/watch?v=jdEmz3iXNlA
	- The Salami Method for Cross Platform Development - CppCon 2018; Adi Shavit
		- https://www.youtube.com/watch?v=ZSpGNiUvXVI

