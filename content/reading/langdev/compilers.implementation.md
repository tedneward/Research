title=Compilers Implementation/Optimization Reading
tags=language, reading, llvm, native, langdev
summary=Collection of articles on implementing languages.
~~~~~~

### Escape analysis
Escape analysis is an optimization for identifying objects which do not escape the dynamic extent of a function; such objects can be stack-allocated, or 'flattened' so that usages of them are replaced with a series of local variables (the latter optimization is known as "scalar replacement").

	An overview of the escape analysis algorithm used in Factor's Optimizing compiler: http://factor-language.blogspot.com/2008/08/algorithm-for-escape-analysis.html http://en.wikipedia.org/wiki/Escape_analysis

### Register allocation

* Linear scan: The linear scan algorithm sacrifices code quality for compilation speed; it only needs to make one or two passes over the intermediate representation to assign registers, and therefore runs in O(n) time; therefore it is much faster than graph coloring, which runs in O(n2) time.

	* Linear Scan Register Allocation, Massimiliano Poletto and Vivek Sarkar, http://www.cs.ucla.edu/~palsberg/course/cs132/linearscan.pdf

	* Linear Scan Register Allocation for the Java HotSpot Client Compiler, by Christian Wimmer, http://www.ssw.uni-linz.ac.at/Research/Papers/Wimmer04Master/

	* Quality and Speed in Linear-scan Register Allocation, by Omri Traub, Glenn Holloway, Michael D. Smith, http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.34.8435


* Graph coloring

	* Graph coloring is traditionally implemented by building an interference graph, attempting to color it, and if coloring fails, spilling some values and building the interference graph again. Building the graph is pretty expensive; if your program is in SSA form, it turns out you can perform spilling, build the graph and color it all in one shot. Register allocation for programs in SSA form using chordal graph coloring, Sebastian Hack, http://digbib.ubka.uni-karlsruhe.de/volltexte/documents/6532

### Static Single Assignment (SSA)

* [Static Single Assignment (SSA) Book (PDF)](http://ssabook.gforge.inria.fr/latest/book-full.pdf) and [online](https://gforge.inria.fr/scm/viewvc.php/ssabook/book/)

### Instruction selection

* [Instruction Selection: Principles, Methods, & Applications](http://kth.diva-portal.org/smash/record.jsf?pid=diva2:951540): Gabriel Hjort Blindell (2016)

* [Universal Instruction Selection](https://github.com/gablin/ghb-thesis/blob/master/ghb-thesis.pdf): 2018 PhD Dissertation; Gabriel Hjort Blindell [Github](https://github.com/gablin/ghb-thesis) and also [here](http://www.diva-portal.org/smash/record.jsf?pid=diva2:1185339)

[Notes on Graph Algorithms Used in Optimizing Compilers](http://www.cs.umb.edu/~offner/files/flow_graph.pdf) - Carl Offner

- ALIVe: Automatic LLVM InstCombine Verifier
	- http://rise4fun.com/Alive
	- https://github.com/nunoplopes/alive
	- http://blog.regehr.org/archives/1170
	- https://www.cs.utah.edu/~regehr/papers/pldi15.pdf
	- http://llvm.org/devmtg/2014-10/Slides/Menendez-Alive.pdf
- Automatic Feedback Directed Optimizer (AutoFDO)
	- https://gcc.gnu.org/wiki/AutoFDO
	- https://github.com/google/autofdo
- Compiler Optimizations for Reverse Engineers by Rolf Rolles
	- http://www.msreverseengineering.com/blog/2014/6/23/compiler-optimizations-for-reverse-engineers
	- http://www.msreverseengineering.com/s/Binary-Literacy-Static-6-Optimizations.ppt
- Compiler Optimization Options
	- GCC: https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html
	- Clang: http://clang.llvm.org/docs/CommandGuide/clang.html#cmdoption-O0 - https://stackoverflow.com/questions/15548023/clang-optimization-levels
	- Visual C++: https://msdn.microsoft.com/en-us/library/19z1t1wy.aspx
- [Devirtualization in C++](https://hubicka.blogspot.com/search/label/devirtualization)
- [GoingNative 50: New Visual C++ Code Optimizer](https://channel9.msdn.com/Shows/C9-GoingNative/GoingNative-50-New-Visual-C-Code-Optimizer)
- [Link time optimization (LTO)](https://hubicka.blogspot.com/search/label/link-time%20optimization)
- [Optimizations in C++ Compilers: A practical journey](https://queue.acm.org/detail.cfm?id=3372264), by Matt Godbolt; ACM Queue vol. 17, no. 5 (2019)


### Superoptimization

- GNU Superoptimizer Version 2 - https://github.com/embecosm/gso2
- Souper - a superoptimizer for LLVM IR - https://github.com/google/souper
- Stochastic Superoptimization - http://blog.regehr.org/archives/923
- STOKE: A stochastic superoptimizer and program synthesizer - http://stoke.stanford.edu - https://github.com/StanfordPL/stoke
- Superoptimizing Compilers - http://superoptimization.org/wiki/Superoptimizing_Compilers
- Superoptimization - James Pallister - FOSDEM 2015 - https://archive.fosdem.org/2015/schedule/event/superoptimization/

