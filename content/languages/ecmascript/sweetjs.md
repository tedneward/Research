title=SweetJS
tags=library, browser, nodejs
summary=Semantic macros for ECMAScript.
~~~~~~

Sweet brings the hygienic macros of languages like Scheme and Rust to JavaScript. Macros allow you to sweeten the syntax of JavaScript and craft the language you’ve always wanted.

[Website](https://www.sweetjs.org/doc/tutorial.html) | [Source](https://github.com/sweet-js) | [Paper: "Sweeten Your JavaScript: Hygienic Macros for ES5"](https://users.soe.ucsc.edu/~cormac/papers/dls14a.pdf) and [Paper: "An Operational Semantics for JavaScript"](http://www.doc.ic.ac.uk/~maffeis/aplas08.pdf)

Install: 
```
npm install -g @sweet-js/cli @sweet-js/helpers
```
... puts `sjs` binary into global scope, which does transpilation of source.

### Examples
Let:
```
syntax let = function (ctx) {
  let ident = ctx.next().value;
  ctx.next(); // eat `=`
  let init = ctx.expand('expr').value;
  return #`
    (function (${ident}) {
      ${ctx}
    }(${init}))
  `
};

let bb8 = new Droid('BB-8', 'orange');
console.log(bb8.beep());
```

Conditional:
```
import { unwrap, isKeyword } from '@sweet-js/helpers' for syntax;

syntax cond = function (ctx) {
  let bodyCtx = ctx.contextify(ctx.next().value);

  let result = #``;
  for (let stx of bodyCtx) { // <2>
    if (isKeyword(stx) && unwrap(stx).value === 'case') {
      let test = bodyCtx.expand('expr').value;
      // eat `:`
      bodyCtx.next();
      let r = bodyCtx.expand('expr').value;
      result = result.concat(#`${test} ? ${r} :`);
    } else if (isKeyword(stx) && unwrap(stx).value === 'default') {
      // eat `:`
      bodyCtx.next();
      let r = bodyCtx.expand('expr').value;
      result = result.concat(#`${r}`);
    } else {
      throw new Error('unknown syntax: ' + stx);
    }
  }
  return result;
};

let x = null;
let realTypeof = cond {
  case x === null: 'null'
  case Array.isArray(x): 'array'
  case typeof x === 'object': 'object'
  default: typeof x
}
```

Operators:
```
operator >>= left 1 = (left, right) => {
  return #`${left}.then(${right})`;
};

fetch('/foo.json') >>= resp => { return resp.json() }
                   >>= json => { return processJson(json) }
```
