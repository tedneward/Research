title=Entity Component Systems (ECS)
tags=gamedev, patterns, reading, architecture
summary=A common architecture/design pattern for building games.
~~~~~~

[Entity Systems Project](http://entity-systems.wikidot.com/) | [Wikipedia](https://en.wikipedia.org/wiki/Entity%E2%80%93component%E2%80%93system)

* [Approaches](http://entity-systems.wikidot.com/es-approaches)
* [Designing a game that uses entity systems](http://entity-systems.wikidot.com/designing-a-game-that-uses-an-entity-system)

## Implementations:

* [A-Frame](https://github.com/aframevr/aframe/) (Javascript): [Website](https://aframe.io/) "A web framework for building 3D/AR/VR experiences. Make 3D worlds with HTML and Entity-Component. For Quest, Rift, WMR, SteamVR, mobile, desktop." [Docs](https://aframe.io/docs/1.2.0/introduction/)
* [Artemis (C#)](https://thelinuxlich.github.io/artemis_CSharp/)/[Artemis (Java)](https://gamadu.com/artemis/)
* [Ape-ECS](https://github.com/fritzy/ape-ecs) (Javascript): "Entity-Component-System library for JavaScript."
* [ECSY](../ecsy) (Javascript)
* [ensy](https://github.com/adngdb/entity-system-js) (Javascript): "A very simple Entity System for JavaScript." [Docs](https://entity-system-js.readthedocs.io/en/latest/)
* [javascript-entity-component-system](https://www.npmjs.com/package/javascript-entity-component-system?activeTab=readme) (Javascript): Lightweight ECS
* [Legion](https://github.com/TomGillen/legion) (Rust)
* [SPECS](https://github.com/amethyst/specs) (Rust)

## Reading

* ["How to Build an Entity Component System Game in JavaScript"](http://vasir.net/blog/game-development/how-to-build-entity-component-system-in-javascript) ([Code](https://github.com/erikhazzard/RectangleEater/blob/master/scripts/game.js))
* ["Introducing ECSY"](https://blog.mozvr.com/introducing-ecsy/)
* ["Entity Component System (ECS) in A-Frame and Javascript"](https://pancy.medium.com/entity-component-system-ecs-in-a-frame-and-javascript-f5b7cdba7248)
* ["How I Built a TypeScript Entity Component System"](https://blog.marco-alka.de/how-i-built-a-typescript-entity-component-system-ck98i5iqp00eqcxs1m1xol9d5)
* "Entity Systems are the future of MMOG development": [Part 1](http://t-machine.org/index.php/2007/09/03/entity-systems-are-the-future-of-mmog-development-part-1/), [Part 2](http://t-machine.org/index.php/2007/09/03/entity-systems-are-the-future-of-mmog-development-part-2/), [Part 3](http://t-machine.org/index.php/2007/09/03/entity-systems-are-the-future-of-mmog-development-part-3/), [Part 4](http://t-machine.org/index.php/2008/03/13/entity-systems-are-the-future-of-mmos-part-4/), [Part 5](http://t-machine.org/index.php/2009/10/26/entity-systems-are-the-future-of-mmos-part-5/)
* [Evolve Your Hierarchy](http://cowboyprogramming.com/2007/01/05/evolve-your-heirachy/)

#### From "How to Build an Entity Component System Game in JavaScript":
With ECS, entities are just collections of components; just a collection of data.

* **Entity**: An entity is just an ID
* **Component**: Components are just data.
* **System**: Logic that runs on every entity that has a component of the system. For example, a "Renderer" system would draw all entities that have a "appearance" component.
* **Assemblage**: a way to easily create entities that have some grouping of components. For instance, a Human assemblage might contain "position", "name", "health", and "appearance" components. A Sword assemblage might just have "appearance" and "name".

With this approach, you avoid having to create gnarly inheritance chains. With this approach, for example, a half-orc isn't some amalgamation of a human class and an orc class (which might inherit from a Monster class). With this approach, a half-orc is just a grouping of data.

An entity is just a like a record in a database. The components are the actual data. Here's a high level example of what the data might look like for entities, shown by ID and components. The beauty of this system is that you can dynamically build entities - an entity can have whatever components (data) you want.

Everything is tagged as an entity. A bullet, for instance, might just have a "physics" and "appearance" component. Entity Component System is data driven. This approach allows greater flexibility and more expression. One benefit is the ability to dynamically add and remove components, even at run time. You could dynamically remove the appearance component to make invisible bullets, or add a "playerControllable" component to allow the bullet to be controlled by the player. No new classes required.

This can potentially be a problem as systems have to iterate through all entities. Of course, it's not terribly difficult to optimize and structure code so not all entities are hit each iteration if you have too many, but it's helpful to keep this constraint in mind, especially for browser based games.

[Thus] we just need to do a few things:

1. Set up the initial entities
1. Set up the order of the systems which we want to use
1. Set up a game loop, which calls each system and passed in all the entities
1. Set up a lose condition

1. Let's take a look at the code for setting up the initial entities and the player entity:

```
var self = this;
var entities = {}; // object containing { id: entity  }
var entity;

// Create a bunch of random entities
for(var i=0; i < 20; i++){
    entity = new ECS.Entity();
    entity.addComponent( new ECS.Components.Appearance());
    entity.addComponent( new ECS.Components.Position());

    // % chance for decaying rects
    if(Math.random() < 0.8){
        entity.addComponent( new ECS.Components.Health() );
    }

    // NOTE: If we wanted some rects to not have collision, we could set it
    // here. Could provide other gameplay mechanics perhaps?
    entity.addComponent( new ECS.Components.Collision());

    entities[entity.id] = entity;
}

// PLAYER entity
// Make the last entity the "PC" entity - it must be player controlled,
// have health and collision components
entity = new ECS.Entity();
entity.addComponent( new ECS.Components.Appearance());
entity.addComponent( new ECS.Components.Position());
entity.addComponent( new ECS.Components.Collision() );
entity.addComponent( new ECS.Components.PlayerControlled() );
entity.addComponent( new ECS.Components.Health() );

// we can also edit any component, as it's just data
entity.components.appearance.colors.g = 255;
entities[entity.id] = entity;

// store reference to entities
ECS.entities = entities;
```

Note how we can modify any of the component data directly. It's all data that can be manipulated however and whenever you want! The player entity step could be even further simplified by using assemblages, which are basically entity templates. For instance (using our assemblages):

```
entity = new ECS.Assemblages.CollisionRect();
entity.addComponent( new ECS.Components.Health());
entity.addComponent( new ECS.Components.PlayerControlled() );
```

2. Next, we setup the order of the systems:

```
// Setup systems
// Setup the array of systems. The order of the systems is likely critical, 
// so ensure the systems are iterated in the right order
var systems = [
    ECS.systems.userInput,
    ECS.systems.collision,
    ECS.systems.decay, 
    ECS.systems.render
];
```

3. Then, a simple game loop

```
// Game loop
function gameLoop (){
    // Simple game loop
    for(var i=0,len=systems.length; i < len; i++){
        // Call the system and pass in entities
        // NOTE: One optimal solution would be to only pass in entities
        // that have the relevant components for the system, instead of 
        // forcing the system to iterate over all entities
        systems[i](ECS.entities);
    }

    // Run through the systems. 
    // continue the loop
    if(self._running !== false){
        requestAnimationFrame(gameLoop);
    }
}
// Kick off the game loop
requestAnimationFrame(gameLoop);
```

4. Finally, a lose condition

```
// Lose condition
this._running = true; // is the game going?
this.endGame = function endGame(){ 
    self._running = false;
    document.getElementById('final-score').innerHTML = +(ECS.$score.innerHTML);
    document.getElementById('game-over').className = '';

    // set a small timeout to make sure we set the background
    setTimeout(function(){
        document.getElementById('game-canvas').className = 'game-over';
    }, 100);
};
```
