title=Love2D
tags=gamedev
summary=Lua-based game engine.
~~~~~~

[Website](http://love2d.org/) | [Source](https://github.com/love2d/love) | [Wiki](http://love2d.org/wiki)

### Examples

Drawing text
```lua
function love.draw()
    love.graphics.print("Hello World!", 400, 300)
end
```

Drawing an image
```lua
function love.load()
    whale = love.graphics.newImage("whale.png")
end
function love.draw()
    love.graphics.draw(whale, 300, 200)
end
```

Playing a sound
```lua
function love.load()
    sound = love.audio.newSource("music.ogg", "stream")
    love.audio.play(sound)
end
```



