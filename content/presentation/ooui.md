title=OOUI
tags=presentation, clr, browser, 
summary=a small cross-platform UI library for .NET that uses web technologies; presents a classic object-oriented UI API that controls a dumb browser.
~~~~~~

[Source](https://github.com/praeclarum/Ooui) | [Interactive examples](http://ooui.mecha.parts/)

### Example App
```
using System;
using Ooui;

class Program
{
    static void Main(string[] args)
    {
        // Create the UI
        var button = new Button("Click me!");

        // Add some logic to it
        var count = 0;
        button.Click += (s, e) => {
            count++;
            button.Text = $"Clicked {count} times";
        };

        // Publishing makes an object available at a given URL
        // The user should be directed to http://localhost:8080/shared-button
        UI.Publish ("/shared-button", button);

        // Don't exit the app until someone hits return
        Console.ReadLine ();
    }
}
```

Make sure to add a reference to Ooui before you start running!

```shell
dotnet add package Ooui
dotnet run
```

