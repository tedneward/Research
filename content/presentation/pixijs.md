title=PixiJS
tags=presentation, browser, gamedev
summary=A rendering library that will allow you to create rich, interactive graphics, cross platform applications, and games without having to dive into the WebGL API or deal with browser and device compatibility.
~~~~~~

[Website](http://www.pixijs.com/) | [Docs](https://pixijs.download/release/docs/index.html) | [Examples](https://pixijs.io/examples/#/demos-basic/container.js) | [Source](https://github.com/pixijs/pixijs) 

[Tutorial](https://github.com/kittykatattack/learningPixi)

Features

* WebGL renderer (with automatic smart batching allowing for REALLY fast performance)
* Canvas renderer (Fastest in town!)
* Full scene graph
* Super easy to use API (similar to the flash display list API)
* Support for texture atlases
* Asset loader / sprite sheet loader
* Auto-detect which renderer should be used
* Full Mouse and Multi-touch Interaction
* Text
* BitmapFont text
* Multiline Text
* Render Texture
* Primitive Drawing
* Masking
* Filters
* User Plugins

### Basic Usage Example
```js
import * as PIXI from 'pixi.js';

// The application will create a renderer using WebGL, if possible,
// with a fallback to a canvas render. It will also setup the ticker
// and the root stage PIXI.Container
const app = new PIXI.Application();

// The application will create a canvas element for you that you
// can then insert into the DOM
document.body.appendChild(app.view);

// load the texture we need
app.loader.add('bunny', 'bunny.png').load((loader, resources) => {
    // This creates a texture from a 'bunny.png' image
    const bunny = new PIXI.Sprite(resources.bunny.texture);

    // Setup the position of the bunny
    bunny.x = app.renderer.width / 2;
    bunny.y = app.renderer.height / 2;

    // Rotate around the center
    bunny.anchor.x = 0.5;
    bunny.anchor.y = 0.5;

    // Add the bunny to the scene we are building
    app.stage.addChild(bunny);

    // Listen for frame updates
    app.ticker.add(() => {
         // each frame we spin the bunny around a bit
        bunny.rotation += 0.01;
    });
});
```
