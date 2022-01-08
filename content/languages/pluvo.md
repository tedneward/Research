title=Pluvo
tags=language, functional, windows, linux
summary=A functional and imperative programming language intended to be highly practical for scripting and CGIs, interpreted using a just-in-time compiler. Its hybrid dynamic and strict typing is flexible enough to allow duck typing. Its functions are, more specifically, closures, and it allows object orientation using prototypes.
~~~~~~

[Website](http://inamidst.com/pluvo/) | [Source](http://inamidst.com/list/pluvo/)

Hello World example:
```
#!/usr/bin/env pluvo

% grep.pvo - Search Files for Pattern
Author: Sean B. Palmer, inamidst.com

usage
   "grep.pvo [options] pattern filenames+"
   -h/--help "Display a help message"
   -t/--test "Perform builtin code tests"

grep = (filenames pattern)
   %% Grep through filenames for pattern
   example
      grep ("tag:pluvo.org,2006:words") "ria"
      => "20. Thesmophoriazousae"

   for line {@lines filenames}
      /$pattern/ line { out line }

main = (argv)
   --help or {not args} { help }
   --test { check grep; quit }
   grep {args.filenames} {args.pattern}

script main
```

