title=OOUI
tags=presentation, clr, browser
summary=A small cross-platform UI library for .NET that uses web technologies; presents a classic object-oriented UI API that controls a dumb browser.
~~~~~~

[Source](https://github.com/praeclarum/Ooui) | [Interactive examples](http://ooui.mecha.parts/) and [source](https://github.com/praeclarum/Ooui/tree/master/Samples)

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

### [Button-XAML Example]()
An example of doing an interactive Xamarin Forms app.

XAML:
```
<?xml version="1.0" encoding="utf-8" ?>
<ContentPage xmlns="http://xamarin.com/schemas/2014/forms"
             xmlns:x="http://schemas.microsoft.com/winfx/2009/xaml"
             x:Class="ButtonXaml.ButtonXamlPage">

    <StackLayout Padding="20">
        <Label Text="Welcome to Xamarin.Forms!" FontSize="32" FontAttributes="Bold" />
        <Entry x:Name="LabelCount" Text="Click Count: 0"/>
        <Button Text="Tap for click count!"
                Clicked="OnButtonClicked" />
    </StackLayout>
</ContentPage>
```

XAML.CS:
```
using System;
using Xamarin.Forms;

namespace ButtonXaml
{
    public partial class ButtonXamlPage
    {
        int count = 0;

        public ButtonXamlPage()
        {
            InitializeComponent();
        }

        public void OnButtonClicked(object sender, EventArgs args)
        {
            count++;
            LabelCount.Text = $"Click Count: {count}";
           
        }
    }
}
```

C#:
```
using Ooui;
using Xamarin.Forms;

namespace Samples
{
    public class ButtonXamlSample : ISample
    {
        public string Title => "Xamarin.Forms Button XAML";
        public string Path => "buttons";

        public Ooui.Element CreateElement ()
        {
            var page = new ButtonXaml.ButtonXamlPage ();
            return page.GetOouiElement ();
        }

        public void Publish()
        {
            UI.Publish(Path, CreateElement);
        }
    }
}
```