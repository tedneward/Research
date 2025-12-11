title=ltk
tags=presentation, python, browser
summary=Write browser apps entirely in Python.
~~~~~~

[Website](https://pyscript.github.io/ltk/?runtime=py) (running Pyodide) | [Website](pyscript.github.io/ltk/?runtime=mpy) (running MicroPython) | [Source](https://github.com/pyscript/ltk) | [LTK kitchensink](https://pyscript.github.io/ltk/)

## Installing LTK

Install LTK from pypi:
```
python3 -m pip install pyscript-ltk
```
## Hello World

```python
import ltk

ltk.Text("Hello World").appendTo(ltk.body)
```

## Getting Started

To get started with LTK, we recommend you try it out on pyscript.com:
 -  [Minimal LTK with MicroPython](https://pyscript.com/@laffra/ltk-on-micropython/latest)
 -  [Minimal LTK with PyOdide](https://pyscript.com/@laffra/ltk-on-pyodide/latest)

## Widget Specification

New widget types are created by subclassing `ltk.Widget`:

```python
class HBox(Widget):
    classes = [ "ltk-hbox" ]
```

By default, widgets are created as `div` DOM elements. You can choose a different tag:

```python
class Preformatted(Widget):
    classes = [ "ltk-pre" ]
    tag = "pre"
```

## Creating a UI 

To create a UI, elements are constructed declaratively:

```python
ltk.Table(
    ltk.TableRow(
        ltk.TableHeader("header1")
        ltk.TableHeader("header2")
    ),
    [
        ltk.TableRow(
            ltk.TableData(value1),
            ltk.TableData(value2),
        )
        for value1, value2 in data
    ],
)
```

Widgets are added to others by using `jQuery`'s `append` and `appendTo` calls:
```python
ltk.body.append(
    ltk.Table(...).element
)

container = ltk.VBox(...)
ltk.H1("This is a header").appendTo(container)
```

When an LTK widget is created, a corresponding jQuery element is attached to it in 
the `ltk.Widget.__init__` constructor. It uses the `tag` value defined by the 
declaring class and the constructed element is referred to as `element`.
As the `append` call is a JavaScript function, implemented by jQuery, we do not
pass the LTK widget directly, but pass its `element` to append to the DOM.

## Styling

Widgets can be styled using using three different approaches:

1. Styling with element styles using `jQuery`'s `css` function:
```python
ltk.Text("Error: Flux capacitor low!")
    .css("background-color", "red")
    .css("color", "white")
    .css("padding", 8)
```

2. Styling using a `dict` to make it easier to share styles:
```python
error = {
    "background-color": "red",
    "color": "white",
    "padding": 8,
}
ltk.Text("Error: Flux capacitor low!", error)
```

3. Styling using CSS classes and an external stylesheet, using `jQuery`'s `addClass` function:
```python
ltk.Text("Some text").addClass("my-special-text)
```
The external style sheet should have these rules:
```css
.ltk-text {
    font-family: Arial;
}

.my-special-text {
    font-family: Courier;
    background-color: red;
    color: white;
    padding: 8px;
}
```

External stylesheets can be included in the original `index.html` or injected at runtime from Python using:
```python
ltk.inject_style("https://example.org/awesome_styles.css")
```

## Events

Event handlers are attached using `jQuery` mechanisms. 
```python
def buy(event):
    purchase(...)

ltk.Card("Buy Now").on("click", ltk.proxy(buy))
```

You can also use the more declarative decorator:
```python
@ltk.callback
def buy(event):
    purchase(...)

ltk.Card("Buy Now").on("click", buy)
```



