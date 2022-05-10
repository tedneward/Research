title=Ursina Engine
tags=gamedev, python
summary=Makes it easier to develop games, visualizations and other kinds of software.
~~~~~~

[Website](https://www.ursinaengine.org/) | [Source](https://github.com/pokepetter/ursina)

Install: `python -m pip install ursina`

Depends on [Panda3D](../panda3d)

### Simple example
```python
from ursina import *

app = Ursina()

player = Entity(model='cube', color=color.orange, scale_y=2)

def update():   # update gets automatically called.
    player.x += held_keys['d'] * .1
    player.x -= held_keys['a'] * .1

app.run()   # opens a window and starts the game.
```

Run: `python ursina_game.py`

