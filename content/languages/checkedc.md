title=Checked C
tags=native, research
summary=An extension to C that adds checking to C to detect or prevent common programming errors such as buffer overruns, out-of-bounds memory accesses, and incorrect type casts.
~~~~~~

"Most system software is written in C or C++, which is based on C. System software includes operating systems, browsers, databases, and programming language interpreters. System software is the “infrastructure” software that the world runs on.

"There are certain kinds of programming errors such as buffer overruns and incorrect type casts that programmers can make when writing C or C++ programs. These errors can lead to security vulnerabilities or software reliability problems. The Checked C extension will let programmers add checking to their programs to detect these kinds of errors when a program runs or while it is being written. Existing system software can be modified incrementally in a backwards-compatible fashion to have this checking.

"In C, programmers use pointers to access data. A pointer is the address of a memory cell. It is easy for programmers to make mistakes when working with pointers, such that a program reads or writes the wrong data. These mistakes can cause programs to crash, misbehave, or allow the program to be taken over by a malicious adversary. Checked C allows programmers to better describe how they intend to use pointers and the range of memory occupied by data that a pointer points to. This information is then used to add checking at runtime to detect mistakes where the wrong data is accessed, instead of the error occurring silently and without detection. This information also can be used detect programming errors while the program is being written. The checking is called “bounds-checking” because it checks that data is being accessed within its intended bounds. The name Checked C reflects the fact that static and dynamic checking is being added to C.

"Many programming languages already have bounds checking. C# and Java are examples of such languages. However, those languages automatically add the information needed for bounds checking to data structures. This is a problem for system software, where the programmer needs precise control over what a program is doing. In Checked C, the programmer controls the placement of information needed for bounds-checking and how the information flows through the program, so the programmer retains precise control over what a program is doing."

[Website](https://www.microsoft.com/en-us/research/project/checked-c/) | Github: [Language design](https://github.com/Microsoft/checkedc) and [compiler implementation](https://github.com/microsoft/checkedc-clang)


