title=Baklavajs
tags=library, presentation, visual, ecmascript, browser
summary=Graph / node editor in the browser using VueJS.
~~~~~~

[Website](https://baklava.tech/) | [Source](https://github.com/newcat/baklavajs)

BaklavaJS is a graph/node editor for the web. It provides an easy-to-use editor together with the ability to create custom nodes. Aditionally, it puts a strong emphasis on extensibility, which leads to a versatile plugin system. To guarantee type safety, the entirety of the BaklavaJS ecosystem is written in TypeScript.

The core functionality is shipped in the `@baklavajs/core` package. Any other functionality can be added a-la-carte by installing the desired plugins:

* Engine: Provides functions to run calculations with the graph.
* Interface Types: Adds types to node interfaces and allowing connections only between types that you want to. It can also automatically convert values from one type to another.
* Vue Renderer: Displays the editor in the browser using VueJS
* Themes: A collection of pre-built themes for BaklavaJS

There is also the `baklavajs` package, which contains the core package as well as all plugins.

