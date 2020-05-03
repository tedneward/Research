# Research
A digital garden of my notes and thoughts around all sorts of technology R-and-D

## Build
Built with [JBake](https://jbake.org/). I tried to use Gatsby, I really did. But this is just the right level of complexity (rather, simplicity) that I needed for this project. If somebody wants to take a look at what I'm doing here, and tell me what the Gatsby equivalent looks like and marvel at how wrong I steered, I totally invite a fork.

## Structure
Content is all pages, not blog posts. (I haven't removed the blog functionality entirely, but that's really not the point of the site, as will be very clear before long.) Content lives inside the content/ directory. Templates are in /templates.

Content consists of "categorypages", which are pages for the top-level categories (language, platform, storage, etc), and "pages" which have the actual notes themselves. Tags are for crossing between categories and are mostly freeform.

## Categories
* Languages: Any and all programming languages
* Platforms: Environments in which programs execute (includes native, VMs, mobile-native)
* Storage: Systems specifically designed to store data (a la "databases" but not always)
* VMs: Virtual machine implementations (differing from platforms mostly due to scope)
* GameDev: Specifically around the development of any sort of game (game frameworks, etc)
* DistribSys: Distributed system research--not architecture but networking
* Architecture: Software architecture links/research

