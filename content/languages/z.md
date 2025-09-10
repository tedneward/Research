title=Z (language)
tags=language, ecmascript, node
summary=Transpiling-to-JS language that also includes its own runtime.
~~~~~~

[Website](https://zlanguage.github.io/) | [Source](https://github.com/zlanguage/zcomp)

Transpile to JS is pretty popular these days. JS has become the de facto assembely of the web, because virtually no one codes in "Vanilla JS" these days. A plethora of languages (CoffeeScript, LiveScript, Elm, ClojureScript, TypeScript) have all emerged on the sole basis of compiling to JS. However, we can seperate the languages that transpile to JS into two categories:

1. Syntatic Sugar: Languages that add new compile-time features to JavaScript, but no knew runtime features. These languages interop with JavaScript nearly seemlessly, but they fail to deliever certain features that require runtime additions, including operator overloading, pattern matching, better concatenation rules, etc.
2. JSVM Languages (JavaScript Virtual Machine): These languages add new compile-time and run-time features to JS, and use JavaScript more like assembely code than a target language. While these languages can add any features they want, they often have limited and clunky interop with JS, and are all are limited to the frontend, whereas Syntatic Sugar languages can be used anywhere.

Z mixes these two sides of transpiled languages. It has it's own runtime, with custom operators, a standard library, goroutines, and other cool out-of-the-box features. However, it also can call any JavaScript method, uses the same APIs as JavaScript, and has a generally similar syntax, making it easy for JavaScript users to pick up. Z is also one of the only langauges that transpiles to JS, comes with a custom runtime, and functions on the backend!

