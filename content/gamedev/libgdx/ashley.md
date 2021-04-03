title=libGdx Ashley library
tags=gamedev, jvm
summary=Entity system library for libGdx.
~~~~~~

An ECS is essentially a cross-cutting concerns capture tool. Might be something that could be replaced entirely through the use of [AspectJ](/languages/aspectj.html)--need to look into that sometime.

An ECS consists of a couple of core concepts:
* Entity: A noun within the game. Players, enemies, etc. Have one or more associated components in order to define their behavior and attributes. Basically an ID, nothing else.
* EntityManager: A class that governs the EC system; fundamental kernel of EC. It creates and kills entities, maintains a list of all known entities, maps entities to their components, and retrieves entities' component functionality on demand.
* Component: Components are parts of entities that correspond to a cross-cutting concern for the entity but isn't part of the entity's concerns itself. "Just dumb bags of data--no logic." No awareness of each other or communication with one another.
* System: Systems iterate through all the entities that have a particular component embedded within them, and perform the logic associated with that component/system. Hold all logic and algorithms, know their own component needs. Allowed to talk to any components as necessary, but generally do not talk to other systems directly.

In [this example](https://www.gamedevelopment.blog/full-libgdx-game-tutorial-entities-ashley/), we have TransformComponent (for storing positional data), TextureComponent (for storing the TextureRegion), AnimationComponent (for keeping track of the animations for an entity), B2dBodyComponent (for Box2D body instances), CollisionComponent (for tracking what Entity this Entity has collided with), and so on. Each component is really just a data-tracking object, holding little bits and pieces that the System is concerned with. Also has PlayerComponent, StateComponent (for tracking state-machine settings), and TypeComponent, tracking what type the entity is.

The Systems, then, handle each of the various "decision-making" parts of the game--rendering the entities to screen, determining if they've collided, and so on. RenderingSystem , CollisionSystem, PhysicsSystem, and so on. Each System obtains a list of Entities that contain the particular Component that matters to that System--RenderingSystem wants only the TransformComponent and TextureComponent pieces, for example.

Entity-Component game programming using JRuby and libGDX: [Source](https://github.com/cpowell/ruby-entity-component-framework) [Part 1](https://cbpowell.wordpress.com/2012/10/30/entity-component-game-programming-using-jruby-and-libgdx-part-1/) [Part 2](https://cbpowell.wordpress.com/2012/12/05/entity-component-game-programming-using-jruby-and-libgdx-part-2/) | [Part 3](https://cbpowell.wordpress.com/2012/12/06/entity-component-game-programming-using-jruby-and-libgdx-part-3/) | [Part 4](https://cbpowell.wordpress.com/2012/12/07/entity-component-game-programming-using-jruby-and-libgdx-part-4/) | [Part 5](https://cbpowell.wordpress.com/2012/12/11/entity-component-game-programming-using-jruby-and-libgdx-part-5/) | [Part 6](https://cbpowell.wordpress.com/2012/12/13/entity-component-game-programming-using-jruby-and-libgdx-part-6/) | [Part 7](https://cbpowell.wordpress.com/2012/12/16/entity-component-game-programming-using-jruby-and-libgdx-part-7/) | [Part 8](https://cbpowell.wordpress.com/2012/12/17/entity-component-game-programming-using-jruby-and-libgdx-part-8/)
