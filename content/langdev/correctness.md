title=Compiler correctness reading
tags=language, reading, native, clr, llvm, language development
summary=A collection of links and resources on compiler correctness, certification, validation, verification.
~~~~~~

[What is a secure programming language?](https://drops.dagstuhl.de/opus/volltexte/2019/10546/pdf/LIPIcs-SNAPL-2019-3.pdf)

- ACM SIGPLAN Conference on Certified Programs and Proofs (CPP) - http://dblp.org/db/conf/cpp/
- Black-Box Equivalence Checking Across Compiler Transformations
	- 2018 PhD thesis; Manjeet Dahiya
	- https://www.cse.iitd.ac.in/~sbansal/pubs/manjeet_thesis.pdf
- Calculating Correct Compilers
	- Journal of Functional Programming, Volume 25, September 2015
	- Patrick Bahr and Graham Hutton
	- http://www.cs.nott.ac.uk/~pszgmh/bib.html#ccc
- Calculating Correct Compilers II: Return of the Register Machines
	- September 2019
	- Patrick Bahr and Graham Hutton
	- http://www.cs.nott.ac.uk/~pszgmh/bib.html#ccc2
- Compiling with Proofs
	- 1998 Ph.D. Thesis; George C. Necula
	- https://people.eecs.berkeley.edu/~necula/Papers/thesis.pdf
- Compilers and Termination Revisited
	- https://blog.regehr.org/archives/161
- Formal Approaches to Secure Compilation: A Survey of Fully Abstract Compilation and Related Work
	- ACM Computing Surveys (CSUR) 51(6) 2019
	- Marco Patrignani, Amal Ahmed, Dave Clarke
	- https://doi.org/10.1145/3280984
	- http://theory.stanford.edu/~mp/mp/Publications_files/a125-patrignani.pdf
	- http://theory.stanford.edu/~mp/mp/Publications_files/main-full.pdf
- How to prove a compiler correct - Daniel Patterson
	- https://dbp.io/essays/2018-01-16-how-to-prove-a-compiler-correct.html
	- https://github.com/dbp/howtoproveacompiler
- How to prove a compiler fully abstract
	- https://dbp.io/essays/2018-04-19-how-to-prove-a-compiler-fully-abstract.html
- Operational Refinement for Compiler Correctness
	- 2012 PhD Dissertation; Robert W. Dockins
	- ftp://ftp.cs.princeton.edu/reports/2012/936.pdf
- Some Goals for High-impact Verified Compiler Research - https://blog.regehr.org/archives/1565
- The Next 700 Compiler Correctness Theorems (Functional Pearl)
	- ICFP 2019
	- Daniel Patterson, Amal Ahmed
	- https://icfp19.sigplan.org/details/icfp-2019-papers/35/The-Next-700-Compiler-Correctness-Theorems-A-Functional-Pearl-
	- https://dbp.io/pubs/2019/ccc/
	- https://www.ccs.neu.edu/home/amal/papers/next700ccc.pdf
	- https://www.youtube.com/watch?v=qrwzpo6ISCQ
- What even is compiler correctness? - https://www.williamjbowman.com/blog/2017/03/24/what-even-is-compiler-correctness/
- Write Your Compiler by Proving It Correct - http://liamoc.net/posts/2015-08-23-verified-compiler.html

## Debugging

See also: Section 6.3 (Compiler Bug Debugging) in ["A Survey of Compiler Testing"](https://software-lab.org/publications/csur2019_compiler_testing.pdf)

- Automatic Isolation of Compiler Errors
	- ACM Transactions on Programming Languages and Systems (TOPLAS) 16(5) 1994
	- David Whalley
	- https://www.cs.fsu.edu/~whalley/papers/acmtoplas94.pdf
- Bugfind: A Tool for Debugging Optimizing Compilers
	- ACM SIGPLAN Notices 25, no. 1 (1990)
	- Jacqueline M. Caron, Peter A. Darnell
	- https://doi.org/10.1145/74105.74106
- Compiler Bug Isolation via Effective Witness Test Program Generation
	- ESEC/FSE 2019 
	- Junjie Chen, Jiaqi Han, Peiyi Sun, Lingming Zhang, Dan Hao, Lu Zhang
	- https://dl.acm.org/citation.cfm?id=3338957
	- https://personal.utdallas.edu/~lxz144130/publications/fse2019.pdf
	- DiWi (Diversified Witnesses)
		- https://github.com/JunjieChen/DiWi
- Debugging compilers with optimization fuel
	- 2011
	- Edward Z. Yang
	- http://blog.ezyang.com/2011/06/debugging-compilers-with-optimization-fuel/
- GCC Wiki: Finding miscompilations on large testcases
	- https://gcc.gnu.org/wiki/Analysing_Large_Testcases
- LLVM bugpoint
	- LLVM bugpoint tool: design and usage
		- https://llvm.org/docs/Bugpoint.html
	- Reduce Your Testcases with Bugpoint and Custom Scripts
		- http://blog.llvm.org/2015/11/reduce-your-testcases-with-bugpoint-and.html
- Locating a compiler bug with git bisection
	- 2020; William Woodruff
	- https://blog.yossarian.net/2020/05/07/Locating-a-compiler-bug-with-git-bisection
- Replay Compilation: Improving Debuggability of a Just-in-Time Compiler
	- OOPSLA 2006
	- Kazunori Ogata, Tamiya Onodera, Kiyokuni Kawachiya, Hideaki Komatsu, Toshio Nakatani
	- https://doi.org/10.1145/1167473.1167493
	- https://www.researchgate.net/publication/221321785_Replay_compilation_Improving_debuggability_of_a_just-in-time_compiler
- Toward Automatic Debugging of Compilers
	- International Joint Conference on Artificial Intelligence 1977
	- Hanan Samet
	- http://www.cs.umd.edu/~hjs/pubs/compilers/toward-automatic-debugging.pdf
- Type-Based Verification of Assembly Language for Compiler Debugging
	- ACM SIGPLAN Workshop on Types in Language Design and Implementation (TLDI) 2005
	- Bor-Yuh Evan Chang, Adam Chlipala, George C. Necula, Robert R. Schneck
	- http://adam.chlipala.net/papers/CoolaidTLDI05/
- Using Mutants to Help Developers Distinguish and Debug (Compiler) Faults
	- Journal of Software Testing, Verification, and Reliability (STVR) Volume 30, Issue 2 (2020)
	- Josie Holmes and Alex Groce
	- https://agroce.github.io/stvr20.pdf
	- https://github.com/agroce/compilermutants

## History

- Advice on Structuring Compilers and Proving Them Correct
	- Principles of Programming Languages (POPL) 1973
	- F. Lockwood Morris
	- https://dl.acm.org/citation.cfm?id=512941
- Compiler Verification: A Bibliography
	- ACM SIGSOFT Software Engineering Notes 28(6) 2003
	- Maulik A. Dave
	- https://dl.acm.org/citation.cfm?id=966235
	- http://www.cs.utah.edu/~skchoe/research/p2-dave.pdf
	- Compiler Verification: A Brief History - http://web.archive.org/web/20090807085152/http://www.geocities.com/compiler00/dave1.html
- Correctness of a Compiler for Algol-like Programs
	- Stanford Artificial Intelligence Memo No. 48 (1967)
	- Donald M. Kaplan
	- https://exhibits.stanford.edu/ai/catalog/hk625xv7120
- Correctness of a Compiler for Arithmetic Expressions
	- Mathematical Aspects of Computer Science (1) 1967
	- John McCarthy and James A. Painter
	- http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.76.7835
	- http://www-formal.stanford.edu/jmc/mcpain.html
- Formalising Meaning: a History of Programming Language Semantics
	- 2019 PhD dissertation; Troy Kaighin Astarte
	- http://homepages.cs.ncl.ac.uk/t.astarte/res/pdf/TK_Astarte_Formalising_Meaning_2019.pdf

## Lectures

- Compiler Verification: The Next Generation
	- PurPL Fest 2019; Amal Ahmed
	- https://www.youtube.com/watch?v=KcOxdyq1vs0
- OPLSS (Oregon Programming Languages Summer School)
	- 2019 - https://www.cs.uoregon.edu/research/summerschool/summer19/topics.php
		- Secure Compilation - Amal Ahmed
			- https://www.youtube.com/playlist?list=PL0DsGHMPLUWXXWjqfRuA20FNnNXOTj_Wh
	- 2017 - https://www.cs.uoregon.edu/research/summerschool/summer17/topics.php
		- Correct and Secure Compilation for Multi-Language Software - Amal Ahmed
			- https://www.youtube.com/playlist?list=PL0DsGHMPLUWUSJ8_THYt6Jcu7Kgp2kjaP
	- 2016 - https://www.cs.uoregon.edu/research/summerschool/summer16/curriculum.php
		- Logical relations/Compiler verification - Amal Ahmed 
			- https://www.youtube.com/playlist?list=PLiHLLF-foEexzqkMlTqzbbX_7V45MAXyX
	- 2015 - https://www.cs.uoregon.edu/research/summerschool/summer15/curriculum.html
		- Logical Relations - Amal Ahmed 
			- https://www.youtube.com/playlist?list=PLiHLLF-foEex7BOvMbrbUFC9XgU7fZW66
	- 2014 - https://www.cs.uoregon.edu/research/summerschool/summer14/curriculum.html
		- Software Verification - Andrew Appel
	- 2013 - https://www.cs.uoregon.edu/research/summerschool/summer13/curriculum.html
		- Logical Relations - Amal Ahmed
		- Verifying LLVM Optimizations in Coq - Steve Zdancewic 
	- 2012 - https://www.cs.uoregon.edu/research/summerschool/summer12/curriculum.html
		- Logical Relations - Amal Ahmed
		- Compiler verification - Xavier Leroy
