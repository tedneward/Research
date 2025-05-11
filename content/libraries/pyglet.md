title=Pyglet
tags=library, python, presentation, multimedia, gamedev
summary=A cross-platform windowing and multimedia library for Python.
~~~~~~

[Website](https://pyglet.org/) | [Source](https://github.com/pyglet/pyglet) | [Docs](https://pyglet.readthedocs.io/)

## Articles

- ["A Comprehensive Guide to Pyglet"](https://codemagnet.in/2024/09/27/a-comprehensive-guide-to-pyglet-python-library/) *(which is really not all that comprehensive)*

## Examples
Installation
```
pip install pyglet
```

Hello World
```
import pyglet

# Create a window object
window = pyglet.window.Window(width=640, height=480, caption="Pyglet Window Example")

@window.event
def on_draw():
    # Clear the window to refresh the frame
    window.clear()

# Run the application
pyglet.app.run()
```

Displaying Text
```
import pyglet

# Create a window
window = pyglet.window.Window(width=640, height=480)

# Create a text label
label = pyglet.text.Label('Hello, Pyglet!',
                          font_name='Times New Roman',
                          font_size=36,
                          x=window.width//2, y=window.height//2,
                          anchor_x='center', anchor_y='center')

@window.event
def on_draw():
    window.clear()
    label.draw()  # Draw the text

# Run the application
pyglet.app.run()
```

User Input
```
import pyglet

window = pyglet.window.Window()

@window.event
def on_key_press(symbol, modifiers):
    if symbol == pyglet.window.key.A:
        print("The 'A' key was pressed!")
    elif symbol == pyglet.window.key.ESCAPE:
        window.close()  # Close the window when the escape key is pressed

pyglet.app.run()
```

Loading/displaying images
```
import pyglet

window = pyglet.window.Window()

# Load the image
image = pyglet.resource.image('2d_plot.png')

@window.event
def on_draw():
    window.clear()
    image.blit(20, 30)  # Display the image at position (100, 100)

pyglet.app.run()
```
