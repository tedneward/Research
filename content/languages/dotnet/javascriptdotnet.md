title=Javascript.NET
tags=language, clr, nodejs
summary=.Net bindings to the V8 JavaScript engine.
~~~~~~

[Sources](https://github.com/JavascriptNet/Javascript.Net)

Example:
```
// Initialize a context
using (JavascriptContext context = new JavascriptContext()) {

    // Setting external parameters for the context
    context.SetParameter("console", new SystemConsole());
    context.SetParameter("message", "Hello World !");
    context.SetParameter("number", 1);

    // Script
    string script = @"
        var i;
        for (i = 0; i < 5; i++)
            console.Print(message + ' (' + i + ')');
        number += i;
    ";

    // Running the script
    context.Run(script);

    // Getting a parameter
    Console.WriteLine("number: " + context.GetParameter("number"));
}
```
