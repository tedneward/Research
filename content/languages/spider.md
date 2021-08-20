title=Spider
tags=language, browser, nodejs
summary=A programming language that compiles to JavaScript (ES5 and ES6 targets).
~~~~~~

[Website](http://spiderlang.org/) | [Source](https://github.com/alongubkin/spider.git)

### Why Spider?
There are many languages that compile to JavaScript. The most popular ones are CoffeeScript, TypeScript and Dart.

But all of them have problems:

* CoffeeScript (and its derivatives: LiveScript, Coco, etc) have serious issues of ambiguous code, alien syntax (foo 1 compiles to foo(1);, but foo compiles to foo;) and scoping problems.
* TypeScript (and AtScript) are supersets of JavaScript, so they inherit all of its problems. Additionally, loose typing can be one of JavaScript's best features if used correctly.
* Dart is an extreme departure from JavaScript, which makes it impossible to interact with JavaScript libraries directly. Instead, you must use a special interop library that exposes wrapped versions of any JavaScript objects you access.

Spider tries to learn from its predecessors and build a real programming language that will make developers and teams happy:

* Instead of bringing a completely new indentation-based syntax like CoffeeScript, Spider preserves JavaScript's familiar syntax that we all use everyday.
* Instead of just introducing classes, Spider embraces JavaScript's prototype-based OOP and makes it much easier to use using keywords like extends and super.
* Spider is fully compatible with libraries like Angular.js, Meteor, jQuery, Sails.js and other existing JS libraries without any extra effort.
* Spider is an extremely safe language. It has a great compile-time error reporting system, and all uses of the global scope must be explicit. Spider also fixes many JavaScript problems. For example, == is automatically compiled to ===, and the typeof operator supports array, date, regexp and more.
* Spider has useful syntactic sugar like Splats, Array Slicing and Splicing, Existential Operator, Ranges, List Comprehensions, Destructuring, Curried Functions and much more.
* Spider has strong concurrency features such as Async/Await and Channels.
* Spider compiles to ES6, and has an ES5 target that uses Google's Traceur Compiler behind the scenes.

```
fn TimeMachine(pilot) {
  this.pilot = pilot;

  this.go = fn (noise) {
    ::console.log(noise);
  };
}

fn Tardis()
  extends TimeMachine("The Doctor") {

  this.go = () =>
    super.go("vorp vorp");
}

fn DeLorean()
  extends TimeMachine("Marty") {

  this.go = () =>
    super.go("One point twenty-one gigawatts!");
}

for timeMachine in ::getTimeMachines() {
  timeMachine?.go();
}
```

