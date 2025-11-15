title=Rebol
tags=language, platform, presentation, native, web assembly
summary=A lean, extensible platform that operates over a variety of operating systems and devices.
~~~~~~

[Website](http://www.rebol.com/) [Rebol 3.0 (Development)](http://www.rebol.com/rebol3/) | [Docs](http://www.rebol.com/docs.html)

## Implementations

* [Ren-C](https://github.com/metaeducation/ren-c) - Ren-C is a deeply redesigned derivative of the Rebol 3 codebase. Features "user-friendly" API for C and JavaScript. It has WASM-powered [Ren-C's replpad-js](https://github.com/hostilefork/replpad-js) - interactive Web Console for Rebol language (Ren-C branch). 
* [Rye](https://github.com/refaktor/rye) - Rye is a high level, dynamic programming language based on ideas from Rebol, flavored by Factor, *nix shells and Golang. Implemented in Golang. You can try it out [here](https://ryelang.org/).


Clock example:
```
REBOL [
    Title: "Digital Clock"
    Version: 1.3.3
    Author: "Carl Sassenrath"
    Purpose: {A simple digital clock.}
]

f: layout [
    origin 0
    b: banner 140x32 rate 1 
        effect [gradient 0x1 0.0.150 0.0.50]
        feel [engage: func [f a e]
                        [set-face b now/time]]
]

resize: does [
    b/size: max 20x20 min 1000x200 f/size
    b/font/size: max 24 f/size/y - 40
    b/text: "Resize Me"
    b/size/x: 1024 ; for size-text
    b/size/x: 20 + first size-text b
    f/size: b/size
    show f
]

view/options/new f 'resize
resize
insert-event-func [
    if event/type = 'resize [resize]
    event
]
do-events
```

