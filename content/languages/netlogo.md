title=NetLogo
tags=language, jvm, agent
summary=A programming language and IDE for agent-based modeling as a dialect of Logo and emphasizing the decentralized, interconnected nature of the phenomena you can model.
~~~~~~

[Website](http://ccl.northwestern.edu/netlogo/) | [Github](https://github.com/NetLogo/NetLogo) | [Wikipedia](https://en.wikipedia.org/wiki/NetLogo)

NetLogo is a very, very different creature from other programming languages (as might be expected from a language that derives from a language driving turtles). It incorporates the GUI development environment as a first-class citizen of the programming experience, apparently, which makes sense if its principal goal is to drive simulations and such.

From the website:

The NetLogo world is made up of agents. Agents are beings that can follow instructions.

In NetLogo, there are four types of agents: turtles, patches, links, and the observer.

Turtles are agents that move around in the world. The world is two dimensional and is divided up into a grid of patches. Each patch is a square piece of “ground” over which turtles can move. Links are agents that connect two turtles. The observer doesn’t have a location – you can imagine it as looking out over the world of turtles and patches.

The observer doesn’t observe passively – it gives instructions to the other agents.

When NetLogo starts up, there are no turtles. The observer can make new turtles. Patches can make new turtles too. (Patches can’t move, but otherwise they’re just as “alive” as turtles.)

Patches have coordinates. The patch at coordinates (0, 0) is called the origin and the coordinates of the other patches are the horizontal and vertical distances from this one. We call the patch’s coordinates pxcor and pycor. Just like in the standard mathematical coordinate plane, pxcor increases as you move to the right and pycor increases as you move up.

The total number of patches is determined by the settings min-pxcor, max-pxcor, min-pycor and max-pycor. When NetLogo starts up, min-pxcor, max-pxcor, min-pycor and max-pycor are -16, 16, -16, and 16 respectively. This means that pxcor and pycor both range from -16 to 16, so there are 33 times 33, or 1089 patches total. (You can change the number of patches with the Settings button.)

Turtles have coordinates too: xcor and ycor. A patch’s coordinates are always integers, but a turtle’s coordinates can have decimals. This means that a turtle can be positioned at any point within its patch; it doesn’t have to be in the center of the patch.

Links do not have coordinates. Every link has two ends, and each end is a turtle. If either turtle dies, the link dies too. A link is represented visually as a line connecting the two turtles.

