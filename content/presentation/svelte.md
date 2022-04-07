title=Svelte
tags=presentation, browser
summary=A framework for building websites.
~~~~~~

[Tutorial](https://svelte.dev/tutorial) | [Docs/API](https://svelte.dev/docs) | [Discord](https://discordapp.com/channels/457912077277855764/473466028106579978)

### Getting Started

NodeJS-based tool chain. Svelte starts from either a .zip of the `sveltejs/template` project or by using `npx degit sveltejs/template <project-directory>`. From there it's a `cd` and `npm install`. Once updated, `npm run dev` puts a local web server on http://localhost:5000 for dev examination.

Project directory layout:

`/` - contains Rollup configuration, npm details, READMe, and so on. Probably nothing to do here.
`/public` - looks like this has the browser-accessible assets, including `index.html`.
`/src` - looks like this has the component files (`App.svelte`) as well as a global tie-together (`main.js`) that instantiates the top-level component. Betting that `main` gets referenced directly or indirectly from `index.html` at some point--nope, looks like it gets bundled into a build directory and that's what's referenced from the index.


### Tutorial

Component-centric; HTML/CSS/JS all go into a `.svelte` file for use.

### Reading

* [Svelte Tutorial](https://svelte.dev/tutorial/basics) - Svelte.dev
* [The Svelte Handbook](https://flaviocopes.com/page/svelte-handbook/) - Flavio Copes (PDF, EPUB, Kindle) *(email address requested)*

### Sapper

"Sapper is a framework for building extremely high-performance web apps. You're looking at one right now! There are two basic concepts:
* Each page of your app is a  component
* You create pages by adding files to the src/routes directory of your project. These will be server-rendered so that a user's first visit to your app is as fast as possible, then a client-side app takes over

Building an app with all the modern best practices — code-splitting, offline support, server-rendered views with client-side hydration — is fiendishly complicated. Sapper does all the boring stuff for you so that you can get on with the creative part.

You don't need to know Svelte to understand the rest of this guide, but it will help. In short, it's a UI framework that compiles your components to highly optimized vanilla JavaScript.

[Docs](https://sapper.svelte.dev/docs/)


