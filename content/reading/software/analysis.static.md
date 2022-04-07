title=Static Program Analysis
tags=language, native, object, metaobject, reading
summary=A collection of resources and readings on static program analysis
~~~~~~

- Static Analysis Roadmap
	- https://tpiazza.me/posts/2017-11-01-static-analysis-roadmap.html
- Best Practices for the use of Static Code Analysis within a Real-World Secure Development Lifecycle
	- 2015; Jeremy Boone
	- https://www.nccgroup.trust/us/our-research/best-practices-for-the-use-of-static-code-analysis-within-a-real-world-secure-development-lifecycle/
- Bill Torpey - [static analysis posts](http://btorpey.github.io/blog/categories/static-analysis/)
	- Static Analysis with Clang - http://btorpey.github.io/blog/2015/04/27/static-analysis-with-clang/
	- Mo' Static - http://btorpey.github.io/blog/2016/04/07/mo-static/
	- Even Mo' Static - http://btorpey.github.io/blog/2016/11/12/even-mo-static/
	- Lots o' static - http://btorpey.github.io/blog/2017/09/17/lotso-static/
- OASIS Static Analysis Results Interchange Format (SARIF) TC
	- Defining a standard output format for static analysis tools
	- https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=sarif
	- https://github.com/oasis-tcs/sarif-spec
	- Static Analysis Results: A Format and a Protocol: SARIF & SASP
		- https://blogs.grammatech.com/static-analysis-results-a-format-and-a-protocol-sarif-sasp
	- Integration of the Static Analysis Results Interchange Format in CogniCrypt
		- 2019 arXiv
		- Sriteja Kummita, Goran Piskachev
		- https://arxiv.org/abs/1907.02558
- [On the Relationship Between Static Analysis and Type Theory](https://semantic-domain.blogspot.com/2019/08/on-relationship-between-static-analysis.html)

## Books

- [Static Program Analysis](https://cs.au.dk/~amoeller/spa/) by Anders Møller, Michael I. Schwartzbach

## Research

- Static Analysis Symposia Central Site
	- http://staticanalysis.org/
- A Few Billion Lines of Code Later: Using Static Analysis to Find Bugs in the Real World
	- Communications of the ACM, Vol. 53 No. 2, 2010
	- Al Bessey, Ken Block, Ben Chelf, Andy Chou, Bryan Fulton, Seth Hallem, Charles Henri-Gros, Asya Kamsky, Scott McPeak, Dawson Engler
	- https://cacm.acm.org/magazines/2010/2/69354-a-few-billion-lines-of-code-later/fulltext
- Automated Program Transformation for Improving Software Quality
	- 2019 PhD Dissertation; Rijnard van Tonder
	- https://www.cs.cmu.edu/~rvantond/pdfs/rijnard-dissertation.pdf
- How to Build Static Checking Systems Using Orders of Magnitude Less Code
	- ASPLOS 2016
	- Fraser Brown, Andres Nötzli, Dawson Engler
	- https://web.stanford.edu/~mlfbrown/paper.pdf
	- http://lambda-the-ultimate.org/node/5348
	- https://blog.acolyer.org/2016/05/31/how-to-build-static-checking-systems-using-orders-of-magnitude-less-code/
- Lessons from Building Static Analysis Tools at Google
	- Communications of the ACM, Vol. 61 No. 4, 2018
	- Caitlin Sadowski, Edward Aftandilian, Alex Eagle, Liam Miller-Cushon, Ciera Jaspan
	- https://cacm.acm.org/magazines/2018/4/226371-lessons-from-building-static-analysis-tools-at-google/abstract
	- https://research.google.com/pubs/pub46576.html
- Object Model Construction for Inheritance in C++ and Its Applications to Program Analysis
	- Compiler Construction (CC) 2012
	- Yang, Jing, Gogul Balakrishnan, Naoto Maeda, Franjo Ivancic, Aarti Gupta, Nishant Sinha, Sriram Sankaranarayanan, Naveen Sharma
	- https://dl.acm.org/citation.cfm?id=2259241
	- http://pages.cs.wisc.edu/~bgogul/Research/Papers/cc12.html
	- https://www.semanticscholar.org/paper/Object-Model-Construction-for-Inheritance-in-C%2B%2B-a-Yang-Balakrishnan/510501c7051c03d5e2a70089deeda8dfc3a7304f
	- https://www.cs.colorado.edu/~srirams/papers/cc12-final.pdf
	- http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.225.2429
- Scaling Static Analyses at Facebook
	- Dino Distefano, Manuel Fähndrich, Francesco Logozzo, Peter W. O'Hearn
	- Communications of the ACM, Vol. 62 No. 8, 2019
	- https://cacm.acm.org/magazines/2019/8/238344-scaling-static-analyses-at-facebook/fulltext
- Source Language Representation of Function Summaries in Static Analysis
	- ICOOOLPS / ECOOP 2016
	- Gábor Horváth, Norbert Pataki
	- https://2016.ecoop.org/event/icooolps-2016-source-language-representation-of-function-summaries-in-static-analysis
- Tailoring Programs for Static Analysis via Program Transformation
	- International Conference on Software Engineering (ICSE) 2020
	- Rijnard van Tonder and Claire Le Goues
	- https://www.cs.cmu.edu/~rvantond/pdfs/tailoring-analysis-icse-2020.pdf
- Toward Full Elasticity in Distributed Static Analysis
	- Diego Garbervetsky, Edgardo Zoppi, Thomas Ball, Ben Livshits 
	- 2016 Microsoft Research Technical Report: MSR-TR-2015-88
	- https://www.microsoft.com/en-us/research/publication/toward-full-elasticity-distributed-static-analysis/
- Undecidability of static analysis
	- ACM Letters on Programming Languages and Systems (LOPLAS) Volume 1 Issue 4, Dec. 1992
	- William Landi
	- https://dl.acm.org/citation.cfm?id=161501
	- "Two fundamental static-analysis problems are may alias and must alias. The former is not recursive (is undecidable), and the latter is not recursively enumerable (is uncomputable), even when all paths are executable in the program being analyzed for languages with if statements, loops, dynamic storage, and recursive data structures."

