title=Ki
tags=language, lisp, browser, nodejs
summary=A Lisp for your JavaScript
~~~~~~

[Website](http://ki-lang.org/) | [Source](https://github.com/lantiga/ki)

## Examples

Require ki (this in turns expands into an appropriate require for mori)
```
ki require core
```

Mori's persistent data structures and Clojure(Script)-like api at your fingertips
```js
var foo = ki (vector 1 2 3)
ki (conj foo 4)
// => [1 2 3 4]
```

Plus lambdas
```js
ki (map (fn [a] (inc a)) (range 5))
// => (1 2 3 4 5)
```

Interoperability: write js in a ki form
```js
var fn1 = ki (js function (a,b) { return a + b + 2; })
```
at any level - e.g. you can use infix where it makes sense
```js
var fn2 = ki (fn [a b] (js a + b + 2))
```

and you can use ki wherever in js code
```js
function somefunc (a) {
  ki (toJs (filter (fn [el] (isEven el)) (range a))).forEach(function(el) {
      console.log(el);
      });
  return [0, 1, 2, 3, 4].filter(ki (fn [el] (isEven el)));
}
console.log(somefunc(5));
// => 0 
// => 2 
// => 4 
// [0 2 4]
```

Like a pro
```js
ki (take 6 (map (fn [x] (js x * 2)) (range 1000)))
// => (0 2 4 6 8 10)
```
