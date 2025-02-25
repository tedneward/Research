title=AST-grep
tags=tool, language, library
summary=A code tool for structural search and replace.
~~~~~~

[Website](https://ast-grep.github.io/) | [GitHub](https://github.com/ast-grep/ast-grep)

**Search and Rewrite**
ast-grep is a code tool for structural search and replace. It is like syntax-aware grep/sed! You can write code patterns to locate and modify code, based on AST, in thousands of files, interactively.

    ast-grep -p '$A && $A()' -r '$A?.()'

**Scan as Linter**
ast-grep is a versatile and flexible tool for linting code with AST patterns. You can easily add new customized rules with intuitive syntax and enjoy pretty error reporting out of box.

    ast-grep scan

**Programmatic Usage**
ast-grep also provides node-js binding to access syntax trees programmatically. You can use jQuery like utility methods to traverse syntax tree nodes. Node API also has opt-in type safety.

    npm install @ast-grep/napi

**Polyglot**
Supports C, C#, Go, Java, Javascript, Kotlin, Python, Rust, TypeScript, and many more.

Rules are written in YAML files


