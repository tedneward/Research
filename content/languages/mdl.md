title=MDL
tags=language, gamedev, dynamic, functional
summary=A programming language, a descendant of the language Lisp whose initial purpose was to provide high level language support for the Dynamic Modeling Group at Massachusetts Institute of Technology's (MIT) Project MAC.
~~~~~~

Model Development Language or More Datatypes than Lisp or MIT Design Language

[Wikipedia](https://en.wikipedia.org/wiki/MDL_(programming_language)) | ["MDL Programming Primer"](http://publications.csail.mit.edu/lcs/pubs/pdf/MIT-LCS-TR-292.pdf) ["The MDL Programming Language"](http://ifarchive.org/if-archive/programming/mdl/manuals/MDL_Programming_Language.pdf) ["The MDL Programming Environment"](http://ifarchive.org/if-archive/programming/mdl/manuals/MDL_Programming_Environment.pdf) | [The MDL Programming Language](https://mdl-language.readthedocs.io/en/latest/) ([Source](https://github.com/taradinoc/mdl-docs/))

"The MDL programming language began existence in late 1970 (under the name Muddle) as a successor to Lisp (Moon, 1974), a candidate vehicle for the Dynamic Modeling System, and a possible base for implementation of Planner (Hewitt, 1969). The original design goals included an interactive integrated environment for programming, debugging, loading, and editing: ease in learning and use; facilities for structured, modular, shared programs; extensibility of syntax, data types and operators: data-type checking for debugging and optional data-type declarations for compiled efficiency; associative storage, coroutining, and graphics. Along the way to reaching those goals, it developed flexible input/output (including the ARPA Network), and flexible interrupt and signal handling. It now serves as a base for software prototyping, research, development, education, and implementation of the majority of programs at MIT-DMS: a library of sharable modules, a coherent user interface, special research projects, autonomous daemons, etc."

Sample of PDP-10 MDL:
```
 <DEFINE EXIT-TO (EXITS RMS)
         #DECL ((EXITS) EXIT (RMS) <UVECTOR [REST ROOM]>)
         <MAPF <>
               <FUNCTION (E)
                  #DECL ((E) <OR DIRECTION ROOM CEXIT NEXIT DOOR>)
                  <COND (<TYPE? .E DIRECTION>)
                        (<AND <TYPE? .E ROOM> <MEMQ .E .RMS>>
                         <MAPLEAVE T>)
                        (<AND <TYPE? .E CEXIT> <MEMQ <2 .E> .RMS>>
                         <MAPLEAVE T>)
                        (<AND <TYPE? .E DOOR>
                              <OR <MEMQ <DROOM1 .E> .RMS>
                                  <MEMQ <DROOM2 .E> .RMS>>>
                         <MAPLEAVE T>)>>
               .EXITS>>
```

