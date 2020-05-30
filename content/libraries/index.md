title=Libraries
type=categorypage
category=library
summary=A collection of language libraries.
~~~~~~

Libraries are collections of code intended to be used from a programming language for a particular purpose; this includes "frameworks", "toolkits", and even the odd "platform", if its principal purpose is to be linked into executable code written by a programming language.

---

Brief bit of Windows lore: [Using Notepad as a debug console for Windows programs](https://reddit.com/r/programming/comments/gnazif/ray_tracing_in_notepadexe_at_30_fps/fr8uy2l):
```
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