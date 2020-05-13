title=libGdx
tags=gamedev, jvm
summary=Cross-platform game development built using Java/JVM languages.
~~~~~~

Java game development framework that provides a unified API that works across all supported platforms.

[Website](https://libgdx.badlogicgames.com/) | [Github](https://github.com/libgdx/libgdx)

[List of awesome resources, tools, tutorials and projects](https://github.com/rafaskb/awesome-libgdx)

## Tutorials
[Game from Scratch: LibGDX Text Tutorial Series](http://gamefromscratch.com/page/LibGDX-Tutorial-series.aspx) builds a jet-plane shooter game | [BludBourne](https://github.com/patrickhoey/BludBourne) comes from the book "Mastering libGdx Game Development"

## Prominent personages
[TEttinger](https://github.com/tommyettinger): [gdx-liftoff](https://github.com/tommyettinger/gdx-liftoff) | [raeleus](https://github.com/raeleus): [skin-composer](https://github.com/raeleus/skin-composer) | [czyzby](https://github.com/czyzby): [gdx-setup](https://github.com/czyzby/gdx-setup)

## Examples
[Asteroids](https://github.com/haxpor/asteroids) | [Nine Circles](https://github.com/edwardszczepanski/LibGDX-Demo-Game) | [Checkers](https://github.com/grafiszti/checkers) | [Straight-Checkers](https://github.com/choxxy/Straight-Checkers) | [libgdx-tic-tac-toe](https://github.com/jarrodparkes/libgdx-tic-tac-toe) | [martianrun](https://github.com/wmora/martianrun) | [DestinationSol](https://github.com/MovingBlocks/DestinationSol) space shooter | [Unciv](https://github.com/yairm210/Unciv) Android/Desktop remake of Civ V | [Unlucky](https://github.com/mingli1/Unlucky) Android 2D RPG | [uracer-kotd](https://github.com/manuelbua/uracer-kotd) GLES2 top-down racer | [SuperJumper](https://github.com/dsaltares/ashley-superjumper)

## Scene2D
[This site](https://github.com/czyzby/gdx-skins) has a bunch of skins, and links to how to use skins in general.


## Extensions
[LibKTX]https://github.com/libktx/ktx): Kotlin extensions for LibGDX games/apps.

## Ashley (Entity Component System)
An ECS is essentially a cross-cutting concerns capture tool. Might be something that could be replaced entirely through the use of [AspectJ](/languages/aspectj.html)--need to look into that sometime.

An ECS consists of a couple of core concepts:
* Entity: A noun within the game. Players, enemies, etc.
* Component: Components are parts of entities that correspond to a cross-cutting concern for the entity but isn't part of the entity's concerns itself. 
* System: Systems iterate through all the entities that have a particular component embedded within them, and perform the logic associated with that component/system.

In [this example](https://www.gamedevelopment.blog/full-libgdx-game-tutorial-entities-ashley/), we have TransformComponent (for storing positional data), TextureComponent (for storing the TextureRegion), AnimationComponent (for keeping track of the animations for an entity), B2dBodyComponent (for Box2D body instances), CollisionComponent (for tracking what Entity this Entity has collided with), and so on. Each component is really just a data-tracking object, holding little bits and pieces that the System is concerned with. Also has PlayerComponent, StateComponent (for tracking state-machine settings), and TypeComponent, tracking what type the entity is.

The Systems, then, handle each of the various "decision-making" parts of the game--rendering the entities to screen, determining if they've collided, and so on. RenderingSystem , CollisionSystem, PhysicsSystem, and so on. Each System obtains a list of Entities that contain the particular Component that matters to that System--RenderingSystem wants only the TransformComponent and TextureComponent pieces, for example.

## Support libraries/packages
[VisUI](https://github.com/kotcrab/vis-ui) UI skin

## Articles

### Deploying to iOS
["Deploying your libGDX game to iOS in 2019"](https://medium.com/@bschulte19e/deploying-your-libgdx-game-to-ios-in-2019-8d3796410d82) 

### RoboVM
[RoboVM Website](http://robovm.mobidevelop.com/) [RoboVM Github](https://github.com/MobiVM/robovm) | [Getting Started](http://robovm.mobidevelop.com/docs/en/getting-started/introduction.html) | ["Are there any alternatives to RoboVM?"](https://github.com/MobiVM/robovm/wiki/Are-there-any-alternatives-to-RoboVM%3F)

### Multi-OS Engine
[Website docs](https://doc.multi-os-engine.org/multi-os-engine/MultiOSEngine.html) | [Getting Started](https://doc.multi-os-engine.org/multi-os-engine/3_getting_started/Getting_Started.html)

