title=Piston
tags=gamedev, rust
summary=A modular open source game engine.
~~~~~~

[Source](https://github.com/pistondevelopers/piston-tutorials)

To use the Piston engine, add the following line to your cargo.toml file:

```
piston = "0.53.1"
```

Piston’s extensive library collection encompasses 2D, 3D, image processing, event programming, a GUI, sound and animation, and other features. These libraries can be used independently depending on the project you are working on.

Maintenance of the libraries is shared amongst the developers to provide more time, increase productivity, and achieve higher quality in the codebases.

In addition to its modular libraries, Piston‘s public API allows you to access inputs like a gamepad, mouse, or keypad. Another great thing about Piston is the event loop. You can either pass your game logic into the event loop or create a separate thread for it.

Piston also uses a dynamic scripting language called Dyon, which was specifically created for game engines and designed to work with Rust. People with no programming experience will find it easy to pick up and use.

