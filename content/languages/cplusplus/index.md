title=C++
tags=language, native, object, metaobject
summary=An object-oriented flavor of C.
~~~~~~

Online reference: [cppreference](http://en.cppreference.com/w/cpp) | Specification

Frequently conjoined with [C](/languages/c); Bjarne wanted C++ to be "as close as possible to C, but not closer." Over the years, C++ has taken a strong stand on some lexical and syntactic things about C that didn't hold up well over time, and C has retrofitted many of those choices back into C.

#### Compiler Implementations:
* GNU
	- C++ Standards Support in GCC - https://gcc.gnu.org/projects/cxx-status.html
	- GNU C++ Library (libstdc++) - https://gcc.gnu.org/onlinedocs/libstdc++/manual/status.html
* [LLVM](/platforms/llvm.html)
	- Clang - http://clang.llvm.org/cxx_status.html
	- libc++ - http://libcxx.llvm.org/
* Emscripten
* [OpenWatcom](http://www.openwatcom.org/)
* [Cheerp](https://leaningtech.com/pages/cheerp.html): C++ to WASM bytecode [Github](https://github.com/leaningtech)
* C++ compiler support - http://en.cppreference.com/w/cpp/compiler_support
* EDG C++ Front End - Supported C++ and C Language Features
	- http://www.edg.com/c/features
* Intel C++ Compiler
	- C++11: https://software.intel.com/en-us/articles/c0x-features-supported-by-intel-c-compiler
	- C++14: https://software.intel.com/en-us/articles/c14-features-supported-by-intel-c-compiler
	- C++17: https://software.intel.com/en-us/articles/c17-features-supported-by-intel-c-compiler
* Visual C++
	- Support For C++11/14/17 Features: https://msdn.microsoft.com/en-us/library/hh567368.aspx
	- Microsoft C++ language conformance table: https://docs.microsoft.com/en-us/cpp/visual-cpp-language-conformance

#### References
- https://cppreference.com/
	- cppman: C++ manual pages for Linux/MacOS
		- https://github.com/aitjcize/cppman
	- C++ standard library reference (cppreference)
		- https://github.com/p12tic/cppreference-doc
	- Formatted C++ stdlib man pages (cppreference)
		- https://github.com/jeaye/stdman
- A cheatsheet of modern C++ language and library features
	- https://github.com/AnthonyCalandra/modern-cpp-features

Articles and papers (focused on teaching, but also of interest for learning by self-studying)

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

---

#### Standards

Overview of C++ features, by version:
[C++20](cpp20.html)
[C++17](cpp17.html)
[C++14](cpp14.html)
[C++11](cpp11.html)

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

More given [here](std.html).

#### Resources
* [Modern C++ Overview](https://github.com/AnthonyCalandra/modern-cpp-features) is the original source of the "Versions" section above and the best overview of all the new features in the language since I stopped using it around C++08.
* [cpplinks](https://github.com/MattPD/cpplinks) is a great collection of C++ links that I shamelessly forked and copied over. May be out of sync with the original.
* [C++ Rvalue References Explained](http://thbecker.net/articles/rvalue_references/section_01.html)
* [Compiler explorer](https://godbolt.org/)
* [Jason Turner's C++ Weekly](https://www.youtube.com/channel/UCxHAlbZQNFU2LgEtiqd2Maw) - nice collection of C++-related videos.
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
* Collaborative Collection of C++ Best Practices
	- https://github.com/lefticus/cppbestpractices
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

#### FAQs

- Bjarne Stroustrup's FAQs
	- FAQ - http://www.stroustrup.com/bs_faq.html
	- C++ Style and Technique FAQ - http://www.stroustrup.com/bs_faq2.html
	- C++11 - http://www.stroustrup.com/C++11FAQ.html
- C++ FAQ - https://isocpp.org/faq
	- Learning C++ - https://isocpp.org/wiki/faq/how-to-learn-cpp
- comp.lang.c Frequently Asked Questions - http://www.c-faq.com/
- LearnProgramming C++ FAQ - https://www.reddit.com/r/learnprogramming/wiki/faq_cpp

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

### IRC

* Freenode [http://freenode.net/]:
	+ #boost - http://www.boost.org/community/irc.html
	+ ##c++ - http://irc.netsplit.de/channels/details.php?room=%23%23C%2B%2B&net=freenode
	+ ##c++-basic - http://irc.netsplit.de/channels/details.php?room=%23%23c%2B%2B-basic&net=freenode
	+ ##C​+​+-general - http://irc.netsplit.de/channels/details.php?room=%23%23C%2B%2B-general&net=freenode
	+ ##c++-help - http://irc.netsplit.de/channels/details.php?room=%23%23C%2B%2B-help&net=freenode
	+ ##iso-c++ - http://irc.netsplit.de/channels/details.php?room=%23%23iso-c%2B%2B&net=freenode

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

### Usenet

The following newsgroups are accessible using a newsreader (requiring a news server account).
In case you'd prefer to use a web browser, Google Groups links are provided.

* alt.comp.lang.learn.c-c++ - http://groups.google.com/group/alt.comp.lang.learn.c-c++
* comp.lang.c++ - http://groups.google.com/group/comp.lang.c++
* comp.lang.c++.moderated - http://groups.google.com/group/comp.lang.c++.moderated
	+ http://www.gotw.ca/resources/clcm.htm
* comp.std.c++ - http://groups.google.com/group/comp.std.c++
* gnu.g++.help (g++-specific) - http://groups.google.com/group/gnu.g++.help
