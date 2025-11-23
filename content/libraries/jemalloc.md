title=jemalloc
tags=library, memory management
summary=A general purpose malloc implementation that emphasizes fragmentation avoidance and scalable concurrency support.
~~~~~~

[Website](http://jemalloc.net/) | [Source](https://github.com/jemalloc/jemalloc) *(Archived 2025)*

jemalloc first came into use as the FreeBSD libc allocator in 2005, and since then it has found its way into numerous applications that rely on its predictable behavior. In 2010 jemalloc development efforts broadened to include developer support features such as heap profiling and extensive monitoring/tuning hooks. Modern jemalloc releases continue to be integrated back into FreeBSD, and therefore versatility remains critical. Ongoing development efforts trend toward making jemalloc among the best allocators for a broad range of demanding applications, and eliminating/mitigating weaknesses that have practical repercussions for real world applications.

