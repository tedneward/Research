title=rpmalloc
tags=library, native, memory management, windows, linux, macos, ios, android
summary=Public domain cross platform lock free thread caching 16-byte aligned memory allocator implemented in C
~~~~~~

[Source](https://github.com/mjansson/rpmalloc)

This library provides a public domain cross platform lock free thread caching 16-byte aligned memory allocator implemented in C. 

The code should be easily portable to any platform with atomic operations and an mmap-style virtual memory management API. The API used to map/unmap memory pages can be configured in runtime to a custom implementation and mapping granularity/size.

We believe rpmalloc is faster than most popular memory allocators like tcmalloc, hoard, ptmalloc3 and others without causing extra allocated memory overhead in the thread caches compared to these allocators. We also believe the implementation to be easier to read and modify compared to these allocators, as it is a single source file of ~2200 lines of C code. All allocations have a natural 16-byte alignment.

Contained in a parallel repository is a benchmark utility that performs interleaved unaligned allocations and deallocations (both in-thread and cross-thread) in multiple threads. It measures number of memory operations performed per CPU second, as well as memory overhead by comparing the virtual memory mapped with the number of bytes requested in allocation calls. The setup of number of thread, cross-thread deallocation rate and allocation size limits is configured by command line arguments.

**Required functions**
Before calling any other function in the API, you MUST call the initialization function, either rpmalloc_initialize or rpmalloc_initialize_config, or you will get undefined behaviour when calling other rpmalloc entry point.

Before terminating your use of the allocator, you SHOULD call rpmalloc_finalize in order to release caches and unmap virtual memory, as well as prepare the allocator for global scope cleanup at process exit or dynamic library unload depending on your use case.

**Using**
The easiest way to use the library is simply adding rpmalloc.[h|c] to your project and compile them along with your sources. The allocator is complete self contained, you are not required to call the init/fini functions from your own code, but can do so in order to initialize and finalize the allocator in specific places or provide your own hooks and/or configuration:

* `rpmalloc_initialize` : Call at process start to initialize the allocator

* `rpmalloc_initialize_config` : Optional entry point to call at process start to initialize the allocator with a custom memory mapping backend, memory page size and mapping granularity.

* `rpmalloc_finalize`: Call at process exit to finalize the allocator

* `rpmalloc_thread_initialize`: Call at each thread start to initialize the thread local data for the allocator

* `rpmalloc_thread_finalize`: Call at each thread exit to finalize and release thread cache back to global cache

* `rpmalloc_config`: Get the current runtime configuration of the allocator

Then simply use the rpmalloc/rpfree and the other malloc style replacement functions. Remember all allocations are 16-byte aligned, so no need to call the explicit rpmemalign/rpaligned_alloc/rpposix_memalign functions unless you need greater alignment, they are simply wrappers to make it easier to replace in existing code.

If you wish to override the standard library malloc family of functions and have automatic initialization/finalization of process and threads, define ENABLE_OVERRIDE to non-zero (default is 1) which will include the malloc.c file in compilation of rpmalloc.c, and then rebuild the library or your project where you added the rpmalloc source. If you compile rpmalloc as a separate library you must make the linker use the override symbols from the library by referencing at least one symbol. The easiest way is to simply include rpmalloc.h in at least one source file and call rpmalloc_linker_reference somewhere - it's a dummy empty function. For C++ overrides you have to #include <rpnew.h> in at least one source file. The list of libc entry points replaced may not be complete, use libc/stdc++ replacement only as a convenience for testing the library on an existing code base, not a final solution.

For explicit first class heaps, see the rpmalloc_heap*_ API under first class heaps section, requiring RPMALLOC_FIRST_CLASS_HEAPS to be defined to 1 - default is 0, as it imposes a very slight performance hit in deallocation path from an extra conditinal instruction.