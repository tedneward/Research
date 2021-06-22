title=Corewars
tags=gamedev, platform
summary=A game of warrior vs warrior, programmed by two opponents, and placed into a virtual 'ring' to fight to the death.
~~~~~~

[koth (King of the Hill) Website](http://www.koth.org/index.html):
* [info](http://www.koth.org/info.html)
* [links](http://www.koth.org/links.html)

[Core War: the Ultimate Programming Game](https://corewar.co.uk/):
> Core War is a played between two or more programs written in Redcode, a low-level language similar to assembly. Players write a program to eliminate all opponents in the memory of the MARS virtual computer. Core War is also used as a platform to experiment with genetic programming.

[Corewars for Dummies](https://corewar.co.uk/lewis/index.htm)
> The game of Core War is played in a virtual computer (called MARS). While MARS can be any size, a common size is 8000 instructions. Programs are limited to a specific starting size, normally 100 instructions. Each program has a finite number of executions (turns, cycles), normally this number is 80,000. These parameters are the ones currently used by the 94 hill on the Pizza server. There can be any number of variations on other hills.


> Instructions:

> There are currently 17 instructions used in Redcode. This number has changed as the games has evolved. Each instruction has a three letter code (an example would the MOV for move.) They are listed below in no particular order.
```
DAT  data
MOV  move
ADD  add
SUB  subtract
MUL  multiply
DIV  divide
MOD  modula (remainder of division)
JMP  jump
JMZ  jump if zero
JMN  jump if not zero
DJN  decrement, jump if not zero
SPL  split execution
SLT  skip if less than
CMP  compare (see SEQ)
SEQ  skip if equal
SNE  skip if not equal
NOP  no operation
```

> An in-depth explanation of each instruction (also called Opcodes) appears later. Suffice it to say that each instruction contains an "A" field and a "B" field. These fields tell MARS how to execute the instruction.

> By example the MOV command simply tells the MARS to copy what is in the "A" field into the "B" field.

> ...we take a closer look at four of these instructions. These four are DAT, ADD, MOV, and JMP. To illustrate we will use a very simple program.

```
;redcode-94
;name Sleepy
;author John Q. Smith
;strategy bombing core

ADD #10, #-1
MOV 2, @-1
JMP -2, 0
DAT #33, #33

end
```

> As you may have guessed, the character that indicates the start of a remark on a line is ";". The first remark (;redcode-94) lets the MARS know that this program is compliant with the proposed 1994 standard for Core Wars. Just so you know, there have been two standards before the proposed 94 standard.

> The name of this program is Sleepy. Sleepy attempts to destroy it's opponents by dropping the "DAT #33, #33" instruction in their path of operation. A process which attempts to execute a "DAT" statement dies.

> Now that we know what it does, let's look at how it does it. The MOV command is really the cornerstone of this program. Without the move command the program has no punch. Let's see how it works.

```
MOV   2,  @-1
Op    A     B
``

> First off, notice that the "A" field points to the DAT statement. You can tell this by counting two from the MOV line. This means that the MOV statement will be coping the information at this location (the "DAT #33, #33").

> The "B" field points to the line with the ADD statement in it. Ordinarily this would mean that the bomb would be copied on top of this statement, but the "@" symbol makes this an indirect pointer. In effect the "@" symbol says, use the "B" field I point to as a new location to point from. In this case the "B" field points to the location just before the ADD line (this location is not shown).

> After the MOV statement is executed, the process goes to the next line. The JMP command indicates a location for the process to go to. Here the process jumps to the ADD command.

> Now that we have bombed a location of core, we should change pointer to a new location so that we don't keep bombing the same place over and over. The ADD command changes the pointer by adding the number "#10" to it. The symbol "#" means that this is an immediate addressing mode. Put simply, this means deal with what is right here to complete you task.
```
ADD #10, #-1
Op    A    B
```
> The add command adds the "A" field to the "B" field. Here both fields are in immediate mode, so the operation takes place on one line. After executing this instruction once, it would look as follows.
```
ADD   #10,  #9
Op      A    B
```
> Now when the MOV command drops a DAT bomb, it will land nine lines below the ADD statement.
```
0   ADD #10, #9
1-> MOV 2, @-1
2   JMP -2, 0
3   DAT #33, #33
4
5
6
7
8
9   DAT #33, #33
```
> Sleepy will continue to drop bombs into the core in ten line increments until the pointers rap around the core and return. At that point Sleepy begins to bomb over it's own bombs, doing to until the end of time (80,000 cycles) or until acted upon by another program.

> There are other modifiers to address, but we will explain those in the next chapter.
