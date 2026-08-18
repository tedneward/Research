title=TADS
tags=gamedev, language, vm, interactive fiction
summary=Authoring system for writing Interactive Fiction.
~~~~~~

[Website](https://www.tads.org/) | [Downloads](https://www.tads.org/tads3.htm#) Latest update 2013 | [System Development](https://tads3.livejournal.com/) | [Interactive Fiction archive](https://www.ifarchive.org/)

Language is strongly object-like (C++-like) in syntax, but with declarative overtones and implementation rules hiding underneath.

```
#include <adv3.h>
#include <en_us.h>

gameMain: GameMainDef
    initialPlayerChar = me
;

versionInfo: GameID
    name = 'My First Game'
    byline = 'by Bob Author'
    authorEmail = 'Bob Author <bob@myisp.com>'
    desc = 'This is an example of how to start a new game project. '
    version = '1'
    IFID = 'b8563851-6257-77c3-04ee-278ceaeb48ac'
;

firstRoom: Room 'Starting Room'
    "This is the boring starting room."
;

+me: Actor
;
```

## Implementations

* [Virtual machine implementation](https://www.tads.org/t3doc/doc/techman/t3spec/model.htm) is a bytecode stack-based machine.
* [HTML TADS](https://tads.org/tads3.htm) - The official Multimedia Tads interpreter for Microsoft Windows.
* [Zoom](https://www.logicalshift.co.uk/unix/zoom/) - macOS and Unix (X11) interpreter that supports quite a few interactive fiction formats. Tads games require a plugin and run in text-only mode.
* [FrobTADS](https://github.com/realnc/frobtads) - Cross-platform terminal (curses/ncurses) interpreter and development tool. It supports most of the latest text-mode Tads user interface features, including colored text and backgrounds, Tads 3 banner windows, and timed input. There is no support for Multimedia Tads games; they always run in text-only mode. Most importantly, it provides the Tads development tools (Tads 2 and Tads 3 command-line compilers and supporting libraries) which allows for authoring your own Tads games.

| Interpreter | Link | Format | System | Updated | Multimedia support |
| --- | --- | --- | --- | --- | --- |
| [Spatterlight](https://www.ifwiki.org/Spatterlight "Spatterlight") | [Download](https://github.com/angstsmurf/spatterlight/releases) | ADRIFT 4, ADRIFT 5, AdvSys, AGT, Alan 2, Alan 3, Glulx, Hugo, Level 9, Magnetic Scrolls, Quest, ScottFree, TADS 2, TADS 3, Z-code, Other | macOS | 2026-08-17 | Colors, graphics, sound |
| [Parchment](https://www.ifwiki.org/Parchment "Parchment") | [Download](https://github.com/curiousdannii/parchment/releases) [Play](https://iplayif.com/) | ADRIFT 4, Glulx, Hugo, TADS 2, TADS 3, Z-code | Browser | 2026-08-01 | Colours, graphics, sound (in Glulx only) |
| [Gargoyle](https://www.ifwiki.org/Gargoyle "Gargoyle") | [Download](https://github.com/garglk/garglk/releases) | ADRIFT 4, AdvSys, AGT, Alan 2, Alan 3, Glulx, Hugo, Level 9, Magnetic Scrolls, ScottFree, TADS 2, TADS 3, Z-code | Windows, macOS, Linux | 2026-02-08 | Different for each game format |
| [Lectrote](https://www.ifwiki.org/Lectrote "Lectrote") | [Download](https://github.com/erkyrath/lectrote/releases) | ADRIFT 4, Glulx, Hugo, Ink JSON, TADS 2, TADS 3, Z-code | Windows, macOS, Linux | 2025-10-04 | Color, Graphics (No TADS multimedia support) |
| [Fabularium (F-Droid)](https://www.ifwiki.org/Fabularium_(F-Droid) "Fabularium (F-Droid)") | [Download](https://f-droid.org/en/packages/io.davidar.fabularium/) | ADRIFT 4, ADRIFT 5, AdvSys, AGT, Alan 2, Alan 3, Glulx, Hugo, Level 9, Magnetic Scrolls, ScottFree, TADS 2, TADS 3, Z-code | Android | 2025-01-11 | Colors, graphics |
| [Gelek Vanilla](https://www.ifwiki.org/Gelek_Vanilla "Gelek Vanilla") | [Download](https://gitlab.com/cibersheep/gelek-vanilla) | ADRIFT 4, AdvSys, AGT, Alan 2, Alan 3, Glulx, Hugo, Level 9, Magnetic Scrolls, ScottFree, TADS 2, TADS 3, Z-code | Linux | 2024-09-18 |     |
| [Frotz for iOS](https://www.ifwiki.org/Frotz_for_iOS "Frotz for iOS") | [Download](https://apps.apple.com/us/app/frotz/id287653015) | Glulx, TADS 2, TADS 3, Z-code | iOS | 2023-09-24 | Color, Graphics (No TADS multimedia support) |
| [ElseIFPlayer](https://www.ifwiki.org/ElseIFPlayer "ElseIFPlayer") | [Play](https://he4et.github.io/elseifplayer/) | ADRIFT 4, Glulx, Hugo, TADS 2, TADS 3, Z-code | Browser | 2023-06-29 | No multimedia |
| [Parchmap](https://www.ifwiki.org/Parchmap "Parchmap") | [Play](http://parchmap.free.nf/) | Glulx, Hugo, TADS 2, TADS 3, Z-code | Browser | 2023-06-17 |     |
| [QTads](https://www.ifwiki.org/QTads "QTads") | [Download](https://realnc.github.io/qtads/#downloads) | TADS 2, TADS 3 | Windows, macOS, Linux | 2023-05-17 | All multimedia features of TADS are supported. |
| [Hunky Punk](https://www.ifwiki.org/Hunky_Punk "Hunky Punk") | [Download](https://play.google.com/store/apps/details?id=org.andglkmod.hunkypunk) | TADS 2, TADS 3, Z-code | Android | 2021-04-05 |     |

## Reading

### Books

[TADS 3 Quick Start Guide](https://www.tads.org/t3doc/doc/T3QuickStart.htm) by Eric Eve This brief guide is probably the best place to start for newcomers to TADS 3. It contains instructions for installing the system and compiling a basic game, an explanation of the other documentation, including guidance on where to go next, and a sample game newcomers can experiment with if they want to dive straight it.

[Getting Started in TADS 3](https://www.tads.org/t3doc/doc/gsg/index.html) ([PDF](https://www.tads.org/t3doc/doc/gsg/Getting%20Started%20in%20TADS%203.pdf)) by Eric Eve This tutorial introduction is a great starting point for anyone new to TADS 3 and new to programming. The book opens with the basics of getting TADS working on your system and setting up your first simple game, so even if you've never done any programming before, this will help you get going quickly. The tutorial then leads you step by step through the design of a full-scale example game, showing how to use TADS to implement the effects needed in the game. By the time you're done, you'll know your way around the system and you'll be able to write your own games. _This book is accompanied by a sample game,_ The Further Adventures of Heidi_. The game's source files can be found here:_ [Heidi.t](https://www.tads.org/t3doc/doc/gsg/Heidi.t) [Heidi.t3m](https://www.tads.org/t3doc/doc/gsg/Heidi.t3m)

[Learning TADS 3](https://www.tads.org/t3doc/doc/learning/Learning%20T3.pdf) by Eric Eve Part tutorial and part reference, _Learning TADS 3_ is a perfect place to start for confident beginners, and for people with a little more programming experience. This book is designed for learning TADS on your terms - it's organized by functional area, so once you've mastered the basics, you can skip around to focus on the areas you're most interested in. As you develop your game, you can return to the book as a reference, to review the details of particular TADS features. _This book refers to a collection of sample games, which are available as a separate download - [click here](http://www.tads.org/learning_tads3_sample_games.htm) to download._ 

[TADS 3 Tour Guide](https://www.tads.org/t3doc/doc/tourguide/index.html) ([PDF](https://www.tads.org/t3doc/doc/tourguide/T3TourGuide.pdf)) by Eric Eve This is a comprehensive overview of the TADS 3 library, covering nearly all of the key classes and functions. It uses practical examples that illustrate how to use library features to accomplish common tasks.

[TADS 3 System Manual](https://www.tads.org/t3doc/doc/sysman/cover.htm) by Michael Roberts This book is a reference to the TADS 3 language and the T3 VM, including the standard intrinsic functions and classes. It covers the language and VM features in depth, so it's the place to go when you need to find the details on the system.

[TADS 3 Technical Manual](https://www.tads.org/t3doc/doc/techman/cover.htm) edited by Michael Roberts This is a collection of technical articles about key aspects of the TADS 3 system and the Adv3 library. These articles provide detailed, task-oriented information on topics of interest to most TADS 3 users.

[TADS 3 Library Reference Manual](https://www.tads.org/t3doc/doc/libref/index.html) This is an extensively cross-referenced and hyperlinked compilation of information on the Adv3 and system libraries. The entire library is indexed here, with the latest information generated directly from the library source code.

[Introduction to HTML TADS](https://www.tads.org/t3doc/doc/htmltads/intro.htm) by Michael Roberts TADS 3 uses a variant of HTML as its formatting language. These notes explain how HTML fits into TADS, and how you can use HTML formatting codes for text effects, graphics, and sound, and how the TADS variant differs from standard HTML. (These are essentially just the original notes for HTML TADS 2, so they're a little rough, but they are updated with relevant changes for TADS 3. Note that this isn't an HTML tutorial - but the HTML in TADS is pretty close to standard HTML, so you can learn it from any of the many tutorials on the Web for ordinary HTML.)
