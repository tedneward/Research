title=Python
tags=platform, language, functional, dynamic, object, metaobject
summary=A dynamic language and platform.
~~~~~~

[Website](https://www.python.org/) | [Docs (Python3)](https://docs.python.org/3/)

### Implementations:

* C: [CPython](/languages/python/cpython): native implementation
* JVM: [GraalPython](https://github.com/graalvm/graalpython): part of [GraalVM](/vms/graalvm.html)
* JVM: [Jython](http://www.jython.org/)
* CLR: [IronPython3](https://github.com/IronLanguages/ironpython3) and [IronPython2](https://github.com/IronLanguages/ironpython2)
* [Nuitka](https://nuitka.net/): optimizing Python compiler written in Python that creates executables that run without a separate installer. ([Source](https://github.com/Nuitka/Nuitka))
* C: [Stackless](https://github.com/stackless-dev/stackless): Stackless implementation (fork of CPython)
* Python-to-[Crystal](/languages/ruby/crystal): [Py2cr](https://github.com/nanobowers/py2cr)
* C: [tinypy](http://www.tinypy.org/): a minimalist implementation of python in 64k of code. [Source](https://github.com/philhassey/tinypy)
* C: [micropython](/languages/python/micropython): lean and efficient Python for microcontrollers and constrained systems
* C: [CircuitPython](/languages/python/circuitpython): fork of micropython
* Web: [Jupyter Notebooks](https://jupyter.org/): installable locally via `pip install notebook`
* Web: [JupyterLab](https://jupyter.org/): "latest web-based interactive development environment for notebooks, code, and data ... allows users to configure and arrange workflows in data science, scientific computing, computational journalism, and machine learning... extensions expand and enrich functionality."
* Javascript: [Skulpt](https://github.com/skulpt/skulpt): a Javascript implementation of Python 2.x.
* Rust: [Cannoli](https://github.com/joncatanio/cannoli): a compiler for a subset of Python 3.6.5.

Not sure if this is a library or an implementation or a tool, it's sort of all three: [VPython](https://vpython.org/), 3D Programming for Ordinary Mortals

### Articles:

* [WTFPython](https://github.com/satwikkansal/wtfpython): A collection of unintuitive ways Python behaves, with explanations as to why.
* [bytecode](https://bytecode.readthedocs.io/) ([Source](https://github.com/MatthieuDartiailh/bytecode)): Python module to modify bytecode
* [Learn Python ASTs, by building your own linter](https://sadh.life/post/ast/)
* [How To Create a Python GUI To Write Data to a File With PyQt5](https://thenewstack.io/how-to-create-a-python-gui-to-write-data-to-a-file-with-pyqt5/)

### Interesting examples:

* [Peter Norvig's Collection of Jupyter Notebooks](http://www.norvig.com/ipython/README.html): This makes me consider spending some time with Jupyter Notebooks a lot more.

### Bridges/FFI:

* [pyobjc](https://pyobjc.readthedocs.io/en/latest/) ([Source](https://github.com/ronaldoussoren/pyobjc)): The Python-to-Objective-C bridge

---

[`dis`: Disassembler for Python bytecode](https://docs.python.org/3/library/dis.html): package in the Python distribution, contains a list of all the Python VM bytecodes

