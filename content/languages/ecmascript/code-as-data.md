title=ECMAScript example of code as data
tags=reading, nodejs, browser
summary=An example of using code as data in ECMAScript
~~~~~~

Originally from [here](https://stopa.io/post/265)

### Setup
We have a program that knows how to draw stuff:
```
drawPoint({x: 0, y: 1}, 'yellow')
drawLine({x: 0, y: 0}, {x: 1, y: 1}, 'blue')
drawCircle(point, radius, 'red')
rotate(shape, 90)
```

### Challenge
Can we support remote drawing? Set up a websocket connection and receive instructions to execute:
```
websocket.onMessage(data => { 
  /* TODO */ 
})
```

We could use `eval` to execute JS directly, but security alert.

### Initial idea: JSON
Map each JSON instruction to a special function:
```
{
  instructions: [
    { functionName: "drawLine", args: [{ x: 0, y: 0 }, { x: 1, y: 1 }, "blue"] },
  ];
}
```
... which translates to `drawLine({x: 0, y: 0}, {x: 1, y: 1},"blue")`; this moves the WebSocket implementation to:
```
webSocket.onMessage(instruction => { 
  const fns = {
    drawLine: drawLine,
    ...
  };
  data.instructions.forEach((ins) => fns[ins.functionName](...ins.args));
})
```

### Simplification
Clean up the JSON, by eliminating the 'functionName' and 'args' strings:
```
{
  instructions: [["drawLine", { x: 0, y: 0 }, { x: 1, y: 1 }, "blue"]],
}
```
We changed our object in favor of an array. To handle that, all we need is a rule: the first part of our instruction is the function name, and the rest are arguments.

... which then gives us this implementation:
```
websocket.onMessage(data => { 
  const fns = {
    drawLine: drawLine,
    ...
  };
  data.instructions.forEach(([fnName, ...args]) => fns[fnName](...args));
})
```

### More power
An instruction that takes another instruction as an argument:
```
["rotate", ["drawLine", { x: 0, y: 0 }, { x: 1, y: 1 }], 90]
```
... implementation:
```
websocket.onMessage(data => { 
  const fns = {
    drawLine: drawLine,
    ...
  };
  const parseInstruction = (ins) => {
    if (!Array.isArray(ins)) {
      // this must be a primitive argument, like {x: 0 y: 0}
      return ins;
    }
    const [fName, ...args] = ins;
    fns[fName](...args);
  };
  data.instructions.forEach(parseInstruction);
})
```

### Further simplification
Remove "instructions" from the JSON since it's not needed:
```
["do", ["drawLine", { x: 0, y: 0 }, { x: 1, y: 1 }]]
```
... implementation:
```
websocket.onMessage(data => { 
  const fns = {
    ...
    do: (...args) => args[args.length - 1],
  };
  const parseInstruction = (ins) => {
    if (!Array.isArray(ins)) {
      // this must be a primitive argument, like {x: 0, y: 0}
      return ins;
    }
    const [fName, ...args] = ins;
    return fns[fName](...args.map(parseInstruction));
  };
  parseInstruction(instruction);
})
```
... which also allows us to do this:
```
[
  "do",
  ["drawPoint", { x: 0, y: 0 }],
  ["rotate", ["drawLine", { x: 0, y: 0 }, { x: 1, y: 1 }], 90]],
];
```

### Even more power
What if we want to support definitions?
```
["def", "shape", ["drawLine", { x: 0, y: 0 }, { x: 1, y: 1 }]]
["rotate", "shape", 90]
```
... implementation:
```
websocket.onMessage(data => { 
  const variables = {};
  const fns = {
    ...
    def: (name, v) => {
      defs[name] = v;
    },
  };
  const parseInstruction = (ins) => {
    if (variables[ins]) {
      // this must be some kind of variable, like "shape"
      return variables[ins];
    }
    if (!Array.isArray(ins)) {
      // this must be a primitive argument, like {x: 0 y: 0}
      return ins;
    }
    const [fName, ...args] = ins;
    return fns[fName](...args.map(parseInstruction));
  };
  parseInstruction(instruction);
})
```
... which also allows for:
```
[
  "do",
  ["def", "shape", ["drawLine", { x: 0, y: 0 }, { x: 1, y: 1 }]],
  ["rotate", "shape", 90],
];
```

### Extreme power
Let remote users define their own functions:
```
const drawTriangle = function(left, top, right, color) { 
   drawLine(left, top, color);
   drawLine(top, right, color); 
   drawLine(left, right, color); 
} 
drawTriangle(...)
```
... written in JSON as:
```
["def", "drawTriangle",
  ["fn", ["left", "top", "right", "color"],
    ["do",
      ["drawLine", "left", "top", "color"],
      ["drawLine", "top", "right", "color"],
      ["drawLine", "left", "right", "color"],
    ],
  ],
],
["drawTriangle", { x: 0, y: 0 }, { x: 3, y: 3 }, { x: 6, y: 0 }, "blue"],
```

... implementation:

```
const parseFnInstruction = (args, body, oldVariables) => {
  return (...values) => {
    const newVariables = {
      ...oldVariables,
      ...mapArgsWithValues(args, values),
    };
    return parseInstruction(body, newVariables);
  };
};
```

### More extreme power
Let users define their own variables too:
```
[
  "do",
  [
    "def",
    "drawTriangle",
    [
      "fn",
      ["left", "top", "right", "color"],
      [
        "do",
        ["drawLine", "left", "top", "color"],
        ["drawLine", "top", "right", "color"],
        ["drawLine", "left", "right", "color"],
      ],
    ],
  ],
  ["drawTriangle", { x: 0, y: 0 }, { x: 3, y: 3 }, { x: 6, y: 0 }, "blue"],
  ["drawTriangle", { x: 6, y: 6 }, { x: 10, y: 10 }, { x: 6, y: 16 }, "purple"],
])
```

... implementation:

```
websocket.onMessage(data => { 
  const variables = {};
  const fns = {
    drawLine: drawLine,
    drawPoint: drawPoint,
    rotate: rotate,
    do: (...args) => args[args.length - 1],
    def: (name, v) => {
      variables[name] = v;
    },
  };
  const mapArgsWithValues = (args, values) => {
    return args.reduce((res, k, idx) => {
      res[k] = values[idx];
      return res;
    }, {});
  };
  const parseFnInstruction = (args, body, oldVariables) => {
    return (...values) => {
      const newVariables = {
        ...oldVariables,
        ...mapArgsWithValues(args, values),
      };
      return parseInstruction(body, newVariables);
    };
  };
  const parseInstruction = (ins, variables) => {
    if (variables[ins]) {
      // this must be some kind of variable
      return variables[ins];
    }
    if (!Array.isArray(ins)) {
      // this must be a primitive argument, like {x: 0 y: 0}
      return ins;
    }
    const [fName, ...args] = ins;
    if (fName == "fn") {
      return parseFnInstruction(...args, variables);
    }
    const fn = fns[fName] || variables[fName];
    return fn(...args.map((arg) => parseInstruction(arg, variables)));
  };
  parseInstruction(instruction, variables);
})
```

### Code as data
Add keywords, like `unless` (where `unless foo { ... }` as `if !foo { ... }`):
```
function rewriteUnless(unlessCode) {
   const [_unlessInstructionName, testCondition, consequent] = unlessCode; 
   return ["if", ["not", testCondition], consequent]
}

rewriteUnless(["unless", ["=", 1, 1], ["drawLine"]])
// => 
["if", ["not", ["=", 1, 1]], ["drawLine"]];
```
