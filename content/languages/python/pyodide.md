title=Pyodide
tags=language, python, wasm, browser
summary=Python with the scientific stack, compiled to WebAssembly; may be used in any context where you want to run Python inside a web browser.
~~~~~~

[Website](https://pyodide.org/en/stable/index.html) | [Source](https://github.com/pyodide/pyodide)

Pyodide is a port of CPython to WebAssembly/Emscripten.

Pyodide makes it possible to install and run Python packages in the browser with micropip. Any pure Python package with a wheel available on PyPi is supported. Many packages with C, C++, and Rust extensions have also been ported for use with Pyodide. These include many general-purpose packages such as regex, PyYAML, and cryptography, and scientific Python packages including NumPy, pandas, SciPy, Matplotlib, and scikit-learn.

Pyodide comes with a robust Javascript <--> Python foreign function interface so that you can freely mix these two languages in your code with minimal friction. This includes full support for error handling, async/await, and much more.

When used inside a browser, Python has full access to the Web APIs.

