title=jint
tags=language, ecmascript, clr
summary=Javascript Interpreter for .NET.
~~~~~~

[Source](https://github.com/sebastienros/jint)

> Jint is a Javascript interpreter for .NET which can run on any modern .NET platform as it supports .NET Standard 2.0 and .NET 4.6.1 targets (and up). Because Jint neither generates any .NET bytecode nor uses the DLR it runs relatively small scripts really fast.

Example:
```
var engine = new Engine()
    .SetValue("log", new Action<object>(Console.WriteLine));
    
engine.Execute(@"
    function hello() { 
        log('Hello World');
    };
 
    hello();
");
```
