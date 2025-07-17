title=Toga
tags=library, presentation, python, linux, macos, windows, android, ios
summary=A Python native, OS native, cross platform GUI toolkit that consists of a library of base components with a shared interface to simplify platform-agnostic GUI development.
~~~~~~

[Website](https://toga.readthedocs.io/en/stable/) | [Source](https://github.com/beeware/toga)

```
import toga


def button_handler(widget):
    print("hello")


def build(app):
    box = toga.Box()

    button = toga.Button("Hello world", on_press=button_handler)
    button.style.margin = 50
    button.style.flex = 1
    box.add(button)

    return box


def main():
    return toga.App("First App", "org.beeware.toga.examples.tutorial", startup=build)


if __name__ == "__main__":
    main().main_loop()
```

