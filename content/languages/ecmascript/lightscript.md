title=Lightscript
tags=language, ecmascript
summary=A Concise Syntax for JavaScript. A close superset of ES7 with JSX and Flow, built with Babel.
~~~~~~

[Website](http://www.lightscript.org/) | [Source](https://github.com/lightscript/lightscript)

```coffee
Item({ item, isActive }) =>
  className = if isActive: 'active' else: 'inactive'

  <li className={className}>
    {item}
  </li>
```

### Language Features

In addition to all all ES7, JSX, and Flow features:

- (Optional) Significant Indentation
- Implicit Returns
- If Expressions
- Auto const
- Async/Await shorthand
- Safe-Await
- Readable Operators (or, and, ==, etc)
- Bound Methods
- Commaless Objects and Arrays
- Automatic Semicolon Insertion that always works
- Array Comprehensions
- Object Comprehensions
- Array-based for-loops
- Object-based for-loops
- a few others

Reference documentation is available in Markdown format [here](https://github.com/lightscript/lightscript.org/blob/master/pages/docs/docs.md).

