title=C++
tags=language, native, object, metaobject
summary=An object-oriented flavor of C.
~~~~~~

Online reference: [cppreference](http://en.cppreference.com/w/cpp)

Frequently conjoined with [C](/languages/c); Bjarne wanted C++ to be "as close as possible to C, but not closer." Over the years, C++ has taken a strong stand on some lexical and syntactic things about C that didn't hold up well over time, and C has retrofitted many of those choices back into C.

## Compiler Implementations:

* GNU
	- C++ Standards Support in GCC - https://gcc.gnu.org/projects/cxx-status.html
	- GNU C++ Library (libstdc++) - https://gcc.gnu.org/onlinedocs/libstdc++/manual/status.html
* [LLVM](/platforms/llvm)
	- Clang - http://clang.llvm.org/cxx_status.html
	- libc++ - http://libcxx.llvm.org/
* [Emscripten](../emscripten): C++ to ASM.js/WebAssembly
* [OpenWatcom](http://www.openwatcom.org/)
* [Digital Mars](http://www.digitalmars.com) : Free C/C++ Compiler for DOS, Win & NT by the author of Zortech C++.
* [Cheerp](../cheerp): C++ to WASM bytecode [Github](https://github.com/leaningtech)
* EDG C++ Front End - Supported C++ and C Language Features
	- http://www.edg.com/c/features
* Intel C++ Compiler
	- C++11: https://software.intel.com/en-us/articles/c0x-features-supported-by-intel-c-compiler
	- C++14: https://software.intel.com/en-us/articles/c14-features-supported-by-intel-c-compiler
	- C++17: https://software.intel.com/en-us/articles/c17-features-supported-by-intel-c-compiler
* Visual C++
	- Support For C++11/14/17 Features: https://msdn.microsoft.com/en-us/library/hh567368.aspx
	- Microsoft C++ language conformance table: https://docs.microsoft.com/en-us/cpp/visual-cpp-language-conformance
* [Dev-C++](http://www.bloodshed.net/) : Free IDE and compiler for the C and C++ languages. Delphi and C source code available.
* [Djgpp](http://www.delorie.com/djgpp/) : Free compiler for c, c++, forth, pascal and more including C sources.
* [nwcc](http://nwcc.sourceforge.net/): a simple C compiler for Unix systems targeting a variety of architectures. ([Source](http://sourceforge.net/project/showfiles.php?group_id=97668))
* [TinyC Compiler](https://bellard.org/tcc/)
* C++ compiler support - http://en.cppreference.com/w/cpp/compiler_support

### Variants and extensions

* Writing GCC plugins
	* https://gabrieleserra.ml/blog/2020-08-27-an-introduction-to-gcc-and-gccs-plugins.html
	* https://stephanfr.blog/2013/05/19/building-gcc-plugins-part-1-c-11-generalized-attributes/
* [GCC Design-by-Contract invariant plugin](https://github.com/GavinRay97/gcc-invariant-plugin) and [related blog post](https://gavinray97.github.io/blog/adding-invariant-to-cpp-design-by-contract)
* [The architecture of Montana: an open and extensible programming environment with an incremental C++ compiler](https://dl.acm.org/doi/10.1145/291252.288284)
* [OpenC++](https://chibash.github.io/public/opencxx/): a version of C++ with a Metaobject Protocol. [Source](https://opencxx.sourceforge.net/)
* [Proxy](https://github.com/microsoft/proxy): "Proxy" is a modern C++ library that helps you use polymorphism (a way to use different types of objects interchangeably) without needing inheritance. "Proxy" was created by Microsoft engineers and has been used in the Windows operating system since 2022. For many years, using inheritance was the main way to achieve polymorphism in C++. However, new programming languages like Rust offer better ways to do this. We have improved our understanding of object-oriented programming and decided to use pointers in C++ as the foundation for "Proxy". Specifically, the "Proxy" library is designed to be:

	* Portable: "Proxy" was implemented as a header-only library in standard C++20. It can be used on any platform while the compiler supports C++20. The majority of the library is freestanding, making it feasible for embedded engineering or kernel design of an operating system.
	* Non-intrusive: An implementation type is no longer required to inherit from an abstract binding.
	* Well-managed: "Proxy" provides a GC-like capability that manages the lifetimes of different objects efficiently without the need for an actual garbage collector.
	* Fast: With typical compiler optimizations, "Proxy" produces high-quality code that is as good as or better than hand-written code. In many cases, "Proxy" performs better than traditional inheritance-based approaches, especially in managing the lifetimes of objects.
	* Accessible: Learned from user feedback, accessibility has been significantly improved with intuitive syntax, good IDE compatibility, and accurate diagnostics.
	* Flexible: Not only member functions, the "abstraction" of "Proxy" allows any expression to be polymorphic, including free functions, operators, conversions, etc. Different abstractions can be freely composed on demand. Performance tuning is supported for experts to balance between extensibility and performance.

## References

- https://cppreference.com/
	- cppman: C++ manual pages for Linux/MacOS
		- https://github.com/aitjcize/cppman
	- C++ standard library reference (cppreference)
		- https://github.com/p12tic/cppreference-doc
	- Formatted C++ stdlib man pages (cppreference)
		- https://github.com/jeaye/stdman
- A cheatsheet of modern C++ language and library features
	- https://github.com/AnthonyCalandra/modern-cpp-features
- Overview of the New C++ (C++11/14) (PDF only) (Meyers) (updated for C++14) These are the presentation materials (slides and some lecture notes) of a three-day training course offered by Meyers, who's a highly respected author on C++. Even though the list of items is short, the quality is high.
- The C++ Core Guidelines (C++11/14/17/...) (edited by Bjarne Stroustrup and Herb Sutter) is an evolving online document consisting of a set of guidelines for using modern C++ well. The guidelines are focused on relatively higher-level issues, such as interfaces, resource management, memory management, and concurrency affecting application architecture and library design. The project was announced at CppCon'15 by Bjarne Stroustrup and others and welcomes contributions from the community. Most guidelines are supplemented with a rationale and examples as well as discussions of possible tool support. Many rules are designed specifically to be automatically checkable by static analysis tools.
- The C++ Super-FAQ (Marshall Cline, Bjarne Stroustrup, and others) is an effort by the Standard C++ Foundation to unify the C++ FAQs previously maintained individually by Marshall Cline and Bjarne Stroustrup and also incorporating new contributions. The items mostly address issues at an intermediate level and are often written with a humorous tone. Not all items might be fully up to date with the latest edition of the C++ standard yet.

## Books

* [C++ Annotations](https://fbb-git.gitlab.io/cppannotations/) - Frank B. Brokken (HTML, PDF)
* [C++ Core Guidelines](https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md) - Editors: Bjarne Stroustrup, Herb Sutter
* [C++ GUI Programming With Qt 3](https://ptgmedia.pearsoncmg.com/images/0131240722/downloads/blanchette_book.pdf) - Jasmin Blanchette, Mark Summerfield (PDF)
* [C++ Language](http://www.cplusplus.com/doc/tutorial/)
* [C++ Notes for Professionals](https://goalkicker.com/CPlusPlusBook) - Compiled from StackOverflow Documentation (PDF)
* [C++ Programming](https://en.wikibooks.org/wiki/C%2B%2B_Programming) - Panic, et al
* [C++ Succinctly, Syncfusion](https://www.syncfusion.com/resources/techportal/ebooks/cplusplus) (PDF, Kindle) (email address *requested*, not required)
* [C++ Tricks](http://www.bordoon.com/cplusplus/book_wrapper.html)
* [CS106X Programming Abstractions in C++](http://web.stanford.edu/class/cs106x/)
* [Elements of Programming](http://elementsofprogramming.com) - Alexander Stepanov and Paul McJones - (PDF)
* [Financial Numerical Recipes in C++](https://ba-odegaard.no/gcc_prog/recipes/) - Bernt Arne Ødegaard (PDF)
* [Fundamentals of C++ Programming](https://web.archive.org/web/20191005170118/https://python.cs.southern.edu/cppbook/progcpp.pdf) - Richard L. Halterman (PDF) *(:card_file_box: archived)*
* [Game Programming Patterns](http://gameprogrammingpatterns.com)
* [Google's C++ Style Guide](https://google.github.io/styleguide/cppguide.html)
* [Hands-On System Programming with C++](https://www.packtpub.com/free-ebook/hands-on-system-programming-with-c/9781789137880) - Dr. Rian Quinn (Packt account *required*)
* [How to make an Operating System](https://samypesse.gitbook.io/how-to-create-an-operating-system/) - Samy Pesse
* [How To Think Like a Computer Scientist: C++ Version](http://greenteapress.com/thinkcpp/index.html) - Allen B. Downey
* [Introduction to Design Patterns in C++ with Qt 4](http://ptgmedia.pearsoncmg.com/images/9780131879058/downloads/0131879057_Ezust_book.pdf) - Alan Ezust, Paul Ezust (PDF)
* [Joint Strike Fighter, C++ Coding Standards, by Bjarne Stroustrup](http://www.stroustrup.com/JSF-AV-rules.pdf) (PDF)
* [LearnCpp.com](https://www.learncpp.com) (HTML)
* [Learning C++ eBook](https://riptutorial.com/Download/cplusplus.pdf) - Compiled from StackOverflow Documentation (PDF)
* [Matters Computational: Ideas, Algorithms, Source Code, by Jorg Arndt](http://www.jjj.de/fxt/fxtbook.pdf) (PDF)
* [More C++ Idioms](https://en.wikibooks.org/wiki/More_C%2B%2B_Idioms) - Sumant Tambe and others, WikiBooks
* [Open Data Structures (In C++)](http://opendatastructures.org/ods-cpp.pdf) - Pat Morin (PDF)
* [Programming Fundamentals - A Modular Structured Approach using C++](https://learning.hccs.edu/faculty/ken.busbee/programming-fundamentals-a-modular-structured-approach-using-c) - Kenneth Leroy Busbee (PDF)
* [Software Design Using C++](http://cis.stvincent.edu/html/tutorials/swd/) - Br. David Carlson and Br. Isidore Minerd
* [Software optimization resources by Agner Fog](http://www.agner.org/optimize/)
* [The Boost C++ libraries](http://theboostcpplibraries.com) - Boris Schäling (HTML)
* [The Rook's Guide to C++](http://rooksguide.org/2013/11/26/version-1-0-is-out/) - Jeremy Hansen (PDF)
* [The Ultimate Question of Programming, Refactoring, and Everything](https://www.gitbook.com/book/alexastva/the-ultimate-question-of-programming-refactoring-/details)
* [Think C++: How To Think Like a Computer Scientist](https://greenteapress.com/wp/think-c/) - Allen B. Downey (PDF)
* [Thinking in C++, Second Edition, Vol. 1.](https://archive.org/details/TICPP2ndEdVolOne) - Bruce Eckel [(Vol. 2)](https://archive.org/details/TICPP2ndEdVolTwo)
* [Working Draft, Standard for Programming Language C++, 2021 Revision](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2021/n4885.pdf) - Thomas Köppe (PDF) *(:construction: in process)*

[The Definitive C++ Book Guide and List](http://stackoverflow.com/questions/388242/the-definitive-c-book-guide-and-list)

* *The C++ Programming Language* (Bjarne Stroustrup) The classic introduction to C++ by its creator. Written to parallel the classic K&R, this indeed reads very much like it and covers just about everything from the core language to the standard library, to programming paradigms to the language's philosophy.
* *Effective C++* (Meyers) (3rd Edition)
* *Effective Modern C++* (Meyers)
* *Effective STL* (Meyers)
* *More Effective C++* (Meyers)
* *Advanced C++ Programming Styles and Idioms* (James Coplien)
* *C++ Primer* (Lippman, Lajoie, Moo) (updated for C++11)
* *The Design and Evolution of C++* (Bjarne Stroustrup)
* *Inside the C++ Object Model* (Stanley Lippman)
* *Programming: Principles and Practice Using C++* (Bjarne Stroustrup), 2nd Edition
* *A Tour of C++* (Bjarne Stroustrup) (2nd edition) (for C++17)
* *Exceptional C++*	(Sutter)
* *More Exceptional C++* (Sutter)
* *Exceptional C++ Style* (Sutter)
* *C++ Coding Standards* (Sutter, Alexandrescu)
* *Accelerated C++*	(Koenig, Moo)
* *Large Scale C++ Software Design* (John Lakos)
* *The Annotated C++ Reference Manual* (Bjarne Stroustrup, Margaret A. Ellis)
* *C++ Templates: The Complete Guide* (Vandevoorde, Josuttis)
* *C++ 17 - The Complete Guide* (Nicolai M. Josuttis): This book describes all the new features introduced in the C++17 Standard covering everything from the simple ones like 'Inline Variables', 'constexpr if' all the way up to 'Polymorphic Memory Resources' and 'New and Delete with over aligned Data'.
* *C++ 20 - The Complete Guide* (Nicolai M. Josuttis): This book presents all the new language and library features of C++20. It covers the motivation and context of each new feature with examples and background information. The focus is on how these features impact day-to-day programming, what it means to combine them, and how to benefit from C++20 in practice. (Note that this book is published step-by-step.)
* *C++ in Action* (Bartosz Milewski): This book explains C++ and its features by building an application from ground up.
* *Functional Programming in C++*	Ivan Čukić	This book introduces functional programming techniques to modern C++ (C++11 and later). A very nice read for those who want to apply functional programming paradigms to C++.
* *Modern C++ Design* (Andrei Alexandrescu): A groundbreaking book on advanced generic programming techniques. Introduces policy-based design, type lists, and fundamental generic programming idioms then explains how many useful design patterns (including small object allocators, functors, factories, visitors, and multi-methods) can be implemented efficiently, modularly, and cleanly using generic programming.
* *C++ Template Metaprogramming* (David Abrahams and Aleksey Gurtovoy)		
* *C++ Concurrency In Action* (Anthony Williams): A book covering C++11 concurrency support including the thread library, the atomics library, the C++ memory model, locks and mutexes, as well as issues of designing and debugging multithreaded applications. A second edition covering C++14 and C++17 has already been published.
* *Advanced C++ Metaprogramming* (Davide Di Gennaro): A pre-C++11 manual of TMP techniques, focused more on practice than theory. There are a ton of snippets in this book, some of which are made obsolete by type traits, but the techniques, are nonetheless useful to know. If you can put up with the quirky formatting/editing, it is easier to read than Alexandrescu, and arguably, more rewarding. For more experienced developers, there is a good chance that you may pick up something about a dark corner of C++ (a quirk) that usually only comes about through extensive experience.	
* *Large Scale C++* volume I, Process and architecture (2020) (John Lakos): Part one of a three-part series extending the older book 'Large Scale C++ Design'. Lakos explains battle-tested techniques to manage very big C++ software projects. If you work in a big C++ software project this is a great read, detailing the relationship between physical and logical structure, strategies for components, and their reuse.
* *Ruminations on C++* (Andrew Koenig and Barbara Moo)
* *C++ Standard Library Tutorial and Reference* (Nicolai Josuttis): (updated for C++11) The introduction and reference for the C++ Standard Library. The second edition (released on April 9, 2012) covers C++11.
* *The C++ IO Streams and Locales* (Angelika Langer and Klaus Kreft): There's very little to say about this book except that if you want to know anything about streams and locales, then this is the one place to find definitive answers.
* Scientific and Engineering C++: An Introduction to Advanced Techniques and Examples (John Barton and Lee Nackman)

* The C++11/14/17 Standard (INCITS/ISO/IEC 14882:2011/2014/2017) This, of course, is the final arbiter of all that is or isn't C++. Be aware, however, that it is intended purely as a reference for experienced users willing to devote considerable time and effort to its understanding. The C++17 standard is released in electronic form for 198 Swiss Francs.

* The C++17 standard is available, but seemingly not in an economical form – directly from the ISO it costs 198 Swiss Francs (about $200 US). For most people, the final draft before standardization is more than adequate (and free). Many will prefer an even newer draft, documenting new features that are likely to be included in C++20.


### Articles and papers (focused on teaching, but also of interest for learning by self-studying)

- A Conversation about Teaching Software Engineering - John Regehr
	- https://blog.regehr.org/archives/1569
- How to Teach “Modern C++” to Someone who Already Knows Programming?
	- Australasian Computing Education Conference (ACE) 2018
	- Adalbert Gerald Soosai Raj, Varun Naik, Jignesh M. Patel, Richard Halverson
	- http://pages.cs.wisc.edu/~gerald/papers/TeachModernC++.pdf
- Koenig, A. & Moo, B. (2005) *Learning & Teaching C++ Programming*, <http://www.drdobbs.com/learning-teaching-c-programming/184401918>, C/C++ Users Journal February, 2005.
- Koenig, A. (2012) on "C++ Primer 5th Edition":
	- *Part 1: How To Revise a Textbook*, <http://www.drdobbs.com/cpp/c-primer-5th-edition-part-1-how-to-revis/240003977>, Dr. Dobb's, July 19, 2012.
	- *Part 2: How Language Revisions Change Strategy*, <http://www.drdobbs.com/cpp/c-primer-5th-edition-part-2-how-language/240004388>, Dr. Dobb's, July 25, 2012.
	- *Part 3: Smart Pointers Make It Harder To Teach How To Write Copy Constructors*, <http://www.drdobbs.com/cpp/c-primer-5th-edition-part-3-smart-pointe/240004805>, Dr. Dobb's, August 2, 2012.
	- *Part 4: What Makes a Good Example?*, <http://www.drdobbs.com/cpp/c-primer-5th-edition-part-4-what-makes-a/240005166>, Dr. Dobb's, August 8, 2012.
	- *Part 5: Core Language Versus Library?*, <http://www.drdobbs.com/cpp/c-primer-5th-edition-part-5-core-languag/240005657>, Dr. Dobb's, August 15, 2012
- Stroustrup, Bjarne (1999) *Learning Standard C++ as a New Language*; <http://www.stroustrup.com/new_learning.pdf>, C/C++ Users Journal, pp 43-54, May 1999.
- Stroustrup, Bjarne (2009) *Programming in an undergraduate CS curriculum*, <http://www.stroustrup.com/software.pdf>, WCCCE'09. May 2009. 
- Stroustrup, Bjarne (2010) *What Should We Teach New Software Developers? Why?*,
	<http://cacm.acm.org/magazines/2010/1/55760-what-should-we-teach-new-software-developers-why/fulltext>, CACM, January 2010.
- Stroustrup, Bjarne (2011) *Principles and Practice Using C++*
	- *Chapter 0: Notes to the Reader*,	<http://www.stroustrup.com/Programming/programming_ch0.pdf>
	- *Instructor’s Guide for Programming Principles and Practice using C++*, <http://www.stroustrup.com/Programming/PPP-guide.pdf>

## Resources

* [Jason Turner's C++ Weekly](https://www.youtube.com/channel/UCxHAlbZQNFU2LgEtiqd2Maw) - nice collection of C++-related videos.
* [C++ Best Practices](https://github.com/cpp-best-practices): Tools and documents related to @lefticus's C++ Best Practices guidelines.
* [Error-handling links](../error_handling)
* [Modern C++ Overview](https://github.com/AnthonyCalandra/modern-cpp-features) is the original source of the "Versions" section above and the best overview of all the new features in the language since I stopped using it around C++08.
* [cpplinks](https://github.com/MattPD/cpplinks) is a great collection of C++ links that I shamelessly forked and copied over. May be out of sync with the original.
* [C++ Rvalue References Explained](http://thbecker.net/articles/rvalue_references/section_01.html)
* [Compiler explorer](https://godbolt.org/)
* [What can I do with a moved-from object?](http://stackoverflow.com/questions/7027523/what-can-i-do-with-a-moved-from-object)
* [What are some uses of decltype(auto)?](http://stackoverflow.com/questions/24109737/what-are-some-uses-of-decltypeauto)
* C++ Core Guidelines
	- https://github.com/isocpp/cppcoreguidelines
	- http://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines.html
* C++ Patterns: A repository of modern C++ patterns curated by the community
	- https://github.com/sftrabbit/CppPatterns-Patterns
	- https://cpppatterns.com/
* C++ Tips of the Week: https://abseil.io/tips/
* Awesome Modern C++ - A collection of resources on modern C++.
	- https://awesomecpp.com/
	- https://github.com/rigtorp/awesome-modern-cpp
* Get Started! - https://isocpp.org/get-started
* Herb Sutter's Guru of the Week (GotW) series: https://herbsutter.com/gotw/
* Learning C++ - Simon Brand - https://blog.tartanllama.xyz/learning-cpp/
* List of Engineers Willing to Mentor You - http://stephaniehurlburt.com/blog/2016/11/14/list-of-engineers-willing-to-mentor-you
* Proposal for Study Group: C++ Education - http://wg21.link/P1231
* Steve Dewhurst: C++ Once, Weakly... - http://www.stevedewhurst.com/once_weakly.html
* Teaching C - https://blog.regehr.org/archives/1393
* The C++ Programming Language - http://www.stroustrup.com/C++.html
* The Definitive C++ Book Guide and List - https://stackoverflow.com/questions/388242/the-definitive-c-book-guide-and-list
* Where to Get Started Learing C++ and What Resources to Use
	- https://shafik.github.io/c++/learning/2019/09/05/getting_started_learning_cpp.html

## Lectures & Talks

### Learning & Teaching

- Beginning with C++
	- 2017; Jens Weller
	- https://www.youtube.com/watch?v=9WHRfU7U9lk
- C++: A General Purpose Language and Library - Kate Gregory and James McNellis
	- a free introductory C++ course on Microsoft Virtual Academy
	- https://channel9.msdn.com/Series/cplusplus-language-library
	- https://mva.microsoft.com/liveevents/c-a-general-purpose-language-and-library
	- http://www.microsoftvirtualacademy.com/training-courses/c-a-general-purpose-language-and-library-jump-start
- Core C++ 2019 / Teaching C++ Workshop 2019 @MTA
	- http://www2.mta.ac.il/~amirk/teaching_cpp_workshop_2019/
	- https://www.youtube.com/playlist?list=PLn4wYlDYx4bumJrfSjI8q_mXV0ieqJ6g7
- Experiences in Teaching Modern C++ to Beginners
	- C++Now 2019; Ryan Dougherty
	- https://www.youtube.com/watch?v=GV1r7uJkPH4
- How to Teach C++ and Influence a Generation - Christopher Di Bella 
	- CppCon 2018 - https://www.youtube.com/watch?v=3AkPd9Nt2Aw
	- ACCU 2019 - https://www.youtube.com/watch?v=nzEPHkUxXZs
- Learning and Teaching Modern C++
	- CppCon 2017; Bjarne Stroustrup
	- https://www.youtube.com/watch?v=fX2W3nNjJIo
- Learning and teaching modern C++
	- Meeting C++ 2016; Arne Mertz
	- https://www.youtube.com/watch?v=N5wOrhL4ew8
- Learning (and teaching) modern C++ - Challenges and Resources
	- C++ on Sea 2019; Arne Mertz
	- https://www.youtube.com/watch?v=yzb57K6b5SY
- Quantifying Accidental Complexity: An Empirical Look at Teaching and Using C++
	- Avast C++ Meetup; February 11, 2020; Herb Sutter
	- https://www.youtube.com/watch?v=qx22oxlQmKc
- SG20 Education and Recommended Videos for Teaching C++
	- https://www.cjdb.com.au/sg20-and-videos
- Stop Teaching C (When Teaching C++) - Kate Gregory
	- CppCast - Oct 14, 2015 - http://cppcast.com/2015/10/kate-gregory/
	- CppCon 2015 - https://www.youtube.com/watch?v=YnWhqhNdYyk

### Self-Study

- Back to Basics at CppCon 2019
	- https://quuxplusone.github.io/blog/2019/09/12/cppcon-2019-b2b-track/
- C9 Lectures: Stephan T. Lavavej
	1. Standard Template Library (STL) - https://channel9.msdn.com/Series/C9-Lectures-Stephan-T-Lavavej-Standard-Template-Library-STL-
	2. Advanced STL - https://channel9.msdn.com/Series/C9-Lectures-Stephan-T-Lavavej-Advanced-STL
	3. Core C++ - https://channel9.msdn.com/Series/C9-Lectures-Stephan-T-Lavavej-Core-C-
- C++ Programming Videos - Bo Qian - http://boqian.weebly.com/c-programming.html
	- https://www.youtube.com/user/BoQianTheProgrammer/playlists
- C++ YouTube Channels - https://github.com/shafik/cpp_youtube_channels
- C++ Weekly - Jason Turner - https://www.youtube.com/user/lefticus1/playlists
- code_report
	- https://youtube.com/c/codereport
	- https://github.com/codereport
- Everything Cpp - https://www.youtube.com/channel/UCxwGBrWeIIWO9V_uLwRWCdA/playlists
- Programming in C++ (Slides and Videos) - Michael Adams - https://www.ece.uvic.ca/~frodo/cppbook/

## Quizzes

Note: Some of the following are primarily for entertainment purposes; while providing useful guidance for self-study (and possibly self-amusement), using these for evaluation in a formal setting would likely be a terrible idea :-)

- CppQuiz - http://cppquiz.org/
- http://www.mycppquiz.com/
- C++ Pub Quiz ACCU 2012 - http://www.pvv.org/~oma/PubQuiz_ACCU_Apr2012.pdf
- C++ Pub Quiz ACCU 2013 - http://www.pvv.org/~oma/PubQuiz_ACCU_Apr2013.pdf
- C++ Pub Quiz ACCU 2014 - http://www.pvv.org/~oma/PubQuiz_ACCU_Apr2014.pdf
- C++ Pub Quiz ACCU 2016 - http://www.pvv.org/~oma/PubQuiz_ACCU_Apr2016.pdf
- Deep C (and C++) - https://www.slideshare.net/olvemaudal/deep-c
- Google's C++ Class - https://developers.google.com/edu/c++/quiz
- Insecure coding in C (and C++) - https://www.slideshare.net/olvemaudal/insecure-coding-in-c-and-c
- Online C++ tests - http://www.interqiew.com/tests?type=cpp - http://www.interqiew.com/tests?type=dp

## FAQs

- Bjarne Stroustrup's FAQs
	- FAQ - http://www.stroustrup.com/bs_faq.html
	- C++ Style and Technique FAQ - http://www.stroustrup.com/bs_faq2.html
	- C++11 - http://www.stroustrup.com/C++11FAQ.html
- C++ FAQ - https://isocpp.org/faq
	- Learning C++ - https://isocpp.org/wiki/faq/how-to-learn-cpp
- comp.lang.c Frequently Asked Questions - http://www.c-faq.com/
- LearnProgramming C++ FAQ - https://www.reddit.com/r/learnprogramming/wiki/faq_cpp

## [Standards](../std)

Overview of C++ features, by version: [C++20](../cpp20) / [C++17](../cpp17) / [C++14](../cpp14) / [C++11](../cpp11)

- C++ standard draft
	- https://github.com/cplusplus/draft
	- http://eel.is/c++draft/
	- C++ Standards Drafts in HTML - https://ubershmekel.github.io/cppdrafts/
	- HTML version of the C++ working paper
		- https://github.com/timsong-cpp/cppwp
		- https://timsong-cpp.github.io/cppwp/
- C++ International Standard schedule
	- https://wg21.link/P1000
- Current Status
	- https://isocpp.org/std/status
- ISO C++ paper scheduling and management
	- track proposals on GitHub
	- https://github.com/cplusplus/papers/issues
- Specref (search WG21 papers)
	- http://www.specref.org/
- wg21.link - WG21 redirect service - https://wg21.link/
- Where do I find the current C or C++ standard documents?
	- https://stackoverflow.com/questions/81656/where-do-i-find-the-current-c-or-c-standard-documents

## Portability

- Beautiful Native Libraries
	- http://lucumr.pocoo.org/2013/8/18/beautiful-native-libraries/
- C++ compiler support - http://en.cppreference.com/w/cpp/compiler_support
- Compiler Dependencies - https://isocpp.org/wiki/faq/compiler-dependencies
- Creating and using shared libraries with different compilers on different operating systems
	- http://gernotklingler.com/blog/creating-using-shared-libraries-different-compilers-different-operating-systems/
- GotW #100: Compilation Firewalls - https://herbsutter.com/gotw/_100/
- GotW #101: Compilation Firewalls, Part 2 - https://herbsutter.com/gotw/_101/
- How to Write Shared Libraries - Ulrich Drepper - http://www.akkadia.org/drepper/dsohowto.pdf
- Interoperability of Libraries Created by Different Compiler Brands
	- http://www.mingw.org/wiki/Interoperability_of_Libraries_Created_by_Different_Compiler_Brands
- libabc
	- http://0pointer.de/blog/projects/libabc
	- https://git.kernel.org/pub/scm/linux/kernel/git/kay/libabc.git/about/
- PImpl - http://en.cppreference.com/w/cpp/language/pimpl
- Program Library HOWTO
	- This HOWTO for programmers discusses how to create and use program libraries on Linux. This includes static libraries, shared libraries, and dynamically loaded libraries.
	- http://tldp.org/HOWTO/Program-Library-HOWTO/
- [SEI CERT C Coding Standard](https://wiki.sei.cmu.edu/confluence/pages/viewpage.action?pageId=87151973)
	- [MSC14-C. Do not introduce unnecessary platform dependencies](https://wiki.sei.cmu.edu/confluence/display/c/MSC14-C.+Do+not+introduce+unnecessary+platform+dependencies)
	- [MSC15-C. Do not depend on undefined behavior](https://wiki.sei.cmu.edu/confluence/display/c/MSC15-C.+Do+not+depend+on+undefined+behavior)
	- [MSC23-C. Beware of vendor-specific library and language differences](https://wiki.sei.cmu.edu/confluence/display/c/MSC23-C.+Beware+of+vendor-specific+library+and+language+differences)
- Understanding GCC Builtins to Develop Better Tools
	- ESEC/FSE 2019
	- Manuel Rigger, Stefan Marr, Bram Adams, Hanspeter Mössenböck
	- https://arxiv.org/abs/1907.00863
	- https://github.com/jku-ssw/gcc-builtin-study

#### Software

- Hedley
	- a single C/C++ header you can include in your project to enable compiler-specific features while retaining compatibility with all compilers. It contains dozens of macros to help make your code easier to use, harder to misuse, safer, faster, and more portable.
	- https://nemequ.github.io/hedley/
	- https://github.com/nemequ/hedley
- Portable Snippets
	- a collection of public domain (CC0) code snippets written in C for performing various common tasks which are typically OS, architecture, and/or compiler-dependent. 
	- https://github.com/nemequ/portable-snippets

#### Talks

- Making a Language Cross Platform: Libraries and Tooling
	- 2019 LLVM Developers’ Meeting; Gwen Mittertreiner
	- https://www.youtube.com/watch?v=bdiQM0IPMio
	- http://llvm.org/devmtg/2019-10/slides/Mittertreiner-MakingALanguageCrossPlatform.pdf
- Naivety of Creating Cross-Platform, Modern C++ Libraries: A Tour Of Our Challenges and Successes
	- CppCon 2017; Jonathan Henson
	- https://www.youtube.com/watch?v=JPdohAomZD8
- Intro to the C++ Object Model
	- CppCon 2015; Richard Powell
	- https://www.youtube.com/watch?v=iLiDezv_Frk&list=PLgpRclL8uN4xjpYqslYJlX2H1hRukN_Qr

## Lists/links

[List of C++ UI libraries](https://philippegroarke.com/posts/2018/c++_ui_solutions/)

## Communities

* C++ User Groups - https://meetingcpp.com/usergroups/
* Discord - IncludeCpp - https://www.includecpp.org/
* Facebook
  - C++ Enthusiasts - https://www.facebook.com/groups/CppEnthusiasts/
  - C++ in-practice questions - https://www.facebook.com/groups/CppInPracticeQuestions/

* Forums & Mailing Lists
  - Standard C++ Forums - https://isocpp.org/forums

### Project-specific

Project-specific, but likely of interest to the general C++ community.

* Boost Mailing Lists - http://www.boost.org/community/groups.html
* GCC
	+ IRC
		- usage: irc://irc.freenode.org/gcc - http://irc.netsplit.de/channels/details.php?room=%23gcc&net=freenode
		- development: irc://irc.oftc.net/gcc - http://irc.netsplit.de/channels/details.php?room=%23gcc&net=OFTC
	+ Mailing Lists - https://gcc.gnu.org/lists.html
* LLVM
	+ IRC - https://llvm.org/docs/#irc - irc://irc.oftc.net/llvm
	+ Mailing Lists - http://lists.llvm.org/mailman/listinfo
* MSDN, Visual C++ forums - http://social.msdn.microsoft.com/Forums/en/category/visualc/
	+ Visual C++ General - http://social.msdn.microsoft.com/Forums/en/vcgeneral/
	+ Visual C++ Language - http://social.msdn.microsoft.com/Forums/en/vclanguage/
	+ Parallel Computing in C++ and Native Code -- http://social.msdn.microsoft.com/Forums/en/parallelcppnative/

### Reddit

* /r/cpp - https://www.reddit.com/r/cpp/
* /r/cpp_questions - https://www.reddit.com/r/cpp_questions/
* /r/cpp_review - https://www.reddit.com/r/cpp_review/

### Slack

* C++ Slack Group - https://cpplang.slack.com
	+ Invitations
		- https://cpplang.now.sh/
		- https://cppalliance.org/slack/

### Stack Exchange

* C++ Code Review
	+ About - https://codereview.stackexchange.com/tags/c%2b%2b/info
	+ Questions - https://codereview.stackexchange.com/questions/tagged/c%2B%2B
* C++ Stack Overflow
	+ About - https://stackoverflow.com/tags/c%2b%2b/info
	+ Questions - http://stackoverflow.com/questions/tagged/c++
