title=tldx
tags=tool, network
summary=Internet domain availability tool.
~~~~~~

[Blog post](https://brandonyoung.dev/blog/introducing-tldx/) | [Source](https://github.com/brandonyoungdev/tldx)

You give it some keywords, optionally add prefixes, suffixes, or TLDs. Then it checks what’s available.

```
$ tldx google
❌ google.com is not available
$ tldx openai -p get,use -s ly,hub -t com,io,ai --only-available
✔️ getopenaily.com is available
✔️ useopenaihub.io is available
   ...
```

**Features**

* Keyword-based domain permutations (prefixes, suffixes, TLDs)
* Fast and concurrent RDAP availability checks
* Streams results as they’re found
* Optional filtering by domain length

## Quick Start

`brew install brandonyoungdev/tldx/tldx`

or

`brew tap brandonyoungdev/tldx; brew install tldx`

