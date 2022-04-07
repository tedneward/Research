title=WebAssembly
tags=platform, browser
summary=A portable multi-environment-targeting bytecode format for the Web.
~~~~~~

[Website](https://webassembly.org/) | [Bytecode Alliance](https://bytecodealliance.org/)

[Specifications page](https://webassembly.github.io/spec/) ([Source](https://github.com/WebAssembly/spec/)):

* [Core](https://webassembly.github.io/spec/core/_download/WebAssembly.pdf)
* [JavaScript Embedding](https://webassembly.github.io/spec/js-api/index.html)
* [Web Embedding](https://webassembly.github.io/spec/web-api/index.html)
* [Proposals](https://github.com/WebAssembly/proposals)
* [Component model](https://github.com/WebAssembly/component-model)
* [WebAssembly System Interface](https://wasi.dev/)
* [Common WebAssembly](https://github.com/CommonWA/cwa-spec)

Tools: [WebAssembly Binary Toolkit (wabt)](https://github.com/WebAssembly/wabt) | [binaryen](https://github.com/WebAssembly/binaryen)

[Awesome WASM languages](https://github.com/appcypher/awesome-wasm-langs):

* [AssemblyScript](/languages/wasm/assemblyscript): An assembler for WebAssembly.
* [Astro](/languages/wasm/astro): a fun safe language for rapid prototyping and high performance applications.
* [Cheerp](/languages/cplusplus/cheerp): an open-source, commercial C/C++ compiler for Web applications. It can compile virtually any C/C++ code (up to C++14) to WebAssembly, JavaScript, asm.js or a combination thereof.
* [Duktape](https://github.com/svaarala/duktape): embeddable JS engine capable of being run in the browser via WebAssembly
* [SwiftWASM](https://swiftwasm.org/) ([Source](https://github.com/swiftwasm/swift)): SwiftWasm compiles your [Swift](/languages/swift) code to WebAssembly.
* [wasmlink](https://github.com/bytecodealliance/wit-bindgen/tree/main/crates/wasmlink):  a CLI that allows us to statically link a module and its dependencies using [module linking](https://github.com/WebAssembly/module-linking) and the [Canonical Interface Types ABI](https://github.com/WebAssembly/interface-types/pull/140).

[Wasm3](https://github.com/wasm3/wasm3): "The fastest WebAssembly interpreter (and the most universal wasm runtime)"

[.NET WebAssembly](https://github.com/RyanLamansky/dotnet-webassembly): Create, read, modify, write and execute WebAssembly (WASM) files from .NET-based applications.

[Wasm Debugger](https://github.com/wasm3/wasm-debug): Direct, source-level WebAssembly debugger

[An introduction to WebAssembly components](https://radu-matei.com/blog/intro-wasm-components/)

[WebAssembly friendly programming with C/C++](https://github.com/3dgen/cppwasm-book/tree/master/en) - Ending, Chai Shushan, Yushih (HTML, [examples](https://github.com/3dgen/cppwasm-book/tree/master/examples))

### Example SDL app compiled to WebAssembly (from https://main.lv/writeup/web_assembly_sdl_example.md):

```
#include <stdio.h>
#include <stdlib.h>

#if __EMSCRIPTEN__
#include <emscripten/emscripten.h>
#include <SDL2/SDL.h>
#include <SDL/SDL_ttf.h>
#else
#include <SDL2/SDL.h>
#include <SDL2/SDL_ttf.h>
#endif

#define SCREEN_WIDTH  200
#define SCREEN_HEIGHT 200

SDL_Window *window = NULL;
SDL_Renderer *renderer = NULL;

#define MAX(a,b) ((a) > (b) ? a : b)
#define MIN(a,b) ((a) < (b) ? a : b)

int posX=0;
int posY=0;
int sizeW=20;
int sizeH=20;

static int quit = 0;

void render()
{

    SDL_Rect r_scr;
    r_scr.x = posX;
    r_scr.y = posY;
    r_scr.w = sizeW;
    r_scr.h = sizeH;
    SDL_SetRenderDrawColor( renderer, 0x00, 0x00, 0x00, 0xFF );
    SDL_RenderClear(renderer);

    SDL_SetRenderDrawColor(renderer, 0xff, 0xff, 0x00, 0x00);
    SDL_RenderDrawRect(renderer, &r_scr);
    SDL_RenderPresent(renderer);
}

#if __EMSCRIPTEN__
void main_tick() {
#else
int main_tick() {
#endif

    SDL_Event event;

        while (SDL_PollEvent(&event))
        {
            switch (event.type)
            {
            case SDL_QUIT:
            {
                quit = 1;
                break;
            }
            case SDL_KEYDOWN:
            {
                switch (event.key.keysym.sym)
                {
                case SDLK_UP:
                {
                    if (posY>=20)
                    {
                        posY-=20;
                    }
                    break;
                }
                case SDLK_DOWN:
                {
                    if (posY+sizeH<SCREEN_HEIGHT)
                    {
                        posY += 20;
                    }
                    break;
                }
                case SDLK_LEFT:
                {
                    if (posX>=20)
                    {
                        posX-=20;
                    }
                    break;
                }
                case SDLK_RIGHT:
                {
                    if (posX+sizeW<SCREEN_WIDTH)
                    {
                        posX+=20;
                    }
                    break;
                }
                }
                break;
            }
            }

        }


    render();
    SDL_UpdateWindowSurface(window);

#if !__EMSCRIPTEN__
    return 0;
#endif
}

void main_loop()
{

#if __EMSCRIPTEN__
    emscripten_set_main_loop(main_tick, -1, 1);
#else
    while (0 == quit)
    {
        main_tick();
    }
#endif
}

int main()
{
    SDL_Init(SDL_INIT_VIDEO);

    window = SDL_CreateWindow(
        "WEBASM",
        SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
        SCREEN_WIDTH, SCREEN_HEIGHT,
        SDL_WINDOW_SHOWN | SDL_WINDOW_OPENGL);

    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    SDL_SetRenderDrawColor(renderer, 0xff, 0xff, 0xff, 0xff);

    main_loop();

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}
```

Build:
```
CC=gcc
CFALGS=
LDFLAGS=-lSDL2 -lSDL2_ttf

EM_ENV=LLVM=/usr/bin NODE_JS=node EMSCRIPTEN_ROOT=/usr/lib/emscripten
EM_CC=emcc
EM_CFLAGS=-s WASM=1 -O3
EM_LDFALGS=-s USE_SDL=2 -s USE_SDL_IMAGE=2 -s SDL2_IMAGE_FORMATS='["png"]' -s USE_SDL_TTF=2

pc:
    $(CC) $(CFLAGS) $(LDFLAGS) main.c -o main

em:
    $(EM_CC) main.c $(EM_CFLAGS) $(EM_LDFALGS) -o index.js -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]'
```

Host:
```
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    </head>
    <body>
        <script type='text/javascript'>
          var Module = {};
          fetch('index.wasm')
            .then(response =>
              response.arrayBuffer()
            ).then(buffer => {
              Module.canvas = document.getElementById("canvas");
              Module.wasmBinary = buffer;
              var script = document.createElement('script');
              script.src = "index.js";
              script.onload = function() {
                console.log("Emscripten boilerplate loaded.")
              }
              document.body.appendChild(script);
            });
        </script>
        <canvas id="canvas" style="width:100%; height:100%"></canvas>

    </body>
</html>
```