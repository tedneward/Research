title=Red
tags=language, native
summary=A next-generation programming language strongly inspired by Rebol, but with a broader field of usage thanks to its native-code compiler, from system programming to high-level scripting
~~~~~~

[Website](http://red-lang.org/) | [Source](https://github.com/red/red) 

Example:
```
    #enum modes! [
    	CONV_UPPER
    	CONV_LOWER
    	CONV_INVERT
    ]

    convert: func [mode [modes!] text [c-string!] return: [c-string!]
        /local
            lower? upper? alpha? do-conv [subroutine!]
            delta [integer!]
            s     [c-string!]
            c     [byte!]
    ][
        lower?:  [all [#"a" <= c c <= #"z"]]
        upper?:  [all [#"A" <= c c <= #"Z"]]
        alpha?:  [any [lower? upper?]]
        do-conv: [s/1: s/1 + delta]
        delta:   0
        s:       text

        while [s/1 <> null-byte][
            c: s/1
            if alpha? [
                switch mode [
                    CONV_UPPER  [if lower? [delta: -32 do-conv]]
                    CONV_LOWER  [if upper? [delta: 32 do-conv]]
                    CONV_INVERT [delta: either upper? [32][-32] do-conv]
                    default     [assert false]
                ]
            ]
            s: s + 1
        ]
        text
    ]
    
    probe convert CONV_UPPER "Hello World!"
    probe convert CONV_LOWER "There ARE 123 Dogs."
    probe convert CONV_INVERT "This SHOULD be INVERTED!"
```