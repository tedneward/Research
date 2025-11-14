title=ECMAScript (aka Javascript)
tags=language, browser, nodejs, dynamic, object, metaobject
summary=A dynamic, object-oriented script language.
~~~~~~

[Official website](http://www.ecmascript.org/) [ECMA-262 Specification](http://www.ecma-international.org/ecma-262/) | [Github](https://github.com/tc39/ecma262) [Active proposals](https://github.com/tc39/proposals) [Finished proposals](https://github.com/tc39/proposals/blob/master/finished-proposals.md)

Official standard name of the language originally appearing in browsers. "Javascript" is the implementation of the language that appeared in the Netscape Navigator browser.

## Implementations

* Native: [WebKit JavaScriptCore](https://github.com/WebKit/WebKit/tree/main/Source/JavaScriptCore): the JavaScript engine that comes as part of the larger open-source [WebKit](https://github.com/WebKit/) browser core.
* C/C++: [Duktape](https://github.com/svaarala/duktape): embeddable JS engine capable of being run in the browser via WebAssembly
* C/C++: [mjs](https://github.com/cesanta/mjs) Embedded JavaScript for C/C++, designed for microcontrollers with limited resources. Implements a strict subset of ES6.
* C/C++: [QuickJS](https://bellard.org/quickjs/): a small and embeddable Javascript engine. It supports the ES2020 specification including modules, asynchronous generators, proxies and BigInt.
* WASM: [quickjs-emscripten](https://github.com/justjake/quickjs-emscripten) - Safely execute untrusted Javascript in your JS/TS, and execute synchronous code that uses async functions.
* C/C++: [V8](/vms/v8): The engine below NodeJS from Google.
* CLR: [jint](/languages/ecmascript/jint) - an embeddable Javascript interpreter for .NET which can run on any modern .NET platform as it supports .NET Standard 2.0 and .NET 4.6.2 targets (and later).
* CLR: [Yantra](https://yantrajs.com/index.html) ([Source](https://github.com/yantrajs/yantra)): Compiles JavaScript to .Net Assembly; Strict Mode Only JavaScript; Subclassable built-ins; Module support; Optional property chain `identifier?.[]`, `identifier?.(`, `identifier?.identifier`; Many ES5 + ES6 features; CommonJS Module Support; Easily marshal CLR Object to JavaScript and other way around; CSX Module support; Mixed module system, YantraJS supports `require` and `import`.
* CLR: [Jurassic](https://github.com/paulbartrum/jurassic): Jurassic is an implementation of the ECMAScript language and runtime. It aims to provide the best performing and most standards-compliant implementation of JavaScript for .NET. Jurassic is not intended for end-users; instead it is intended to be integrated into .NET programs. If you are the author of a .NET program, you can use Jurassic to compile and execute JavaScript code.
* CLR: [IronJS](/languages/ecmascript/ironjs)
* Go: [Elsa](https://github.com/elsaland/elsa) | [HN](https://news.ycombinator.com/item?id=24626655): Fast/secure QuickJS wrapper in Go
* JVM: Nashorn: [Nashorn Blog](https://blogs.oracle.com/nashorn/) is at Oracle but Nashorn appears to have moved to JetBrains ownership/development [here](https://github.com/JetBrains/jdk8u_nashorn)
* JVM: [Rhino](https://github.com/mozilla/rhino) (includes [E4X](../e4x) support)
* JVM: [Graal.js](https://github.com/graalvm/graaljs) part of [GraalVM](/vms/graalvm.html)
* JVM: [RingoJS](https://ringojs.org/) ([Source](https://github.com/ringo/ringojs/))
* JVM: Kotlin: [Reeva](https://github.com/ReevaJS/reeva)
* Rust: [Deno](https://github.com/denoland/deno)
* Rust: [Boa](https://github.com/boa-dev/boa)
* Zig: [Bun](https://bun.sh/) ([Source](https://github.com/oven-sh/bun)): a fast all-in-one JavaScript runtime
* [Javy](https://github.com/bytecodealliance/javy) - a JavaScript to WebAssembly toolchain, capable of generating WASI-compatible modules from JS by embedding the QuickJS engine.
* [SpiderMonkey](https://github.com/bytecodealliance/spidermonkey-wasm-rs) - experimental Rust bindings and generic builtins for SpiderMonkey for building WASI-compatible modules from JavaScript.
* [wasmedge-quickjs](https://github.com/second-state/wasmedge-quickjs) - A high-performance, secure, extensible, and OCI-complaint JavaScript runtime for WasmEdge.  Features TCP/UDP support via WasmEdge Sockets.
* [Boa](https://github.com/boa-dev/boa) - an embeddable and experimental Javascript engine written in Rust. You can try it out [here](https://boajs.dev/boa/playground/).
* [goja](https://github.com/dop251/goja) - an implementation of ECMAScript 5.1 in pure Go with emphasis on standard compliance and performance.
* [otto](https://github.com/robertkrimen/otto) - a JavaScript parser and interpreter written natively in Go.
* [hermes](https://github.com/facebook/hermes) - Hermes is a JavaScript engine optimized for fast start-up of React Native apps. It features ahead-of-time static optimization and compact bytecode. [Emscripten](https://github.com/facebook/hermes/blob/main/doc/Emscripten.md) and [WASI](https://github.com/guest271314/hermes/blob/shermes-wasm/doc/WASI.md) support.
* [Porffor](https://github.com/CanadaHonk/porffor) - a from-scratch experimental AOT optimizing JS/TS -> Wasm/C engine/compiler/runtime. You can try it out [here](https://porffor.dev/).
* [sebastianwessel-quickjs](https://github.com/sebastianwessel/quickjs) - a typescript package to execute JavaScript and TypeScript code in a webassembly quickjs sandbox. You can try it out [here](https://sebastianwessel.github.io/quickjs/playground.html).

## Implementation-related

* [zipline](https://github.com/cashapp/zipline): This library streamlines using Kotlin/JS libraries from Kotlin/JVM and Kotlin/Native programs. It makes it fetching code as easy as fetching data:

	* For continuous deployment within mobile apps, just like we do for servers and web apps. It'd be simpler to do continuous deploys via the app stores! But that process is too slow and we can't guarantee that user’s devices will update immediately.
	* For user-customizable behavior and plugin systems
	* For updating business rules, like pricing or payments
	* For fresh content like games
	
	Zipline works by embedding the QuickJS JavaScript engine in your Kotlin/JVM or Kotlin/Native program. It's a small and fast JavaScript engine that's well-suited to embedding in applications.

## Module systems

* [Asynchronous Module Definition API (AMD)](https://github.com/amdjs/amdjs-api/blob/master/AMD.md)

    * [r.js](https://github.com/requirejs/r.js): A command line tool for running JavaScript scripts that use the Asynchronous Module Definition API (AMD) for declaring and using JavaScript modules and regular JavaScript script files. It is part of the RequireJS project, and works with the RequireJS implementation of AMD.

### Transpilers
[List of languages that compile to JS](https://github.com/jashkenas/coffeescript/wiki/List-of-languages-that-compile-to-JS)

* [Babel](/languages/ecmascript/babel): Babel is a JS-to-JS transpiler to support new features on older implementations.
* [Coco](/languages/ecmascript/coco): Last commit 2014
* [CoffeeScript](/languages/ecmascript/coffeescript)
* [Lightscript](/languages/ecmascript/lightscript)
* [Livescript](/languages/ecmascript/livescript): Last commit 2018
* [PureScript](/languages/ecmascript/purescript)
* [Rescript](/languages/ecmascript/rescript)
* [SweetJS](/languages/ecmascript/sweetjs): Syntactic sugar (semantic macros) on top of JS
* [TypeScript](/languages/ecmascript/typescript)

### FFI bindings
To any JS engine (not direct FFI)

* nbind: a set of headers that make your C++11 library accessible from JavaScript.
	- https://github.com/charto/nbind
	- https://github.com/charto/nbind#readme


### Tierless

* [Fun](../fun): A programming language for realtime webapps - compiles to client-side and server-side JS.
* [Ur](../../ur): In the tradition of ML and Haskell.
* [mobl](../../mobl): The new language for programming the mobile web.
* [E](../../e): Compiles E to JS. E is a secure distributed persistent pure object language.
* [Sugar](../sugar): New programming language designed to replace JavaScript for client-side (and server-side) web development
* [Opa](../../opa): Write your complete application in just one language, and the compiler will transform it into a self-sufficient executable
* [STIP.js](../../stip): Slicing Tierless Programs in JavaScript

### Other JS-related implementations

* [OMetaJS](https://www.npmjs.com/package/ometajs) ([Source](https://github.com/veged/ometa-js)): a JavaScript implementation of [OMeta](/languages/ometa), an object-oriented language for pattern matching; see the [dissertation](https://web.cs.ucla.edu/~todd/theses/warth_dissertation.pdf); see also [OMeta](../../ometa)

### Other JS-related language-related libraries

* [neverthrow](https://github.com/supermacro/neverthrow): Type-Safe Errors for JS & TypeScript

## Reading

* [`SingleEscapeCharacter`](https://262.ecma-international.org/13.0/#prod-SingleEscapeCharacter)
* [Airbnb JavaScript Style Guide](https://airbnb.io/javascript/) - Airbnb (HTML)
* [Automatic semicolon insertions in JavaScript](https://articles.wesionary.team/automatic-semicolon-insertions-in-javascript-best-practices-c49ed8222e12)
* [Basic JavaScript for the impatient programmer](http://www.2ality.com/2013/06/basic-javascript.html) - Dr. Axel Rauschmayer (HTML)
* [Book of Modern Frontend Tooling](https://github.com/tooling/book-of-modern-frontend-tooling) - Various (HTML)
* [Building Front-End Web Apps with Plain JavaScript](https://web-engineering.info/JsFrontendApp-Book) - Gerd Wagner (HTML,PDF)
* [Clean Code JavaScript](https://github.com/ryanmcdermott/clean-code-javascript) - Ryan McDermott (HTML)
* [Code as Data](../code-as-data)
* [Create Your Own JavaScript Runtime](https://www.youtube.com/watch?v=ynNDmp7hBdo&ab_channel=ErickWendel)
* [Crockford's JavaScript](http://www.crockford.com/javascript/) - Douglas Crockford (HTML)
* [Deep JavaScript: Theory and techniques](https://exploringjs.com/deep-js) - Dr. Axel Rauschmayer (HTML)
* [Designing Scalable JavaScript Applications](https://www.manning.com/books/designing-scalable-javascript-applications) - Emmit Scott (PDF+livebook)
* [Dev Docs](https://devdocs.io/javascript/) - Various (HTML)
* [Ectype - bringing type safety (and more!) to vanilla JavaScript](https://www.youtube.com/watch?v=vyjHRlQrVSA&ab_channel=StrangeLoopConference)
* [Eloquent JavaScript 3rd edition](http://eloquentjavascript.net) - Marijn Haverbeke (HTML, PDF, EPUB, MOBI)
* [Empty Statement](https://tc39.es/ecma262/multipage/ecmascript-language-statements-and-declarations.html#sec-empty-statement)
* [Exploring ES6](http://exploringjs.com/es6/) - Dr. Axel Rauschmayer (HTML)
* [From Research Prototypes to Continuous Integration: Guiding the Design and Implementation of JavaScript](https://blog.sigplan.org/2023/01/12/from-research-prototypes-to-continuous-integration-guiding-the-design-and-implementation-of-javascript)
* [Google JavaScript Style Guide](https://google.github.io/styleguide/javascriptguide.xml) - Aaron Whyte, Bob Jervis, Dan Pupius, Erik Arvidsson, Fritz Schneider, & Robby Walker (HTML)
* [Human JavaScript](http://read.humanjavascript.com/ch01-introduction.html) - Henrik Joreteg (HTML)
* [Implementing one feature set in two JavaScript engines](https://www.youtube.com/watch?v=V1Q9iqxhfgU&ab_channel=WebEnginesHackfest)
* [JavaScript Allongé](https://leanpub.com/javascript-allonge/read) - Reginald Braithwaite (HTML)
* [JavaScript and C++ in Node.js core](https://www.youtube.com/watch?v=GrgMT5zMgF4&ab_channel=NearForm)
* [JavaScript Bible](http://media.wiley.com/product_ancillary/28/07645334/DOWNLOAD/all.pdf) - Danny Goodman (PDF)
* [JavaScript Challenges Book](https://tcorral.github.io/javascript-challenges-book/) - Tomás Corral Casas (HTML)
* [JavaScript Closures](http://jibbering.com/faq/notes/closures)
* [JavaScript Enlightenment](http://www.javascriptenlightenment.com) - Cody Lindley (HTML)
* [JavaScript ES6 and beyond](https://github.com/AlbertoMontalesi/JavaScript-es6-and-beyond-ebook) - Alberto Montalesi (PDF, epub)
* [JavaScript For Cats](http://jsforcats.com) - Maxwell Ogden (HTML)
* [JavaScript for Impatient Programmers (ES2020 edition)](https://exploringjs.com/impatient-js/toc.html) - Dr. Axel Rauschmayer (HTML)
* [JavaScript from ES5 to ESNext](https://flaviocopes.com/page/es5-to-esnext/) - Flavio Copes (PDF, EPUB, Kindle) *(email address requested)*
* [JavaScript Fundamentals, Plus a Dash Of JQuery - for dinner ladies](http://nicholasjohnson.com/javascript-book/) - Nicholas Johnson (HTML)
* [JavaScript Garbage Collector](https://javascript.info/garbage-collection)
* [JavaScript Garden](http://bonsaiden.github.io/JavaScript-Garden/) Maintained by Tim Ruffles (HTML)
* [JavaScript Interview #35](https://gumroad.com/l/javascript-interview-35) - Coderslang Master (PDF, email address *requested*, not required)
* [JavaScript Memory management](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Memory_management)
* [JavaScript Notes for Professionals](https://goalkicker.com/JavaScriptBook/) - Compiled from StackOverflow documentation (PDF)
* [JavaScript Patterns Collection](http://shichuan.github.io/javascript-patterns/) - Shi Chuan (HTML)
* [JavaScript Promises... in Wicked Detail](https://mattgreer.dev/articles/promises-in-wicked-detail/)
* [JavaScript Spessore](https://web.archive.org/web/20160325064800/https://leanpub.com/javascript-spessore/read) - Reginald Braithwaite (HTML)
* [JavaScript Static Analysis for Evolving Language Specifications](https://plrg.korea.ac.kr/assets/data/publication/thesis22-park.pdf)
* [JavaScript Succinctly](https://www.syncfusion.com/resources/techportal/ebooks/javascript) - Cody Lindley (PDF, Kindle; email address *requested*, not required)
* [JavaScript the Right Way](https://github.com/braziljs/js-the-right-way) - William Oliveira & Allan Esquina (HTML)
* [JS Robots](https://web.archive.org/web/20201029045339/http://markdaggett.com/images/ExpertJavaScript-ch6.pdf) - Mark Daggett (PDF) *(:card_file_box: archived)*
* [Language learnings](https://github.com/imteekay/programming-language-research/tree/master/language-learning/javascript)
* [Leaflet Tips and Tricks: Interactive Maps Made Easy](https://leanpub.com/leaflet-tips-and-tricks/read) - Malcolm Maclean (HTML)
* [Learning JavaScript Design Patterns](http://addyosmani.com/resources/essentialjsdesignpatterns/book/) - Addy Osmani (HTML)
* [Let's Learn ES6](https://bubblin.io/cover/let-s-learn-es6-by-ryan-christiani#frontmatter) - Ryan Christiani (Superbook format)
* [Managing Space and Time with JavaScript - Book 1: The Basics](http://www.noelrappin.com) - Noel Rappin (dead link)
* [Marionette Exposé: Learn to write modular Javascript applications using Backbone Marionette and RequireJS/AMD](https://leanpub.com/marionetteexpose) - Jack Killilea  (HTML, PDF, EPUB, MOBI; Leanpub account or valid email requested)
* [Mozilla Developer Network's JavaScript Guide](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide) - Mozilla Developer Network contributors (HTML)
* [Neural Networks with JavaScript Succinctly](https://www.syncfusion.com/ebooks/neural-networks-with-javascript-succinctly) - James McCaffrey (PDF, EPUB, MOBI)
* [Oh My JS](https://web.archive.org/web/20150317231950/https://leanpub.com/ohmyjs/read) - Azat Mardanov (HTML)
* [Patterns For Large-Scale JavaScript Application Architecture](http://addyosmani.com/largescalejavascript/) - Addy Osmani (HTML)
* [Practical Modern JavaScript](https://github.com/mjavascript/practical-modern-javascript) - Nicolas Bevacqua (HTML)
* [Professor Frisby’s Mostly Adequate Guide to Functional Programming](https://mostly-adequate.gitbooks.io/mostly-adequate-guide/content/) - Brian Lonsdorf (HTML)
* [Relation of Garbage Collector and Closure in JavaScript](https://www.geeksforgeeks.org/relation-of-garbage-collector-and-closure-in-javascript)
* [Robust Client-Side JavaScript](https://molily.de/robust-javascript/) - Matthias Schäfer (HTML, EPUB)
* [SICP in ECMAScript](../sicpjs.pdf); see also [js-slang](https://github.com/source-academy/js-slang), implementations of the Source languages, which are small sublanguages of JavaScript designed for SICP JS
* [Single page apps in depth](http://singlepageappbook.com) - Mixu (HTML)
* [Speaking JavaScript](http://speakingjs.com/es5/) - Dr. Axel Rauschmayer
* [Static Hermes: the Next Generation of Hermes](https://www.youtube.com/watch?v=q-xKYA0EO-c&ab_channel=CallstackEngineers)
* [TC39 – From the proposal to ECMAScript - Step by Step](https://www.youtube.com/watch?v=ZheFIz4FhXo&ab_channel=FestDevConference)
* [The JavaScript Beginner's Handbook](https://flaviocopes.com/page/javascript-handbook/) - Flavio Copes (PDF, EPUB, Kindle) *(email address requested)*
* [The JavaScript Tutorial](http://javascript.info) - Ilya Kantor (HTML)
* [The JavaScript Way](https://github.com/bpesquet/thejsway) - Baptiste Pesquet
* [The Problem with Native JavaScript APIs](https://www.oreilly.com/programming/free/native-javascript-apis.csp) - Nicholas C. Zakas (PDF, email address *requested*)
* [Thinking in JavaScript](https://www.amazon.com/Thinking-JavaScript-Aravind-Shenoy-ebook/dp/B00JUI6LUQ) - Aravind Shenoy (Kindle)
* [Understanding ECMAScript 6](https://leanpub.com/understandinges6/read) - Nicholas C. Zakas (HTML)
* [Understanding JavaScript OOP](http://robotlolita.me/2011/10/09/understanding-javascript-oop.html) - Quil (HTML)
* [Understanding the DOM — Document Object Model](https://www.digitalocean.com/community/books/understanding-the-dom-document-object-model-ebook) - Tania Rascia (PDF, EPUB)
* [You Don't Know JS](https://github.com/getify/You-Dont-Know-JS) - Kyle Simpson (HTML, PDF, EPUB, MOBI)


#### Aurelia

* [Beginning Aurelia](https://leanpub.com/beginning-of-aurelia) - behzad  *(Leanpub account or valid email requested)*


#### Backbone.js

* [A pragmatic guide to Backbone.js apps](http://pragmatic-backbone.com)
* [Backbone Tutorials: Beginner, Intermediate and Advanced](https://leanpub.com/backbonetutorials) - Thomas Davis   *(Leanpub account or valid email requested)*
* [Backbonejs Tutorials](https://cdnjs.com/libraries/backbone.js/tutorials/)
* [Building Single Page Web Apps with Backbone.js](https://singlepagebook.supportbee.com) (:construction: *in process*)
* [Developing Backbone.js Applications](http://addyosmani.github.io/backbone-fundamentals/)
* [Getting Started with Backbone.js](http://net.tutsplus.com/tutorials/javascript-ajax/getting-started-with-backbone-js/)
* [How to share Backbone.js models with node.js](http://amirmalik.net/2010/11/27/how-to-share-backbonejs-models-with-nodejs)


#### Booty5.js

* [The Booty5 HTML5 Game Maker Manual](http://booty5.com/booty5-free-html-game-maker-e-book-manual/)


#### D3.js

* [D3 Tips and Tricks](https://leanpub.com/D3-Tips-and-Tricks/read) - Malcolm Maclean
* [Dashing D3.js Tutorial](https://www.dashingd3js.com/d3-tutorial)
* [Interactive Data Visualization with D3](http://alignedleft.com/tutorials/d3)


#### Dojo

* [Dojo: The Definitive Guide](https://www.oreilly.com/library/view/dojo-the-definitive/9780596516482/) - Matthew A. Russell


#### Electron

* [Electron Succinctly, Syncfusion](https://www.syncfusion.com/succinctly-free-ebooks/electron-succinctly) (PDF, Kindle) (email address requested, not required)


#### Ember.js

* [AngularJs vs EmberJs](https://angularjs-emberjs-compare.bguiz.com) - Brendan Graetz (HTML, [PDF, EPUB, Kindle](https://leanpub.com/angularjs-emberjs-compare)) (Leanpub account / email address *not required*)
* [DockYard Ember.js Style Guide](https://github.com/DockYard/styleguides/blob/master/engineering/ember.md)
* [Ember App with RailsApi](https://dockyard.com/blog/ember/2013/01/07/building-an-ember-app-with-rails-api-part-1)
* [Ember.js - Getting started](https://guides.emberjs.com/release/)
* [Vic Ramon's Ember Tutorial](http://ember.vicramon.com)
* [yoember.com](https://yoember.com)


#### Express.js

* [Express.js Guide](https://web.archive.org/web/20140621124403/https://leanpub.com/express/read) - Azat Mardanov
* [The Express.js Handbook](https://flaviocopes.com/page/express-handbook/) - Flavio Copes (HTML, PDF) *(email required for PDF)*


#### Fastify

* [Fastify - Latest Documentation](https://www.fastify.io/docs/latest) (HTML)


#### Ionic

* [Ionic 4 Succinctly](https://www.syncfusion.com/ebooks/ionic-4-succinctly) - Ed Freitas


#### jQuery

* [JavaScript Fundamentals, Plus a Dash Of JQuery - for dinner ladies](http://nicholasjohnson.com/javascript-book/)
* [jQuery Notes for Professionals](https://goalkicker.com/jQueryBook/) - Compiled from StackOverflow Documentation (PDF)
* [jQuery Novice to Ninja](http://mediatheque.cite-musique.fr/MediaComposite/Debug/Dossier-Orchestre/ressources/jQuery.Novice.to.Ninja.2nd.Edition.pdf) (PDF)
* [jQuery Succinctly, Syncfusion](https://www.syncfusion.com/resources/techportal/ebooks/jquery) (PDF, Kindle) (email address *requested*, not required)


#### Meteor

* [Your First Meteor Application, A Complete Beginner’s Guide to the Meteor JavaScript Framework](http://meteortips.com/book/)


#### Next.js

* [Mastering Next.js](https://masteringnextjs.com)
* [Next.js Crash Course 2021](https://www.youtube.com/watch?v=mTz0GXj8NN0) - Brad Traversy (Traversy Media)
* [The Next.js Handbook](https://flaviocopes.com/page/nextjs-handbook/) - Flavio Copes (HTML, PDF) *(email required for PDF)*


#### Node.js

* [An Introduction to libuv](https://nikhilm.github.io/uvbook/) - Nikhil Marathe  ([PDF](http://nikhilm.github.io/uvbook/An%20Introduction%20to%20libuv.pdf) - [ePub](http://nikhilm.github.io/uvbook/An%20Introduction%20to%20libuv.epub))
* [From Containers to Kubernetes with Node.js](https://www.digitalocean.com/community/books/from-containers-to-kubernetes-with-node-js-ebook) - Kathleen Juell (PDF, EPUB)
* [Full Stack JavaScript: Learn Backbone.js, Node.js and MongoDB](https://github.com/azat-co/fullstack-javascript) - Azat Mardan
* [How To Code in Node.js - eBook](https://www.digitalocean.com/community/books/how-to-code-in-node-js-ebook) - David Landup, Marcus Sanatan @ Stack Abuse, Digital Ocean (PDF, EPUB)
* [Introduction to Node.js](https://nodejs.dev/learn) (HTML)
* [Mastering Node](https://github.com/visionmedia/masteringnode) - visionmedia ([PDF](https://github.com/visionmedia/masteringnode/blob/master/book.pdf))
* [Mixu's Node Book](http://book.mixu.net/node/)
* [Module Patterns](https://leanpub.com/modulepatterns) - Pedro Teixeira (HTML, PDF, EPUB, Kindle) *(Leanpub account or valid email requested)*
* [Node Documentation](https://nodejs.org/en/docs/)
* [Node: Up and Running](https://www.oreilly.com/library/view/node-up-and/9781449332235/) - Tom Hughes-Croucher
* [Node.js Notes for Professionals](http://goalkicker.com/NodeJSBook) - Compiled from StackOverflow Documentation (PDF)
* [Node.js Succinctly, Syncfusion](https://www.syncfusion.com/resources/techportal/ebooks/nodejs) (PDF, Kindle) (email address *requested*, not required)
* [Practical Node.js: Building Real-World Scalable Web Apps](https://github.com/azat-co/practicalnode) - Azat Mardan
* [The Node Beginner Book](http://nodebeginner.org)
* [The Node.js Handbook](https://flaviocopes.com/page/node-handbook/) - Flavio Copes (HTML, PDF) *(email required for PDF)*


#### Om

* [Om Tutorial](http://awkay.github.io/om-tutorial/)


## History
From the Specification home page, a history:
> ECMAScript is based on several originating technologies, the most well-known being JavaScript (Netscape) and JScript (Microsoft). The language was invented by Brendan Eich at Netscape and first appeared in that company's Navigator 2.0 browser. It has appeared in all subsequent browsers from Netscape and in all browsers from Microsoft starting with Internet Explorer 3.0.

### ECMAScript 1
> The development of the ECMAScript Language Specification started in November 1996. The first edition of this Ecma Standard was adopted by the Ecma General Assembly of June 1997.

### ECMAScript 2
> That Ecma Standard was submitted to ISO/IEC JTC 1 for adoption under the fast-track procedure, and approved as international standard ISO/IEC 16262, in April 1998. The Ecma General Assembly of June 1998 approved the second edition of ECMA-262 to keep it fully aligned with ISO/IEC 16262. Changes between the first and the second edition are editorial in nature.

### ECMAScript 3
> The third edition of the Standard introduced powerful regular expressions, better string handling, new control statements, try/catch exception handling, tighter definition of errors, formatting for numeric output and minor changes in anticipation of future language growth. The third edition of the ECMAScript standard was adopted by the Ecma General Assembly of December 1999 and published as ISO/IEC 16262:2002 in June 2002.

### ECMAScript 4
*also known as "The Version of ECMAScript We Don't Talk About"*
> After publication of the third edition, ECMAScript achieved massive adoption in conjunction with the World Wide Web where it has become the programming language that is supported by essentially all web browsers. Significant work was done to develop a fourth edition of ECMAScript. However, that work was not completed and not published as the fourth edition of ECMAScript but some of it was incorporated into the development of the sixth edition.

### ECMAScript 5
*also known as "Harmony" (as in, "Let's do something small to bring all the vendors back into harmony")*

> The fifth edition of ECMAScript (published as ECMA-262 5th edition) codified de facto interpretations of the language specification that have become common among browser implementations and added support for new features that had emerged since the publication of the third edition. Such features include accessor properties, reflective creation and inspection of objects, program control of property attributes, additional array manipulation functions, support for the JSON object encoding format, and a strict mode that provides enhanced error checking and program security. The fifth edition was adopted by the Ecma General Assembly of December 2009.

### ECMAScript 5.1
*the last version of "traditional" ECMAScript*
> The fifth edition was submitted to ISO/IEC JTC 1 for adoption under the fast-track procedure, and approved as international standard ISO/IEC 16262:2011. Edition 5.1 of the ECMAScript Standard incorporated minor corrections and is the same text as ISO/IEC 16262:2011. The 5.1 Edition was adopted by the Ecma General Assembly of June 2011.

### ECMAScript 6
*also known as "When ECMAScript finally got classes"*
> Focused development of the sixth edition started in 2009, as the fifth edition was being prepared for publication. However, this was preceded by significant experimentation and language enhancement design efforts dating to the publication of the third edition in 1999. In a very real sense, the completion of the sixth edition is the culmination of a fifteen year effort. The goals for this addition included providing better support for large applications, library creation, and for use of ECMAScript as a compilation target for other languages. Some of its major enhancements included modules, class declarations, lexical block scoping, iterators and generators, promises for asynchronous programming, destructuring patterns, and proper tail calls. The ECMAScript library of built-ins was expanded to support additional data abstractions including maps, sets, and arrays of binary numeric values as well as additional support for Unicode supplemental characters in strings and regular expressions. The built-ins were also made extensible via subclassing. The sixth edition provides the foundation for regular, incremental language and library enhancements. The sixth edition was adopted by the General Assembly of June 2015.

### ECMAScript 2016
> ECMAScript 2016 was the first ECMAScript edition released under Ecma TC39's new yearly release cadence and open development process. A plain-text source document was built from the ECMAScript 2015 source document to serve as the base for further development entirely on GitHub. Over the year of this standard's development, hundreds of pull requests and issues were filed representing thousands of bug fixes, editorial fixes and other improvements. Additionally, numerous software tools were developed to aid in this effort including Ecmarkup, Ecmarkdown, and Grammarkdown. ES2016 also included support for a new exponentiation operator and adds a new method to Array.prototype called includes.

### ECMAScript 2017
> ECMAScript 2017 introduced Async Functions, Shared Memory, and Atomics along with smaller language and library enhancements, bug fixes, and editorial updates. Async functions improve the asynchronous programming experience by providing syntax for promise-returning functions. Shared Memory and Atomics introduce a new memory model that allows multi-agent programs to communicate using atomic operations that ensure a well-defined execution order even on parallel CPUs. This specification also includes new static methods on Object: Object.values, Object.entries, and Object.getOwnPropertyDescriptors.

### ECMAScript 2018
> ECMAScript 2018 introduced support for asynchronous iteration via the AsyncIterator protocol and async generators. It also included four new regular expression features: the dotAll flag, named capture groups, Unicode property escapes, and look-behind assertions. Lastly it included rest parameter and spread operator support for object properties.

### ECMAScript 2019
> This specification, the 10th edition, introduces a few new built-in functions: flat and flatMap on Array.prototype for flattening arrays, Object.fromEntries for directly turning the return value of Object.entries into a new Object, and trimStart and trimEnd on String.prototype as better-named alternatives to the widely implemented but non-standard String.prototype.trimLeft and trimRight built-ins. In addition, this specification includes a few minor updates to syntax and semantics. Updated syntax includes optional catch binding parameters and allowing U+2028 (LINE SEPARATOR) and U+2029 (PARAGRAPH SEPARATOR) in string literals to align with JSON. Other updates include requiring that Array.prototype.sort be a stable sort, requiring that JSON.stringify return well-formed UTF-8 regardless of input, and clarifying Function.prototype.toString by requiring that it either return the corresponding original source text or a standard placeholder.
