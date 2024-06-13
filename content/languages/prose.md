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

https://prose.sourceforge.net/wiki/index.php?title=Main_Page
In distributed computing environments, getting software components to integrate and communicate with each other can involve large teams of developers, and involve significant amounts of time and money. Such projects can be very difficult to manage. PROSE is designed from the ground-up to address these challenges with a range of innovative features that are unique to the language. It consists of: A high-level modular scripting language, which compiles into bytecode An assembly language for low-level bytecode development An execution engine, which interprets the bytecode A hierarchical object tree through which all components are addressed
