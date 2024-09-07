title=TileEngine
tags=gamedev, 2d, native
summary=A free, open source cross-platform 2D graphics engine for creating classic/retro games with tilemaps, sprites and palettes. 
~~~~~~

[Website](http://www.tilengine.org/) | [Website](https://tilengine.handmade.network/) | [Source](https://github.com/megamarc/Tilengine)

```
#include "Tilengine.h"

void main(void) {
    TLN_Tilemap foreground;

    TLN_Init (400, 240, 1, 0, 0);
    foreground = TLN_LoadTilemap ("assets/sonic/Sonic_md_fg1.tmx", NULL);
    TLN_SetLayerTilemap (0, foreground);

    TLN_CreateWindow (NULL, 0);
    while (TLN_ProcessWindow()) {
        TLN_DrawFrame (0);
    }

    TLN_DeleteTilemap (foreground);
    TLN_Deinit ();
}
```
