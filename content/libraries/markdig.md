title=Markdig
tags=library, markdown, parser
summary=A CommonMark-compatible Markdown parser.
~~~~~~

[Source](https://github.com/xoofx/markdig)

## Features

-   **Very fast parser and html renderer** (no-regexp), very lightweight in terms of GC pressure. See benchmarks
-   **Abstract Syntax Tree** with precise source code location for syntax tree, useful when building a Markdown editor.
    -   Checkout [Markdown Editor v2 for Visual Studio 2022](https://marketplace.visualstudio.com/items?itemName=MadsKristensen.MarkdownEditor2) powered by Markdig!
-   Converter to **HTML**
-   Passing more than **600+ tests** from the latest [CommonMark specs (0.31.2)](https://spec.commonmark.org/)
-   Includes all the core elements of CommonMark:
    -   including **GFM fenced code blocks**.
-   **Extensible** architecture
    -   Even the core Markdown/CommonMark parsing is pluggable, so it allows to disable builtin Markdown/Commonmark parsing (e.g [Disable HTML parsing](https://github.com/lunet-io/markdig/blob/7964bd0160d4c18e4155127a4c863d61ebd8944a/src/Markdig/MarkdownExtensions.cs#L306)) or change behaviour (e.g change matching `#` of a headers with `@`)
-   [**Roundtrip support**](https://github.com/xoofx/markdig/blob/main/src/Markdig/Roundtrip.md): Parses trivia (whitespace, newlines and other characters) to support lossless parse ⭢ render roundtrip. This enables changing markdown documents without introducing undesired trivia changes.
-   Built-in with **20+ extensions**, including:
    -   [**Alerts**](https://xoofx.github.io/markdig/docs/extensions/alert-blocks/) for [GitHub style alerts](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#alerts) including: `[!Note]`, `[!Tip]`, `[!Important]`, `[!Warning]`, `[!Caution]`
    -   2 kind of tables:
        -   [**Pipe tables**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/PipeTableSpecs.md) (inspired from GitHub tables and [PanDoc - Pipe Tables](https://pandoc.org/MANUAL.html#extension-pipe_tables)), with opt-in [strict GFM parsing](https://github.com/xoofx/markdig/blob/main/site/docs/extensions/tables.md#strict-gfm-mode) via `PipeTableOptions.UseGfmRules`
        -   [**Grid tables**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/GridTableSpecs.md) (inspired from [Pandoc - Grid Tables](https://pandoc.org/MANUAL.html#extension-grid_tables))
    -   [**Extra emphasis**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/EmphasisExtraSpecs.md) (inspired from [Pandoc - Emphasis](https://pandoc.org/MANUAL.html#strikeout) and [Markdown-it](https://markdown-it.github.io/))
        -   strike through `~~`,
        -   Subscript `~`
        -   Superscript `^`
        -   Inserted `++`
        -   Marked `==`
    -   [**Special attributes**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/GenericAttributesSpecs.md) or attached HTML attributes (inspired from [PHP Markdown Extra - Special Attributes](https://michelf.ca/projects/php-markdown/extra/#spe-attr))
    -   [**Definition lists**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/DefinitionListSpecs.md) (inspired from [PHP Markdown Extra - Definitions Lists](https://michelf.ca/projects/php-markdown/extra/#def-list))
    -   [**Footnotes**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/FootnotesSpecs.md) (inspired from [PHP Markdown Extra - Footnotes](https://michelf.ca/projects/php-markdown/extra/#footnotes))
    -   [**Auto-identifiers**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/AutoIdentifierSpecs.md) for headings (similar to [Pandoc - Auto Identifiers](https://pandoc.org/MANUAL.html#extension-auto_identifiers))
    -   [**Auto-links**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/AutoLinks.md) generates links if a text starts with `http://` or `https://` or `ftp://` or `mailto:` or `www.xxx.yyy`
    -   [**Task Lists**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/TaskListSpecs.md) inspired from [Github Task lists](https://github.com/blog/1375-task-lists-in-gfm-issues-pulls-comments).
    -   [**Extra bullet lists**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/ListExtraSpecs.md), supporting alpha bullet `a.` `b.` and roman bullet (`i`, `ii`...etc.)
    -   [**Media support**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/MediaSpecs.md) for media url (youtube, vimeo, mp4...etc.) (inspired from this [CommonMark discussion](https://talk.commonmark.org/t/embedded-audio-and-video/441))
    -   [**Abbreviations**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/AbbreviationSpecs.md) (inspired from [PHP Markdown Extra - Abbreviations](https://michelf.ca/projects/php-markdown/extra/#abbr))
    -   [**Citation**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/FigureFooterAndCiteSpecs.md) text by enclosing `""...""` (inspired by this [CommonMark discussion](https://talk.commonmark.org/t/referencing-creative-works-with-cite/892) )
    -   [**Custom containers**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/CustomContainerSpecs.md) similar to fenced code block `:::` for generating a proper `<div>...</div>` instead (inspired by this [CommonMark discussion](https://talk.commonmark.org/t/custom-container-for-block-and-inline/2051) )
    -   [**Figures**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/FigureFooterAndCiteSpecs.md) (inspired from this [CommonMark discussion](https://talk.commonmark.org/t/image-tag-should-expand-to-figure-when-used-with-title/265/5))
    -   [**Footers**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/FigureFooterAndCiteSpecs.md) (inspired from this [CommonMark discussion](https://talk.commonmark.org/t/syntax-for-footer/2070))
    -   [**Mathematics**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/MathSpecs.md)/Latex extension by enclosing `$$` for block and `$` for inline math (inspired from this [CommonMark discussion](https://talk.commonmark.org/t/mathematics-extension/457/31))
    -   [**Soft lines as hard lines**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/HardlineBreakSpecs.md)
    -   [**Emoji**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/EmojiSpecs.md) support (inspired from [Markdown-it](https://markdown-it.github.io/))
    -   [**SmartyPants**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/SmartyPantsSpecs.md) (inspired from [Daring Fireball - SmartyPants](https://daringfireball.net/projects/smartypants/))
    -   [**Bootstrap**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/BootstrapSpecs.md) class (to output bootstrap class)
    -   [**Diagrams**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/DiagramsSpecs.md) extension whenever a fenced code block contains a special keyword, it will be converted to a div block with the content as-is (currently, supports [`mermaid`](https://mermaid.js.org/) and [`nomnoml`](https://github.com/skanaar/nomnoml) diagrams)
    -   [**YAML Front Matter**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/YamlSpecs.md) to parse without evaluating the front matter and to discard it from the HTML output (typically used for previewing without the front matter in MarkdownEditor)
    -   [**JIRA links**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/JiraLinks.md) to automatically generate links for JIRA project references (Thanks to @clarkd: [https://github.com/clarkd/MarkdigJiraLinker](https://github.com/clarkd/MarkdigJiraLinker))
    -   [**CJK-friendly Emphasis**](https://github.com/xoofx/markdig/blob/main/src/Markdig.Tests/Specs/CJKFriendlyEmphasis.md) to mitigate a CommonMark specification issue in CJK languages (Thanks to @tats-u: [https://github.com/tats-u/markdown-cjk-friendly](https://github.com/tats-u/markdown-cjk-friendly))
    -   [**Relative file links**](https://xoofx.github.io/markdig/docs/extensions/relative-file-links/) to rewrite links to Markdown files, such as `usage.md#preview`, into links to the generated pages, such as `usage.html#preview`
    -   [**Table of Contents**](https://xoofx.github.io/markdig/docs/extensions/table-of-contents/) to replace a `[TOC]` paragraph with a nested list of links to the headings of the document
-   Starting with Markdig version `0.20.0+`, Markdig is compatible only with `NETStandard 2.0`, `NETStandard 2.1`, `NETCoreApp 2.1` and `NETCoreApp 3.1`.

If you are looking for support for an old .NET Framework 3.5 or 4.0, you can download Markdig `0.18.3`.

### Third Party Extensions

-   [**Avalonia Markdown Renderer**: `MarkView.Avalonia`](https://github.com/Kryptos-FR/MarkView.Avalonia)
-   [**WPF/XAML Markdown Renderer**: `Neo.Markdig.Xaml`](https://github.com/neolithos/NeoMarkdigXaml)
-   [**Syntax highlighting**: `Markdig.SyntaxHighlighting`](https://github.com/RichardSlater/Markdig.SyntaxHighlighting)
-   [**Syntax highlighting using ColorCode-Universal**: `Markdown.ColorCode`](https://github.com/wbaldoumas/markdown-colorcode)
-   [**Syntax highlighting using Prism.js**: `WebStoating.Markdig.Prism`](https://github.com/ilich/Markdig.Prism)
-   [**Embedded C# scripting**: `Markdig.Extensions.ScriptCs`](https://github.com/macaba/Markdig.Extensions.ScriptCs)