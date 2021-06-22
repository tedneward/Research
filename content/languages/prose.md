title=Prose
tags=language, jvm
summary=A simple language inspired by Io and Ioke that compiles to Clojure and ClojureScript.
~~~~~~

[Source](https://github.com/aaron-lebo/prose)

Example:
```
buffalo = defn(end,
  let(strings: 1 * 8 repeat("buffalo"),
    idxs: [0, 2, 6],
    f: fn(idx, itm,
      if(idx2 fn(idx2 == idx) some(idxs),
        itm string/capitalize,
        itm
      )
    ),
    res: f map-indexed(strings),
    " " string/join(res) str(end case(
      period: ".",
      qmark: "?",
      "!"
    ))
  )
)

:period buffalo
buffalo(:qmark)

excited-buffalo = buffalo partial(:exmark)
excited-buffalo()
```
