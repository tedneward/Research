title=Pyret
tags=language
summary=Python like scripting language.
~~~~~~

[Web](https://www.pyret.org/) | [Code](https://github.com/brownplt/pyret-lang)

## Examples

```
flag = image-url("https://.../pyret-sticker-caps.png")
blackout = rectangle(550, 425, "solid", "black")
blank-flag = place-image(blackout, 450, 285, flag)
bonnie = scale(0.75, image-url("https://.../pyret-logo.png"))
fun draw-bonnie(angle :: Number) -> Image:
  scale(0.5, place-image(rotate(angle, bonnie), 450, 285, blank-flag))
end
spinner = reactor:
  init: 0,
  on-tick: {(angle): angle + 5},
  to-draw: draw-bonnie
end
spinner.interact()
```
