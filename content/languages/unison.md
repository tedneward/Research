title=Unison
tags=language, functional
summary=A modern, statically-typed purely functional language with the ability to describe entire distributed systems using a single program.
~~~~~~

[Website](https://www.unison-lang.org/) | [Source](https://github.com/unisonweb)

## Examples
Hello World
```
helloWorld : '{IO, Exception} ()
helloWorld _ = printLine "Hello World"
```

With a few lines of code, you can perform a distributed map-reduce using the `Remote` ability.

```
distributedEx : Seq k Nat ->{Remote} Nat
distributedEx dseq =
  dseq
    |> Seq.map (x -> x + 1)
    |> Seq.filter (x -> mod x 7 == 0)
    |> Seq.reduce 0 (+)
```

Perform effectful code, like HTTP requests with `Abilities` and `Ability handlers`.

```
httpEx : '{IO, Exception} Response
httpEx _ =
  host = HostName "unison-lang.org"
  web = Authority None host None
  path = Path.root / "learn"
  uri = Uri https (Some web) path Query.empty None
  req = Request.get uri
  handle request req with Http.handler
```

(Apparently used to be Unison-Web, [Website](https://www.unisonweb.org/) | [Source](https://github.com/unisonweb/unison)
)
