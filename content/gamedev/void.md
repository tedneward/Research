title=Void
tags=gamedev, clr
summary=A modular, extensible 2D game framework for .NET.
~~~~~~

[Source](https://github.com/Shmellyorc/Void)

VOID is built around a simple idea:

> Give developers solid defaults without assuming those defaults are right for every game.

Use the built-in systems as they are, extend them, replace them, or ignore the ones you do not need.

VOID deliberately stays focused on framework-level systems. Features such as full physics and UI frameworks are left to your game or the libraries you choose.

Install the project template:

    dotnet new install Void.Templates

Create and run a game:

    dotnet new voidgame -n MyGame
    cd MyGame
    dotnet run

Or install the engine directly:

    dotnet add package Void.Engine

## Features

| System | What It Does |
| --- | --- |
| **Rendering** | Batched sprite and primitive rendering, texture atlasing, shaders, render targets, post-processing |
| **Renderer API** | Public renderer-neutral contracts with a pluggable backend architecture |
| **Platform** | SDL3 windowing, displays, fullscreen modes, events, keyboard, mouse, and gamepads |
| **Assets** | Mount-based virtual file system, custom asset types, pack loading, LRU eviction |
| **Audio** | OpenAL playback, sound pooling, priority-based voice stealing, category volumes |
| **Saving** | AES-GCM encrypted saves with manifest verification |
| **Pathfinding** | A\\*, Dijkstra, BFS, and flow fields |
| **Coroutines** | Tweens, sequencing, delays, waits, and easing |
| **Logging** | Async logging with console and file sinks |
| **Math** | Vectors, matrices, rectangles, colors, easing, and random helpers |
| **Tooling** | Project templates and encrypted asset packing tools |
| **LDtk** | LDtk level and asset integration |

