title=guizero
tags=presentation, python, windows, macos, linux
summary=A Python 3 library to allow learners to quickly and easily create GUIs.
~~~~~~

[Website](https://lawsie.github.io/guizero/) | [Source](https://github.com/lawsie/guizero) | [Book]()

The aim of guizero is to make the process of creating simple GUIs quick, accessible and understandable for new learners.

* Works with standard Python Tkinter GUI library (and no need to install other libraries)
* Abstracts away details new learners find difficult to understand (such as Tkinter StringVar() objects)
* Accessible widget naming system to help new learners to build up a mental model
* Flexible enough to be used for projects up to A-Level standard, yet accessible to primary school children
* Comprehensive and accessible documentation with examples
* Generates helpful additional error messages

## Examples

Hello, world
```
from guizero import App, Text, PushButton
app = App(title="guizero")
intro = Text(app, text="Have a go with guizero and see what you can create.")
ok = PushButton(app, text="Ok")

app.display()
```

Get some text
```
from guizero import App, TextBox

app = App()
name = TextBox(app, text="Enter your name")

app.display()
```

Use a PushButton to display a message when the button is pressed.
```
from guizero import App, TextBox, PushButton, Text

def update_text():
    label.value = name.value

app = App()
label = Text(app, text="What's your name?")
name = TextBox(app)
button = PushButton(app, command=update_text)

app.display()
```

Use a Picture object to display an image.
```
from guizero import App, Picture
app = App()
pic = Picture(app, image="myimage.gif")
app.display()
```
Create a picture PushButton with an image like this:
```
from guizero import App, PushButton
def do_nothing():
    print("A picture button was pressed")

app = App()
button = PushButton(app, image="button.gif", command=do_nothing)
app.display()
```
The image button.gif should be stored in the folder as your program. Alternatively you can provide the path to your image.

Have 2 buttons, start and stop with them changing the enabled state of each other.
```
from guizero import App, PushButton

def start():
    start_button.disable()
    stop_button.enable()

def stop():
    start_button.enable()
    stop_button.disable()

app = App()
start_button = PushButton(app, command=start, text="start")
stop_button = PushButton(app, command=stop, text="stop", enabled=False)
app.display()
```

Your app doesn't have to use the standard colors and text, let your user pick the background and text color from 2 combo's.
```

from guizero import App, Combo, Text

def update_bg():
    app.bg = bg_combo.value

def update_text():
    app.text_color = text_combo.value

colors = ["black", "white", "red", "green", "blue"]

app = App()
app.bg = "black"
app.text_color = "white"

title1 = Text(app, text="Background color")
bg_combo = Combo(app, options=colors, selected=app.bg, command=update_bg)

title2 = Text(app, text="Text color")
text_combo = Combo(app, options=colors, selected=app.text_color, command=update_text)

app.display()
```

Display an image on the screen with 2 sliders, 1 for height and 1 for width.
```
from guizero import App, Slider, Picture

def resize():
    picture.width = width.value
    picture.height = height.value

app = App(layout="grid")

picture = Picture(app, image="image.gif", grid=[0,1])

width = Slider(app, command=resize, grid=[0,0], start=1, end=picture.width)
width.width = picture.width
width.value = picture.width

height = Slider(app, command=resize, horizontal=False, grid=[1,1], start=1, end=picture.height)
height.height = picture.height
height.value = picture.height

app.display()
```

To be able to react when a user double click's you will need to use events.
```
from guizero import App, Text

def double_click():
    double_click_me.value = "Thanks"

app = App()

double_click_me = Text(app, text="Double click me")
double_click_me.when_double_clicked = double_click

app.display()
```

You can use repeat to periodically update your application. For example, a timer which updates every 1 second (1000 ms).
```
from guizero import App, Text

# Update the counter
def counter():
    text.value = int(text.value) + 1

app = App("Hello world")
text = Text(app, text="1")

# Schedule call to counter() every 1000ms
text.repeat(1000, counter)  

app.display()
```

You can use a yesno box to check whether someone really wants to exit your app. If they click yes, the app is closed, if not, nothing happens and they can continue with what they were doing.
```
from guizero import App, Text

# Ask the user if they really want to close the window
def do_this_when_closed():
    if app.yesno("Close", "Do you want to quit?"):
        app.destroy()

app = App()

title = Text(app, text="blank app")

# When the user tries to close the window, run the function do_this_when_closed()
app.when_closed = do_this_when_closed

app.display()
```
