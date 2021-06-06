title=AutoHotKey
tags=language, windows
summary=The ultimate automation scripting language for Windows.
~~~~~~

[Website](https://www.autohotkey.com/) | [Source](https://ahkscript.github.io/) | [Docs](https://www.autohotkey.com/docs/AutoHotkey.htm)

There's some really interesting ideas here, and the whole language appears to be one giant Windows systemwide keyboard hook. Love the simplicity of the idea.

### Examples
```
; hotstrings - expand 'btw' to 'By the way' as you type
::btw::By the way

; hotkeys - press winkey-z to go to Google
#z::
Run http://google.com
Return
```

```
; copy text to the clipboard, modify it, paste it back
^+k:: ; ctrl-shift-k
ClipSave:=ClipboardAll ; store current clipboard
Send ^c ; copy selected text
clipboard:="<i>" clipboard "</i>" ; wrap it in html-tags
Send ^v ; paste
Clipboard:=ClipSave ; restore old clipboard content
ClipSave:="" ; clear variable
Return
```

```
; Easy to make GUIs
Gui, Add, Text, , Enter your name
Gui, Add, Edit, vName w150
Gui, Add, Button, , OK
Gui, Show
Return

ButtonOK:
Gui, Submit, Destroy
MsgBox Hello %Name%
Return

Esc::
GuiClose:
ExitApp
```

```
; AutoHotkey (Associative) Arrays
Colors:="Red,Green,Blue"           ; string
ColorArray:=StrSplit(Colors, ",")  ; create array

ColorArray.Push("Purple")          ; add data

for index, element in ColorArray   ; Read from the array
    MsgBox % "Color " index " = " element
```

---

## IronAHK
CLR-based rewrite of AutoHotKey. Discontinued.

[Source](https://github.com/Paris/IronAHK) (archived)

> IronAHK is a rewrite of [AutoHotkey](https://www.autohotkey.com/), a powerful and easy to use scripting language for automation on the desktop. It is developed in C# for .NET and Mono which brings cross-platform compatibility, increased performance, enhanced security, Unicode, native 64-bit support, smaller file sizes for compiled binaries and much more.
