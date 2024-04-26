title=NiceGUI
tags=presentation, library, python, browser
summary=A Python-based UI framework, which shows up in your web browser. 
~~~~~~

[Website](https://nicegui.io/) | [Source](https://github.com/zauberzeug/nicegui)

Create web-based user interfaces with Python. "The nice way."

NiceGUI is an easy-to-use, Python-based UI framework, which shows up in your web browser. You can create buttons, dialogs, Markdown, 3D scenes, plots and much more.

It is great for micro web apps, dashboards, robotics projects, smart home solutions and similar use cases. You can also use it in development, for example when tweaking/configuring a machine learning algorithm or tuning motor controllers.

#### Installation
`python3 -m pip install nicegui`

#### Usage
Write your nice GUI in a file main.py:

```
from nicegui import ui

ui.label('Hello NiceGUI!')
ui.button('BUTTON', on_click=lambda: ui.notify('button was pressed'))

ui.run()
```

Launch it with:

`python3 main.py`

The GUI is now available through http://localhost:8080/ in your browser. Note: NiceGUI will automatically reload the page when you modify the code.

