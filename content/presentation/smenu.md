title=SMenu
tags=presentation, console
summary=A lightweight and flexible terminal menu generator, but quickly evolved into a powerful and versatile CLI selection tool for interactive or scripting use.
~~~~~~

[Source](https://github.com/p-gen/smenu)

smenu is a selection filter just like sed is an editing filter.

This tool reads words from standard input or from a file, and presents them to the terminal screen in different layouts in a scrolling window. A cursor, easily moved using the keyboard and/or the mouse, makes it possible to select one or more words.

Note that the screen is not cleared at the start and end of smenu execution. The selection window is displayed at the cursor position, and the previous contents of the terminal are neither modified nor lost.

I've tried to make it as easy to use as possible. It should work on all terminals managed in the terminfo database.

UTF-8 encoding is supported. This support includes double-width characters and extended grapheme clusters. The latter is still experimental, however, and works much better if appropriate terminals such as WezTerm or iTerm are used.

The encoding of UTF-8 glyphs must also be in canonical form, as no effort will be made to put them in this form.

Please refer to the included man page to find out more about this little program.

