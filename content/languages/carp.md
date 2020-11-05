title=Carp
tags=language, static, native
summary=A statically-typed lisp, without a GC, for real-time applications.
~~~~~~

[Source](https://github.com/carp-lang/Carp)

Example:
```
(load-and-use SDL)

(defn tick [state]
  (+ state 10))

(defn draw [app rend state]
  (bg rend &(rgb (/ @state 2) (/ @state 3) (/ @state 4))))

(defn main []
  (let [app (SDLApp.create "The Minimalistic Color Generator" 400 300)
        state 0]
    (SDLApp.run-with-callbacks &app SDLApp.quit-on-esc tick draw state)))
```
