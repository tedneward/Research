title=Pandoc
tags=tool, documentation, writing
summary=A universal document converter.
~~~~~~

[Website](https://pandoc.org/) | [Source](https://github.com/jgm/pandoc/) | [Demos](https://pandoc.org/demos.html)

Written in Haskell.

Converts to/from more formats than most people realize exist:

(← = conversion from; → = conversion to; ↔︎ = conversion from and to)

Lightweight markup formats:

* ↔︎ Markdown (including CommonMark and GitHub-flavored Markdown)
* ↔︎ reStructuredText
* ↔︎ AsciiDoc
* ↔︎ Emacs Org-Mode
* ↔︎ Emacs Muse
* ↔︎ Textile
* → Markua
* ← txt2tags
* ↔︎ djot
* → BBCode

HTML formats

* ↔︎ (X)HTML 4
* ↔︎ HTML5
* → Chunked HTML

Ebooks

* ↔︎ EPUB version 2 or 3
* ↔︎ FictionBook2

Documentation formats

* → GNU TexInfo
* ← pod
* ↔︎ Haddock markup
* → Vimdoc

Roff formats

* ↔︎ roff man
* → roff ms
* ← mdoc

TeX formats

* ↔︎ LaTeX
* → ConTeXt

XML formats

* ↔︎ DocBook version 4 or 5
* ↔︎ JATS
* ← BITS
* → TEI Simple
* → OpenDocument XML

Outline formats

* ↔︎ OPML

Bibliography formats

* ↔︎ BibTeX
* ↔︎ BibLaTeX
* ↔︎ CSL JSON
* ↔︎ CSL YAML
* ← RIS
* ← EndNote XML

Word processor formats

* ↔︎ Microsoft Word docx
* ↔︎ Rich Text Format RTF
* ↔︎ OpenOffice/LibreOffice ODT

Interactive notebook formats

* ↔︎ Jupyter notebook (ipynb)

Page layout formats

* → InDesign ICML
* ↔︎ Typst

Wiki markup formats

* ↔︎ MediaWiki markup
* ↔︎ DokuWiki markup
* ← TikiWiki markup
* ← TWiki markup
* ← Vimwiki markup
* → XWiki markup
* → ZimWiki markup
* ↔︎ Jira wiki markup
* ← Creole

Slide show formats

* → LaTeX Beamer
* ↔︎ Microsoft PowerPoint
* → Slidy
* → reveal.js
* → Slideous
* → S5
* → DZSlides

Data formats

* ← CSV tables
* ← TSV tables
* ← Microsoft Excel spreadsheets

Terminal output

* → ANSI-formatted text

Serialization formats

* ↔︎ Haskell AST
* ↔︎ JSON representation of AST
* ↔︎ XML representation of AST

Custom formats

* ↔︎ custom readers and writers can be written in Lua

PDF

* → via pdflatex, lualatex, xelatex, latexmk, tectonic, wkhtmltopdf, weasyprint, prince, pagedjs-cli, context, or pdfroff.

## Installation

* macOS: `brew install pandoc`; integrations may be useful too: `brew install librsvg python homebrew/cask/basictex`
* Docker: `docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` pandoc/latex README.md -o README.pdf` converts README.md to README.pdf
    * The official Docker images for pandoc can be found at https://github.com/pandoc/dockerfiles and at dockerhub.
    * The [pandoc/core](https://hub.docker.com/r/pandoc/core) image contains pandoc. The [pandoc/latex](https://hub.docker.com/r/pandoc/latex) image also contains the minimal LaTeX installation needed to produce PDFs using pandoc.

## Build Actions

Pandoc can be run through [GitHub Actions](https://github.com/features/actions). For some examples, see [https://github.com/pandoc/pandoc-action-example](https://github.com/pandoc/pandoc-action-example).

Pandoc can be run through [GitLab CI/CD](https://about.gitlab.com/stages-devops-lifecycle/continuous-integration/). For some examples, see [https://gitlab.com/pandoc/pandoc-ci-example](https://gitlab.com/pandoc/pandoc-ci-example).