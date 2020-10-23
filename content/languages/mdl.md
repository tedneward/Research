title=MDL
tags=language, gamedev, dynamic, functional
summary=A programming language, a descendant of the language Lisp whose initial purpose was to provide high level language support for the Dynamic Modeling Group at Massachusetts Institute of Technology's (MIT) Project MAC.
~~~~~~

Model Development Language or More Datatypes than Lisp or MIT Design Language

[Wikipedia](https://en.wikipedia.org/wiki/MDL_(programming_language)) | ["MDL Programming Primer"](http://publications.csail.mit.edu/lcs/pubs/pdf/MIT-LCS-TR-292.pdf) ["The MDL Programming Language"](http://ifarchive.org/if-archive/programming/mdl/manuals/MDL_Programming_Language.pdf) ["The MDL Programming Environment"](http://ifarchive.org/if-archive/programming/mdl/manuals/MDL_Programming_Environment.pdf)

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

