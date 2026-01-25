title=Mu Micro Virtual Machine
tags=vm, langdev
summary=A Solid Foundation for Language Development.
~~~~~~

[Website](https://microvm.github.io/) | [Specification](https://gitlab.anu.edu.au/mu/mu-spec) | [Guide](https://mu-tutorial.readthedocs.io/en/latest/) | [Project](https://gitlab.anu.edu.au/groups/mu)

*Looks like the project paused/stopped development around 2019 or so*

## Implementations

* [Holstein](https://gitlab.anu.edu.au/mu/mu-impl-ref2): reference
* [Zebu](https://gitlab.anu.edu.au/mu/mu-impl-fast): high-perf, in development

A large fraction of today’s software is written in managed languages. These languages increase software productivity by offering rich abstractions for managing memory, executing code concurrently, and hiding the complexity of modern hardware. Examples include JavaScript, PHP, Objective-C, Java, C#, Python, and Ruby. These languages are economically important. Unfortunately, most of these languages are inefficient, imposing overheads as large as a factor of fifty compared to orthodox language choices such as C.

The project will define, develop, evaluate, and refine the essential components of a new foundation layer for managed language implementation. In doing so, it will address a key source of systemic inefficiency, by pioneering micro virtual machines as an efficient high-performance substrate for managed language implementation. The relationship between a micro virtual machine and existing managed language implementations is analogous to the one between an operating system micro kernel and monolithic operating systems such as Linux. A micro virtual machine captures the insight that there exists a well-defined foundation common to most modern languages that can take responsibility for fundamental abstractions over hardware, concurrency, and memory. By isolating and exposing this substrate, a micro virtual machine embodies state-of-the-art base technology available to language implementers while isolating them from the pernicious complexities of these abstractions, freeing them to focus on all-important language-specific optimizations. This project will enable more efficient software and a distinctly sharper focus for language implementation research and development.

## Resources

### Papers

-   Yi Lin, "An efficient implementation of a micro virtual machine", Ph.D. thesis, College of Engineering and Computer Science, The Australian National University, 2019. [pdf](https://openresearch-repository.anu.edu.au/bitstream/1885/158122/1/Yi%20Lin%20Thesis%202019.pdf "Download pdf") [url](https://doi.org/10.25911/5ca1dad991dbf)
-   K. Wang, S. M. Blackburn, A. L. Hosking, and M. Norrish, "Hop, Skip, & Jump: Practical On-Stack Replacement for a Cross-Platform Language-Neutral VM", in 14th ACM SIGPLAN/SIGOPS International Conference on Virtual Execution Environments (VEE 2018), 2018. [pdf](https://wks.github.io/downloads/pdf/osr-vee-2018.pdf) [url](https://doi.org/10.1145/3186411.3186412)
-   Kunshan Wang, "Micro Virtual Machines: A Solid Foundation for Managed Language Implementation", Ph.D. thesis, College of Engineering and Computer Science, The Australian National University, 2017. [pdf](https://openresearch-repository.anu.edu.au/bitstream/1885/147871/1/Wang%20Thesis%202018.pdf "Download pdf") [url](http://hdl.handle.net/1885/147871)
-   Y. Lin, S. M. Blackburn, A. L. Hosking, and M. Norrish, "Rust as a Language for High Performance GC Implementation", in Proceedings of the Sixteenth ACM SIGPLAN International Symposium on Memory Management, ISMM ‘16, Santa Barbara, CA, June 13, 2016, 2016. [pdf](http://users.cecs.anu.edu.au/~steveb/downloads/pdf/rust-ismm-2016.pdf "Download pdf")
-   Y. Lin, K. Wang, S. M. Blackburn, M. Norrish, and A. L. Hosking, "Stop and Go: Understanding Yieldpoint Behavior", in Proceedings of the Fourteenth ACM SIGPLAN International Symposium on Memory Management, ISMM ‘15, Portland, OR, June 14, 2015, 2015. [pdf](http://users.cecs.anu.edu.au/~steveb/downloads/pdf/yieldpoint-ismm-2015.pdf "Download pdf")
-   K. Wang, Y. Lin, S. M. Blackburn, M. Norrish, and A. L. Hosking, "Draining the Swamp: Micro Virtual Machines as Solid Foundation for Language Development", in 1st Summit on Advances in Programming Languages (SNAPL 2015), 2015. [pdf](http://drops.dagstuhl.de/opus/volltexte/2015/5034/pdf/24.pdf) [url](http://drops.dagstuhl.de/opus/frontdoor.php?source_opus=5034)
