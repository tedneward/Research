title=Hammerspoon
tags=tool, macos
summary=A bridge between the operating system and a Lua scripting engine that in turn provides a set of extensions that expose specific pieces of system functionality, to the user.
~~~~~~

[Website](https://www.hammerspoon.org/) | [Source](https://github.com/Hammerspoon/hammerspoon) | [API Documentation](https://www.hammerspoon.org/docs/index.html)

Basically wires up a [Lua](/languages/lua) engine with the various APIs exposed by macOS applications.

**Example: Hello World**

In your init.lua place the following:
```
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.alert.show("Hello World!")
end)
```

Then save the file, click on the Hammerspoon menubar icon and choose Reload Config. You should now find that pressing Cmd+Option+Ctrl+W will display a Hello World notification on your screen.

What is happening here is that we’re telling Hammerspoon to bind an anonymous function to a particular hotkey. The hotkey is specified by a table of modifier keys (Cmd, Option, and Ctrl in this case) and a normal key (W). An anonymous function is simply one that doesn’t have a name. We could have defined the alert function separately with a name and passed that name to `hs.hotkey.bind()`, but Lua makes it easy to define the functions inline.

