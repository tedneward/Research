title=TADS
tags=gamedev, language, vm
summary=Authoring system for writing Interactive Fiction.
~~~~~~

[Website](https://www.tads.org/)

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

[Virtual machine implementation](https://www.tads.org/t3doc/doc/techman/t3spec/model.htm) is a bytecode stack-based machine.

