title=ECMAScript (aka Javascript)
tags=language, browser, nodejs, dynamic, object, metaobject
summary=A dynamic, object-oriented script language.
~~~~~~

[Official website](http://www.ecmascript.org/) [ECMA-262 Specification](http://www.ecma-international.org/ecma-262/) | [Github](https://github.com/tc39/ecma262) [Active proposals](https://github.com/tc39/proposals) [Finished proposals](https://github.com/tc39/proposals/blob/master/finished-proposals.md)

Official standard name of the language originally appearing in browsers. "Javascript" is the implementation of the language that appeared in the Netscape Navigator browser.

## Implementations

* Native: [WebKit JavaScriptCore](https://github.com/WebKit/WebKit/tree/main/Source/JavaScriptCore): the JavaScript engine that comes as part of the larger open-source [WebKit](https://github.com/WebKit/) browser core.
* C/C++: [mjs](https://github.com/cesanta/mjs) Embedded JavaScript for C/C++, designed for microcontrollers with limited resources. Implements a strict subset of ES6.
* C/C++: [QuickJS](https://bellard.org/quickjs/): a small and embeddable Javascript engine. It supports the ES2020 specification including modules, asynchronous generators, proxies and BigInt.
* C/C++: [V8](/vms/v8): The engine below NodeJS from Google.
* CLR: [jint](../jint)
* CLR: [Yantra](https://yantrajs.com/index.html) ([Source](https://github.com/yantrajs/yantra)): Compiles JavaScript to .Net Assembly; Strict Mode Only JavaScript; Subclassable built-ins; Module support; Optional property chain `identifier?.[]`, `identifier?.(`, `identifier?.identifier`; Many ES5 + ES6 features; CommonJS Module Support; Easily marshal CLR Object to JavaScript and other way around; CSX Module support; Mixed module system, YantraJS supports `require` and `import`.
* CLR: [Jurassic](https://github.com/paulbartrum/jurassic): Jurassic is an implementation of the ECMAScript language and runtime. It aims to provide the best performing and most standards-compliant implementation of JavaScript for .NET. Jurassic is not intended for end-users; instead it is intended to be integrated into .NET programs. If you are the author of a .NET program, you can use Jurassic to compile and execute JavaScript code.
* CLR: [IronJS](../ironjs)
* Go: [Elsa](https://github.com/elsaland/elsa) | [HN](https://news.ycombinator.com/item?id=24626655): Fast/secure QuickJS wrapper in Go
* JVM: Nashorn: [Nashorn Blog](https://blogs.oracle.com/nashorn/) is at Oracle but Nashorn appears to have moved to JetBrains ownership/development [here](https://github.com/JetBrains/jdk8u_nashorn)
* JVM: [Rhino](https://github.com/mozilla/rhino) (includes [E4X](../e4x) support)
* JVM: [Graal.js](https://github.com/graalvm/graaljs) part of [GraalVM](/vms/graalvm.html)
* JVM: [RingoJS](https://ringojs.org/) ([Source](https://github.com/ringo/ringojs/))
* JVM: Kotlin: [Reeva](https://github.com/ReevaJS/reeva)
* Rust: [Deno](https://github.com/denoland/deno)
* Rust: [Boa](https://github.com/boa-dev/boa)
* Zig: [Bun](https://bun.sh/) ([Source](https://github.com/oven-sh/bun)): a fast all-in-one JavaScript runtime, written in [Zig](/languages/zig).

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

* [Babel](../babel): Babel is a JS-to-JS transpiler to support new features on older implementations.
* [Coco](../coco): Last commit 2014
* [CoffeeScript](../coffeescript)
* [Lightscript](../lightscript)
* [Livescript](../livescript): Last commit 2018
* [PureScript](../purescript)
* [Rescript](../rescript)
* [TypeScript](../typescript)
* [SweetJS](../sweetjs): Syntactic sugar (semantic macros) on top of JS

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

* [Language learnings](https://github.com/imteekay/programming-language-research/tree/master/language-learning/javascript)
* [JavaScript Promises... in Wicked Detail](https://mattgreer.dev/articles/promises-in-wicked-detail/)
* [SICP in ECMAScript](../sicpjs.pdf); see also [js-slang](https://github.com/source-academy/js-slang), implementations of the Source languages, which are small sublanguages of JavaScript designed for SICP JS
* [Code as Data](../code-as-data)
* [Create Your Own JavaScript Runtime](https://www.youtube.com/watch?v=ynNDmp7hBdo&ab_channel=ErickWendel)
* [Ectype - bringing type safety (and more!) to vanilla JavaScript](https://www.youtube.com/watch?v=vyjHRlQrVSA&ab_channel=StrangeLoopConference)
* [Implementing one feature set in two JavaScript engines](https://www.youtube.com/watch?v=V1Q9iqxhfgU&ab_channel=WebEnginesHackfest)
* [JavaScript and C++ in Node.js core](https://www.youtube.com/watch?v=GrgMT5zMgF4&ab_channel=NearForm)
* [Node.js startup performance](https://www.youtube.com/watch?v=G36lrPrF09c&ab_channel=NearForm)
* [Static Hermes: the Next Generation of Hermes](https://www.youtube.com/watch?v=q-xKYA0EO-c&ab_channel=CallstackEngineers)
* [TC39 – From the proposal to ECMAScript - Step by Step](https://www.youtube.com/watch?v=ZheFIz4FhXo&ab_channel=FestDevConference)
* [`SingleEscapeCharacter`](https://262.ecma-international.org/13.0/#prod-SingleEscapeCharacter)
* [Automatic semicolon insertions in JavaScript](https://articles.wesionary.team/automatic-semicolon-insertions-in-javascript-best-practices-c49ed8222e12)
* [Deep JavaScript](https://exploringjs.com/deep-js/toc.html)
* [Empty Statement](https://tc39.es/ecma262/multipage/ecmascript-language-statements-and-declarations.html#sec-empty-statement)
* [From Research Prototypes to Continuous Integration: Guiding the Design and Implementation of JavaScript](https://blog.sigplan.org/2023/01/12/from-research-prototypes-to-continuous-integration-guiding-the-design-and-implementation-of-javascript)
* [JavaScript Closures](http://jibbering.com/faq/notes/closures)
* [JavaScript Garbage Collector](https://javascript.info/garbage-collection)
* [JavaScript Memory management](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Memory_management)
* [JavaScript Static Analysis for Evolving Language Specifications](https://plrg.korea.ac.kr/assets/data/publication/thesis22-park.pdf)
* [Relation of Garbage Collector and Closure in JavaScript](https://www.geeksforgeeks.org/relation-of-garbage-collector-and-closure-in-javascript)
* [V8: full compiler](https://jayconrod.com/posts/51/a-tour-of-v8--full-compiler)
* [V8: Garbage Collection](https://jayconrod.com/posts/55/a-tour-of-v8-garbage-collection)


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
