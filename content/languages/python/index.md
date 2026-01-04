title=Python
tags=platform, language, functional, dynamic, object, metaobject, windows, macos, linux, web assembly
summary=A dynamic language and platform.
~~~~~~

[Website](https://www.python.org/) | [Docs (Python3)](https://docs.python.org/3/)

## Implementations:

* C: [CPython](/languages/python/cpython): native implementation

    - [Python internals: Symbol tables, part 1](https://eli.thegreenplace.net/2010/09/18/python-internals-symbol-tables-part-1)
    - [Python internals: Symbol tables, part 2](https://eli.thegreenplace.net/2010/09/20/python-internals-symbol-tables-part-2)

* JVM: [GraalPython](https://github.com/graalvm/graalpython): part of [GraalVM](/vms/graalvm.html)
* JVM: [Jython](http://www.jython.org/)
* Javascript: [Skulpt](https://github.com/skulpt/skulpt): a Javascript implementation of Python 2.x.
* CLR: [IronPython3](https://github.com/IronLanguages/ironpython3) and [IronPython2](https://github.com/IronLanguages/ironpython2)
* [Nuitka](https://nuitka.net/): optimizing Python compiler written in Python that creates executables that run without a separate installer. ([Source](https://github.com/Nuitka/Nuitka))
* C: [Stackless](https://github.com/stackless-dev/stackless): Stackless implementation (fork of CPython)
* Python-to-[Crystal](/languages/ruby/crystal): [Py2cr](https://github.com/nanobowers/py2cr)
* C: [tinypy](http://www.tinypy.org/): a minimalist implementation of python in 64k of code. [Source](https://github.com/philhassey/tinypy)
* C: [micropython](/languages/python/micropython): lean and efficient Python for microcontrollers and constrained systems
* C: [CircuitPython](/languages/python/circuitpython): fork of micropython
* C: [PythoC](https://github.com/1flei/PythoC) (See https://www.infoworld.com/article/4101101/pythoc-a-new-way-to-generate-c-code-from-python.html for article)
* Web: [Jupyter Notebooks](https://jupyter.org/): installable locally via `pip install notebook`
* Web: [JupyterLab](https://jupyter.org/): "latest web-based interactive development environment for notebooks, code, and data ... allows users to configure and arrange workflows in data science, scientific computing, computational journalism, and machine learning... extensions expand and enrich functionality."
* WASM: py2wasm: converts your Python programs to WebAssembly (`$ pip install py2wasm; py2wasm myprogram.py -o myprogram.wasm; wasmer run myprogram.wasm`)
* Rust: [Cannoli](https://github.com/joncatanio/cannoli): a compiler for a subset of Python 3.6.5.
* WASM: [Pyodide](/languages/python/pyodide) - a port of Python to WebAssembly that includes the core packages of the scientific Python stack (Numpy, Pandas, matplotlib).  Objects transparently convert and share between Python and Javascript.
* [MicroPython](/languages/python/micropython)
* Rust: [RustPython](https://github.com/RustPython/RustPython) - A Python 3 interpreter written in Rust. Check the demo [here](https://rustpython.github.io/demo/)
* WASM: [RPython](https://github.com/soIu/rpython) - A RPython (PyPy's Restricted Python) to WebAssembly compiler
* WASM: [TPython](https://github.com/soIu/tpython) - Pythonic++ (a "dialect" of C++) to WebAssembly compiler
* WASM: [WebAssembly Language Runtimes](https://github.com/vmware-labs/webassembly-language-runtimes) - up-to-date CPython prebuilt for WASI

Not sure if this is a library or an implementation or a tool, it's sort of all three: [VPython](https://vpython.org/), 3D Programming for Ordinary Mortals

### Language extensions and/or libraries close to the language

* [metap](https://github.com/baziotis/metap): Metaprogramming in Python. Automatic augmentation/rewrite of Python code.
* [bytecode](https://bytecode.readthedocs.io/) ([Source](https://github.com/MatthieuDartiailh/bytecode)): Python module to modify bytecode
* [`dis`: Disassembler for Python bytecode](https://docs.python.org/3/library/dis.html): package in the Python distribution, contains a list of all the Python VM bytecodes
* [Pyrefly](https://pyrefly.org/): A faster Python type checker written in Rust

### FFI

FFI for the standard CPython implementation

* [JPype](https://jpype.readthedocs.io/en/latest/userguide.html): A Python module that provides seamless access to Java libraries from Python using JNI. ([Source](https://github.com/jpype-project/jpype))
* [pyobjc](https://pyobjc.readthedocs.io/en/latest/) ([Source](https://github.com/ronaldoussoren/pyobjc)): The Python-to-Objective-C bridge
* [pydotnet](https://github.com/sadhbh-c0d3/pydotnet): Direct interop between Python and .NET assemblies via Microsoft C++/CLR and Boost.Python.

### Debugging

- Let's Create a Debugger Together [Source](https://github.com/parttimenerd/python-dbg)

    - Part 1: https://mostlynerdless.de/blog/2023/09/20/lets-create-a-python-debugger-together-part-1/
    - Part 2: https://mostlynerdless.de/blog/2023/10/06/lets-create-a-python-debugger-together-part-2/
    - Part 3: https://mostlynerdless.de/blog/2023/11/06/lets-create-a-python-debugger-together-part-3-refactoring/

## Reading

### Articles/Blogs/Essays

- https://www.freecodecamp.org/news/build-smart-expense-tracker-with-python-and-llms/

## Build tools

### Makefiles

- https://www.kdnuggets.com/the-case-for-makefiles-in-python-projects-and-how-to-get-started
- Complete Makefile for Flask app

        # Variables
        PYTHON := python3
        APP_NAME := myapp
        TEST_PATH := tests/

        .PHONY: help
        help:  ## Show this help message
          @echo "Available commands for $(APP_NAME):"
          @grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

        .DEFAULT_GOAL := help

        # Environment setup
        .PHONY: install
        install:  ## Install all dependencies
          $(PYTHON) -m pip install --upgrade pip
          pip install -r requirements.txt
          pip install -r requirements-dev.txt

        .PHONY: dev-setup
        dev-setup: install  ## Complete development setup
          pre-commit install
          @echo "✅ Development environment ready!"

        # Code quality
        .PHONY: format
        format:  ## Format code
          black $(APP_NAME) $(TEST_PATH)
          isort $(APP_NAME) $(TEST_PATH)

        .PHONY: lint
        lint:  ## Run linting
          flake8 $(APP_NAME) $(TEST_PATH)
          black --check $(APP_NAME) $(TEST_PATH)
          isort --check-only $(APP_NAME) $(TEST_PATH)

        # Testing
        .PHONY: test
        test:  ## Run tests
          $(PYTHON) -m pytest $(TEST_PATH) -v

        .PHONY: test-watch
        test-watch:  ## Run tests in watch mode
          $(PYTHON) -m pytest $(TEST_PATH) -v --looponfail

        .PHONY: coverage
        coverage:  ## Run tests with coverage
          $(PYTHON) -m pytest $(TEST_PATH) --cov=$(APP_NAME) --cov-report=html --cov-report=term

        # Development
        .PHONY: serve
        serve:  ## Start development server
          flask --app $(APP_NAME) run --debug --reload

        .PHONY: shell
        shell:  ## Start application shell
          flask --app $(APP_NAME) shell

        # Database
        .PHONY: db-migrate
        db-migrate:  ## Create database migration
          flask --app $(APP_NAME) db migrate

        .PHONY: db-upgrade
        db-upgrade:  ## Apply database migrations
          flask --app $(APP_NAME) db upgrade

        # Cleanup
        .PHONY: clean
        clean:  ## Clean up generated files
          find . -type f -name "*.pyc" -delete
          find . -type d -name "__pycache__" -delete
          rm -rf build/ dist/ *.egg-info/ htmlcov/ .coverage .pytest_cache/

        # All-in-one commands
        .PHONY: check
        check: lint test  ## Run all checks

        .PHONY: fresh-start
        fresh-start: clean install  ## Clean everything and reinstall

## Reading

### Books

* [100 Page Python Intro](https://learnbyexample.github.io/100_page_python_intro/) - Sundeep Agarwal
* [20 Python Libraries You Aren't Using (But Should)](https://www.oreilly.com/learning/20-python-libraries-you-arent-using-but-should) - Caleb Hattingh
* [A Beginner's Python Tutorial](https://en.wikibooks.org/wiki/A_Beginner%27s_Python_Tutorial) - Wikibooks
* [A Byte of Python](https://python.swaroopch.com) (3.x) (HTML, PDF, EPUB, Mobi)
* [A Guide to Python's Magic Methods](https://github.com/RafeKettler/magicmethods) - Rafe Kettler
* [A Practical Introduction to Python Programming](https://www.brianheinold.net/python/) - Brian Heinold (HTML, PDF, Exercises sources)
* [A Whirlwind Tour of Python](http://www.oreilly.com/programming/free/files/a-whirlwind-tour-of-python.pdf) - Jake VanderPlas (PDF) [(EPUB, MOBI)](http://www.oreilly.com/programming/free/a-whirlwind-tour-of-python.csp?download=yes)
* [Architecture Patterns with Python](https://www.cosmicpython.com/book/preface.html) - Harry J.W. Percival & Bob Gregory (HTML)
* [Automate the Boring Stuff with Python, 2nd Edition: Practical Programming for Total Beginners](https://automatetheboringstuff.com/2e/chapter0/) - Al Sweigart (3.8)
* [Beej's Guide to Python Programming - For Beginners](http://beej.us/guide/bgpython/) - B. Hall (HTML,PDF)
* [Beyond the Basic Stuff with Python](https://inventwithpython.com/beyond/) - Al Sweigart (3.x)
* [Biopython Tutorial and Cookbook](https://biopython.org/DIST/docs/tutorial/Tutorial.pdf) (PDF)
* [Build applications in Python the antitextbook](http://github.com/thewhitetulip/build-app-with-python-antitextbook) (3.x) (HTML, PDF, EPUB, Mobi)
* [Building Skills in Object-Oriented Design, V4](https://slott56.github.io/building-skills-oo-design-book/build/html/) - Steven F. Lott (3.7)
    * [Building Skills in Object-Oriented Design, Release 2.2.1](https://web.archive.org/web/20150824204101/http://buildingskills.itmaybeahack.com/book/oodesign-python-2.2/latex/BuildingSkillsinOODesign.pdf) - Steven F. Lott (PDF) (2.2.1)
    * [Building Skills in Object-Oriented Design, Release 3.1](https://web.archive.org/web/20160322093622/http://buildingskills.itmaybeahack.com/book/oodesign-3.1/latex/BuildingSkillsinObject-OrientedDesign.pdf) - Steven F. Lott (PDF) (3.1)
* [Building Skills in Python](https://web.archive.org/web/20190918094202/http://www.itmaybeahack.com/book/python-2.6/latex/BuildingSkillsinPython.pdf) - Steven F. Lott (PDF) (2.6)
* [Clean Architectures in Python](https://www.pycabook.com) - Leonardo Giordani (3.x)
* [Code Like a Pythonista: Idiomatic Python](https://web.archive.org/web/20180411011411/http://python.net/~goodger/projects/pycon/2007/idiomatic/handout.html) - David Goodger
* [CodeCademy Python](https://www.codecademy.com/learn/python)
* [Composing Programs](http://composingprograms.com) (3.x)
* [Cracking Codes with Python](https://inventwithpython.com/cracking/) - Al Sweigart (3.6)
* [Data Structures and Algorithms in Python](https://web.archive.org/web/20161016153130/http://www.brpreiss.com/books/opus7/html/book.html) - B. R. Preiss (PDF)
* [Dive into Python 3](https://diveintopython3.problemsolving.io) - Mark Pilgrim (3.0)
  * [Dive into Python](https://linux.die.net/diveintopython/html/toc/index.html) - Mark Pilgrim (2.3)
* [From Python to NumPy](https://www.labri.fr/perso/nrougier/from-python-to-numpy/) - Nicolas P. Rougier (3.6)
* [Full Stack Python](https://www.fullstackpython.com) - Matt Makai
* [Functional Programming in Python](https://www.oreilly.com/ideas/functional-programming-in-python) - David Mertz
* [Fundamentals of  Python Programming](https://web.archive.org/web/20191005170430/http://python.cs.southern.edu/pythonbook/pythonbook.pdf) - Richard L. Halterman (PDF) (:construction: *in process*)
* [Google's Python Class](https://developers.google.com/edu/python/) (2.4 - 2.x)
* [Google's Python Style Guide](https://google.github.io/styleguide/pyguide.html)
* [Hadoop with Python](https://www.oreilly.com/learning/hadoop-with-python) - Zachary Radtka, Donald Miner
* [Hands-On Natural Language Processing with Python](https://www.packtpub.com/free-ebook/hands-on-natural-language-processing-with-python/9781789139495) - Rajesh Arumugam, Rajalingappaa Shanmugamani (Packt account *required*)
* [Hitchhiker's Guide to Python!](http://docs.python-guide.org/en/latest/) (2.6)
* [How to Code in Python 3](https://assets.digitalocean.com/books/python/how-to-code-in-python.pdf) - Lisa Tagliaferri (PDF)
* [How to Make Mistakes in Python](http://www.oreilly.com/programming/free/files/how-to-make-mistakes-in-python.pdf) - Mike Pirnat (PDF) (1st edition)
* [How to Think Like a Computer Scientist: Learning with Python, Interactive Edition](https://runestone.academy/runestone/books/published/thinkcspy/index.html) - Brad Miller, David Ranum, Jeffrey Elkner, Peter Wentworth, Allen B. Downey, Chris Meyers, and Dario Mitchell (3.2)
  * [How to Think Like a Computer Scientist: Learning with Python 1st Edition](https://greenteapress.com/wp/learning-with-python/) - Allen B. Downey, Jeff Elkner and Chris Meyers (2.4) (HTML, PDF)
  * [How to Think Like a Computer Scientist: Learning with Python 2nd Edition](https://openbookproject.net/thinkcs/python/english2e/) - Jeffrey Elkner, Allen B. Downey, and Chris Meyers (Using Python 2.x)
  * [How to Think Like a Computer Scientist: Learning with Python 3 (RLE)](https://openbookproject.net/thinkcs/python/english3e/) - Peter Wentworth, Jeffrey Elkner, Allen B. Downey, and Chris Meyers [(PDF)](https://www.ict.ru.ac.za/Resources/cspw/thinkcspy3/thinkcspy3.pdf)
* [Inside The Python Virtual Machine](https://leanpub.com/insidethepythonvirtualmachine) - Obi Ike-Nwosu (HTML, PDF, EPUB, Kindle) *(Leanpub account or valid email requested)*
* [Intermediate Python](https://book.pythontips.com/en/latest/) - Muhammad Yasoob Ullah Khalid (1st edition)
* [Introduction to Programming with Python](http://opentechschool.github.io/python-beginners/en/) (3.3)
  * [Introduction to Programming Using Python](http://python-ebook.blogspot.co.uk) - Cody Jackson (1st edition) (2.3)
* [Introduction to Python](http://kracekumar.com/post/71171551647/introduction-to-python) - Kracekumar (2.7.3)
* [Introduction to Python for Econometrics, Statistics and Numerical Analysis](https://www.kevinsheppard.com/files/teaching/python/notes/python_introduction_2020.pdf) - Kevin Sheppard (PDF) (3.8)
* [Invent Your Own Computer Games With Python](https://inventwithpython.com/invent4thed/) - Al Sweigart (3.4)
* [Learn Python, Break Python](http://learnpythonbreakpython.com)
* [Learn Python Programming, Second Edition](https://www.packtpub.com/free-ebooks/learn-python-programming-second-edition) - Fabrizio Romano (Packt account *required*)
* [Learn Python the Right Way](https://learnpythontherightway.com)
* [Learn to Program Using Python](https://web.archive.org/web/20201224032210/https://www.ida.liu.se/~732A47/literature/PythonBook.pdf) - Cody Jackson (PDF) *(:card_file_box: archived)*
* [Learning to Program](http://www.alan-g.me.uk)
* [Lectures on scientific computing with python](https://github.com/jrjohansson/scientific-python-lectures) - J.R. Johansson (2.7)
* [Making Games with Python & Pygame](https://inventwithpython.com/pygame/chapters/) - Al Sweigart (3.2)
* [Math for programmers (using python)](https://akuli.github.io/math-tutorial/)
* [Modeling and Simulation in Python](https://greenteapress.com/wp/modsimpy/) - Allen B. Downey (PDF)
* [Modeling Creativity: Case Studies in Python](http://www.clips.ua.ac.be/sites/default/files/modeling-creativity.pdf) - Tom D. De Smedt (PDF)
* [Natural Language Processing (NLP) with Python — Tutorial](https://medium.com/towards-artificial-intelligence/natural-language-processing-nlp-with-python-tutorial-for-beginners-1f54e610a1a0) (PDF)
* [Natural Language Processing with Python](http://www.nltk.org/book/) (3.x)
* [Non-Programmer's Tutorial for Python 3](https://en.wikibooks.org/wiki/Non-Programmer%27s_Tutorial_for_Python_3) - Wikibooks (3.3)
    * [Non-Programmer's Tutorial for Python 2.6](https://en.wikibooks.org/wiki/Non-Programmer%27s_Tutorial_for_Python_2.6) - Wikibooks (2.6)
* [Official NumPy Reference](https://numpy.org/doc/stable/numpy-ref.pdf) - The NumPy Community (PDF)
* [Picking a Python Version: A Manifesto](https://www.oreilly.com/ideas/picking-a-python-version) - David Mertz
* [Porting to Python 3: An In-Depth Guide](http://python3porting.com) (2.6 - 2.x & 3.1 - 3.x)
* [Practical Programming in Python](https://launchpadlibrarian.net/165489933/PracticalProgrammingPython2014.pdf) - Jeffrey Elkner (PDF)
* [Practice Python Projects](https://learnbyexample.github.io/practice_python_projects/) - Sundeep Agarwal
* [Problem Solving with Algorithms and Data Structures using Python](https://runestone.academy/runestone/books/published/pythonds3/index.html) - Bradley N. Miller and David L. Ranum (3.x)
* [Program Arcade Games With Python And Pygame](http://programarcadegames.com) (3.3)
* [Programming Computer Vision with Python](http://programmingcomputervision.com/downloads/ProgrammingComputerVision_CCdraft.pdf) (PDF)
* [Programming for Non-Programmers, Release 2.6.2](https://web.archive.org/web/20180921063136/http://buildingskills.itmaybeahack.com/book/programming-2.6/latex/ProgrammingforNon-Programmers.pdf) - Steven F. Lott (PDF) (2.6)
* [PySDR: A Guide to SDR and DSP using Python](https://pysdr.org) - Dr. Marc Lichtman (3.x)
* [Python 101](https://python101.pythonlibrary.org) - Michael Driscoll (HTML, TEXT)
* [Python 2 Official Documentation](https://docs.python.org/2/download.html) (PDF, HTML, TEXT) (2.x)
* [Python 2.7 quick reference](https://web.archive.org/web/20171013204449/http://infohost.nmt.edu/tcc/help/pubs/python27/python27.pdf) - John W. Shipman (PDF) (2.7)
* [Python 3 Official Documentation](https://docs.python.org/3/download.html) (PDF, EPUB, HTML, TEXT) (3.x)
* [Python 3 Tutorial](https://github.com/Akuli/python-tutorial)
* [Python Data Science Handbook](https://jakevdp.github.io/PythonDataScienceHandbook) - Jake VanderPlas (HTML, Jupyter Notebooks)
* [Python for Everybody](http://py4e.com/book) - Charles Russell Severance (PDF, EPUB, HTML) (3.x)
* [Python for Informatics: Exploring Information](http://www.pythonlearn.com/book.php) - Charles Russell Severance (2.7.5)
* [Python for you and me](http://pymbook.readthedocs.org/en/latest/) (2.7.3)
* [Python for you and me](http://pymbook.readthedocs.org/en/py3/) (3.x)
* [Python Idioms](http://safehammad.com/downloads/python-idioms-2014-01-16.pdf) (PDF)
* [Python in Education](https://www.oreilly.com/ideas/python-in-education) - Nicholas Tollervey
* [Python in Hydrology](http://www.greenteapress.com/pythonhydro/pythonhydro.html) - Sat Kumar Tomer
* [Python Koans](https://github.com/gregmalcolm/python_koans) (2.7 or 3.x)
* [Python Machine Learning By Example](https://www.packtpub.com/free-ebooks/python-machine-learning-example) - Yuxi (Hayden) Liu (Packt account *required*)
* [Python Module of the Week](https://pymotw.com/3/) (3.x)
  * [Python Module of the Week](https://pymotw.com/2/) (2.x)
* [Python Notes for Professionals](http://goalkicker.com/PythonBook/) - Compiled from StackOverflow documentation (PDF)
* [Python Practice Book](http://anandology.com/python-practice-book/index.html) (2.7.1)
* [Python Practice Projects](http://pythonpracticeprojects.com)
* [Python Programming](https://en.wikibooks.org/wiki/Python_Programming) - Wikibooks (2.7)
* [Python Programming](https://upload.wikimedia.org/wikipedia/commons/9/91/Python_Programming.pdf) - Wikibooks (PDF) (2.6)
* [Python Programming And Numerical Methods: A Guide For Engineers And Scientists](https://pythonnumericalmethods.berkeley.edu/notebooks/Index.html) - Qingkai Kong, Timmy Siauw, Alexandre Bayen (3.7)
* [Python Tutorial](https://www.tutorialspoint.com/python) - Tutorials Point
* [Scipy Lecture Notes](http://scipy-lectures.github.io)
* [SICP in Python](http://www-inst.eecs.berkeley.edu/~cs61a/sp12/book/) (3.2)
* [Slither into Python: An introduction to Python for beginners](https://web.archive.org/web/20210411065902/https://www.slitherintopython.com/) (3.7) *(:card_file_box: archived)*
* [Supporting Python 3: An In-Depth Guide](http://python3porting.com) (2.6 - 2.x & 3.1 - 3.x)
* [Test-Driven Web Development with Python: Obey the Testing Goat! using Django, Selenium and Javascript](http://www.obeythetestinggoat.com/pages/book.html) - Harry J.W. Percival (HTML) *(3.3 - 3.x)*
* [Text Processing in Python](http://gnosis.cx/TPiP/) - David Mertz (2.3 - 2.x)
* [The Big Book of Small Python Projects](https://inventwithpython.com/bigbookpython/) - Al Sweigart
* [The Coder's Apprentice: Learning Programming with Python 3](http://www.spronck.net/pythonbook/) - Pieter Spronck (PDF) (3.x)
* [The Definitive Guide to Jython, Python for the Java Platform](https://jython.readthedocs.io/en/latest/) - Josh Juneau, Jim Baker, Victor Ng, Leo Soto, Frank Wierzbicki (2.5)
* [The Little Book of Python Anti-Patterns](http://docs.quantifiedcode.com/python-anti-patterns/) ([Source](https://github.com/quantifiedcode/python-anti-patterns))
* [The Programming Historian](http://niche-canada.org/research/niche-digital-infrastructure-project/the-programming-historian/) - William J. Turkel, Adam Crymble and Alan MacEachern
* [The Python GTK+ 3 Tutorial](http://python-gtk-3-tutorial.readthedocs.org/en/latest/)
* [The Python Handbook](https://flaviocopes.com/page/python-handbook/) - Flavio Copes (PDF, EPUB, Kindle) *(email address requested)*
* [The Standard Python Library](https://web.archive.org/web/20200626001242/http://effbot.org/librarybook/) - Fredrik Lundh
* [Think Complexity](https://greenteapress.com/wp/think-complexity-2e/) - Allen B. Downey (2nd Edition) (PDF, HTML)
* [Think DSP - Digital Signal Processing in Python](https://greenteapress.com/wp/think-dsp/) - Allen B. Downey (PDF, HTML)
* [Think Python 2nd Edition](https://greenteapress.com/wp/think-python-2e/) - Allen B. Downey (3.x) (HTML, PDF)
    * [Think Python First Edition](https://greenteapress.com/wp/think-python/) - Allen B. Downey (2.x) (HTML, PDF)
* [Tiny Python 3.6 Notebook](https://github.com/mattharrison/Tiny-Python-3.6-Notebook) - Matt Harrison (3.6)
* [Web2py: Complete Reference Manual, 6th Edition (pre-release)](http://web2py.com/book) (2.5 - 2.x)
* ["What are Mixin classes in Python?"](https://realpython.com/python-mixin/)


#### Django

* [Django Girls Tutorial](https://tutorial.djangogirls.org/en/) (1.11)
* [Django Official Documentation](https://media.readthedocs.org/pdf/django/1.5.x/django.pdf) (PDF) (1.5)
* [Django Official Documentation](https://media.readthedocs.org/pdf/django/1.7.x/django.pdf) (PDF) (1.7)
* [Django Official Documentation](https://media.readthedocs.org/pdf/django/1.9.x/django.pdf) (PDF) (1.9)
* [Django Official Documentation](https://media.readthedocs.org/pdf/django/1.10.x/django.pdf) (PDF) (1.10)
* [Django Official Documentation](https://buildmedia.readthedocs.org/media/pdf/django/2.2.x/django.pdf) (PDF) (2.2)
* [Django Official Documentation](https://buildmedia.readthedocs.org/media/pdf/django/3.1.x/django.pdf) (PDF) (3.1)
* [Django Official Documentation](https://buildmedia.readthedocs.org/media/pdf/django/3.2.x/django.pdf) (PDF) (3.2)
* [Django RESTful Web Services](https://www.packtpub.com/free-ebooks/django-restful-web-services) - Gaston C. Hillar (Packt account *required*)
* [Django Web Framework (Python)](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Django) - MDN contributors
* [Djen of Django](http://agiliq.com/books/djenofdjango/)
* [Effective Django](https://web.archive.org/web/20181130092020/http://www.effectivedjango.com/) (1.5)
* [How to Tango With Django](http://www.tangowithdjango.com/book17/) (1.7)
* [Test-Driven Development With Python And Django](http://www.obeythetestinggoat.com/pages/book.html) (1.11)


#### Flask

* [Explore Flask](https://exploreflask.com) - Robert Picard
* [Flask Documentation](https://flask.palletsprojects.com) - Pallets
* [The Flask Mega-Tutorial](http://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world) - Miguel Grinberg (0.9)


#### Kivy

* [Kivy Programming Guide](https://kivy.org/docs/guide-index.html)


#### Pandas

* [Learn Pandas](https://bitbucket.org/hrojas/learn-pandas) - Hernan Rojas (0.18.1)
* [pandas: powerful Python data analysis toolkit](https://pandas.pydata.org/docs) - Wes McKinney and the Pandas Development Team (HTML, PDF)


#### Pyramid

* [Quick Tutorial for Pyramid](http://docs.pylonsproject.org/projects/pyramid/en/latest/quick_tutorial/index.html#quick-tutorial)


#### Tornado

* [Learn Web Programming](https://bitbucket.org/hrojas/learn-web-programming)

### Articles:

* [WTFPython](https://github.com/satwikkansal/wtfpython): A collection of unintuitive ways Python behaves, with explanations as to why.
* [Language learnings](https://github.com/imteekay/programming-language-research/tree/master/language-learning/python)
* [Learn Python ASTs, by building your own linter](https://sadh.life/post/ast/)
* [How To Create a Python GUI To Write Data to a File With PyQt5](https://thenewstack.io/how-to-create-a-python-gui-to-write-data-to-a-file-with-pyqt5/)
* [A JIT Compiler for CPython](https://www.youtube.com/watch?v=HxSHIpEQRjs&ab_channel=encukou)
* [Python's type system explained: Static vs dynamic typing | Guido van Rossum](https://www.youtube.com/watch?v=kSXZHRsWXfU)
* [metap: A Meta-Programming Layer for Python](https://sbaziotis.com/compilers/metap.html)
* [Building a Simple Data Quality DSL in Python](https://www.kdnuggets.com/building-a-simple-data-quality-dsl-in-python)

### Interesting examples:

* [Peter Norvig's Collection of Jupyter Notebooks](http://www.norvig.com/ipython/README.html): This makes me consider spending some time with Jupyter Notebooks a lot more.
