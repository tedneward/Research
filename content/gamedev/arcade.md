title=Arcade
tags=gamedev, python
summary=a modern Python framework for crafting games with compelling graphics and sound.
~~~~~~

[Website](https://api.arcade.academy/en/latest/index.html) | [Source](https://github.com/pythonarcade/arcade.git)

[RealPython primer](https://realpython.com/arcade-python-game-framework/)

Install: `python -m pip install arcade` (on macOS, also need PyObjC, so `python -m pip install PyObjC arcade`)

### RealPython basic example:
```python
"""
Basic "Hello, World!" program in Arcade

This program is designed to demonstrate the basic capabilities
of Arcade. It will:
- Create a game window
- Fill the background with white
- Draw some basic shapes in different colors
- Draw some text in a specified size and color
"""

# Import arcade allows the program to run in Python IDLE
import arcade

# Set the width and height of your output window, in pixels
WIDTH = 800
HEIGHT = 600

# Classes
class ArcadeBasic(arcade.Window):
    """Main game window"""

    def __init__(self, width: int, height: int, title: str):
        """Initialize the window to a specific size

        Arguments:
            width {int} -- Width of the window
            height {int} -- Height of the window
            title {str} -- Title for the window
        """

        # Call the parent class constructor
        super().__init__(width, height, title)

        # Set the background window
        arcade.set_background_color(color=arcade.color.WHITE)

    def on_draw(self):
        """Called once per frame to render everything on the screen"""

        # Start rendering
        arcade.start_render()

        # Draw a blue circle with a radius of 50 in the center of the screen
        arcade.draw_circle_filled(
            center_x=WIDTH // 2,
            center_y=HEIGHT // 2,
            radius=50,
            color=arcade.color.BLUE,
            num_segments=50,
        )

        # Draw a red-outlined square in the top-left corner of the screen
        arcade.draw_lrtb_rectangle_outline(
            left=50,
            top=HEIGHT - 50,
            bottom=HEIGHT - 100,
            right=100,
            color=arcade.color.RED,
            border_width=3,
        )

        # Draw an orange caption along the bottom in 60-point font
        arcade.draw_text(
            text="Hello, World! From Arcade!",
            start_x=100,
            start_y=50,
            font_size=28,
            color=arcade.color.ORANGE,
        )

# Run the program
if __name__ == "__main__":
    arcade_game = ArcadeBasic(WIDTH, HEIGHT, "Arcade Basic Game")
    arcade.run()
```

Run: python arcade/arcade_basic.py

### RealPython advanced example
```python
"""
Complete game in Arcade

This game demonstrates some of the more advanced features of
Arcade, including:
- Using sprites to render complex graphics
- Handling user input
- Sound output
"""

# Import arcade allows the program to run in Python IDLE
import arcade

# To randomize coin placement
from random import randint

# To locate your assets
from pathlib import Path

# Set the width and height of your game window, in pixels
WIDTH = 800
HEIGHT = 600

# Set the game window title
TITLE = "Arcade Sample Game"

# Location of your assets
ASSETS_PATH = Path.cwd() / "assets"

# How many coins must be on the screen before the game is over?
COIN_COUNT = 10

# How much is each coin worth?
COIN_VALUE = 10

# Classes
class ArcadeGame(arcade.Window):
    """The Arcade Game class"""

    def __init__(self, width: float, height: float, title: str):
        """Create the main game window

        Arguments:
            width {float} -- Width of the game window
            height {float} -- Height of the game window
            title {str} -- Title for the game window
        """

        # Call the super class init method
        super().__init__(width, height, title)

        # Set up a timer to create new coins
        self.coin_countdown = 2.5
        self.coin_interval = 0.1

        # Score is initially zero
        self.score = 0

        # Set up empty sprite lists
        self.coins = arcade.SpriteList()

        # Don't show the mouse cursor
        self.set_mouse_visible(False)

    def setup(self):
        """Get the game ready to play"""

        # Set the background color
        arcade.set_background_color(color=arcade.color.PINK)

        # Set up the player
        sprite_image = ASSETS_PATH / "images" / "alien_green_stand.png"
        self.player = arcade.Sprite(
            filename=sprite_image, center_x=WIDTH // 2, center_y=HEIGHT // 2
        )

        # Spawn a new coin
        arcade.schedule(
            function_pointer=self.add_coin, interval=self.coin_countdown
        )

        # Load your coin collision sound
        self.coin_pickup_sound = arcade.load_sound(
            ASSETS_PATH / "sounds" / "coin_pickup.wav"
        )

    def add_coin(self, dt: float):
        """Add a new coin to the screen, reschedule the timer if necessary

        Arguments:
            dt {float} -- Time since last call (unused)
        """

        # Create a new coin
        coin_image = ASSETS_PATH / "images" / "coin_gold.png"
        new_coin = arcade.Sprite(
            filename=coin_image,
            center_x=randint(20, WIDTH - 20),
            center_y=randint(20, HEIGHT - 20),
        )

        # Add the coin to the current list of coins
        self.coins.append(new_coin)

        # Decrease the time between coin appearances, but only if there are
        # fewer than three coins on the screen.
        if len(self.coins) < 3:
            self.coin_countdown -= self.coin_interval

            # Make sure you don't go too quickly
            if self.coin_countdown < 0.1:
                self.coin_countdown = 0.1

            # Stop the previously scheduled call
            arcade.unschedule(function_pointer=self.add_coin)

            # Schedule the next coin addition
            arcade.schedule(
                function_pointer=self.add_coin, interval=self.coin_countdown
            )

    def on_mouse_motion(self, x: float, y: float, dx: float, dy: float):
        """Processed when the mouse moves

        Arguments:
            x {float} -- X Position of the mouse
            y {float} -- Y Position of the mouse
            dx {float} -- Change in x position since last move
            dy {float} -- Change in y position since last move
        """

        # Ensure the player doesn't move off-screen
        self.player.center_x = arcade.clamp(x, 0, WIDTH)
        self.player.center_y = arcade.clamp(y, 0, HEIGHT)

    def on_update(self, delta_time: float):
        """Update all the game objects

        Arguments:
            delta_time {float} -- How many seconds since the last frame?
        """

        # Check if you've picked up a coin
        coins_hit = arcade.check_for_collision_with_list(
            sprite=self.player, sprite_list=self.coins
        )

        for coin in coins_hit:
            # Add the coin score to your score
            self.score += COIN_VALUE

            # Play the coin sound
            arcade.play_sound(self.coin_pickup_sound)

            # Remove the coin
            coin.remove_from_sprite_lists()

        # Are there more coins than allowed on the screen?
        if len(self.coins) > COIN_COUNT:
            # Stop adding coins
            arcade.unschedule(function_pointer=self.add_coin)

            # Show the mouse cursor
            self.set_mouse_visible(True)

            # Print the final score and exit the game
            print(f"Game over! Final score: {self.score}")
            exit()

    def on_draw(self):
        """Draw everything"""

        # Start the rendering pass
        arcade.start_render()

        # Draw the coins
        self.coins.draw()

        # Draw the player
        self.player.draw()

        # Draw the score in the lower-left corner
        arcade.draw_text(
            text=f"Score: {self.score}",
            start_x=50,
            start_y=50,
            font_size=32,
            color=arcade.color.BLACK,
        )

if __name__ == "__main__":
    arcade_game = ArcadeGame(WIDTH, HEIGHT, TITLE)
    arcade_game.setup()
    arcade.run()
```
