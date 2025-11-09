title=RobotWar
tags=gamedev, language
summary=Links to games in which one programs a robot to do battle in an arena.
~~~~~~

[RobotWar for AppleII+ (Wikipedia)](https://en.wikipedia.org/wiki/RobotWar), derived from the [original](https://corewar.co.uk/robotwar.htm) | [Manual](https://corewar.co.uk/robotwar/robotwar.txt) | [Key Summary](https://corewar.co.uk/robotwar/rw.txt)

Programs are written in small, custom language which controls the robot using 8 i/o registers. Labels are up to 32 characters terminated by a newline. The following commands and registers are supported:

Command | Description
------- | ------------
`;` | The remainder of this line is a comment
`_<arg>_` | Store the value of _<arg>_ in the accumulator
`TO _<reg>_` | Store the value of the accumulator in _<reg>_
`+ _<arg>_` | Add _<arg>_ to the accumulator
`- _<arg>_` | Subtract _<arg>_ from the accumulator
`* _<arg>_` | Multiply the accumulator by _<arg>_
`/ _<arg>_` | Divide the accumulator by _<arg>_
`IF _<arg>_ < _<arg>_` | If the first _<arg>_ is smaller…
`IF _<arg>_ > _<arg>_` | If the first _<arg>_ is larger…
`IF _<arg>_ = _<arg>_` | If the _<arg>_s are equal…
`IF _<arg>_ # _<arg>_` | If the _<arg>_s are unequal…
`GOTO _<arg>_` | Go to _<arg>_
`GOSUB _<arg>_` | Call a subroutine at _<arg>_
`ENDSUB` | Return from a subroutine

# | Register | Description
- | -------- | -----------
1–23 | `A–W` | General purpose
24 | `X` | Current x-coordinate (0..256)
25 | `Y` | Current y-coordinate (0..256)
26 | `Z` | General purpose
27 | `AIM` | Angle of the gun (0..359)
28 | `SHOT` | Set to distance to shoot, returns status of gun
29 | `RADAR` | Set to angle to scan, returns distance to wall/robot
30 | `DAMAGE` | Damage status (0..100)
31 | `SPEEDX` | Horizontal speed (-255..255)
32 | `SPEEDY` | Vertical speed (-255..255)
33 | `RANDOM` | Set to _limit_, returns a random number (0.._limit_)
34 | `INDEX` | The register number to be used by `DATA`
N/A | `DATA` | Uses `INDEX` to access a register by number

Robots battle in a 260×260 metre arena (x- and y-coordinates are in the range 0..256). The `DAMAGE` register starts at 100 and drops every time the robot is attacked or collides with something. A robot is destroyed when `DAMAGE` reaches 0.

More RobotWar links

* https://www.filfre.net/2012/01/robot-war/
* https://github.com/richardharrington/robotwar

## Examples Robots

Bottom
```
;     ROBOT  'BOTTOM'


; MOVE TO THE BOTTOM OF THE BATTLEFIELD

BOTTOM
  250 TO SPEEDY
  IF Y < 240 GOTO BOTTOM
  0 TO SPEEDY


; MOVE TO THE LEFT

MOVELEFT
  -100 TO SPEEDX
  GOSUB SCAN
  IF X > 20 GOTO MOVELEFT


; MOVE TO THE RIGHT

MOVERIGHT
  100 TO SPEEDX
  GOSUB SCAN
  IF X < 235 GOTO MOVERIGHT
  GOTO MOVELEFT


; SEARCH AND SHOOT

SCAN
  0 TO RADAR
  IF RADAR < 0, 0 - RADAR TO SHOT
  ENDSUB
```

Mover
```


;     ROBOT  'MOVER'


; INITIALIZE RANDOM NUMBER

   250 TO RANDOM


; SAVE CURRENT DAMAGE

START
 DAMAGE TO D  


; CHECK DAMAGE - GO MOVE IF DAMAGED
; IF NOT, INCREMENT AIM

SCAN
   IF DAMAGE # D GOTO MOVE
   AIM + 13 TO AIM 


; SEND RADAR IN DIRECTION OF AIM
; EXIT TO SCAN IF NO ENEMY FOUND
; OR SHOOT AT ENEMY JUST SPOTTED
; THEN GO SEE IF ENEMY IS STILL THERE

SPOT
   AIM TO RADAR
   IF RADAR > 0 GOTO SCAN
   0 - RADAR TO SHOT
   GOTO SPOT


; PICK A RANDOM PLACE TO GO

MOVE
   RANDOM TO H
   RANDOM TO V


; TRAVEL TO NEW X LOCATION

MOVEX
   H - X * 100 TO SPEEDX
   IF H - X > 20 GOTO MOVEX
   IF H - X < -20 GOTO MOVEX
   0 TO SPEEDX


; TRAVEL TO NEW Y LOCATION
; THEN GO START SCANNING AGAIN

MOVEY
   V - Y * 100 TO SPEEDY
   IF V - Y > 20 GOTO MOVEY
   IF V - Y < -20 GOTO MOVEY
   0 TO SPEEDY
   GOTO START
```

Random
```


;     ROBOT  'RANDOM'


;     SET RANDOM NUMBER LIMIT

   360 TO RANDOM


;     SET RANDOM AIM AND
;     MOVE IN A RANDOM DIRECTION
;     FOR A RANDOM AMOUNT OF TIME

MOVE
   RANDOM TO AIM
   RANDOM - 180 TO SPEEDX
   RANDOM - 180 TO SPEEDY
   RANDOM / 36 TO T


;     COUNTDOWN TIMER AND
;     CHECK FOR ENEMY ROBOTS

LOOK
   T - 1 TO T
   IF T < 0 GOTO MOVE
   AIM TO RADAR
   IF RADAR > 0 GOTO LOOK
   0 - RADAR TO SHOT
   GOTO LOOK
```

### Other RobotWar-like

[Wikipedia RobotBattle](https://en.wikipedia.org/wiki/Robot_Battle)

[BerryBots](http://berrybots.com/): Ships and stages are programmed in Lua and run on Mac, Linux, Windows, Raspberry Pi, or on the web at PlayBerryBots.com. Every stage is different. The sample stages include mazes, jousting, a race track, arcade games, and battle stages. And it's easy to program your own.

[CRobots (Github)](https://github.com/tpoindex/crobots/): Popular version by Tom Poindexter for DOS | [CRobots64](http://corewar.co.uk/crobots/zora/) appears to be an upgraded version of CRobots, but the page is entirely in Italian | [Netrobots (Github)](https://github.com/bonzini/netrobots): Client/server version of CRobots

[Robocode](https://robocode.sourceforge.io/) ([Source](https://github.com/robo-code/robocode)): Robocode is a programming game, where the goal is to develop a robot battle tank to battle against other tanks in Java. The robot battles are running in real-time and on-screen.

See also: Reminiscient of [CoreWar](https://programminggames.org/Core_War) (should be its own page?)

