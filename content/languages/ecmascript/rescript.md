title=Rescript
tags=language, browser
summary=A robustly typed language that compiles to efficient and human-readable JavaScript. It comes with a lightning fast compiler toolchain that scales to any codebase size.
~~~~~~

ReScript compiler and syntax provide the best experience to write JS and React applications. Unifying the tools in one coherent platform and core team allows us to build features that wouldn't be possible in the original BuckleScript + Reason setup.

[Website](https://rescript-lang.org/) | [Source](https://github.com/rescript-lang/rescript-compiler)

(Used to be BuckleScript)

ReScript is a robustly typed language that compiles to efficient and human-readable JavaScript. It comes with a lightning fast compiler toolchain that scales to any codebase size.

* Fast and Simple. ReScript cares about a consistent and fast feedback loop for any codebase size. Refactor code, pull complex changes, or switch to feature branches as you please. No sluggish CI builds, stale caches, wrong type hints, or memory hungry language servers that slow you down.
* A Robust Type System. Every ReScript app is fully typed and provides reliable type information for any given value in your program. We prioritize simpler types over complex types for the sake of clarity and easy debugability. No any, no magic types, no surprise undefined.
* Seamless Integration. Use any library from JavaScript, export ReScript libraries to JavaScript, automatically generate TypeScript types. It's like you've never left the good parts of JavaScript at all.
* Tooling that just works out of the box. A builtin pretty printer, memory friendly VSCode & Vim plugins, a stable type system and compiler that doesn't require lots of extra configuration. ReScript brings all the tools you need to build reliable JavaScript, Node and ReactJS applications.
* Easy to adopt — without any lock-in. ReScript was made with gradual adoption in mind. If you ever want to go back to plain JavaScript, just remove all source files and keep its clean JavaScript output. Tell your coworkers that your project will keep functioning with or without ReScript!

Example in Rescript:
```
module Button = {
  @react.component
  let make = (~count: int) => {
    let times = switch count {
    | 1 => "once"
    | 2 => "twice"
    | n => Belt.Int.toString(n) ++ " times"
    }
    let msg = "Click me " ++ times

    <button> {msg->React.string} </button>
  }
}
```
... compiles to Javascript:
```
var React = require("react");

function Playground$Button(Props) {
  var count = Props.count;
  var times = count !== 1 ? (
      count !== 2 ? String(count) + " times" : "twice"
    ) : "once";
  var msg = "Click me " + times;
  return React.createElement("button", undefined, msg);
}

var Button = {
  make: Playground$Button
};

exports.Button = Button;
```

