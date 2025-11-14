title=CPython
tags=language, vm, python
summary=The original, "standard", C-based implementation of the Python language/platform.
~~~~~~

[Source](https://github.com/python/cpython)

## Perf

[memray](https://github.com/bloomberg/memray): Memray is a memory profiler for Python. It can track memory allocations in Python code, in native extension modules, and in the Python interpreter itself. It can generate several different types of reports to help you analyze the captured memory usage data. While commonly used as a CLI tool, it can also be used as a library to perform more fine-grained profiling tasks.

## FFI

- Calling C functions from Python
	- part 1 - using ctypes - http://yizhang82.me/python-interop-ctypes
	- part 2 - writing CPython extensions using Python/C API - http://yizhang82.me/python-interop-capi
	- part 3 - deep dive into ctypes implementation in CPython
		- http://yizhang82.me/python-interop-inside-ctypes
		- https://blogs.msdn.microsoft.com/yizhang/2018/02/02/calling-c-functions-from-python-part-3-deep-dive-into-ctypes-implementation-in-cpython/
- cppyy: Automatic Python-C++ bindings
	- https://cppyy.readthedocs.io/
- How and why to write Python binary extension modules using C++
	- SwedenCpp::Stockholm::0x0F, September 20, 2018; Thomas Nyberg
	- https://www.youtube.com/watch?v=LbiozBn9v6Y
	- https://github.com/ApproximateIdentity/cpp_extension_talk
- pybind11 — Seamless operability between C++11 and Python
	- https://github.com/pybind/pybind11
	- http://pybind11.readthedocs.io
	- pybind11 - seamless operability between C++11 and Python - EuroPython 2017; Ivan Smirnov
		- https://www.youtube.com/watch?v=jQedHfF1Jfw
	- Integrate Python and C++ with pybind11 - NDC 2018; Robert Smallshire
		- https://www.youtube.com/watch?v=YReJ3pSnNDo
- Python - using C and C++ libraries with ctypes
	- https://solarianprogrammer.com/2019/07/18/python-using-c-cpp-libraries-ctypes/
- Wrappy: Wrapping python made easy
	- https://github.com/lava/wrappy
