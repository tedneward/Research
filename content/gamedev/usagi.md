title=Usagi
tags=gamedev, lua
summary=Simple 2D Game Engine for Rapid Prototyping.
~~~~~~

[Website](https://usagiengine.com/) | [Source](https://github.com/brettchalupa/usagi/)

## Features

-   **Live reload.** `usagi dev` watches your code and assets; saves apply without losing game state. Tweak a sprite in your editor and see it update instantly.
-   **One-command export.** `usagi export` packages your game for Linux, macOS, Windows, and the web.
-   **Pause menu, free.** Built-in pause menu with sfx and music volume, fullscreen toggle, and per-game keyboard + gamepad remapping.
-   **Easy save data.** One function to save and load your game state as a Lua table.
-   **Small, fixed API.** You can't do everything, but you've got what you need to make a great 2D game.
-   **Constraints to inspire creativity.** 320x180 default resolution, 16x16 default sprite grid, a single `sprites.png` for textures.

Bring your own sound effects, sprite editor, and music tools.

## Getting Started

Bootstrap a project and start it in dev mode:

```
usagi init my_game
cd my_game
usagi dev
```

`init` writes `main.lua` (with `_init` / `_update` / `_draw` stubs), `.luarc.json` for Lua LSP support, `.gitignore`, `meta/usagi.lua` (API type stubs), and `USAGI.md` (a copy of these docs).

Edit `main.lua`, save, and the running game picks up the change without restarting or losing state. Drawing "Hello, Usagi!" looks like:

    function _draw(_dt)
        gfx.clear(gfx.COLOR_BLACK)
        gfx.text("Hello, Usagi!", 10, 10, gfx.COLOR_WHITE)
    end

