title=Kivy
tags=platform, python, android, ios, linux, macOS, windows
summary=Build and distribute beautiful Python cross-platform GUI apps with ease.
~~~~~~

[Website](https://kivy.org/) | [Source](https://github.com/kivy)

### Example: Simplest application

Creating a kivy application is as simple as:

* sub-classing the App class

* implementing its build() method so it returns a Widget instance (the root of your widget tree)

* instantiating this class, and calling its run() method.

Here is an example of a minimal application:

```
import kivy
kivy.require('2.1.0') # replace with your current kivy version !

from kivy.app import App
from kivy.uix.label import Label

class MyApp(App):

    def build(self):
        return Label(text='Hello world')

if __name__ == '__main__':
    MyApp().run()
```


### Example: Pong

main.py
```
from kivy.app import App
from kivy.uix.widget import Widget
from kivy.properties import (
    NumericProperty, ReferenceListProperty, ObjectProperty
)
from kivy.vector import Vector
from kivy.clock import Clock


class PongPaddle(Widget):
    score = NumericProperty(0)

    def bounce_ball(self, ball):
        if self.collide_widget(ball):
            vx, vy = ball.velocity
            offset = (ball.center_y - self.center_y) / (self.height / 2)
            bounced = Vector(-1 * vx, vy)
            vel = bounced * 1.1
            ball.velocity = vel.x, vel.y + offset


class PongBall(Widget):
    velocity_x = NumericProperty(0)
    velocity_y = NumericProperty(0)
    velocity = ReferenceListProperty(velocity_x, velocity_y)

    def move(self):
        self.pos = Vector(*self.velocity) + self.pos


class PongGame(Widget):
    ball = ObjectProperty(None)
    player1 = ObjectProperty(None)
    player2 = ObjectProperty(None)

    def serve_ball(self, vel=(4, 0)):
        self.ball.center = self.center
        self.ball.velocity = vel

    def update(self, dt):
        self.ball.move()

        # bounce off paddles
        self.player1.bounce_ball(self.ball)
        self.player2.bounce_ball(self.ball)

        # bounce ball off bottom or top
        if (self.ball.y < self.y) or (self.ball.top > self.top):
            self.ball.velocity_y *= -1

        # went off to a side to score point?
        if self.ball.x < self.x:
            self.player2.score += 1
            self.serve_ball(vel=(4, 0))
        if self.ball.right > self.width:
            self.player1.score += 1
            self.serve_ball(vel=(-4, 0))

    def on_touch_move(self, touch):
        if touch.x < self.width / 3:
            self.player1.center_y = touch.y
        if touch.x > self.width - self.width / 3:
            self.player2.center_y = touch.y


class PongApp(App):
    def build(self):
        game = PongGame()
        game.serve_ball()
        Clock.schedule_interval(game.update, 1.0 / 60.0)
        return game


if __name__ == '__main__':
    PongApp().run()
```

pong.kv:
```
#:kivy 1.0.9

<PongBall>:
    size: 50, 50 
    canvas:
        Ellipse:
            pos: self.pos
            size: self.size          

<PongPaddle>:
    size: 25, 200
    canvas:
        Rectangle:
            pos: self.pos
            size: self.size

<PongGame>:
    ball: pong_ball
    player1: player_left
    player2: player_right
    
    canvas:
        Rectangle:
            pos: self.center_x - 5, 0
            size: 10, self.height
    
    Label:
        font_size: 70  
        center_x: root.width / 4
        top: root.top - 50
        text: str(root.player1.score)
        
    Label:
        font_size: 70  
        center_x: root.width * 3 / 4
        top: root.top - 50
        text: str(root.player2.score)
    
    PongBall:
        id: pong_ball
        center: self.parent.center
        
    PongPaddle:
        id: player_left
        x: root.x
        center_y: root.center_y
        
    PongPaddle:
        id: player_right
        x: root.width - self.width
        center_y: root.center_y
```

