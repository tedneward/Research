title=Markdoc
tags=tool, format
summary=A Markdown-based syntax and toolchain for creating custom documtation sites.
~~~~~~

[Website](https://markdoc.io/) | [Source](https://github.com/markdoc/markdoc)

Appears to have tools to render to an AST, which I find intriguing....

`npm install @markdoc/markdoc`

then

```
const Markdoc = require('@markdoc/markdoc');
// or
import Markdoc from '@markdoc/markdoc';

const doc = `
# Markdoc README

{% image src="/logo.svg" /%}
`;

const ast = Markdoc.parse(doc);
const content = Markdoc.transform(ast);
return Markdoc.renderers.react(content, React);
```

