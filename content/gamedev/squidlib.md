title=SquidLib
tags=gamedev, jvm
summary=Useful tools for roguelike, role-playing, strategy, and other grid-based games in Java.
~~~~~~

[Source](https://github.com/yellowstonegames/SquidLib)

> SquidLib is a very full-featured library, and is partly targeted at making traditional roguelikes and similar genres. It can handle basic to moderately-complex dungeon generation, including rigid mazes (GrowingTreeMazeGenerator), flowing/natural cave systems (FlowingCaveGenerator), dense systems of inter-connected rooms (DungeonGenerator's default setting), rooms that connect via thin corridor in a cyclical pattern (SerpentMapGenerator), mixes of cave, room, and corridor (also SerpentMapGenerator, with more options using SectionDungeonGenerator), and more. It represents dungeons universally as a char[][], consistently using x-then-y indexing throughout the library, and various other parts of SquidLib can understand char[][] input. Since we target the JVM, we have Unicode for our chars, and dungeons often are drawn with box-drawing characters for walls. Within a dungeon or cave, the lighting system can be complex, so there's code to find the Field of Vision for a character that can also be used to find the level of brightness for light cast into many tiles. You can mix these fields of vision (FOV) based on what lit cells are in Line of Sight (LOS); SquidLib provides LOS algorithms to get the actual line and can also find the total set of cells that are at all within line of sight, even if out of lighting range. The dungeons can be generated from repeatable random number generators (RNG), so if the same seed is provided to an RNG, you get the same procedurally generated content, even on different runs, machines, OSes or platforms.

> There's a lot of procedural content generation here. There's simple name-generation roughly matching the style of a list of names in WeightedLetterNamegen, and then there's the sizable and just-about unique FakeLanguageGen, which imitates the linguistic properties of real and/or fictional languages but can also generate those languages procedurally (with no list of starting material) or hybridize two or more languages it already knows. For English text, there's Thesaurus, which can choose various synonyms for specified categories of words, Messaging/ProceduralMessaging, which is useful for transforming coded statements into short, game-appropriate sentences like "You smash the goblin for 7 damage!" or "The goblin slices you for 3 damage!", and general utilities in StringKit, like word-wrapping and handling case. SquidLib can generate wild area maps using WildMap, all the way to continent or world maps with WorldMapGenerator. Handling complex map situations is made more feasible using the incredibly-powerful but oddly-named GreasedRegion class; it allows manipulating regions of a map not just as unrelated sets of points, but as areas that can be expanded, retracted, limited to only their outer surface, randomly filtered, flood-filled within the bounds of another region, and so on. GreasedRegion has a spill() method, but there's also a Spill (and MultiSpill) class, all of which handle randomized flood-fill to loosely simulate a fluid expanding through an area. There's code for continuous noise, including Classic Perlin Noise (ClassicNoise and a mode in FastNoise), Simplex Noise (SeededNoise and a mode in FastNoise), and more unusual kinds like Foam Noise (FoamNoise, PhantomNoise, and again, a mode in FastNoise); this is often used for making water animate in games, or to make grass sway slightly.

> Once you have inhabitants in your map, whatever it is, you probably want to have them act at least a little intelligently, and so there's various pathfinding classes here. DijkstraMap produces one of these beloved roguelike concepts and can support not just simply getting next to the player from far away, but also pathfinding toward a target while keeping a minimum distance, fleeing away from a target, pathfinding to the closest of several potential targets, reusing certain parts of pathfinding to make later paths nearly instantaneous to find, etc. The squidpony.squidai.graph package draws on the very fast code from simple-graphs to handle A-Star pathfinding to one target, and various other common graph algorithms like topological sorting.

> Displaying the map and all the contents of the world you carefully craft really is something that's different in every game. You can use squidlib-util on its own and render your game with libGDX, Arc, some other choice for graphics, or you can use the text-based display code in the squidlib module. This could be just for prototyping, or for your final game, it is up to you. This text-based display is usually used via SparseLayers, which can render a grid of text layered over other text and that layered over a background, any of which can be partially transparent. It can also render chars out of grid alignment for movement between grid cells, or bump/wiggle effects. Fonts are usually in the TextCellFactory class, which is misleadingly named because it doesn't actually handle cells, nor is it a factory... But it does handle the nice and smooth "stretchable" SDF fonts, and the newer "crisp" MSDF fonts, which are provided in various pre-made forms in DefaultResources. There's a ton of pre-defined colors in SColor along with ways to manipulate them. You can make use of SColor with Radiance, which handles those FOV-based lights mentioned above, and can also make the lights flicker and/or strobe. You can also filter colors before they are drawn using Filters or FloatFilters, which store various handy predefined effects that you can add to.
