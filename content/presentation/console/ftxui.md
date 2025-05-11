title=FTXUI
tags=presentation, library, console
summary=C++ Functional Terminal User Interface.
~~~~~~

[Source](https://github.com/ArthurSonzogni/FTXUI)

#### Example:

![](https://private-user-images.githubusercontent.com/4759106/243190749-569bf043-4e85-4245-aad5-2324572135c4.png)

```
    vbox({
      hbox({
        text("one") | border,
        text("two") | border | flex,
        text("three") | border | flex,
      }),

      gauge(0.25) | color(Color::Red),
      gauge(0.50) | color(Color::White),
      gauge(0.75) | color(Color::Blue),
    });
```
