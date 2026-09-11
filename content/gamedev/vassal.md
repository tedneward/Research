title=Vassal
tags=gamedev, jvm, browser
summary=A game engine for building and playing online adaptations of board games and card games, used to play in real time over the Internet or by email.
~~~~~~

[Website](https://vassalengine.org/) | [Source](https://github.com/vassalengine)

[Vassal TypeScript interpreter](https://github.com/TyroneSlothrop/vassal-ts-emulator): A **browser-native player for [VASSAL](https://vassalengine.org/) modules**, including iOS Safari. It is **not** a port of the Java desktop app — it is a TypeScript **interpreter of the `.vmod` module format**: it reads a module's `buildFile.xml`, decodes each piece's trait chain, and reimplements the trait behaviors on an HTML canvas. No Java and no server are required to play; the built site is fully static. It is developed against locally-bundled reference modules that span the format's range — an extension-heavy module (piece-roster extensions, prototypes, cards), a complex module (custom Java classes, hex grids, lazily-loaded board archives, DR/dr dice), and a legacy 3.1-era module — but **the code knows formats, not games**: no module names or content appear in the repo.

