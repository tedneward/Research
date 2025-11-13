title=Flet
tags=presentation, ios, android, macos, windows, linux, python
summary=Build multi-platform apps in Python powered by Flutter.
~~~~~~

[Website](https://flet.dev/) | [Source](https://github.com/flet-dev/flet)

### What is Flet?

Flet is a framework that allows building web, desktop and mobile applications in Python without prior experience in frontend development.

You can build a UI for your program with Flet [controls](https://flet.dev/docs/controls) which are based on [Flutter](https://flutter.dev/) by Google. Flet goes beyond merely wrapping Flutter widgets. It adds its own touch by combining smaller widgets, simplifying complexities, implementing UI best practices, and applying sensible defaults. This ensures that your applications look stylish and polished without requiring additional design efforts on your part.

### Flet app example

Create a sample "Counter" app:

counter.py
```
import flet as ft

def main(page: ft.Page):
    page.title = "Flet counter example"
    page.vertical_alignment = ft.MainAxisAlignment.CENTER

    txt_number = ft.TextField(value="0", text_align=ft.TextAlign.RIGHT, width=100)

    def minus_click(e):
        txt_number.value = str(int(txt_number.value) - 1)
        page.update()

    def plus_click(e):
        txt_number.value = str(int(txt_number.value) + 1)
        page.update()

    page.add(
        ft.Row(
            [
                ft.IconButton(ft.Icons.REMOVE, on_click=minus_click),
                txt_number,
                ft.IconButton(ft.Icons.ADD, on_click=plus_click),
            ],
            alignment=ft.MainAxisAlignment.CENTER,
        )
    )

ft.app(main)
```

To run the app install `flet` module ([create a new Flet environment](https://flet.dev/docs/getting-started)):

    pip install flet

and [run the program](https://flet.dev/docs/getting-started/running-app):

    flet run counter.py

The app will be started in a native OS window - what a nice alternative to Electron!

### macOS

![](https://flet.dev/img/docs/getting-started/flet-counter-macos.png)

### Windows

![](https://flet.dev/img/docs/getting-started/flet-counter-windows.png)

Now, run your app as a web app:

    flet run --web counter.py

A new browser window or tab will be opened:

![](https://flet.dev/img/docs/getting-started/flet-counter-safari.png)