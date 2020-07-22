title=PostScript
tags=format, language
summary=A dynamically typed, concatenative programming language page description language in the electronic publishing and desktop publishing business.
~~~~~~

[Wikipedia](https://en.wikipedia.org/wiki/PostScript) | [Language Manual - original](https://www.adobe.com/jp/print/postscript/pdfs/PLRM.pdf) (or [archive](https://web.archive.org/web/20170218093716/https://www.adobe.com/products/postscript/pdfs/PLRM.pdf)) and [Supplement - original](https://www.adobe.com/content/dam/acom/en/devnet/actionscript/articles/PS3010and3011.Supplement.pdf) (or [archive](https://web.archive.org/web/20160305010005/http://partners.adobe.com/public/developer/en/ps/PS3010and3011.Supplement.pdf)) are together the "red book" and *de facto* definition | [Type 1 font definition](https://web.archive.org/web/20150321034514/http://partners.adobe.com/public/developer/en/font/T1_SPEC.PDF), the "black book"

### PostScript (Level 1)
The first version of the PostScript language was released to the market in 1984. The suffix Level 1 was added when Level 2 was introduced.

### PostScript Level 2
PostScript Level 2 was introduced in 1991, and included several improvements: improved speed and reliability, support for in-RIP separations, image decompression (for example, JPEG images could be rendered by a PostScript program), support for composite fonts, and the form mechanism for caching reusable content.

### PostScript 3
PostScript 3 (Adobe dropped the "level" terminology in favor of simple versioning) came at the end of 1997, and along with many new dictionary-based versions of older operators, introduced better color handling and new filters (which allow in-program compression/decompression, program chunking, and advanced error-handling).

PostScript 3 was significant in terms of replacing the existing proprietary color electronic prepress systems, then widely used for magazine production, through the introduction of smooth shading operations with up to 4096 shades of grey (rather than the 256 available in PostScript Level 2), as well as DeviceN, a color space that allowed the addition of additional ink colors (called spot colors) into composite color pages.

PostScript is a Turing-complete programming language, belonging to the concatenative group. Typically, PostScript programs are not produced by humans, but by other programs. However, it is possible to write computer programs in PostScript just like any other programming language.[10]

PostScript is an interpreted, stack-based language similar to Forth but with strong dynamic typing, data structures inspired by those found in Lisp, scoped memory and, since language level 2, garbage collection. The language syntax uses reverse Polish notation, which makes the order of operations unambiguous, but reading a program requires some practice, because one has to keep the layout of the stack in mind. Most operators (what other languages term functions) take their arguments from the stack, and place their results onto the stack. Literals (for example, numbers) have the effect of placing a copy of themselves on the stack. Sophisticated data structures can be built on the array and dictionary types, but cannot be declared to the type system, which sees them all only as arrays and dictionaries, so any further typing discipline to be applied to such user-defined "types" is left to the code that implements them.

The character "%" is used to introduce comments in PostScript programs. As a general convention, every PostScript program should start with the characters "%!PS" as an interpreter directive so that all devices will properly interpret it as PostScript.

### "Hello world"
Hello World might look like this in PostScript (level 2):

```
 %!PS
 /Courier             % name the desired font
 20 selectfont        % choose the size in points and establish 
                      % the font as the current one
 72 500 moveto        % position the current point at 
                      % coordinates 72, 500 (the origin is at the 
                      % lower-left corner of the page)
 (Hello world!) show  % stroke the text in parentheses
 showpage             % print all on the page
```

or if the output device has a console

```
 %!PS
 (Hello world!) =
```
