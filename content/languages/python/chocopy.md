title=ChocoPy
tags=language, python, static, langdev
summary=A restricted subset of Python 3 designed for classroom use in undergraduate compilers courses.
~~~~~~

[Website](https://chocopy.org/) | [Language Reference Manual](https://chocopy.org/chocopy_language_reference.pdf) | [Implementation Guide](https://chocopy.org/chocopy_implementation_guide.pdf) | [SPLASH-E Paper](https://chocopy.org/chocopy-splashe19.pdf) and [Slides](https://chocopy.org/chocopy-splashe19-slides.pdf)

At a glance, ChocoPy is:

* Familiar: ChocoPy programs can be executed directly in a Python (3.6+) interpreter. ChocoPy programs can also be edited using standard Python syntax highlighting.
* Safe: ChocoPy uses Python 3.6 type annotations to enforce static type checking. The type system supports nominal subtyping.
* Concise: A full compiler for ChocoPy be implemented in about 12 weeks by undergraduate students of computer science. This can be a hugely rewarding exercise for students.
* Expressive: One can write non-trivial ChocoPy programs using lists, classes, and nested functions. Such language features also lead to interesting implications for compiler design.

Bonus: Due to static type safety and ahead-of-time compilation, most student implementations outperform the reference Python implementation on non-trivial benchmarks.
