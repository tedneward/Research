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
* Architecture: Software architecture links/research
* Backends: Software platforms
* Clouds: Software "other peoples' hardware on other peoples' dirt" platforms
* Distributed Systems: Distributed system research--not architecture but networking
* Formats: File and online formats (HTML, PDF, etc)
* GameDev: Specifically around the development of any sort of game (game frameworks, etc)
* Languages: Any and all programming languages
* Libraries: Collection of code; includes O-O frameworks
* Places: Websites of interest "in general"
* Platforms: Environments in which programs execute (includes native, VMs, mobile-native)
* Presentation: Front-end layers, usually of some sort of graphical format
* Reading: Specific topics of interest and reading materials related them
* Storage: Systems specifically designed to store data (a la "databases" but not always)
* Tools: Bits of software that are intended to be used directly (compilers, analyzers, etc)
* VMs: Virtual machine implementations (differing from platforms mostly due to scope--platforms include libraries, open-source packages, etc)

## Tags
An open-ended list, but here's what we have so far:

* Category tags: backend, gamedev, language, distributed system, platform, reading, storage, vm
* Backends: backend, cms
* Gamedev: gamedev
* Language: language, compiled, object, metaobject, functional, logic, probabilistic programming, reactive, state machine, static, dynamic, esoteric
* Distributed Systems: distributed system, actors
* Platforms: clr, jvm, native, linux, macos, windows, browser, mobile, ios, android, llvm, nodejs, python, ruby, javascript, wasm
* VMs: interpreter, vm
* Tools: library, parsing
* Storage: storage, static, dynamic, cms, document, keyvalue, object, relational
* Architecture/design: agent, concurrency
* Misc: research, website, security, services, ui

