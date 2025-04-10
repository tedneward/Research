title=Kivy
tags=presentation, python, android, ios, macos, windows
summary=Python cross-platform GUI framework.
~~~~~~

[Website](https://kivy.org/) | [Source](https://github.com/kivy) | [Docs](https://kivy.org/doc/stable/)

Uses a "design language" ([Kv Design Language](https://kivy.org/doc/stable/guide/lang.html)) to separate code from layout:

```
#:kivy 1.0

<Controller>:
    label_wid: my_custom_label

    BoxLayout:
        orientation: 'vertical'
        padding: 20

        Button:
            text: 'My controller info is: ' + root.info
            on_press: root.do_action()

        Label:
            id: my_custom_label
            text: 'My label before button press'
```

... matched up with code...

```
import kivy
kivy.require('1.0.5')

from kivy.uix.floatlayout import FloatLayout
from kivy.app import App
from kivy.properties import ObjectProperty, StringProperty


class Controller(FloatLayout):
    '''Create a controller that receives a custom widget from the kv lang file.

    Add an action to be called from the kv lang file.
    '''
    label_wid = ObjectProperty()
    info = StringProperty()

    def do_action(self):
        self.label_wid.text = 'My label after button press'
        self.info = 'New info text'


class ControllerApp(App):

    def build(self):
        return Controller(info='Hello world')


if __name__ == '__main__':
    ControllerApp().run()
```

