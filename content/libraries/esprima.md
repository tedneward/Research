title=Esprima
tags=library, parser, ecmascript
summary=ECMAScript parsing infrastructure for multipurpose analysis.
~~~~~~

[Website](http://esprima.org/) | [Source](https://github.com/jquery/esprima)

* Full support for ECMAScript 2019 (ECMA-262 10th Edition)
* Sensible syntax tree format as standardized by ESTree project
* Experimental support for JSX, a syntax extension for React
* Optional tracking of syntax node location (index-based and line-column)
* Heavily tested (~1600 unit tests with full code coverage)

Esprima can be used to perform lexical analysis (tokenization) or syntactic analysis (parsing) of a JavaScript program.

A simple example on Node.js REPL:

```
> var esprima = require('esprima');
> var program = 'const answer = 42';

> esprima.tokenize(program);
[ { type: 'Keyword', value: 'const' },
  { type: 'Identifier', value: 'answer' },
  { type: 'Punctuator', value: '=' },
  { type: 'Numeric', value: '42' } ]
  
> esprima.parseScript(program);
{ type: 'Program',
  body:
   [ { type: 'VariableDeclaration',
       declarations: [Object],
       kind: 'const' } ],
  sourceType: 'script' }
```
