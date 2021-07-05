title=Rescript
tags=language, browser
summary=A robustly typed language that compiles to efficient and human-readable JavaScript. It comes with a lightning fast compiler toolchain that scales to any codebase size.
~~~~~~

[Website](https://rescript-lang.org/) | [Source](https://github.com/reason-association/rescript-lang.org#rescript-langorg)

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

