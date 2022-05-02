# Research
A digital garden of my notes and thoughts around all sorts of technology R-and-D

## Build
Built with [JBake](https://jbake.org/). I tried to use Gatsby, I really did. But this is just the right level of complexity (rather, simplicity) that I needed for this project. If somebody wants to take a look at what I'm doing here, and tell me what the Gatsby equivalent looks like and marvel at how wrong I steered, I totally invite a fork.

## Structure
Content is all pages, not blog posts. (I haven't removed the blog functionality entirely, but that's really not the point of the site, as will be very clear before long.) Content lives inside the content/ directory. Templates are in /templates.

Content consists of "categorypages", which are pages for the top-level categories (language, platform, storage, etc), and "pages" which have the actual notes themselves. Tags are for crossing between categories and are mostly freeform.

## TODO

* Create a Chrome Extension to "bookmark" from Chrome tabs by creating a new file in either the local filesystem or via GitHub API calls
  * Verify that the page or something like it doesn't already exist
  * Add links to an existing page

## Categories

* [Architecture](http://research.tedneward.com/architecture/index/index.html): Software architecture links/research
* [Backends](http://research.tedneward.com/backends/index/index.html): Software platforms
* [Clouds](http://research.tedneward.com/clouds/index/index.html): Software platforms on "other peoples' servers on other peoples' dirt"
* [Distributed Systems](http://research.tedneward.com/distribution/index/index.html): Distributed system research--not architecture but networking
* [Formats](http://research.tedneward.com/formats/index/index.html): File and online formats (HTML, PDF, etc)
* [GameDev](http://research.tedneward.com/gamedev/index/index.html): Specifically around the development of any sort of game (game frameworks, etc)
* [Hardware](http://research.tedneward.com/hardware/index/index.html): Collection of links about and around hardware.
* [Languages](http://research.tedneward.com/languages/index/index.html): Any and all programming languages
* [Libraries](http://research.tedneward.com/libraries/index/index.html): Collection of code; includes O-O frameworks
* [Places](http://research.tedneward.com/places/index/index.html): Websites of interest "in general"
* [Platforms](http://research.tedneward.com/platforms/index/index.html): Environments in which programs execute (includes native, VMs, mobile-native)
* [Presentation](http://research.tedneward.com/presentation/index/index.html): Front-end layers, usually of some sort of graphical format
* [Reading](http://research.tedneward.com/reading/index/index.html): Specific topics of interest and reading materials related them
* [Storage](http://research.tedneward.com/storage/index/index.html): Systems specifically designed to store data (a la "databases" but not always)
* [Tools](http://research.tedneward.com/tools/index/index.html): Bits of software that are intended to be used directly (compilers, analyzers, etc)
* [VMs](http://research.tedneward.com/vms/index/index.html): Virtual machine implementations (differing from platforms mostly due to scope--platforms include libraries, open-source packages, etc)

## Tags
An open-ended list, but here's what we have so far:

* Category tags: backend, gamedev, language, distributed system, platform, reading, storage, vm
* Backends: backend, cms
* Gamedev: gamedev
* Language: language, compiled, object, metaobject, functional, logic, probabilistic programming, reactive, state machine, static, dynamic, esoteric
* Distributed Systems: distributed system, actors
* Platforms: clr, jvm, native, linux, macos, windows, browser, mobile, ios, android, llvm, nodejs, python, ruby, javascript, wasm
* VMs: interpreter, vm
* Tools: library, parsing, disassembler
* Storage: storage, static, dynamic, cms, document, keyvalue, object, relational
* Architecture/design: agent, concurrency
* Misc: research, website, security, services, ui
