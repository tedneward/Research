title=Raylib
tags=gamedev, native, windows, macos, linux, android, browser
summary=A simple and easy-to-use library to enjoy videogames programming.
~~~~~~

[Website](http://www.raylib.com/) | [Source](https://github.com/raysan5/raylib) | [Examples](https://www.raylib.com/examples.html) | [Wiki](https://github.com/raysan5/raylib/wiki)

C/C++ library

raylib is highly inspired by Borland BGI graphics lib and by XNA framework and it's especially well suited for prototyping, tooling, graphical applications, embedded systems and education.

NOTE for ADVENTURERS: raylib is a programming library to enjoy videogames programming; no fancy interface, no visual helpers, no debug button... just coding in the most pure spartan-programmers way.

## features

-   **NO external dependencies**, all required libraries are [included into raylib](https://github.com/raysan5/raylib/tree/master/src/external)
-   Multiple platforms supported: **Windows, Linux, MacOS, RPI, Android, HTML5... and more!**
-   Written in plain C code (C99) using PascalCase/camelCase notation
-   Hardware accelerated with OpenGL: **1.1, 2.1, 3.3, 4.3, ES 2.0, ES 3.0**
-   **Unique OpenGL abstraction layer** (usable as standalone module): [rlgl](https://github.com/raysan5/raylib/blob/master/src/rlgl.h)
-   **Software Renderer** backend (no OpenGL required!): [rlsw](https://github.com/raysan5/raylib/blob/master/src/external/rlsw.h)
-   Multiple **Fonts** formats supported (TTF, OTF, FNT, BDF, sprite fonts)
-   Multiple texture formats supported, including **compressed formats** (DXT, ETC, ASTC)
-   **Full 3D support**, including 3D Shapes, Models, Billboards, Heightmaps and more!
-   Flexible Materials system, supporting classic maps and **PBR maps**
-   **Animated 3D models** supported (skeletal bones animation) (IQM, M3D, glTF)
-   Shaders support, including model shaders and **postprocessing** shaders
-   **Powerful math module** for Vector, Matrix and Quaternion operations: [raymath](https://github.com/raysan5/raylib/blob/master/src/raymath.h)
-   Audio loading and playing with streaming support (WAV, QOA, OGG, MP3, FLAC, XM, MOD)
-   **VR stereo rendering** support with configurable HMD device parameters
-   Huge examples collection with [+140 code examples](https://github.com/raysan5/raylib/tree/master/examples)!
-   Bindings to [+70 programming languages](https://github.com/raysan5/raylib/blob/master/BINDINGS.md)!
-   **Free and open source**

## basic example

This is a basic raylib example, it creates a window and draws the text `"Congrats! You created your first window!"` in the middle of the screen. Check this example [running live on web here](https://www.raylib.com/examples/core/loader.html?name=core_basic_window).

        #include "raylib.h"

        int main(void)
        {
            InitWindow(800, 450, "raylib example - basic window");

            while (!WindowShouldClose())
            {
                BeginDrawing();
                    ClearBackground(RAYWHITE);
                    DrawText("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);
                EndDrawing();
            }

            CloseWindow();

            return 0;
        }

## learning and docs

raylib is designed to be learned using [the examples](https://github.com/raysan5/raylib/tree/master/examples) as the main reference. There is no standard API documentation but there is a [**cheatsheet**](https://www.raylib.com/cheatsheet/cheatsheet.html) containing all the functions available on the library a short description of each one of them, input parameters and result value names should be intuitive enough to understand how each function works.

Some additional documentation about raylib design can be found in [raylib GitHub Wiki](https://github.com/raysan5/raylib/wiki). Here are the relevant links:

-   [raylib cheatsheet](https://www.raylib.com/cheatsheet/cheatsheet.html)
-   [raylib architecture](https://github.com/raysan5/raylib/wiki/raylib-architecture)
-   [raylib library design](https://github.com/raysan5/raylib/wiki)
-   [raylib examples collection](https://github.com/raysan5/raylib/tree/master/examples)
-   [raylib games collection](https://github.com/raysan5/raylib-games)

