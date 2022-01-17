title=FX
tags=tool, json, distribution
summary=Command-line tool and terminal JSON viewer.
~~~~~~

[Website](https://fx.wtf/) (Currently redirects to) [Source](https://github.com/antonmedv/fx) | [Docs](https://github.com/antonmedv/fx/blob/master/DOCS.md).


Install: `brew install fx` or `npm install -g fx`

## Usage

Start [interactive mode](https://github.com/antonmedv/fx/blob/master/DOCS.md#interactive-mode) without passing any arguments.
```bash
$ curl ... | fx
```

Or by passing filename as first argument.
```bash
$ fx data.json
```

Pass a few JSON files.
```bash
cat foo.json bar.json baz.json | fx .message
```

Use full power of JavaScript.
```bash
$ curl ... | fx '.filter(x => x.startsWith("a"))'
```

Access all lodash (or ramda, etc) methods by using [.fxrc](https://github.com/antonmedv/fx/blob/master/DOCS.md#using-fxrc) file.
```bash
$ curl ... | fx '_.groupBy("commit.committer.name")' '_.mapValues(_.size)'
```

Update JSON using spread operator.
```bash
$ echo '{"count": 0}' | fx '{...this, count: 1}'
{
  "count": 1
}
```

Extract values from maps.
```bash
$ fx commits.json | fx .[].author.name
```

Print formatted JSON to stdout.
```bash
$ curl ... | fx .
```

Pipe JSON logs stream into fx.
```bash
$ kubectl logs ... -f | fx .message
```

And try this:
```bash
$ fx --life
```

## Links

* [Discover how to use fx effectively](http://bit.ly/discover-how-to-use-fx-effectively)
* [Video tutorial](http://bit.ly/youtube-fx-tutorial)

## Related

* [gofx](https://github.com/antonmedv/gofx) – fx-like JSON tool (*go*)
* [eat](https://github.com/antonmedv/eat) – converts anything into JSON
* [ymlx](https://github.com/matthewadams/ymlx) – fx-like YAML cli processor
* [fx-completion](https://github.com/antonmedv/fx-completion) – bash completion for fx
* [fx-theme-monokai](https://github.com/antonmedv/fx-theme-monokai) – monokai theme
* [fx-theme-night](https://github.com/antonmedv/fx-theme-night) – night theme

