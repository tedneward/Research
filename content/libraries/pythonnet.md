title=Python.NET
tags=library, python, clr
summary=A package that allows Python code to interact with the CLR, and may also be used to embed Python into a .NET application.
~~~~~~

[Website](http://pythonnet.github.io/) | [Source](https://github.com/pythonnet/pythonnet)

## Calling .NET from Python
Python.NET allows CLR namespaces to be treated essentially as Python packages.

```python
import clr
from System import String
from System.Collections import *
```

To load an assembly, use the AddReference function in the clr module:

```python
import clr
clr.AddReference("System.Windows.Forms")
from System.Windows.Forms import Form
```

By default, Mono will be used on Linux and macOS, .NET Framework on Windows. For details on the loading of different runtimes, please refer to the documentation. If .NET Core is installed in a default location or the dotnet CLI tool is on the PATH, loading it instead of the default (Mono/.NET Framework) runtime just requires setting either the environment variable `PYTHONNET_RUNTIME=coreclr` or calling `pythonnet.load` explicitly:

```python
from pythonnet import load
load("coreclr")

import clr
```

See more [here](https://pythonnet.github.io/pythonnet/python.html).

## Calling Python from .NET

* Set `Runtime.PythonDLL` property or `PYTHONNET_PYDLL` environment variable starting with version 3.0, otherwise you will receive `BadPythonDllException` (internal, derived from `MissingMethodException`) upon calling `Initialize`. Typical values are `python38.dll` (Windows), `libpython3.8.dylib` (Mac), `libpython3.8.so` (most other Unix-like operating systems).
* Call `PythonEngine.Initialize()`. If you plan to use Python objects from multiple threads, also call `PythonEngine.BeginAllowThreads()`.
* All calls to python should be inside a `using (Py.GIL()) {/* Your code here */}` block.
* Import python modules using `dynamic mod = Py.Import("mod")`, then you can call functions as normal, eg `mod.func(args)`.
Use `mod.func(args, Py.kw("keywordargname", keywordargvalue))` or `mod.func(args, keywordargname: keywordargvalue)` to apply keyword arguments.
* All python objects should be declared as `dynamic` type.
* Mathematical operations involving python and literal/managed types must have the python object first, eg. `np.pi * 2` works, `2 * np.pi` doesn't.

Example

```c#
static void Main(string[] args)
{
    PythonEngine.Initialize();
    using (Py.GIL())
    {
        dynamic np = Py.Import("numpy");
        Console.WriteLine(np.cos(np.pi * 2));

        dynamic sin = np.sin;
        Console.WriteLine(sin(5));

        double c = (double)(np.cos(5) + sin(5));
        Console.WriteLine(c);

        dynamic a = np.array(new List<float> { 1, 2, 3 });
        Console.WriteLine(a.dtype);

        dynamic b = np.array(new List<float> { 6, 5, 4 }, dtype: np.int32);
        Console.WriteLine(b.dtype);

        Console.WriteLine(a * b);
        Console.ReadKey();
    }
}
```

See more [here](https://pythonnet.github.io/pythonnet/dotnet.html).

