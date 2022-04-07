title=Windows (OS)
tags=platform, windows, native
summary=Development links and notes on the Microsoft Windows OS.
~~~~~~

[XWindows for WSL subsystem](https://x410.dev/): Commercial

---

Brief bit of Windows lore: [Using Notepad as a debug console for Windows programs](https://reddit.com/r/programming/comments/gnazif/ray_tracing_in_notepadexe_at_30_fps/fr8uy2l):

```c
static void nlog(char *str, ...)
{
	HWND notepad, edit;
	va_list ap;
	char buf[256];

	va_start(ap, str);
	vsprintf(buf, str, ap);
	va_end(ap);
	strcat(buf, "\r\n");
	notepad = FindWindow(NULL, "Untitled - Notepad");
	edit = FindWindowEx(notepad, NULL, "EDIT", NULL);
	SendMessage(edit, EM_REPLACESEL, TRUE, (LPARAM)buf);
}
```
... which is kinda a cool trick.

---

[Win32 Assembly Language](https://www.randallhyde.com/AssemblyLanguage/Win32Asm/index.html)
