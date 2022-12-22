title=Multi-Dimensional and Hierarchical Database Toolkit
tags=library, storage, native
summary=A Linux-based, open sourced, C/C++ toolkit of portable software that supports fast, flexible, multi-dimensional and hierarchical storage, retrieval and manipulation of information in data bases ranging in size up to 256 terabytes.
~~~~~~

[User's Guide](https://www.cs.uni.edu/~okane/source/MUMPS-MDH/MDH-UsersGuide.pdf)

The MDH (Multi-Dimensional and Hierarchical) Database Toolkit is a Linux-based, open sourced, toolkit of portable software that supports fast, flexible, multi-dimensional and hierarchical storage, retrieval and manipulation of information in data bases ranging in size up to 256 terabytes.

The package is written in C and C++ and is available under the GNU GPL/LGPL licenses in source code form. The distribution kit contains demonstration implementations of text and sequence retrieval tools that function with very large genomic data bases and illustrate the toolkit's capability to manipulate massive data sets of genomic information.

The toolkit is distributed as part of the [Mumps Compiler for Linux](/languages/mumps.html).

The toolkit is a solution to the problem of manipulating very large, character string indexed,multi-dimensional, sparse matrices. It is based on Mumps (also referred to as M), a general purpose programming language that originated in the mid 60's at the Massachusetts General Hospital. The toolkit supports access to the SQLite relational data base server, the Perl Compatible Regular Expression Library, and the Glade GUI builder.

The principal database feature in this project is the global array which permits direct, efficient manipulation of multi-dimensional arrays of effectively unlimited size. A global array is a persistent, sparse, undeclared, multi-dimensional, string indexed data disk based structure. A global array may appear anywhere an ordinary array reference is permitted and data may be stored at leaf nodes as well as intermediate nodes in the data base array. The number of subscripts in an array reference is limited only by the system’s maximum length array reference restriction with all subscripts expanded to their string values. The toolkit includes several functions to traverse the data base and manipulate the arrays.

The toolkit makes the data base and function set available as C++ classes and also permits execution of legacy Mumps scripts. To use the toolkit, you install the MDH and Mumps distribution kit and related code.

