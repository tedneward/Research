title=EverPARSE
tags=language, library
summary=A framework that automatically produces high-performance, formally proven C code for parsing binary messages.
~~~~~~

[MSR page](https://www.microsoft.com/en-us/research/blog/research-collection-creating-the-future-of-software-development/) | [Website](https://project-everest.github.io/everparse/) | [Source](https://github.com/project-everest/everparse/)

The framework contains three components:

* LowParse: At the core of EverParse is LowParse, a verified library of parsing and formatting combinators programmed and verified in F*.

* 3D: A frontend for EverParse to enable specifying data formats in an style resembling type definitions in the C programming language. We have used it to generate message validation code for use within several low-level C programs.

* QuackyDucky: A frontend for EverParse that accepts data formats in a style common to many RFCs. We have used it to generate message processing code for several networking protocols, including TLS and QUIC.

