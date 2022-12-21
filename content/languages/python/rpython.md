title=RPython
tags=language, vm, python
summary=A translation and support framework for producing implementations of dynamic languages, emphasizing a clean separation between language specification and implementation aspects.
~~~~~~

[Docs](https://rpython.readthedocs.io/en/latest/)

"RPython is a restricted subset of Python that is amenable to static analysis. Although there are additions to the language and some things might surprisingly work, this is a rough list of restrictions that should be considered. Note that there are tons of special cased restrictions that you’ll encounter as you go. The exact definition is “RPython is everything that our translation toolchain can accept” :)"

[Actively developed projects](https://rpython.readthedocs.io/en/latest/examples.html) using RPython:

* PyPy, Python2 and Python3, very complete and maintained, http://pypy.org
* Pydgin, CPU emulation framework, supports ARM well, jitted, active development, https://github.com/cornell-brg/pydgin
* RSqueak VM, Smalltalk, core complete, JIT working, graphics etc getting there, in active development https://github.com/HPI-SWA-Lab/RSqueak
* Pixie, ‘A small, fast, native lisp with “magical” powers’, jitted, maintained, https://github.com/pixie-lang/pixie
* Monte, ‘A dynamic language inspired by Python and E.’ has an rpython implementation, in active development, https://github.com/monte-language/typhon
* Typhon, ‘A virtual machine for Monte’, in active development, https://github.com/monte-language/typhon
* Tulip, an untyped functional language, in language design mode, maintained, https://github.com/tulip-lang/tulip/
* Pycket, a Racket implementation, proof of concept, small language core working, a lot of primitives are missing. Slow development https://github.com/samth/pycket
* Lever, a dynamic language with a modifiable grammar, actively developed, https://github.com/cheery/lever

