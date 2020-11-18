title=PuzzleScript
tags=gamedev, language
summary=A language/environment for creating turn-based, keyboard-controlled games where you're moving a thing, or several things around.
~~~~~~

[Website](https://www.puzzlescript.net/index.html) | [Source](https://github.com/increpare/PuzzleScript)

### PuzzleScript file:
A puzzlescript file is divided into 8 sections:

#### Prelude
```
title My Game
author My Name Here
homepage www.puzzlescript.net
```

#### Objects
Here's where your in-game objects are all declared. The simplest way is to give something a name and a color:
```
========
OBJECTS
========

Background 
GREEN  

Target 
DarkBlue    

Wall 
BROWN

Player 
Blue   

Crate 
Orange 
```

#### Legend
This section has two purposes. Firstly, it's a place where you can set up single-character names for things so that you can type them in levels:
```
=======
LEGEND
=======

. = Background
# = Wall
P = Player
* = Crate
@ = Crate and Target
O = Target
```
There is another purpose, and this is to define properties of objects that you can refer to in rules and elsewhere:

```
Flying = Bat or Bird
Obstacle = Wall or Lava or Water
```

#### Sounds
Here's where you hook up sounds to in-game actions.

There are sound buttons above the console, that produce sound seeds that you can use in this section.

These numbers are saved representations of the sounds, and you use them in the sound sections.
```
=======
SOUNDS
=======

#### Collision Layers
Objects can be placed on different layers:
```
================
COLLISIONLAYERS
================

Background
Target
Player, Wall, Crate
```
The main purpose of layers is in resolving movements: two objects on the same layer cannot coexist in a single cell. The order of layers also determines in what order things are drawn.

The Background layer is a special layer. Every game must have one. Every tile must have a background tile. However, by defining `Background = Background1 or Background2` in the legend, you can have several tile types on the background layer. Every tile must have a background tile. If you don't specify one explicitly for a tile, it is inferred based on what background tiles are on the level it's in.

#### Rules
Rules are about pattern replacement. There's a left side, and a right side, the engine looks for occurrences of the left side, possibly in many different orientations, and when it finds one, it replaces the contents with what's on the right.
```
======
RULES     
======     

[ >  Player | Crate ] -> [  >  Player | > Crate  ]     
```

#### Win Conditions
Here are the possible formats of win conditions:

```
(neko puzzle - you win if there's no fruit left)
No Fruit

(sokoban - you win if every target point has a crate on it)
All Target On Crate 

(you win if Love exists somewhere)
Some Love 

(you win if there's some gold in the chest)
Some gold on chest 

(you win if all gold has been taken from the chest)
No gold on chest
```

If you have multiple win conditions, they all have to be satisfied.

These should do for most games, but if you want more advanced control over winning and losing, then you can specify your own win rules using commands.

```
==============
WINCONDITIONS
==============

All Target on Crate     
```

#### Levels
Here's where all the fun happens. Levels are separated by blank lines, and you can also display messages if you want to. If you want to have several objects occupying single tile, you can specify this in the legend using `and`.

```
=======     
LEVELS
=======

#########
#.......#
#.....@.#
#.P.*.O.#
#.......#
#.......#
#########
```

