title=AutoHotKey
tags=language, windows
summary=The ultimate automation scripting language for Windows.
~~~~~~

[Website](https://www.autohotkey.com/) | [Source](https://ahkscript.github.io/) | [Docs](https://www.autohotkey.com/docs/v2/) ([CHM](https://autohotkey.com/download/1.1/AutoHotkeyHelp.zip))

There's some really interesting ideas here, and the whole language appears to be one giant Windows systemwide keyboard hook. Love the simplicity of the idea. Note that v1.1 and v2 are syntactically similar but not backwards-compatible, as 1.1 had a lot of inconsistencies to it.

[AHKbook - the book for AutoHotkey](http://ahkscript.github.io/ahkbook/index.html)

### Examples
```
; hotstrings - expand 'btw' to 'By the way' as you type
::btw::By the way

; hotkeys - press winkey-z to go to Google
#z::Run "http://google.com"
```

```
; copy text to the clipboard, modify it, paste it back
^+k:: ; ctrl-shift-k
{
    ClipSave := ClipboardAll() ; store current clipboard
    A_Clipboard := "" ; clear the clipboard
    Send "^c" ; copy selected text
    if ClipWait(1) ; wait up to a second for content
    {
        ; wrap it in html-tags
        A_Clipboard := "<i>" A_Clipboard "</i>"
        Send "^v" ; paste
        Sleep 500 ; wait for Windows to complete paste
    }
    A_Clipboard := ClipSave ; restore old clipboard content
    ClipSave := "" ; clear variable
}
```

```
; Easy to make GUIs
MyGui := Gui()
MyGui.Add("Text",, "Enter your name")
MyGui.Add("Edit", "w150 vName")
MyGui.Add("Button",, "OK").OnEvent("Click", SayHello)
MyGui.Show()
Return

SayHello(*)
{
    Saved := MyGui.Submit()
    MsgBox "Hello " Saved.Name
    ExitApp
}
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
