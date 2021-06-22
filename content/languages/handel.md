title=Handel
tags=language, presentation, browser
summary=A small procedural programming language for writing songs in the browser.
~~~~~~

[Website](https://handel-pl.github.io/) | [Source](https://github.com/ddj231/Handel)

Oh, I *really* have to play with this.

Example:
```
start
    chunk example 
        play E3, C3, G3 for 2b
    endchunk
    run example with sound piano, loop for 5 
finish
```

Example using Handel in the browser:
```
function clicked(){
    Handel.RunHandel(`
        start
            chunk example using somePlayable 
                play somePlayable 
                rest for 1b
            endchunk
            save myPlayable = Eb3 for 1b
            run example using myPlayable with sound piano, loop for 5 
        finish
    `)
}
document.addEventListener("click", clicked);
```

