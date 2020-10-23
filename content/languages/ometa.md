title=OMeta (OMeta/JS)
tags=language, metaobject
summary=An object-oriented language for pattern matching, based on a variant of Parsing Expression Grammars (PEGs) which we have extended to handle arbitrary data types; OMeta's general-purpose pattern matching facilities provide a natural and convenient way for programmers to implement tokenizers, parsers, visitors, and tree transformers, all of which can be extended in interesting ways using familiar object-oriented mechanisms.
~~~~~~

[Paper: "OMeta: an Object-Oriented Language for Pattern Matching"](http://www.tinlizzie.org/~awarth/papers/dls07.pdf) [Website](http://www.tinlizzie.org/ometa/) [PhD dissertation](http://www.vpri.org/pdf/tr2008003_experimenting.pdf) or [here](https://web.cs.ucla.edu/~todd/theses/warth_dissertation.pdf)

* [OMeta/Squeak](http://www.tinlizzie.org/ometa/ometa2.html): syntax is closer to OMeta/JS (below)
* [OMeta#: Codeplex Archive](https://archive.codeplex.com/?p=ometasharp)
    * ["OMeta: Who? What? When? Where? Why?"](http://www.moserware.com/2008/06/ometa-who-what-when-where-why.html)
    * ["Building an Object-Oriented Parasitic Metalanguage"](http://www.moserware.com/2008/07/building-object-oriented-parasitic.html)
    * ["Meta-FizzBuzz"](http://www.moserware.com/2008/08/meta-fizzbuzz.html)
* [IronMeta: GitHub](https://github.com/kulibali/ironmeta)
* [OMeta for Scheme](http://tech.labs.oliverwyman.com/blog/2008/07/01/ometa-for-scheme/)
* [OMeta for CommonLisp](http://subvert-the-dominant-paradigm.net/blog/?p=23)
* [PyMeta2](https://www.allbuttonspressed.com/projects/pymeta)

---
## OMeta/JS

[API on Github](http://veged.github.io/ometa-js/) | [npm](https://www.npmjs.com/package/ometajs) | [Source](https://github.com/veged/ometa-js)

### Installing

Globally for use as a transpiler tool: `$ [sudo] npm install ometajs -g`

... or locally for programmatic use: `$ cd /path/to/your/project; npm install ometajs`

### Usage
#### Command line
```
$ ometajs2js --help
 
Usage:
  ometajs2js [OPTIONS] [ARGS]
 
 
Options:
  -h, --help : Help
  -v, --version : Version
  -i INPUT, --input=INPUT : Input file (default: stdin)
  -o OUTPUT, --output=OUTPUT : Output file (default: stdout)
  --root=ROOT : Path to root module (default: ometajs)
```
ometajs2js will take input *.ometajs file and produce a CommonJS- compatible javascript file.

You may also require('*.ometajs') files directly without compilation. (OMetaJS is patching require.extensions as CoffeeScript does).

#### Usage as CommonJS module
```
var ometajs = require('ometajs');
 
var ast = ometajs.grammars.BSJSParser.matchAll('var x = 1', 'topLevel'),
    code = ometajs.grammars.BSJSTranslator.matchAll([ast], 'trans');
```

#### Example grammar
```
ometa Simple {
  top = [#simple] -> 'ok'
}
```

