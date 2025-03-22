title=CodePortal (Language)
tags=language, natural language processing
summary=A full-stack natural-language based, and visual programming platform looking to avoid the limitations of traditional programming and tools.
~~~~~~

[Website](https://codeportal.io) | [Source](https://github.com/codeportal-org/codeportal-lang) *(No updates since early 2024?)*

## README
Here is what we envision for PortalLang and CodePortal:

* An intuitive and extensible UI for code with support for themes, and plugins ✨.
* AI-first, meaning that it includes code gen, code explain and other AI features.
* An enriched UI with widgets for visualizing and working with data and for debugging it.
* A language that resembles natural language, that's easy to read and to understand. It draws inspiration from Python 🐍.
* Support for translations! The programming language and platform can be translated to any language. This is a big deal for accessibility! 🌎 Localized keywords!!! 🤯
* A full-stack platform, not just a language. It is a complete solution for building web applications and APIs.
* A block-based code editor, not text-based. This makes it easier to work with and more intuitive (no syntax, just UI).
* Automatic import management. No need to import things, or maintain them, the system will do it for you. All of this is easier and automatic because references are by ID not by name! ✨
* Built-in code versioning and collaboration.
* Package manager and marketplace for sharing and installing code.
* Inferred incremental typing ala TypeScript. You can add types if you want, but you don't have to.
* JS/TS ecosystem interop, so you can use any or most JS/TS libraries.
* Content-addressed code ala Unison, see Unison: 💡 The big idea.
* For the server side, it uses an interpreter which allows for instant deployments and updates. No need to recompile or restart the server, inspired by Darklang.

And very interesting things:

* PortalLang has names with spaces, which is the only right way to name things! 🌶️ 😉 No more camelCase, snake_case, kebab-case, etc. Inspired by this Douglas Crockford talk. So, you can name a function, variable or anything just as you would with natural language, no need to remember weird conventions or sacrifice readability.
* PortalLang solved the tabs vs spaces debate! It uses UI space instead! 🤯 🌶️ No need to type it, and it is configurable!

This project has two main parts, the Portal Language (PortalLang), a general purpose programming language, and the CodePortal Platform.

#### The Portal Language

The goal of the Portal Language is to be independent from the CodePortal Platform and be easily embeddable into other systems and platforms. PortalLang is comprised of 4 parts:

* The Code Tree (CT) format.
* The Storage.
* The Editor.
* The Runtime.

**The Code Tree format (CT):** Ground zero is forgetting about saving code as text. Instead, we save it as what it really is, structured data. We call that the Code Tree (CT). This is the representation of the code as a tree of nodes and connections. In text-based programming, a similar concept is referred to as the AST (Abstract Syntax Tree). However, since there is no syntax here, that name doesn't fit anymore. Additionally, it's a simpler name ✨. The Code Tree is the source of truth. Code is always stored, and modified in this format. It is also the format that is used to run the code. It is JSON based but we will see how this goes as the requirements evolve. I guess we will need an additional format for the Runtime, but that's an optimization for our future selves.

**The Storage:** This is the layer in charge of querying and mutating the Code Tree. It includes various indexes, and a simple API for the Editor to interact with the Code Tree. For now, it is a simple in-memory storage, that we persist as blobs but we will be evolving it as we see fit, maybe into a fully fledged DB, or maybe we will use an existing one 🤔, this is open for analysis/discussion.

**The Editor:** It allows you to explore, understand and modify the Code Tree. This is where a lot of the magic happens 🪄. It is an extensible UI that benefits from the Code Tree graph format and the Storage to give the best DX possible. It enables for multiple representations or views of the code, like the main one which is block-based, the graph view, the canvas view, notebooks and it offers a way to extend these views even further. It also integrates with the Runtime to provide debugging features.

**The Runtime:** It is an interpreter and debugger that runs the Code Tree. In the future we would love explore compilation/partial-generation to JS (or WASM!) for certain parts but for now it is fully interpreted. It also includes the basic functionality of the language, a standard library, the UI framework, the JS interop layer, and the web server.

#### The CodePortal Platform
The Platform is our PaaS offering of the Portal Language. Its main parts are:

**The web app:** You can find it inside the apps/web folder. It has the API, web UI and handles auth, billing, DB connections, etc. It is a Next.js app hosted on Vercel.

**The worker:** It is in charge of long running tasks (background jobs) both internal and the ones that users create. It is a Node.js app. You can find it inside the apps/worker folder. It is hosted on Railway.

**The SDK:** It is a set of libraries to integrate Portal code into other systems. For instance an existing Next.js app to replace a part of it to allow for easy personalization and fast iteration. There are two libraries at the moment:

* @codeportal/sdk-core: Pure JS/TS library.
* @codeportal/sdk-react: React library.

