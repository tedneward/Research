title=VanillaJS (aka No Web Framework)
tags=presentation, browser
summary=Articles and links about using no Web framework at all.
~~~~~~

[VanillaJS Toolkit](https://vanillajstoolkit.com/) (ignore the homepage, look at the menu at the top) | [VanillaJS Components](https://github.com/vanillawc/)

["A Framework Author's Case Against Frameworks"](https://youtu.be/VvOsegaN9Wk): Adrian Holovaty, dotJS 2017

["Design: #noFramework"](https://javarome.medium.com/design-noframework-bbc00a02d9b3):
    *Article speaks principally to Web frameworks, but I'd argue that this can be true of any framework (thinking Java server-side Web frameworks, C++ GUI frameworks, server-side transaction processing frameworks, ...).*

    *Article brings to mind Vlissides' pattern of [evolving frameworks](/reading/patterns/evolving-frameworks)*

    *Also brings to mind the Windows++ story: build your own to understand what's going on underneath--not quite the same point as this author, but certainly a viable line of thought/approach.*

    * Drawbacks of frameworks:

        * The Framework Tax: frameworks require you to:

            * **comply** with their API so that they can provide your their services. This is just the way a framework works: your code will have to adhere to some rules, including more or less boilerplate code. So it’s the framework way, or the highway. Your daily challenges will be less about “how to do this” than “how to make the framework (not) do this”. Dodge those constraints at your own risks: if you bypass a framework by directly calling low-level APIs, don’t expect it to understand what you’re trying to do, don’t expect it to stay consistent. So it’s a false promise frameworks make that you’ll be “focusing on your business”: in reality you have to care on the framework too, and a lot.

            * upgrades are effectively forced if you:
                1) want a new feature (even if you didn’t wanted all those of the next release, you need to upgrade the whole thing) or
                2) want a bugfix, or
                3) want to avoid loosing support (as new versions are shipped, the one on which you have based your app will get deprecated).
                Upgrades can also be lacking and let you frustrated (and possibly with a project at risk) with an identified bug but no planned date for a fix. Third-party framework-specific libraries (such as widgets) or plugins are no exception to that rule and will be less and less compatible with your app if you keep using old versions. Maintaining backward compatibility has became such a hassle for frameworks maintainers that they now find more profitable to work on tools that automate upgrades of your code as much as possible (Angular’s ng-update, React native Upgrade helper, Facebook’s jscodeshift, etc.).
            
            * **train** to learn how they work (what they can/cannot do, what are their concepts, APIs, ecosystem, tools), including changes that may occur in new versions. Should you pick the most popular framework of the day, this might be easier, but it’s unlikely that you’ll ever know about every aspects of a given framework. Also, hype comes and goes: should you decide to use another framework for a new app (or even worse, to migrate from one to another), the cost of investing in such proprietary knowledge will be lost. This explains a lot of inertia in enterprise projects, even if each project is different than the previous one. “Compatibility means deliberately repeating other people’s mistakes,” said the late David Wheeler.

            * **compromise** with the drawbacks implied by delegating control: you may not be able to do whatever you want (or to prevent the framework from doing things you do not want) or you may not achieve the performance you want (because of additional layering, too-generic code, bigger code size or backward compatibility requirements).

            * **lose** skills. A number of developers either don’t know much about the lower-level APIs (because they always used the framework layer instead) or live in the past (i.e. are stick on an outdated knowledge of it, not being aware of the latest improvements and new capabilities). The [law of the instrument](https://en.wikipedia.org/wiki/Law_of_the_instrument) then leads too often to build overkill solutions to simple problems, and loose (if even once acquired) knowledge to build simpler ones. Being guided by blueprints and recipes, they loose (or not gain) a culture of good software design (principles, patterns) and barely build a significant engineering experience. Just like users of CSS frameworks (Bootstrap, Tailwind, etc.) lack CSS skills, users of web frameworks are doomed to lack experience in both modern web APIs and software design in general.

        * The Framework Silo: Aside the “tax” that you have to pay to get their benefits, frameworks can also induce an additional major issue when they are not standard. As they enforce rules — but each one of them is different — this implies binding your app with a proprietary ecosystem. That means locking your app code with a proprietary API (and its upgrade process). That’s a risky bet for your project.

        * Are languages (CoffeeScript, TypeScript, Dart, etc) subject to the same problems as frameworks? Yup.

    * Frameworks are a good thing if they:

        * are app-specific: any app ends up designing its own “business” framework.
        * are standard or end up with a standard. For instance the web platform is a standard web framework, and Web Components frameworks (lit, stencil, skatejs, etc.) end up building components that comply with the standard.
        * add some unique value that you’re missing in all other alternatives (including other frameworks). In such a case you have almost no choice, as the unique added value justifies the implied cost of locking with it. For instance, an OS-specific framework makes sense since it enforce OS standards and there is no other other way to provide an app or extension for it.
        * are used to build non-critical apps (short lived, with lower quality expectations) where tax and silo effect are acceptable. For instance it makes sense to use Bootstrap to build some prototype, MVP or internal tool.

        So, in a nutshell, avoiding a framework to build an app aims to:

        * maximize flexibility by avoiding “one size fits all” constraints from frameworks. Also, not having blueprints avoids the law of the instrument to increase the creativity for ambitious applications. Most web apps using Bootstrap can be recognized as such, because they’re having a hard time getting out of the predefined components and styles. In the end, they’ll have a hard time thinking another way.
        * minimize dependency to any of the currently hyped frameworks. Not being locked with a framework avoids issues with portability and interoperability.
        * maximize performance by allowing the most fine-grained operations only when required (no framework-dependent refresh cycle for instance) and reducing dependencies to a selection of precise, required-only, set of lightweight libraries.

    * Building an app without a framework: 
    
        * Goals and mindset: We must clarify the anti-goal: “building an app without a framework” is NOT to be confused with “replacing the framework”. This is not the challenge at stake: a framework is a general purpose technical solution to host virtually any app, so it is less about your app than all apps. On the opposite, going vanilla is an opportunity to focus on your app’s needs only.

            This is an important scope narrowing to make to assess the (non-)difficulty of building your app without a framework: it is not as hard as building a framework, because you do NOT aim to build:

            * a proprietary component model (a container implementing a specific components lifecycle)
            * a proprietary plugins/extension system :
            * a fancy template syntax (JSX, Angular HTML, etc.)
            * optimizations that make sense for general-purpose (change detection, virtual DOM)
            * framework-specific tools (debugging extensions, UI builders, version migration tools)
            
            So building a vanilla app is not an enormous task of “reinventing the wheel” as often caricatured, because the major part of this “wheel” is actually about the APIs/contracts, their implementations, the general-purpose engine and associated optimizations, the debugging capabilities, etc.. Leaving the general-purpose goal and focusing on your app’s goals means that you can rid of most of it. Ironically, this is the real “focus on your app” approach.

            **change your state of mind**: don’t look for the framework-specific services mentioned above. As a vanilla app, you will probably don’t need it. Don’t think change detection, just update the DOM, etc.

            **use technical alternatives** for the common tasks you performed with frameworks (updating the DOM — including reactively — , loading lazily, etc.)

        * Standards: standards APIs are among the “good frameworks” as they:
            * allow portability: they are expected to be available everywhere. When not yet available, they can be polyfilled.
            * allow interoperability: they can interact with other standards and be used by proprietary code.
            * are long lived: as devised by multiple industry actors rather than only one, they are well designed and here to stay once released. So investing in them is less risky.
            * are immediately available in the browser most of the time, which avoids downloading them. In some case you may have to download polyfills instead but, contrary to proprietary frameworks (which are doomed to be less and less trendy), their fate is to be more and more available (thus reducing download probability).

        * What about the use of libraries? As for the “rewrite a framework” false assumption, it is often considered that vanilla JS apps are NOT supposed to use libraries. This is utterly false. Once again, “reinventing the wheel”, i.e. rewriting everything from scratch cannot be a sensible goal. The vanilla goal of removing constraints implied by frameworks and not libraries, must not be confused with a “write everything by yourself” dogma.

            *(This raises an interesting question not answered by the author: What is the difference between a framework and a library?)*

            *(THis is a fascinating throwaway line at the end of this section:)* don’t be fooled by frameworks documentation or articles that would claim that they are not a framework (because they would be “unopinionated”, or not defining a “complete application“, etc.): as soon as they imply a contract, they are. *(Can libraries be opinionated?)* *(NOTE: author also has another post about the [differences between libraries and frameworks](https://javarome.medium.com/framework-or-library-6711f998d978) in which he summarizes the two as "frameworks provide you application blueprints with built-in services but enforces predefined contracts to call your code and thus imply a strong dependency; libraries won’t help you design your application, but can be called only when you need them. You can devise a design that limits dependency to them.")*

        * Patterns. Just use of patterns is not enough, but it helps allow people coming to your app consume it more quickly (lighter cognitive burden).

        * Concerns:

            * Updating: When interviewing developers about what would be their primary concerns when trying to build a vanilla application, most of them reply that it would be complicated to implement model change detection and subsequent updates in the relevant “views” of the app. This is a typical law of the instrument effect, which makes you think in a framework way, whereas not being a framework actually implies much more simple needs:

                * The “views” are just DOM elements. You can abstract them of course (and you should) but in the end they are just that.
                * Updating them is just a matter of viewElement.replaceChild(newContent). That’s it. No unnecessary update of a larger DOM scope, no unwanted redraw or scrolling. There are several ways to update the DOM, from inserting text to manipulating real DOM objects. Just pick the one that fits your need.
                * “Detecting” when updating is required is usually not necessary in a vanilla app, since most often you just know what is to be updated following an event as you can just do it imperatively. You grab your DOM target and update it, period. In some cases of course you might want to do a more generic update by reversing the dependency and notifying observers (see below) that will update themselves.

            * Templates: Another feature that developers fear to miss is the ability to write HTML snippets with dynamics parts, even listeners, etc.

                First of all the DOM API (document.createElement("button"), etc.) is not that hard, and actually more powerful than any template language since this allows you full access to the API. It can be tedious to build long HTML fragments but, hey, if they are that long, it’s probably that you need to split it in more fine grained components.
                
                It is true, however, that viewing those elements as a template improves readability. So how to have them? There are actually multiple ways:
                
                * [HTML Templates](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_templates_and_slots) are now available in browsers (since 2017 at worse). They provide the ability to build a reusable, off-screen, HTML<template> snippet. This is this actually a part of Web Components and yes, they can support transclusion through <slot>.

                * [Template literals](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals) are available in JavaScript since ES6 (2015). They allow you to easily embed values inside a string. That be enough to embed primitives (numbers, strings, including other HTML code, etc.) but not more sophisticated elements like DOM elements on which you registered listeners for instance.

                * A [tagged template literal](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals) function can help embedding complex values like DOM Nodes into such a template that would result in a Node itself. ObservableHQ has devised a pretty handy one that allows you to write things like html`<header>${stringOrNode}</header> or to do more complex templating like html`<ul>${items.map(item => `<li>${item.title}</li>}</ul> .

            What about conditionals or loops in a template? Aside the fact that this might have never been a good idea (UIs should be dumb and not contain logic), you can (and should) just do it JS, then insert the result in your template, using one of the techniques above.

            * Events: how to bind events to DOM Nodes inside them? There are also several alternatives:
                
                * HTML event handlers (<button onclick="myClickHandler(event)“>) can be inserted in any HTML source, but they not very practicable, since they require the specified handlers to be available on the specified scope.
                * Event handlers API (button.addEventListener("click", myClickHandler)) can be used on any node created through the DOM API or an HTML tagged template literal function.
            
                Now what about custom/business events? What if I need to react to some event triggered by a component of my app. There are also multiple options for that:

                * Custom events: You can create you own events classes extending EventTarget and dispatch or listen to them, just like any “standard” event.
                * EventEmitter is theoretically an option (exists in Node and as libs in the browser), but is rarely used.
                * Observer pattern: You can build your own but RxJs is the de facto-standard for doing such reactive programming: build a Subject then notify all subscribers of a new value so they can react to it.

            * Components: it is still a good idea design software items as reusable (i.e. context-independent) if they can occur multiple times in your system. Whatever the technology you use, well-grained abstractions remain useful, whether they are business or technical: it’s always a good idea to group data and rules pertaining to the same business concept into a reusable object or to build a widget that can be instantiated in multiple places in your app.

                Aside *[from]* standard widget components (which would typically be implemented as standard Web Components), any component should typically be able to *(standard component things: methods, state, events)*:
                
                * split its logic and its view (through a MVC typically). Mixing the two usually makes the code less maintainable, and less flexible (for instance, should you want to display a record in both detailed or tabular form, your RecordComponent would just need to use either a DetailRecordView or a RowRecordView).
                * read inputs to parameterize its behavior or its view.
                * trigger events to notify parties that something occurred in the component (following a user interaction typically).
                * synchronize: your component should be able to redraw if some event occurs. This can be achieved quite easily using reactive libraries such as RxJS.

                In any case, whatever the design strategy you choose, you component (or more specifically its associated “view”) must be able to provide some HTML rendering result. A string containing HTML code could be used, but an actual HTMLElement (or just Element) is usually a better choice (easier to read/update rather than parsing, allowing to bind event handlers on it) and a more performant one (no parsing required).

                Also, you might want to use external components from third-party libraries. For sure, proprietary frameworks, because of their popularity, benefit from a larger number of libraries and components developed by their community. Although most of them are actually not so different from what they would be if they’d had been implemented in pure Javascript (like this was the case at JQuery times) they do suffer from lack of interoperability, and you find yourself looking for either vanilla or Web components.

                Hopefully such libraries exist, such as the Vanilla JS Toolkit, even if less common. Regarding standards ones, WebComponents.org list 2000+ elements. There’s even vanilla web components, but the vanilla aspect is less relevant here (more about implementation lightweightness than interoperability).

            * Routing: Managing routes in a SPA today requires using the web [History API](https://developer.mozilla.org/en-US/docs/Web/API/History_API). Whereas this is [less complex that you imagine](https://krasimirtsonev.com/blog/article/A-modern-JavaScript-router-in-100-lines-history-api-pushState-hash-url), you might want to delegate this to a simple router library such as [Navigo](https://github.com/krasimir/navigo). All you have to do, then, is to replace an DOM element by another (using replaceChildren() or replaceWith()) when a route is reached.

            * Lazy loading: ES6 (2015) can load modules dynamically. This works in Node, but in browsers too: `{WelcomeModule} = await import("./welcome/ModuleImpl"); module = new WelcomeModule()` Bundlers like Webpack can insulate modules in dedicated files. Beware that you should only use constants in the import path, though: otherwise, the bundler cannot guess what you will load and will package the whole set of possible files in a single chunk. For instance `await import(`./welcome/${moduleName}`)` will bundle everything in the specified directory, given that your bundler doesn’t know what the `moduleName` variable will hold at runtime.

            * Native apps: *(as opposed to using framework derivatives like React Native)*

            * Server-side rendering (SSR): *(I find it hilarious and sad that we talk about using client-side Javascript fameworks to do server-side rendering with a straight face)*

            * 



